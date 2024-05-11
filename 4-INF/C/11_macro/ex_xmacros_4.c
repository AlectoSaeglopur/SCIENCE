
/*** LIBRARIES ***/

#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>


/*** CONSTANTS ***/

#define ZONES_VAL_MAX     5                                           // maximum number of zones for any configuration

#define AAA_BTN_Z3        0xA83                                       // IDs of button widgets for each view/configuration combination
#define AAA_BTN_Z4        0xA84
#define AAA_BTN_Z5        0xA85
#define BBB_BTN_Z3        0xB83
#define BBB_BTN_Z4        0xB84
#define BBB_BTN_Z5        0xB85
#define CCC_BTN_Z3        0xC83
#define CCC_BTN_Z4        0xC84
#define CCC_BTN_Z5        0xC85
#define DDD_BTN_Z3        0xD83
#define DDD_BTN_Z4        0xD84
#define DDD_BTN_Z5        0xD85

#define AAA_IMG_Z3_LF     0xA930                                      // IDs of image widgets for each view/configuration combination
#define AAA_IMG_Z3_LR     0xA931
#define AAA_IMG_Z3_Rx     0xA932
#define AAA_IMG_Z4_LF     0xA940
#define AAA_IMG_Z4_LR     0xA941
#define AAA_IMG_Z4_RF     0xA942
#define AAA_IMG_Z4_RR     0xA943
#define AAA_IMG_Z5_LF     0xA950
#define AAA_IMG_Z5_LR     0xA951
#define AAA_IMG_Z5_RF     0xA952
#define AAA_IMG_Z5_RR     0xA953
#define AAA_IMG_Z5_CT     0xA954
#define BBB_IMG_Z3_LF     0xB930
#define BBB_IMG_Z3_LR     0xB931
#define BBB_IMG_Z3_Rx     0xB932
#define BBB_IMG_Z4_LF     0xB940
#define BBB_IMG_Z4_LR     0xB941
#define BBB_IMG_Z4_RF     0xB942
#define BBB_IMG_Z4_RR     0xB943
#define BBB_IMG_Z5_LF     0xB950
#define BBB_IMG_Z5_LR     0xB951
#define BBB_IMG_Z5_RF     0xB952
#define BBB_IMG_Z5_RR     0xB953
#define BBB_IMG_Z5_CT     0xB954
#define CCC_IMG_Z3_LF     0xC930
#define CCC_IMG_Z3_LR     0xC931
#define CCC_IMG_Z3_Rx     0xC932
#define CCC_IMG_Z4_LF     0xC940
#define CCC_IMG_Z4_LR     0xC941
#define CCC_IMG_Z4_RF     0xC942
#define CCC_IMG_Z4_RR     0xC943
#define CCC_IMG_Z5_LF     0xC950
#define CCC_IMG_Z5_LR     0xC951
#define CCC_IMG_Z5_RF     0xC952
#define CCC_IMG_Z5_RR     0xC953
#define CCC_IMG_Z5_CT     0xC954
#define DDD_IMG_Z3_LF     0xD930
#define DDD_IMG_Z3_LR     0xD931
#define DDD_IMG_Z3_Rx     0xD932
#define DDD_IMG_Z4_LF     0xD940
#define DDD_IMG_Z4_LR     0xD941
#define DDD_IMG_Z4_RF     0xD942
#define DDD_IMG_Z4_RR     0xD943
#define DDD_IMG_Z5_LF     0xD950
#define DDD_IMG_Z5_LR     0xD951
#define DDD_IMG_Z5_RF     0xD952
#define DDD_IMG_Z5_RR     0xD953
#define DDD_IMG_Z5_CT     0xD954


/*** DEFINES ***/

// Zone-layouts list [see NOTE#2]
#define LIST_OF_ZONE_LAYOUTS(ENTRY1,ENTRY2,ENTRY3)    \
  ENTRY1( 3, ENTRY2, ENTRY3 ),                        \
  ENTRY1( 4, ENTRY2, ENTRY3 ),                        \
  ENTRY1( 5, ENTRY2, ENTRY3 )

// Zone-layouts indexes enumerator
#define DEF_ZONE_LAYOUT_IDX(znum,...) LAYOUT_IDX_Z##znum
enum {
  LIST_OF_ZONE_LAYOUTS(DEF_ZONE_LAYOUT_IDX,_,_),
  LAYOUT_IDX_MAX
};

// Zone-layouts values vector (to automatically calculate "ZONES_NUM_MIN")
#define DEF_ZONE_LAYOUT_VAL(znum,...) znum
#define DEF_ZONE_LAYOUT_VECTOR (uint8_t [LAYOUT_IDX_MAX]){LIST_OF_ZONE_LAYOUTS(DEF_ZONE_LAYOUT_VAL,_,_)}
#define ZONES_NUM_MIN     DEF_ZONE_LAYOUT_VECTOR[0]                   // minimum number of zones for any configuration

// Views list [see NOTE#3]
#define LIST_OF_VIEWS(ENTRY1,ENTRY2)  \
  ENTRY1( ENTRY2, AAA, false ),       \
  ENTRY1( ENTRY2, BBB, false ),       \
  ENTRY1( ENTRY2, CCC, true  ),       \
  ENTRY1( ENTRY2, DDD, false )

// Views enumerator
#define DEF_VIEWS(_,name,...) VIEW_IDX_##name                         // NB: "_" is here used as 1st dummy arguments for the macro, whereas "..." tells the macro to skip all argument after the 2nd
typedef enum view_enum {
  LIST_OF_VIEWS(DEF_VIEWS,_),
  VIEW_NUM_MAX
} view_t;

