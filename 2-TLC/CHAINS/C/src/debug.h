/**
 * @file debug.h
 * @author Filippo Valmori
 * @date 26/08/2024
 * @copyright Electrolux S.p.A.
 * @ingroup TLC_CHAIN
 * @brief Debug library header
 */


#ifndef DEBUG_H
#define DEBUG_H


/****************/
/*** INCLUDES ***/
/****************/

#include "channel.h"
#include "convolutional.h"
#include "error.h"
#include "interleaving.h"
#include "memory.h"
#include "modulation.h"
#include "reed_solomon.h"
#include "scrambling.h"
#include "system.h"



/******************/
/*** PARAMETERS ***/
/******************/

#define PID_NCOLS_BYTE        30u                           //!< Number of byte columns per row to print before wrapping
#define PID_NCOLS_FLOAT       15u                           //!< Number of float columns per row to print before wrapping
#define PID_NCOLS_SYMB        8u                            //!< Number of symbol columns per row to print before wrapping

#define STYLE_DEFAULT         STYLE_ITALIC                  //!< Print-on-shell default style
#define STYLE_SUCCESS         STYLE_BOLD                    //!< Print-on-shell successful style
#define STYLE_ERROR           STYLE_BOLD                    //!< Print-on-shell error style
#define COLOR_DEFAULT         COLOR_BRIGHT_WHITE            //!< Print-on-shell default color
#define COLOR_SUCCESS         COLOR_BRIGHT_GREEN            //!< Print-on-shell successful color
#define COLOR_ERROR           COLOR_BRIGHT_RED              //!< Print-on-shell error color



/****************/
/*** TYPEDEFS ***/
/****************/

typedef struct _debug_par_t
{
  scr_par_t scrPar;
  rs_par_t rsPar;
  itlv_par_t itlvPar;
  cc_par_t ccPar;
  mod_par_t modPar;
  chan_par_t chanPar;
} debug_par_t;


typedef enum
{
  PID_TX_ORG = 0,                                           /** - tx origin bytes print-id */
  PID_RX_ORG,                                               /** - rx origin bytes print-id */
  PID_TX_CRC,                                               /** - tx CRC print-id */
  PID_RX_CRC,                                               /** - rx CRC print-id */
  PID_TX_SCR,                                               /** - tx scrambled bytes print-id */
  PID_RX_SCR,                                               /** - rx scrambled bytes print-id */
  PID_TX_RSCOD,                                             /** - tx reed-solomon coded bytes print-id */
  PID_RX_RSCOD,                                             /** - tx reed-solomon coded bytes print-id */
  PID_TX_INTLV,                                             /** - tx interleaved bytes print-id */
  PID_RX_INTLV,                                             /** - rx interleaved bytes print-id */
  PID_TX_CNVCOD,                                            /** - tx convolution coded bytes print-id */
  PID_RX_CNVCOD,                                            /** - rx convolution coded bytes print-id */
  PID_TX_MAP,                                               /** - tx mapped symbols print-id */
  PID_RX_MAP,                                               /** - rx mapped symbols print-id */
  PID_RX_LLR,                                               /** - rx demapped LLRs print-id */
  // keep NUM as final entry
  PID_NUM,
  PID_INVALID = 255
} print_label_t;


typedef enum _wm_level_t
{
  WM_LEVEL_1 = 0,                                           /** - watermark level for public functions */
  WM_LEVEL_2,                                               /** - watermark level for private functions */
  WM_LEVEL_3,                                               /** - watermark level for private subfunctions */
  // keep NUM as final entry
  WM_LEVEL_NUM
} wm_level_t;


typedef enum _ansi_text_color
{
  COLOR_BLACK           = 30,
  COLOR_RED             = 31,
  COLOR_GREEN           = 32,
  COLOR_YELLOW          = 33,
  COLOR_BLUE            = 34,
  COLOR_PURPLE          = 35,
  COLOR_CYAN            = 36,
  COLOR_WHITE           = 37,
  COLOR_GREY            = 90,
  COLOR_BRIGHT_RED      = 91,
  COLOR_BRIGHT_GREEN    = 92,
  COLOR_BRIGHT_YELLOW   = 93,
  COLOR_BRIGHT_BLUE     = 94,
  COLOR_BRIGHT_PURPLE   = 95,
  COLOR_BRIGHT_CYAN     = 96,
  COLOR_BRIGHT_WHITE    = 97,
} ansi_text_color;                                          //!< ANSI escape code for terminal text color


typedef enum _ansi_text_style
{
  STYLE_RESET             = 0,
  STYLE_BOLD              = 1,
  STYLE_ITALIC            = 3,
  STYLE_SINGLE_UNDERLINE  = 4,
  STYLE_SLOW_BLINK        = 5,
  STYLE_FAST_BLINK        = 6,
  STYLE_DOUBLE_UNDERLINE  = 21,
} ansi_text_style;                                          //!< ANSI escape code for terminal text styles



/*****************/
/*** CONSTANTS ***/
/*****************/

#if _WIN64
  #define watermark_t           uint64_t                    // type depending on processor architecture
#elif _WIN32
  #define watermark_t           uint32_t
#endif

#define WATERMARK_MASK        ((watermark_t)0xFFFF)



/******************/
/*** PROTOTYPES ***/
/******************/

error_t Debug_PrintParameters( ulen_t orgLen, const debug_par_t * pParams );
error_t Debug_ListParameters( debug_par_t * ioParams, const scr_par_t * scrParam, const rs_par_t * rsParam, const itlv_par_t * itlvParam, const cc_par_t * ccParam, const mod_par_t * modParam, const chan_par_t * chanParam );
error_t Debug_GenerateRandomBytes( byte_stream_t * ioStream, const uint32_t * pSeed );
error_t Debug_PrintByteStream( const byte_stream_t * inStream, print_label_t label, const debug_par_t * pParams );
error_t Debug_PrintFloatStream( const float_stream_t * inStream, print_label_t label, const debug_par_t * pParams );
error_t Debug_PrintComplexStream( const complex_stream_t * inStream, print_label_t label, const debug_par_t * pParams );
error_t Debug_CheckWrongBits( const byte_stream_t * inStreamA, const byte_stream_t * inStreamB, print_label_t label, const debug_par_t * pParams, ulen_t * pBitErr );
error_t Debug_WriteByteStreamToCsv( const byte_stream_t * inStream, print_label_t label );
error_t Debug_WriteComplexStreamToCsv( const complex_stream_t * inStream, print_label_t label );
error_t Debug_SetWatermark( const void * funcAddr, const wm_level_t level );
void Debug_PrintWatermarks( void );
void Debug_SetTerminalAppearance( ansi_text_color color, ansi_text_style style );
void Debug_ResetTerminalAppearance( void );


#endif
