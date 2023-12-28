
/*** INCLUDES ***/

#include "stdio.h"
#include "stdint.h"



/*** TYPEDEFS ***/

typedef enum {                                                              // typedef specifying all possible FSM state IDs
    STA_OFF = 17,
    STA_ON = 62,                                                                 
    STA_ERR = 14
} state_t;

typedef enum {                                                              // typedef specifying all possible FSM event IDs (to switch from one state to another)
    EVT_START = 0,
    EVT_END,                                                                // initialize to 1st value +1 (i.e. to 1 since START = 0)
    EVT_OVFLOW,                                                             // initialize to 1st value +1 (i.e. to 2 since START = 0)
    N_EVENTS                                                                // if 0 at the beginning, this returns directly the overall number of possible events!
} event_t;

#define     MAX_N_EVENTS    (uint8_t) 3                                     // maximum number of events that can be stored in queue

typedef struct {                                                            // structure representing the events-queue
    uint8_t evt_queue[MAX_N_EVENTS];
    uint8_t evt_head;
    uint8_t num_evt;                                                        // number of pending events to be processed
} evt_queue_t;



/*** FUNCTIONS ***/

void add_evt_start( evt_queue_t * const xyz ){                              // function to add a new START event ot queue (const means the pointer cannot be reassing inside the function)
    if( xyz->num_evt < MAX_N_EVENTS ){
        xyz->evt_queue[(xyz->evt_head+xyz->num_evt)%MAX_N_EVENTS] = EVT_START;
        xyz->num_evt++;
    } else {
        xyz->evt_queue[xyz->evt_head] = EVT_OVFLOW;                         // in case of queue overflow, overwrite 1st element with EVT_OVFLOW (to signal error and flush buffer)
        xyz->num_evt = 1;
    }
}

void add_evt_end( evt_queue_t * const xyz ){                                // function to add a new END event ot queue
    if( xyz->num_evt < MAX_N_EVENTS ){
        xyz->evt_queue[(xyz->evt_head+xyz->num_evt)%MAX_N_EVENTS] = EVT_END;
        xyz->num_evt++;
    } else {
        xyz->evt_queue[xyz->evt_head] = EVT_OVFLOW;
        xyz->num_evt = 1;
    }
}

typedef void evt_func_t( evt_queue_t * const xyz );                         // define a new type for all functions with pointer to "evt_queue_t" as input argument and return "void"

static evt_func_t * const evt_func_table[ 2 ] = {                           // create a funciton array with "add_evt_start" and "add_evt_end"
    add_evt_start,
    add_evt_end
};


void update_fsm( state_t * const abc, evt_queue_t * const xyz ){            // function to process each time up to one event from the queue and consequently update the FSM state
    if( xyz->num_evt > 0 ){
        switch( xyz->evt_queue[xyz->evt_head] ){
            case EVT_START :
                printf("- processing START event\n");
                *abc = STA_ON;
                break;
            case EVT_END :
                printf("- processing END event\n");
                *abc = STA_OFF;
                break;
            case EVT_OVFLOW :
                printf("- processing OVFLOW event\n");
                *abc = STA_ERR;
                break;
        }
        xyz->num_evt--;                                                     // decrease number of pending events
        xyz->evt_head = (xyz->evt_head+1)%MAX_N_EVENTS;                     // update queue head index
        
    } else {
        // do nothing...
    }
}

void print_queue( const evt_queue_t * const xyz){                           // function to print queue structure for degub purpose (const/const means the input poiter cannot be reassing and its content cannot be modified)
    uint8_t j;
    printf("\nQUEUE : head = %d | nevents = %d | buffer = ",xyz->evt_head,xyz->num_evt);
    for( j=0; j<MAX_N_EVENTS; j++ ){
        printf(" %d",xyz->evt_queue[j]);
    }
    printf("\n\n");
}



/*** MAIN ***/

int main(){

    printf("Nevents = %d\n",N_EVENTS);         
    printf("SzState = %d bytes\n\n",sizeof(state_t));                       // size of each STATE entry of state_t (decided by compiler!, e.g. with gcc on PC is 4 Bm, but on MPLAB with xc16 is 2 B)
    state_t fsm_state = STA_OFF;
    evt_queue_t fsm_queue = {.evt_head=0, .num_evt=0};

    add_evt_start(&fsm_queue);                                              // add START event to queue (NB: in real applications these events are triggered by EXTI, timers or some external command)
    add_evt_end(&fsm_queue);                                                // add END event to queue
    evt_func_table[EVT_START](&fsm_queue);                                  // add START event to queue (NB: if MAX_N_EVENTS < 3 this causes an overflow | note this line is equivalent to "add_evt_start(&fsm_queue);")

    while( fsm_queue.num_evt > 0  ){                                        // as long as queue is not empty... (NB: in real application this would be an endless while!)
        print_queue(&fsm_queue);
        update_fsm(&fsm_state,&fsm_queue);                                  // check if FSM state has to be updated
        //print_queue(&fsm_queue);
        printf("----\n");
    }

    return 1;
    
}