// Macros to map zone-icons subfields to related widgets
#define GET_BTN(zone_num,view_name,_)       [VIEW_IDX_##view_name][LAYOUT_IDX_Z##zone_num].btn_widget  = view_name##_BTN_Z##zone_num
#define GET_IMG(zone_num,view_name,_)       [VIEW_IDX_##view_name][LAYOUT_IDX_Z##zone_num].img_widgets = {IMG_Z##zone_num(view_name)}
#define GET_ACT(zone_num,view_name,flag)    [VIEW_IDX_##view_name][LAYOUT_IDX_Z##zone_num].is_active   = flag

#define IMG_Z3(view)    view##_IMG_Z3_LF, \
                        view##_IMG_Z3_LR, \
                        view##_IMG_Z3_Rx

#define IMG_Z4(view)    view##_IMG_Z4_LF, \
                        view##_IMG_Z4_LR, \
                        view##_IMG_Z4_RF, \
                        view##_IMG_Z4_RR

#define IMG_Z5(view)    view##_IMG_Z5_LF, \
                        view##_IMG_Z5_LR, \
                        view##_IMG_Z5_RF, \
                        view##_IMG_Z5_RR, \
                        view##_IMG_Z5_CT


/*** TYPEDEFS ***/

typedef struct tab_struct
{
  uint32_t btn_widget;
  uint32_t img_widgets[ZONES_VAL_MAX];
  bool is_active;
} tab_t;


/*** GLOBAL VARIABLES ***/

static const tab_t all_icons_tables[VIEW_NUM_MAX][LAYOUT_IDX_MAX] =
{
  LIST_OF_VIEWS(LIST_OF_ZONE_LAYOUTS,GET_BTN),
  LIST_OF_VIEWS(LIST_OF_ZONE_LAYOUTS,GET_IMG),
  LIST_OF_VIEWS(LIST_OF_ZONE_LAYOUTS,GET_ACT)
};


/*** FUNCTIONS ***/

#define STRBOOL(x) (x == 0 ? "FALSE" : "TRUE")

void debug_table_content(const tab_t *table, uint8_t zone_num)
{
  uint8_t idx;
  printf("\n >> BTN     = %X\n",table->btn_widget);
  printf(" ----------\n");
  for (idx=0; idx<zone_num; idx++)
  {
    printf(" >> IMG#%d   = %X\n",idx+1,table->img_widgets[idx]);
  }
  printf(" ----------\n");
  printf(" >> ACT     = %s\n",STRBOOL(table->is_active));
  printf(" ----------\n");
}

void debug_table_size(const tab_t *table)
{
  size_t size8b = sizeof(*table);                     // byte-size
  size_t size32b = sizeof(*table);                    // word-size
  printf(" >> Size = %d B = %d W\n", size8b,
    size8b/(sizeof(uint32_t)/sizeof(uint8_t)));
}


/*** MAIN ***/

int main(void)
{
  view_t my_view = VIEW_IDX_CCC;
  uint8_t my_nzones = 5;
  tab_t my_table = all_icons_tables[my_view][my_nzones-ZONES_NUM_MIN];
  debug_table_content(&my_table,my_nzones);
  debug_table_size(&my_table);                        // [see NOTE#4]
  return 1;
}


/*** NOTES ***/

// 1. This example is inspired by Peacock2 GPU project. Assuming a certain number of views and zone-configurations
//    are needed (in this case x4 and x3 respectively) and that the respective widget-IDs are already available
//    throughout the project (here simply added within the CONSTANTS section), the purpose of the script is to
//    generate an overall structure (i.e. "all_icons_tables") containing all widgets needed by each possible view/
//    zone-configuration combination, so that this can be then accessed by a dynamic table-variable at run-time (i.e.
//    "my_table") to adapt to the current view and zone-configuration and easily and automatically retrieve the
//    needed widgets. Note each table contains x1 button-widget, x1 active-flag and a variable number of image-widgets
//    (depending on the specific zone-configuration).
//    Hereafter it's reported the mapping between widgets name-subfields and their hexadecimal value:
//      Views : AAA = A | BBB = B | CCC = C | DDD = D
//      Widget type : BTN = 8 | IMG = 9
//      Zone : Z3 = 3 | Z4 = 4 | Z5 = 5
//      Image location : LF = 0 | LR = 1 | RF = 2 | RR = 3 | CT = 4
//        [where "LF" = "left-front", "RR" = "right-rear", "CT" = "central", etc.]

// 2. To add a new zone-configuration insert a new line into "LIST_OF_ZONE_CONFIGS", for instance:
//      ENTRY1( number_of_zones, ENTRY2, ENTRY3)
//    where "number_of_zones" shall not be larger than ZONES_VAL_MAX and place maintainingthe increasing order of
//    entries with the LIST_OF_ZONE_CONFIGS table (otherwise ZONES_NUM_MIN would be set to a wrong value)!
//    Note during expansion ENTRY2 and ENTRY3 will represent respectively "view_name" and "is_active_value" options.


// 3. To add a new view insert a new line into "LIST_OF_VIEWS", for instance:
//      ENTRY1( ENTRY2, view_name, is_active )
//    where "view_name" can be whatever string value identifying the view and "is_active" the boolean flag associated
//    to the view (its actual usage is beyond the scope of this script).

// 4. For example, running the script to make "my_table" point to the info-structure related to view "CCC" configuration
//    "Z5" produces the following output:
//       BTN     = C85
//      --------
//       IMG#1   = C950
//       IMG#2   = C951
//       IMG#3   = C952
//       IMG#4   = C953
//       IMG#5   = C954
//      --------
//       ACT     = TRUE
//      --------
//       Size = 28 B = 7 W
