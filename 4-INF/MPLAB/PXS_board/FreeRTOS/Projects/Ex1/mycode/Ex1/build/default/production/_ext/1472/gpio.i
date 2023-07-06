# 1 "../gpio.c"
# 1 "C:\\Users\\Filippo\\Desktop\\Projects\\Ex1\\mycode\\Ex1"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "../gpio.c"
# 16 "../gpio.c"
# 1 "../error.h" 1
# 21 "../error.h"
# 1 "../system.h" 1
# 24 "../system.h"
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdio.h" 1 3 4





# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h" 1 3 4
# 86 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h" 3 4
typedef void *va_list;
# 102 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h" 3 4

# 135 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h" 3 4
typedef long long _Longlong;
typedef unsigned long long _ULonglong;
# 149 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h" 3 4
typedef short unsigned int _Wchart;
typedef unsigned int _Wintt;
# 161 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h" 3 4
typedef int _Ptrdifft;
typedef unsigned int _Sizet;



int _Setjmp(int *);


typedef va_list _Va_list;





void _Atexit(void (*)(void));


typedef struct _Mbstatet
 {
 _Wchart _Wchar;
 unsigned short _Byte, _State;
 } _Mbstatet;
# 191 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h" 3 4
typedef struct _Fpost
 {
 long _Off;
 _Mbstatet _Wstate;
 } _Fpost;
# 212 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/yvals.h" 3 4

# 7 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdio.h" 2 3 4


# 50 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdio.h" 3 4
typedef _Sizet size_t;


typedef _Fpost fpos_t;





typedef struct FILE
 {
 unsigned short _Mode;
 unsigned char _Lockno;
 signed char _Handle;

 unsigned char *_Buf, *_Bend, *_Next;
 unsigned char *_Rend, *_Wend, *_Rback;

 _Wchart *_WRback, _WBack[2];
 unsigned char *_Rsave, *_WRend, *_WWend;

 struct _Mbstatet _Wstate;
 char *_Tmpnam;
 unsigned char _Back[1 * 2], _Cbuf;
 } FILE;



extern FILE _Stdin, _Stdout, _Stderr;

void clearerr(FILE *);
int fclose(FILE *);
int feof(FILE *);
int ferror(FILE *);
int _DNKfflush(FILE *);
int fgetc(FILE *);
int fgetpos(FILE *, fpos_t *);
char * fgets(char *, int, FILE *);
FILE * fopen(const char *, const char *);
int fprintf(FILE *, const char *, ...);
int fputc(int, FILE *);
int fputs(const char *, FILE *);
size_t fread(void *, size_t, size_t, FILE *);
FILE * freopen(const char *, const char *,
 FILE *);
int fscanf(FILE *, const char *, ...);
int fseek(FILE *, long, int);
int fsetpos(FILE *, const fpos_t *);
long ftell(FILE *);
size_t fwrite(const void *, size_t, size_t, FILE *);
char * gets(char *);
void perror(const char *);
int printf(const char *, ...);
int puts(const char *);
int remove(const char *);
int rename(const char *, const char *);
void rewind(FILE *);
int scanf(const char *, ...);
void setbuf(FILE *, char *);
int setvbuf(FILE *, char *, int, size_t);
int sprintf(char *, const char *, ...);
int sscanf(const char *, const char *, ...);
FILE * tmpfile(void); char * tmpnam(char *);
int ungetc(int, FILE *);
int vfprintf(FILE *, const char *, _Va_list);
int vprintf(const char *, _Va_list);
int vsprintf(char *, const char *, _Va_list);






long _Fgpos(FILE *, fpos_t *);
int _Flocale(FILE *, const char *, int);
void _Fsetlocale(FILE *, int);
int _Fspos(FILE *, const fpos_t *, long, int);






extern FILE *_Files[8];





# 174 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdio.h" 3 4

int getc(FILE *);
int getchar(void);
int putc(int, FILE *);
int putchar(int);

# 191 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdio.h" 3 4

# 25 "../system.h" 2
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdlib.h" 1 3 4







# 41 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdlib.h" 3 4
typedef _Wchart wchar_t;


typedef struct
 {
 int quot;
 int rem;
 } div_t;

typedef struct
 {
 long quot;
 long rem;
 } ldiv_t;


typedef struct
 {
 _Longlong quot;
 _Longlong rem;
 } _Lldiv_t;




void _Exit(int) ;
void exit(int) ;
char * getenv(const char *);
int system(const char *);



void abort(void) ;
int abs(int);
void * calloc(size_t, size_t);
div_t div(int, int);
void free(void *);
long labs(long);
ldiv_t ldiv(long, long);
void * malloc(size_t);
int mblen(const char *, size_t);
size_t mbstowcs(wchar_t *, const char *, size_t);
int mbtowc(wchar_t *, const char *, size_t);
int rand(void);
void srand(unsigned int);
void * realloc(void *, size_t);
long strtol(const char *, char **, int);
size_t wcstombs(char *, const wchar_t *, size_t);
int wctomb(char *, wchar_t);
# 102 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdlib.h" 3 4
unsigned long _Stoul(const char *, char **, int);
float _Stof(const char *, char **, long);






long double _Stold(const char *, char **, long);
_Longlong _Stoll(const char *, char **, int);
unsigned long long _Stoull(const char *, char **, int);

extern size_t _Getmbcurmax(void);

# 191 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdlib.h" 3 4


typedef int _Cmpfun(const void *, const void *);

int atexit(void (*)(void));
void * bsearch(const void *, const void *, size_t, size_t, _Cmpfun *);
void qsort(void *, size_t, size_t, _Cmpfun *);

double atof(const char *);
double strtod(const char *, char **);
int atoi(const char *);
long atol(const char *);
unsigned long strtoul(const char *, char **, int);
long long atoll(const char *);
unsigned long long strtoull(const char *, char **, int);
# 219 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdlib.h" 3 4








# 26 "../system.h" 2
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/string.h" 1 3 4







# 25 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/string.h" 3 4

int memcmp(const void *, const void *, size_t);
void * memcpy(void *, const void *, size_t);
void * memmove(void *, const void *, size_t);
void * memset(void *, int, size_t);
char * strcat(char *, const char *);
int strcmp(const char *, const char *);
int strcoll(const char *, const char *);
char * strcpy(char *, const char *);
size_t strcspn(const char *, const char *);
char * strerror(int);
size_t strlen(const char *);
char * strncat(char *, const char *, size_t);
int strncmp(const char *, const char *, size_t);
char * strncpy(char *, const char *, size_t);
size_t strspn(const char *, const char *);
char * strtok(char *, const char *);
size_t strxfrm(char *, const char *, size_t);
# 53 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/string.h" 3 4

# 88 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/string.h" 3 4



void * memchr(const void *, int, size_t);
char * strchr(const char *, int);
char * strpbrk(const char *, const char *);
char * strrchr(const char *, int);
char * strstr(const char *, const char *);



# 27 "../system.h" 2
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdbool.h" 1 3 4
# 28 "../system.h" 2
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h" 1 3 4
# 13 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h" 3 4
typedef signed char int8_t;






typedef signed int int16_t;






typedef signed long int int32_t;






typedef signed long long int int64_t;
# 43 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h" 3 4
typedef unsigned char uint8_t;





typedef unsigned int uint16_t;





typedef unsigned long int uint32_t;





typedef unsigned long long int uint64_t;
# 70 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h" 3 4
typedef signed char int_least8_t;






typedef signed int int_least16_t;






typedef signed long int int_least24_t;






typedef signed long int int_least32_t;






typedef signed long long int int_least64_t;






typedef unsigned char uint_least8_t;





typedef unsigned int uint_least16_t;





typedef long int uint_least24_t;





typedef unsigned long int uint_least32_t;





typedef unsigned long long int uint_least64_t;







typedef signed int int_fast8_t;






typedef signed int int_fast16_t;






typedef signed long int int_fast24_t;






typedef signed long int int_fast32_t;






typedef signed long long int int_fast64_t;






typedef unsigned int uint_fast8_t;





typedef unsigned int uint_fast16_t;





typedef unsigned long int uint_fast24_t;





typedef unsigned long int uint_fast32_t;





typedef unsigned long long int uint_fast64_t;





typedef long long int intmax_t;




typedef unsigned long long int uintmax_t;
# 29 "../system.h" 2

# 1 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\generic\\h/xc.h" 1 3 4
# 43 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\generic\\h/xc.h" 3 4
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/builtins.h" 1 3 4
# 42 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/builtins.h" 3 4
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h" 1 3 4
# 43 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/builtins.h" 2 3 4

void __builtin_write_OSCCONL(
        uint16_t);
void __builtin_write_OSCCONH(
        uint16_t);
void __builtin_write_DISICNT(
        uint16_t);
void __builtin_write_NVM(
        void);
void __builtin_write_CRYOTP(
        void);
void __builtin_write_DATAFLASH(
        void);
void __builtin_write_NVM_secure(
        uint16_t,
        uint16_t);
void __builtin_write_DATAFLASH_secure(
        uint16_t,
        uint16_t);
void __builtin_write_RTCWEN(
        void);
void __builtin_write_RTCC_WRLOCK(
        void);
void __builtin_write_PWMSFR(
        volatile uint16_t *,
        uint16_t,
        volatile uint16_t *);
void __builtin_write_RPCON(
        uint16_t);
uint16_t __builtin_readsfr(
        volatile void *);
void __builtin_writesfr(
        volatile void *,
        uint16_t);

uint16_t __builtin_edspage();
uint16_t __builtin_tblpage();
uint16_t __builtin_edsoffset();
uint16_t __builtin_dataflashoffset();
uint16_t __builtin_tbloffset();
uint16_t __builtin_psvpage();
uint16_t __builtin_psvoffset();
uint16_t __builtin_dmaoffset();
uint16_t __builtin_dmapage();
uint32_t __builtin_tbladdress();

void __builtin_nop(
        void);
int16_t __builtin_divsd(
        const int32_t,
        const int16_t);
int16_t __builtin_modsd(
        const int32_t,
        const int16_t);
int16_t __builtin_divmodsd(
        const int32_t,
        const int16_t,
        int16_t *);
uint16_t __builtin_divud(
        const uint32_t,
        const uint16_t);
uint16_t __builtin_modud(
        const uint32_t,
        const uint16_t);
uint16_t __builtin_divmodud(
        const uint32_t,
        const uint16_t,
        uint16_t *);
uint16_t __builtin_divf(
        uint16_t,
        uint16_t);
int32_t __builtin_mulss(
        const int16_t,
        const int16_t);
uint32_t __builtin_muluu(
        const uint16_t,
        const uint16_t);
int32_t __builtin_mulsu(
        const int16_t,
        const uint16_t);
int32_t __builtin_mulus(
        const uint16_t,
        const int16_t);
void __builtin_btg(
        uint16_t *,
        const uint16_t);
int16_t __builtin_addab(
        int16_t,
        int16_t);
int16_t __builtin_add(
        int16_t,
        int16_t,
        int16_t);
int16_t __builtin_clr(
        void);
int16_t __builtin_clr_prefetch(
        int16_t * *,
        int16_t *,
        int16_t,
        int16_t * *,
        int16_t *,
        int16_t,
        int16_t *,
        int16_t);
int16_t __builtin_ed(
        int16_t,
        int16_t * *,
        int16_t,
        int16_t * *,
        int16_t,
        int16_t *);
int16_t __builtin_edac(
        int16_t,
        int16_t,
        int16_t * *,
        int16_t,
        int16_t * *,
        int16_t,
        int16_t *);
int16_t __builtin_fbcl(
        int16_t);
int16_t __builtin_lac(
        int16_t,
        int16_t);
int16_t __builtin_lacd(
        int32_t,
        int16_t);
int16_t __builtin_mac(
        int16_t,
        int16_t,
        int16_t,
        int16_t * *,
        int16_t *,
        int16_t,
        int16_t * *,
        int16_t *,
        int16_t,
        int16_t *,
        int16_t);
void __builtin_movsac(
        int16_t * *,
        int16_t *,
        int16_t,
        int16_t * *,
        int16_t *,
        int16_t,
        int16_t *,
        int16_t);
int16_t __builtin_mpy(
        int16_t,
        int16_t,
        int16_t * *,
        int16_t *,
        int16_t,
        int16_t * *,
        int16_t *,
        int16_t);
int16_t __builtin_mpyn(
        int16_t,
        int16_t,
        int16_t * *,
        int16_t *,
        int16_t,
        int16_t * *,
        int16_t *,
        int16_t);
int16_t __builtin_msc(
        int16_t,
        int16_t,
        int16_t,
        int16_t * *,
        int16_t *,
        int16_t,
        int16_t * *,
        int16_t *,
        int16_t,
        int16_t *,
        int16_t);
int16_t __builtin_sac(
        int16_t,
        int16_t);
int32_t __builtin_sacd(
        int16_t,
        int16_t);
int16_t __builtin_sacr(
        int16_t,
        int16_t);
int16_t __builtin_sftac(
        int16_t,
        int16_t);
int16_t __builtin_subab(
        int16_t,
        int16_t);
int16_t __builtin_ACCL(
        int16_t);
int16_t __builtin_ACCH(
        int16_t);
int16_t __builtin_ACCU(
        int16_t);
uint16_t __builtin_tblrdl(
        uint16_t);
uint16_t __builtin_tblrdh(
        uint16_t);
unsigned char __builtin_tblrdhb(
        uint16_t);
unsigned char __builtin_tblrdlb(
        uint16_t);
void __builtin_tblwtl(
        uint16_t,
        uint16_t);
void __builtin_tblwth(
        uint16_t,
        uint16_t);
void __builtin_tblwtlb(
        uint16_t,
        unsigned char);
void __builtin_tblwthb(
        uint16_t,
        unsigned char);
void __builtin_disi(
        int16_t);
uint32_t __builtin_section_begin(
        const char *);
uint32_t __builtin_section_size(
        const char *);
uint32_t __builtin_section_end(
        const char *);
uint16_t __builtin_get_isr_state(
        void);
void __builtin_set_isr_state(
        uint16_t);
void __builtin_disable_interrupts(
        void);
void __builtin_enable_interrupts(
        void);
void __builtin_software_breakpoint(
        void);

uint16_t __builtin_addr_low();
uint16_t __builtin_addr_high();
uint32_t __builtin_addr();

void __builtin_pwrsav(
        uint16_t);
void __builtin_clrwdt(
        void);
void _Static_assert(
        uint16_t,
        const char *);
uint16_t __builtin_ff1l(
        uint16_t);
uint16_t __builtin_ff1r(
        uint16_t);
uint16_t __builtin_swap(
        uint16_t);
unsigned char __builtin_swap_byte(
        unsigned char);
int16_t __builtin_flim(
        int16_t,
        int16_t,
        int16_t);
int16_t __builtin_flim_excess(
        int16_t,
        int16_t,
        int16_t,
        int16_t *);
int16_t __builtin_flimv_excess(
        int16_t,
        int16_t,
        int16_t,
        int16_t *);
int16_t __builtin_min(
        int16_t,
        int16_t);
int16_t __builtin_max(
        int16_t,
        int16_t);
int16_t __builtin_min_excess(
        int16_t,
        int16_t,
        int16_t *);
int16_t __builtin_minv_excess(
        int16_t,
        int16_t,
        int16_t *);
int16_t __builtin_max_excess(
        int16_t,
        int16_t,
        int16_t *);
int16_t __builtin_maxv_excess(
        int16_t,
        int16_t,
        int16_t *);
# 44 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\generic\\h/xc.h" 2 3 4
# 224 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\generic\\h/xc.h" 3 4
# 1 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 1 3 4
# 42 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stdint.h" 1 3 4
# 43 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 2 3 4
# 56 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern volatile uint16_t WREG0 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG1 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG2 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG3 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG4 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG5 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG6 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG7 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG8 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG9 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG10 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG11 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG12 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG13 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG14 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t WREG15 __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t SPLIM __attribute__((__sfr__));

extern volatile uint16_t ACCAL __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t ACCAH __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint8_t ACCAU __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t ACCBL __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t ACCBH __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint8_t ACCBU __attribute__((__sfr__,__deprecated__,__unsafe__));

extern volatile uint16_t PCL __attribute__((__sfr__));

extern volatile uint8_t PCH __attribute__((__sfr__));

extern volatile uint16_t DSRPAG __attribute__((__sfr__));
typedef struct tagDSRPAGBITS {
  uint16_t DSRPAG:10;
} DSRPAGBITS;
extern volatile DSRPAGBITS DSRPAGbits __attribute__((__sfr__));


extern volatile uint16_t DSWPAG __attribute__((__sfr__));
typedef struct tagDSWPAGBITS {
  uint16_t DSWPAG:9;
} DSWPAGBITS;
extern volatile DSWPAGBITS DSWPAGbits __attribute__((__sfr__));


extern volatile uint16_t RCOUNT __attribute__((__sfr__));

extern volatile uint16_t DCOUNT __attribute__((__sfr__));

extern volatile uint16_t DOSTARTL __attribute__((__sfr__));

extern volatile uint16_t DOSTARTH __attribute__((__sfr__));

extern volatile uint16_t DOENDL __attribute__((__sfr__));

extern volatile uint16_t DOENDH __attribute__((__sfr__));

extern volatile uint16_t SR __attribute__((__sfr__));
__extension__ typedef struct tagSRBITS {
  union {
    struct {
      uint16_t C:1;
      uint16_t Z:1;
      uint16_t OV:1;
      uint16_t N:1;
      uint16_t RA:1;
      uint16_t IPL:3;
      uint16_t DC:1;
      uint16_t DA:1;
      uint16_t SAB:1;
      uint16_t OAB:1;
      uint16_t SB:1;
      uint16_t SA:1;
      uint16_t OB:1;
      uint16_t OA:1;
    };
    struct {
      uint16_t :5;
      uint16_t IPL0:1;
      uint16_t IPL1:1;
      uint16_t IPL2:1;
    };
  };
} SRBITS;
extern volatile SRBITS SRbits __attribute__((__sfr__));


extern volatile uint16_t CORCON __attribute__((__sfr__));
__extension__ typedef struct tagCORCONBITS {
  union {
    struct {
      uint16_t IF:1;
      uint16_t RND:1;
      uint16_t SFA:1;
      uint16_t IPL3:1;
      uint16_t ACCSAT:1;
      uint16_t SATDW:1;
      uint16_t SATB:1;
      uint16_t SATA:1;
      uint16_t DL:3;
      uint16_t EDT:1;
      uint16_t US:2;
      uint16_t :1;
      uint16_t VAR:1;
    };
    struct {
      uint16_t :8;
      uint16_t DL0:1;
      uint16_t DL1:1;
      uint16_t DL2:1;
      uint16_t :1;
      uint16_t US0:1;
      uint16_t US1:1;
    };
  };
} CORCONBITS;
extern volatile CORCONBITS CORCONbits __attribute__((__sfr__));


extern volatile uint16_t MODCON __attribute__((__sfr__));
__extension__ typedef struct tagMODCONBITS {
  union {
    struct {
      uint16_t XWM:4;
      uint16_t YWM:4;
      uint16_t BWM:4;
      uint16_t :2;
      uint16_t YMODEN:1;
      uint16_t XMODEN:1;
    };
    struct {
      uint16_t XWM0:1;
      uint16_t XWM1:1;
      uint16_t XWM2:1;
      uint16_t XWM3:1;
      uint16_t YWM0:1;
      uint16_t YWM1:1;
      uint16_t YWM2:1;
      uint16_t YWM3:1;
      uint16_t BWM0:1;
      uint16_t BWM1:1;
      uint16_t BWM2:1;
      uint16_t BWM3:1;
    };
  };
} MODCONBITS;
extern volatile MODCONBITS MODCONbits __attribute__((__sfr__));


extern volatile uint16_t XMODSRT __attribute__((__sfr__));

extern volatile uint16_t XMODEND __attribute__((__sfr__));

extern volatile uint16_t YMODSRT __attribute__((__sfr__));

extern volatile uint16_t YMODEND __attribute__((__sfr__));

extern volatile uint16_t XBREV __attribute__((__sfr__));
__extension__ typedef struct tagXBREVBITS {
  union {
    struct {
      uint16_t XB:15;
      uint16_t BREN:1;
    };
    struct {
      uint16_t XB0:1;
      uint16_t XB1:1;
      uint16_t XB2:1;
      uint16_t XB3:1;
      uint16_t XB4:1;
      uint16_t XB5:1;
      uint16_t XB6:1;
      uint16_t XB7:1;
      uint16_t XB8:1;
      uint16_t XB9:1;
      uint16_t XB10:1;
      uint16_t XB11:1;
      uint16_t XB12:1;
      uint16_t XB13:1;
      uint16_t XB14:1;
    };
  };
} XBREVBITS;
extern volatile XBREVBITS XBREVbits __attribute__((__sfr__));


extern volatile uint16_t DISICNT __attribute__((__sfr__));

extern volatile uint16_t TBLPAG __attribute__((__sfr__));
typedef struct tagTBLPAGBITS {
  uint16_t TBLPAG:8;
} TBLPAGBITS;
extern volatile TBLPAGBITS TBLPAGbits __attribute__((__sfr__));


extern volatile uint16_t YPAG __attribute__((__sfr__));
typedef struct tagYPAGBITS {
  uint16_t YPAG:8;
} YPAGBITS;
extern volatile YPAGBITS YPAGbits __attribute__((__sfr__));


extern volatile uint16_t MSTRPR __attribute__((__sfr__));
typedef struct tagMSTRPRBITS {
  uint16_t NVMPR:1;
  uint16_t :2;
  uint16_t CAN2PR:1;
  uint16_t CANPR:1;
  uint16_t DMAPR:1;
} MSTRPRBITS;
extern volatile MSTRPRBITS MSTRPRbits __attribute__((__sfr__));


extern volatile uint16_t CTXTSTAT __attribute__((__sfr__));
typedef struct tagCTXTSTATBITS {
  uint16_t MCTXI:3;
  uint16_t :5;
  uint16_t CCTXI:3;
} CTXTSTATBITS;
extern volatile CTXTSTATBITS CTXTSTATbits __attribute__((__sfr__));


extern volatile uint16_t DMTCON __attribute__((__sfr__));
typedef struct tagDMTCONBITS {
  uint16_t :15;
  uint16_t ON:1;
} DMTCONBITS;
extern volatile DMTCONBITS DMTCONbits __attribute__((__sfr__));


extern volatile uint16_t DMTPRECLR __attribute__((__sfr__));
typedef struct tagDMTPRECLRBITS {
  uint16_t :8;
  uint16_t STEP1:8;
} DMTPRECLRBITS;
extern volatile DMTPRECLRBITS DMTPRECLRbits __attribute__((__sfr__));


extern volatile uint16_t DMTCLR __attribute__((__sfr__));
typedef struct tagDMTCLRBITS {
  uint16_t STEP2:8;
} DMTCLRBITS;
extern volatile DMTCLRBITS DMTCLRbits __attribute__((__sfr__));


extern volatile uint16_t DMTSTAT __attribute__((__sfr__));
typedef struct tagDMTSTATBITS {
  uint16_t WINOPN:1;
  uint16_t :4;
  uint16_t DMTEVENT:1;
  uint16_t BAD2:1;
  uint16_t BAD1:1;
} DMTSTATBITS;
extern volatile DMTSTATBITS DMTSTATbits __attribute__((__sfr__));


extern volatile uint16_t DMTCNTL __attribute__((__sfr__));

extern volatile uint16_t DMTCNTH __attribute__((__sfr__));

extern volatile uint16_t DMTHOLDREG __attribute__((__sfr__));

extern volatile uint16_t DMTPSCNTL __attribute__((__sfr__));

extern volatile uint16_t DMTPSCNTH __attribute__((__sfr__));

extern volatile uint16_t DMTPSINTVL __attribute__((__sfr__));

extern volatile uint16_t DMTPSINTVH __attribute__((__sfr__));

extern volatile uint16_t SENT1CON1 __attribute__((__sfr__));
typedef struct tagSENT1CON1BITS {
  uint16_t NIBCNT:3;
  uint16_t :1;
  uint16_t PS:1;
  uint16_t :1;
  uint16_t SPCEN:1;
  uint16_t PPP:1;
  uint16_t CRCEN:1;
  uint16_t TXPOL:1;
  uint16_t TXM:1;
  uint16_t RCVEN:1;
  uint16_t :1;
  uint16_t SNTSIDL:1;
  uint16_t :1;
  uint16_t SNTEN:1;
} SENT1CON1BITS;
extern volatile SENT1CON1BITS SENT1CON1bits __attribute__((__sfr__));


extern volatile uint16_t SENT1CON2 __attribute__((__sfr__));

extern volatile uint16_t SENT1CON3 __attribute__((__sfr__));

extern volatile uint16_t SENT1STAT __attribute__((__sfr__));
__extension__ typedef struct tagSENT1STATBITS {
  union {
    struct {
      uint16_t SYNCTXEN:1;
      uint16_t RXIDLE:1;
      uint16_t FRMERR:1;
      uint16_t CRCERR:1;
      uint16_t NIB:3;
      uint16_t PAUSE:1;
    };
    struct {
      uint16_t SYNC:1;
      uint16_t :3;
      uint16_t NIB0:1;
      uint16_t NIB1:1;
      uint16_t NIB2:1;
    };
    struct {
      uint16_t TXEN:1;
    };
  };
} SENT1STATBITS;
extern volatile SENT1STATBITS SENT1STATbits __attribute__((__sfr__));


extern volatile uint16_t SENT1SYNC __attribute__((__sfr__));

extern volatile uint16_t SENT1DATL __attribute__((__sfr__));
__extension__ typedef struct tagSENT1DATLBITS {
  union {
    struct {
      uint16_t CRC:4;
      uint16_t DATA6:4;
      uint16_t DATA5:4;
      uint16_t DATA4:4;
    };
    struct {
      uint16_t CRC0:1;
      uint16_t CRC1:1;
      uint16_t CRC2:1;
      uint16_t CRC3:1;
      uint16_t DATA60:1;
      uint16_t DATA61:1;
      uint16_t DATA62:1;
      uint16_t DATA63:1;
      uint16_t DATA50:1;
      uint16_t DATA51:1;
      uint16_t DATA52:1;
      uint16_t DATA53:1;
      uint16_t DATA40:1;
      uint16_t DATA41:1;
      uint16_t DATA42:1;
      uint16_t DATA43:1;
    };
  };
} SENT1DATLBITS;
extern volatile SENT1DATLBITS SENT1DATLbits __attribute__((__sfr__));


extern volatile uint16_t SENT1DATH __attribute__((__sfr__));
__extension__ typedef struct tagSENT1DATHBITS {
  union {
    struct {
      uint16_t DATA3:4;
      uint16_t DATA2:4;
      uint16_t DATA1:4;
      uint16_t STAT:4;
    };
    struct {
      uint16_t DATA30:1;
      uint16_t DATA31:1;
      uint16_t DATA32:1;
      uint16_t DATA33:1;
      uint16_t DATA20:1;
      uint16_t DATA21:1;
      uint16_t DATA22:1;
      uint16_t DATA23:1;
      uint16_t DATA10:1;
      uint16_t DATA11:1;
      uint16_t DATA12:1;
      uint16_t DATA13:1;
      uint16_t STAT0:1;
      uint16_t STAT1:1;
      uint16_t STAT2:1;
      uint16_t STAT3:1;
    };
  };
} SENT1DATHBITS;
extern volatile SENT1DATHBITS SENT1DATHbits __attribute__((__sfr__));


extern volatile uint16_t SENT2CON1 __attribute__((__sfr__));
typedef struct tagSENT2CON1BITS {
  uint16_t NIBCNT:3;
  uint16_t :1;
  uint16_t PS:1;
  uint16_t :1;
  uint16_t SPCEN:1;
  uint16_t PPP:1;
  uint16_t CRCEN:1;
  uint16_t TXPOL:1;
  uint16_t TXM:1;
  uint16_t RCVEN:1;
  uint16_t :1;
  uint16_t SNTSIDL:1;
  uint16_t :1;
  uint16_t SNTEN:1;
} SENT2CON1BITS;
extern volatile SENT2CON1BITS SENT2CON1bits __attribute__((__sfr__));


extern volatile uint16_t SENT2CON2 __attribute__((__sfr__));

extern volatile uint16_t SENT2CON3 __attribute__((__sfr__));

extern volatile uint16_t SENT2STAT __attribute__((__sfr__));
__extension__ typedef struct tagSENT2STATBITS {
  union {
    struct {
      uint16_t SYNCTXEN:1;
      uint16_t RXIDLE:1;
      uint16_t FRMERR:1;
      uint16_t CRCERR:1;
      uint16_t NIB:3;
      uint16_t PAUSE:1;
    };
    struct {
      uint16_t SYNC:1;
      uint16_t :3;
      uint16_t NIB0:1;
      uint16_t NIB1:1;
      uint16_t NIB2:1;
    };
    struct {
      uint16_t TXEN:1;
    };
  };
} SENT2STATBITS;
extern volatile SENT2STATBITS SENT2STATbits __attribute__((__sfr__));


extern volatile uint16_t SENT2SYNC __attribute__((__sfr__));

extern volatile uint16_t SENT2DATL __attribute__((__sfr__));
__extension__ typedef struct tagSENT2DATLBITS {
  union {
    struct {
      uint16_t CRC:4;
      uint16_t DATA6:4;
      uint16_t DATA5:4;
      uint16_t DATA4:4;
    };
    struct {
      uint16_t CRC0:1;
      uint16_t CRC1:1;
      uint16_t CRC2:1;
      uint16_t CRC3:1;
      uint16_t DATA60:1;
      uint16_t DATA61:1;
      uint16_t DATA62:1;
      uint16_t DATA63:1;
      uint16_t DATA50:1;
      uint16_t DATA51:1;
      uint16_t DATA52:1;
      uint16_t DATA53:1;
      uint16_t DATA40:1;
      uint16_t DATA41:1;
      uint16_t DATA42:1;
      uint16_t DATA43:1;
    };
  };
} SENT2DATLBITS;
extern volatile SENT2DATLBITS SENT2DATLbits __attribute__((__sfr__));


extern volatile uint16_t SENT2DATH __attribute__((__sfr__));
__extension__ typedef struct tagSENT2DATHBITS {
  union {
    struct {
      uint16_t DATA3:4;
      uint16_t DATA2:4;
      uint16_t DATA1:4;
      uint16_t STAT:4;
    };
    struct {
      uint16_t DATA30:1;
      uint16_t DATA31:1;
      uint16_t DATA32:1;
      uint16_t DATA33:1;
      uint16_t DATA20:1;
      uint16_t DATA21:1;
      uint16_t DATA22:1;
      uint16_t DATA23:1;
      uint16_t DATA10:1;
      uint16_t DATA11:1;
      uint16_t DATA12:1;
      uint16_t DATA13:1;
      uint16_t STAT0:1;
      uint16_t STAT1:1;
      uint16_t STAT2:1;
      uint16_t STAT3:1;
    };
  };
} SENT2DATHBITS;
extern volatile SENT2DATHBITS SENT2DATHbits __attribute__((__sfr__));


extern volatile uint16_t CRCCON1 __attribute__((__sfr__));
typedef struct tagCRCCON1BITS {
  uint16_t :2;
  uint16_t MOD:1;
  uint16_t LENDIAN:1;
  uint16_t CRCGO:1;
  uint16_t CRCISEL:1;
  uint16_t CRCMPT:1;
  uint16_t CRCFUL:1;
  uint16_t VWORD:5;
  uint16_t CSIDL:1;
  uint16_t :1;
  uint16_t CRCEN:1;
} CRCCON1BITS;
extern volatile CRCCON1BITS CRCCON1bits __attribute__((__sfr__));


extern volatile uint16_t CRCCONL __attribute__((__sfr__));
typedef struct tagCRCCONLBITS {
  uint16_t :2;
  uint16_t MOD:1;
  uint16_t LENDIAN:1;
  uint16_t CRCGO:1;
  uint16_t CRCISEL:1;
  uint16_t CRCMPT:1;
  uint16_t CRCFUL:1;
  uint16_t VWORD:5;
  uint16_t CSIDL:1;
  uint16_t :1;
  uint16_t CRCEN:1;
} CRCCONLBITS;
extern volatile CRCCONLBITS CRCCONLbits __attribute__((__sfr__));


extern volatile uint16_t CRCCON2 __attribute__((__sfr__));
typedef struct tagCRCCON2BITS {
  uint16_t PLEN:5;
  uint16_t :3;
  uint16_t DWIDTH:5;
} CRCCON2BITS;
extern volatile CRCCON2BITS CRCCON2bits __attribute__((__sfr__));


extern volatile uint16_t CRCCONH __attribute__((__sfr__));
typedef struct tagCRCCONHBITS {
  uint16_t PLEN:5;
  uint16_t :3;
  uint16_t DWIDTH:5;
} CRCCONHBITS;
extern volatile CRCCONHBITS CRCCONHbits __attribute__((__sfr__));


extern volatile uint16_t CRCXORL __attribute__((__sfr__));
typedef struct tagCRCXORLBITS {
  uint16_t :1;
  uint16_t X1:1;
  uint16_t X2:1;
  uint16_t X3:1;
  uint16_t X4:1;
  uint16_t X5:1;
  uint16_t X6:1;
  uint16_t X7:1;
  uint16_t X8:1;
  uint16_t X9:1;
  uint16_t X10:1;
  uint16_t X11:1;
  uint16_t X12:1;
  uint16_t X13:1;
  uint16_t X14:1;
  uint16_t X15:1;
} CRCXORLBITS;
extern volatile CRCXORLBITS CRCXORLbits __attribute__((__sfr__));


extern volatile uint16_t CRCXORH __attribute__((__sfr__));
typedef struct tagCRCXORHBITS {
  uint16_t X16:1;
  uint16_t X17:1;
  uint16_t X18:1;
  uint16_t X19:1;
  uint16_t X20:1;
  uint16_t X21:1;
  uint16_t X22:1;
  uint16_t X23:1;
  uint16_t X24:1;
  uint16_t X25:1;
  uint16_t X26:1;
  uint16_t X27:1;
  uint16_t X28:1;
  uint16_t X29:1;
  uint16_t X30:1;
  uint16_t X31:1;
} CRCXORHBITS;
extern volatile CRCXORHBITS CRCXORHbits __attribute__((__sfr__));


extern volatile uint16_t CRCDATL __attribute__((__sfr__));

extern volatile uint16_t CRCDATH __attribute__((__sfr__));

extern volatile uint16_t CRCWDATL __attribute__((__sfr__));

extern volatile uint16_t CRCWDATH __attribute__((__sfr__));

extern volatile uint16_t CLC1CONL __attribute__((__sfr__));
__extension__ typedef struct tagCLC1CONLBITS {
  union {
    struct {
      uint16_t MODE:3;
      uint16_t :2;
      uint16_t LCPOL:1;
      uint16_t LCOUT:1;
      uint16_t LCOE:1;
      uint16_t :2;
      uint16_t INTN:1;
      uint16_t INTP:1;
      uint16_t :3;
      uint16_t LCEN:1;
    };
    struct {
      uint16_t MODE0:1;
      uint16_t MODE1:1;
      uint16_t MODE2:1;
    };
  };
} CLC1CONLBITS;
extern volatile CLC1CONLBITS CLC1CONLbits __attribute__((__sfr__));


extern volatile uint16_t CLC1CONH __attribute__((__sfr__));
typedef struct tagCLC1CONHBITS {
  uint16_t G1POL:1;
  uint16_t G2POL:1;
  uint16_t G3POL:1;
  uint16_t G4POL:1;
} CLC1CONHBITS;
extern volatile CLC1CONHBITS CLC1CONHbits __attribute__((__sfr__));


extern volatile uint16_t CLC1SEL __attribute__((__sfr__));
__extension__ typedef struct tagCLC1SELBITS {
  union {
    struct {
      uint16_t DS1:3;
      uint16_t :1;
      uint16_t DS2:3;
      uint16_t :1;
      uint16_t DS3:3;
      uint16_t :1;
      uint16_t DS4:3;
    };
    struct {
      uint16_t DS10:1;
      uint16_t DS11:1;
      uint16_t DS12:1;
      uint16_t :1;
      uint16_t DS20:1;
      uint16_t DS21:1;
      uint16_t DS22:1;
      uint16_t :1;
      uint16_t DS30:1;
      uint16_t DS31:1;
      uint16_t DS32:1;
      uint16_t :1;
      uint16_t DS40:1;
      uint16_t DS41:1;
      uint16_t DS42:1;
    };
  };
} CLC1SELBITS;
extern volatile CLC1SELBITS CLC1SELbits __attribute__((__sfr__));


extern volatile uint16_t CLC1SELL __attribute__((__sfr__));
__extension__ typedef struct tagCLC1SELLBITS {
  union {
    struct {
      uint16_t DS1:3;
      uint16_t :1;
      uint16_t DS2:3;
      uint16_t :1;
      uint16_t DS3:3;
      uint16_t :1;
      uint16_t DS4:3;
    };
    struct {
      uint16_t DS10:1;
      uint16_t DS11:1;
      uint16_t DS12:1;
      uint16_t :1;
      uint16_t DS20:1;
      uint16_t DS21:1;
      uint16_t DS22:1;
      uint16_t :1;
      uint16_t DS30:1;
      uint16_t DS31:1;
      uint16_t DS32:1;
      uint16_t :1;
      uint16_t DS40:1;
      uint16_t DS41:1;
      uint16_t DS42:1;
    };
  };
} CLC1SELLBITS;
extern volatile CLC1SELLBITS CLC1SELLbits __attribute__((__sfr__));


extern volatile uint16_t CLC1GLSL __attribute__((__sfr__));
typedef struct tagCLC1GLSLBITS {
  uint16_t G1D1N:1;
  uint16_t G1D1T:1;
  uint16_t G1D2N:1;
  uint16_t G1D2T:1;
  uint16_t G1D3N:1;
  uint16_t G1D3T:1;
  uint16_t G1D4N:1;
  uint16_t G1D4T:1;
  uint16_t G2D1N:1;
  uint16_t G2D1T:1;
  uint16_t G2D2N:1;
  uint16_t G2D2T:1;
  uint16_t G2D3N:1;
  uint16_t G2D3T:1;
  uint16_t G2D4N:1;
  uint16_t G2D4T:1;
} CLC1GLSLBITS;
extern volatile CLC1GLSLBITS CLC1GLSLbits __attribute__((__sfr__));


extern volatile uint16_t CLC1GLSH __attribute__((__sfr__));
typedef struct tagCLC1GLSHBITS {
  uint16_t G3D1N:1;
  uint16_t G3D1T:1;
  uint16_t G3D2N:1;
  uint16_t G3D2T:1;
  uint16_t G3D3N:1;
  uint16_t G3D3T:1;
  uint16_t G3D4N:1;
  uint16_t G3D4T:1;
  uint16_t G4D1N:1;
  uint16_t G4D1T:1;
  uint16_t G4D2N:1;
  uint16_t G4D2T:1;
  uint16_t G4D3N:1;
  uint16_t G4D3T:1;
  uint16_t G4D4N:1;
  uint16_t G4D4T:1;
} CLC1GLSHBITS;
extern volatile CLC1GLSHBITS CLC1GLSHbits __attribute__((__sfr__));


extern volatile uint16_t CLC2CONL __attribute__((__sfr__));
__extension__ typedef struct tagCLC2CONLBITS {
  union {
    struct {
      uint16_t MODE:3;
      uint16_t :2;
      uint16_t LCPOL:1;
      uint16_t LCOUT:1;
      uint16_t LCOE:1;
      uint16_t :2;
      uint16_t INTN:1;
      uint16_t INTP:1;
      uint16_t :3;
      uint16_t LCEN:1;
    };
    struct {
      uint16_t MODE0:1;
      uint16_t MODE1:1;
      uint16_t MODE2:1;
    };
  };
} CLC2CONLBITS;
extern volatile CLC2CONLBITS CLC2CONLbits __attribute__((__sfr__));


extern volatile uint16_t CLC2CONH __attribute__((__sfr__));
typedef struct tagCLC2CONHBITS {
  uint16_t G1POL:1;
  uint16_t G2POL:1;
  uint16_t G3POL:1;
  uint16_t G4POL:1;
} CLC2CONHBITS;
extern volatile CLC2CONHBITS CLC2CONHbits __attribute__((__sfr__));


extern volatile uint16_t CLC2SEL __attribute__((__sfr__));
__extension__ typedef struct tagCLC2SELBITS {
  union {
    struct {
      uint16_t DS1:3;
      uint16_t :1;
      uint16_t DS2:3;
      uint16_t :1;
      uint16_t DS3:3;
      uint16_t :1;
      uint16_t DS4:3;
    };
    struct {
      uint16_t DS10:1;
      uint16_t DS11:1;
      uint16_t DS12:1;
      uint16_t :1;
      uint16_t DS20:1;
      uint16_t DS21:1;
      uint16_t DS22:1;
      uint16_t :1;
      uint16_t DS30:1;
      uint16_t DS31:1;
      uint16_t DS32:1;
      uint16_t :1;
      uint16_t DS40:1;
      uint16_t DS41:1;
      uint16_t DS42:1;
    };
  };
} CLC2SELBITS;
extern volatile CLC2SELBITS CLC2SELbits __attribute__((__sfr__));


extern volatile uint16_t CLC2SELL __attribute__((__sfr__));
__extension__ typedef struct tagCLC2SELLBITS {
  union {
    struct {
      uint16_t DS1:3;
      uint16_t :1;
      uint16_t DS2:3;
      uint16_t :1;
      uint16_t DS3:3;
      uint16_t :1;
      uint16_t DS4:3;
    };
    struct {
      uint16_t DS10:1;
      uint16_t DS11:1;
      uint16_t DS12:1;
      uint16_t :1;
      uint16_t DS20:1;
      uint16_t DS21:1;
      uint16_t DS22:1;
      uint16_t :1;
      uint16_t DS30:1;
      uint16_t DS31:1;
      uint16_t DS32:1;
      uint16_t :1;
      uint16_t DS40:1;
      uint16_t DS41:1;
      uint16_t DS42:1;
    };
  };
} CLC2SELLBITS;
extern volatile CLC2SELLBITS CLC2SELLbits __attribute__((__sfr__));


extern volatile uint16_t CLC2GLSL __attribute__((__sfr__));
typedef struct tagCLC2GLSLBITS {
  uint16_t G1D1N:1;
  uint16_t G1D1T:1;
  uint16_t G1D2N:1;
  uint16_t G1D2T:1;
  uint16_t G1D3N:1;
  uint16_t G1D3T:1;
  uint16_t G1D4N:1;
  uint16_t G1D4T:1;
  uint16_t G2D1N:1;
  uint16_t G2D1T:1;
  uint16_t G2D2N:1;
  uint16_t G2D2T:1;
  uint16_t G2D3N:1;
  uint16_t G2D3T:1;
  uint16_t G2D4N:1;
  uint16_t G2D4T:1;
} CLC2GLSLBITS;
extern volatile CLC2GLSLBITS CLC2GLSLbits __attribute__((__sfr__));


extern volatile uint16_t CLC2GLSH __attribute__((__sfr__));
typedef struct tagCLC2GLSHBITS {
  uint16_t G3D1N:1;
  uint16_t G3D1T:1;
  uint16_t G3D2N:1;
  uint16_t G3D2T:1;
  uint16_t G3D3N:1;
  uint16_t G3D3T:1;
  uint16_t G3D4N:1;
  uint16_t G3D4T:1;
  uint16_t G4D1N:1;
  uint16_t G4D1T:1;
  uint16_t G4D2N:1;
  uint16_t G4D2T:1;
  uint16_t G4D3N:1;
  uint16_t G4D3T:1;
  uint16_t G4D4N:1;
  uint16_t G4D4T:1;
} CLC2GLSHBITS;
extern volatile CLC2GLSHBITS CLC2GLSHbits __attribute__((__sfr__));


extern volatile uint16_t CLC3CONL __attribute__((__sfr__));
__extension__ typedef struct tagCLC3CONLBITS {
  union {
    struct {
      uint16_t MODE:3;
      uint16_t :2;
      uint16_t LCPOL:1;
      uint16_t LCOUT:1;
      uint16_t LCOE:1;
      uint16_t :2;
      uint16_t INTN:1;
      uint16_t INTP:1;
      uint16_t :3;
      uint16_t LCEN:1;
    };
    struct {
      uint16_t MODE0:1;
      uint16_t MODE1:1;
      uint16_t MODE2:1;
    };
  };
} CLC3CONLBITS;
extern volatile CLC3CONLBITS CLC3CONLbits __attribute__((__sfr__));


extern volatile uint16_t CLC3CONH __attribute__((__sfr__));
typedef struct tagCLC3CONHBITS {
  uint16_t G1POL:1;
  uint16_t G2POL:1;
  uint16_t G3POL:1;
  uint16_t G4POL:1;
} CLC3CONHBITS;
extern volatile CLC3CONHBITS CLC3CONHbits __attribute__((__sfr__));


extern volatile uint16_t CLC3SEL __attribute__((__sfr__));
__extension__ typedef struct tagCLC3SELBITS {
  union {
    struct {
      uint16_t DS1:3;
      uint16_t :1;
      uint16_t DS2:3;
      uint16_t :1;
      uint16_t DS3:3;
      uint16_t :1;
      uint16_t DS4:3;
    };
    struct {
      uint16_t DS10:1;
      uint16_t DS11:1;
      uint16_t DS12:1;
      uint16_t :1;
      uint16_t DS20:1;
      uint16_t DS21:1;
      uint16_t DS22:1;
      uint16_t :1;
      uint16_t DS30:1;
      uint16_t DS31:1;
      uint16_t DS32:1;
      uint16_t :1;
      uint16_t DS40:1;
      uint16_t DS41:1;
      uint16_t DS42:1;
    };
  };
} CLC3SELBITS;
extern volatile CLC3SELBITS CLC3SELbits __attribute__((__sfr__));


extern volatile uint16_t CLC3SELL __attribute__((__sfr__));
__extension__ typedef struct tagCLC3SELLBITS {
  union {
    struct {
      uint16_t DS1:3;
      uint16_t :1;
      uint16_t DS2:3;
      uint16_t :1;
      uint16_t DS3:3;
      uint16_t :1;
      uint16_t DS4:3;
    };
    struct {
      uint16_t DS10:1;
      uint16_t DS11:1;
      uint16_t DS12:1;
      uint16_t :1;
      uint16_t DS20:1;
      uint16_t DS21:1;
      uint16_t DS22:1;
      uint16_t :1;
      uint16_t DS30:1;
      uint16_t DS31:1;
      uint16_t DS32:1;
      uint16_t :1;
      uint16_t DS40:1;
      uint16_t DS41:1;
      uint16_t DS42:1;
    };
  };
} CLC3SELLBITS;
extern volatile CLC3SELLBITS CLC3SELLbits __attribute__((__sfr__));


extern volatile uint16_t CLC3GLSL __attribute__((__sfr__));
typedef struct tagCLC3GLSLBITS {
  uint16_t G1D1N:1;
  uint16_t G1D1T:1;
  uint16_t G1D2N:1;
  uint16_t G1D2T:1;
  uint16_t G1D3N:1;
  uint16_t G1D3T:1;
  uint16_t G1D4N:1;
  uint16_t G1D4T:1;
  uint16_t G2D1N:1;
  uint16_t G2D1T:1;
  uint16_t G2D2N:1;
  uint16_t G2D2T:1;
  uint16_t G2D3N:1;
  uint16_t G2D3T:1;
  uint16_t G2D4N:1;
  uint16_t G2D4T:1;
} CLC3GLSLBITS;
extern volatile CLC3GLSLBITS CLC3GLSLbits __attribute__((__sfr__));


extern volatile uint16_t CLC3GLSH __attribute__((__sfr__));
typedef struct tagCLC3GLSHBITS {
  uint16_t G3D1N:1;
  uint16_t G3D1T:1;
  uint16_t G3D2N:1;
  uint16_t G3D2T:1;
  uint16_t G3D3N:1;
  uint16_t G3D3T:1;
  uint16_t G3D4N:1;
  uint16_t G3D4T:1;
  uint16_t G4D1N:1;
  uint16_t G4D1T:1;
  uint16_t G4D2N:1;
  uint16_t G4D2T:1;
  uint16_t G4D3N:1;
  uint16_t G4D3T:1;
  uint16_t G4D4N:1;
  uint16_t G4D4T:1;
} CLC3GLSHBITS;
extern volatile CLC3GLSHBITS CLC3GLSHbits __attribute__((__sfr__));


extern volatile uint16_t CLC4CONL __attribute__((__sfr__));
__extension__ typedef struct tagCLC4CONLBITS {
  union {
    struct {
      uint16_t MODE:3;
      uint16_t :2;
      uint16_t LCPOL:1;
      uint16_t LCOUT:1;
      uint16_t LCOE:1;
      uint16_t :2;
      uint16_t INTN:1;
      uint16_t INTP:1;
      uint16_t :3;
      uint16_t LCEN:1;
    };
    struct {
      uint16_t MODE0:1;
      uint16_t MODE1:1;
      uint16_t MODE2:1;
    };
  };
} CLC4CONLBITS;
extern volatile CLC4CONLBITS CLC4CONLbits __attribute__((__sfr__));


extern volatile uint16_t CLC4CONH __attribute__((__sfr__));
typedef struct tagCLC4CONHBITS {
  uint16_t G1POL:1;
  uint16_t G2POL:1;
  uint16_t G3POL:1;
  uint16_t G4POL:1;
} CLC4CONHBITS;
extern volatile CLC4CONHBITS CLC4CONHbits __attribute__((__sfr__));


extern volatile uint16_t CLC4SEL __attribute__((__sfr__));
__extension__ typedef struct tagCLC4SELBITS {
  union {
    struct {
      uint16_t DS1:3;
      uint16_t :1;
      uint16_t DS2:3;
      uint16_t :1;
      uint16_t DS3:3;
      uint16_t :1;
      uint16_t DS4:3;
    };
    struct {
      uint16_t DS10:1;
      uint16_t DS11:1;
      uint16_t DS12:1;
      uint16_t :1;
      uint16_t DS20:1;
      uint16_t DS21:1;
      uint16_t DS22:1;
      uint16_t :1;
      uint16_t DS30:1;
      uint16_t DS31:1;
      uint16_t DS32:1;
      uint16_t :1;
      uint16_t DS40:1;
      uint16_t DS41:1;
      uint16_t DS42:1;
    };
  };
} CLC4SELBITS;
extern volatile CLC4SELBITS CLC4SELbits __attribute__((__sfr__));


extern volatile uint16_t CLC4SELL __attribute__((__sfr__));
__extension__ typedef struct tagCLC4SELLBITS {
  union {
    struct {
      uint16_t DS1:3;
      uint16_t :1;
      uint16_t DS2:3;
      uint16_t :1;
      uint16_t DS3:3;
      uint16_t :1;
      uint16_t DS4:3;
    };
    struct {
      uint16_t DS10:1;
      uint16_t DS11:1;
      uint16_t DS12:1;
      uint16_t :1;
      uint16_t DS20:1;
      uint16_t DS21:1;
      uint16_t DS22:1;
      uint16_t :1;
      uint16_t DS30:1;
      uint16_t DS31:1;
      uint16_t DS32:1;
      uint16_t :1;
      uint16_t DS40:1;
      uint16_t DS41:1;
      uint16_t DS42:1;
    };
  };
} CLC4SELLBITS;
extern volatile CLC4SELLBITS CLC4SELLbits __attribute__((__sfr__));


extern volatile uint16_t CLC4GLSL __attribute__((__sfr__));
typedef struct tagCLC4GLSLBITS {
  uint16_t G1D1N:1;
  uint16_t G1D1T:1;
  uint16_t G1D2N:1;
  uint16_t G1D2T:1;
  uint16_t G1D3N:1;
  uint16_t G1D3T:1;
  uint16_t G1D4N:1;
  uint16_t G1D4T:1;
  uint16_t G2D1N:1;
  uint16_t G2D1T:1;
  uint16_t G2D2N:1;
  uint16_t G2D2T:1;
  uint16_t G2D3N:1;
  uint16_t G2D3T:1;
  uint16_t G2D4N:1;
  uint16_t G2D4T:1;
} CLC4GLSLBITS;
extern volatile CLC4GLSLBITS CLC4GLSLbits __attribute__((__sfr__));


extern volatile uint16_t CLC4GLSH __attribute__((__sfr__));
typedef struct tagCLC4GLSHBITS {
  uint16_t G3D1N:1;
  uint16_t G3D1T:1;
  uint16_t G3D2N:1;
  uint16_t G3D2T:1;
  uint16_t G3D3N:1;
  uint16_t G3D3T:1;
  uint16_t G3D4N:1;
  uint16_t G3D4T:1;
  uint16_t G4D1N:1;
  uint16_t G4D1T:1;
  uint16_t G4D2N:1;
  uint16_t G4D2T:1;
  uint16_t G4D3N:1;
  uint16_t G4D3T:1;
  uint16_t G4D4N:1;
  uint16_t G4D4T:1;
} CLC4GLSHBITS;
extern volatile CLC4GLSHBITS CLC4GLSHbits __attribute__((__sfr__));


extern volatile uint16_t ECCCONL __attribute__((__sfr__));
typedef struct tagECCCONLBITS {
  uint16_t FLTINJ:1;
} ECCCONLBITS;
extern volatile ECCCONLBITS ECCCONLbits __attribute__((__sfr__));


extern volatile uint16_t ECCCONH __attribute__((__sfr__));
__extension__ typedef struct tagECCCONHBITS {
  union {
    struct {
      uint16_t FLT1PTR:8;
      uint16_t FLT2PTR:8;
    };
    struct {
      uint16_t :8;
      uint16_t FTL2PTR:8;
    };
  };
} ECCCONHBITS;
extern volatile ECCCONHBITS ECCCONHbits __attribute__((__sfr__));


extern volatile uint16_t ECCADDRL __attribute__((__sfr__));

extern volatile uint16_t ECCADDRH __attribute__((__sfr__));

extern volatile uint16_t ECCSTATL __attribute__((__sfr__));
typedef struct tagECCSTATLBITS {
  uint16_t SECIN:8;
  uint16_t SECOUT:8;
} ECCSTATLBITS;
extern volatile ECCSTATLBITS ECCSTATLbits __attribute__((__sfr__));


extern volatile uint16_t ECCSTATH __attribute__((__sfr__));
typedef struct tagECCSTATHBITS {
  uint16_t SYND:8;
  uint16_t DEDIN:1;
  uint16_t DEDOUT:1;
} ECCSTATHBITS;
extern volatile ECCSTATHBITS ECCSTATHbits __attribute__((__sfr__));


extern volatile uint16_t T1CON __attribute__((__sfr__));
typedef struct tagT1CONBITS {
  uint16_t :1;
  uint16_t TCS:1;
  uint16_t TSYNC:1;
  uint16_t :1;
  uint16_t TCKPS:2;
  uint16_t :1;
  uint16_t TGATE:1;
  uint16_t TECS:2;
  uint16_t PRWIP:1;
  uint16_t TMWIP:1;
  uint16_t TMWDIS:1;
  uint16_t TSIDL:1;
  uint16_t :1;
  uint16_t TON:1;
} T1CONBITS;
extern volatile T1CONBITS T1CONbits __attribute__((__sfr__));


extern volatile uint16_t TMR1 __attribute__((__sfr__));

extern volatile uint16_t PR1 __attribute__((__sfr__));

extern volatile uint16_t QEI1CON __attribute__((__sfr__));
typedef struct tagQEI1CONBITS {
  uint16_t CCM:2;
  uint16_t GATEN:1;
  uint16_t CNTPOL:1;
  uint16_t INTDIV:3;
  uint16_t :1;
  uint16_t IMV:2;
  uint16_t PIMOD:3;
  uint16_t QEISIDL:1;
  uint16_t :1;
  uint16_t QEIEN:1;
} QEI1CONBITS;
extern volatile QEI1CONBITS QEI1CONbits __attribute__((__sfr__));


extern volatile uint16_t QEI1IOC __attribute__((__sfr__));
typedef struct tagQEI1IOCBITS {
  uint16_t QEA:1;
  uint16_t QEB:1;
  uint16_t INDEX:1;
  uint16_t HOME:1;
  uint16_t QEAPOL:1;
  uint16_t QEBPOL:1;
  uint16_t IDXPOL:1;
  uint16_t HOMPOL:1;
  uint16_t SWPAB:1;
  uint16_t OUTFNC:2;
  uint16_t QFDIV:3;
  uint16_t FLTREN:1;
  uint16_t QCAPEN:1;
} QEI1IOCBITS;
extern volatile QEI1IOCBITS QEI1IOCbits __attribute__((__sfr__));


extern volatile uint16_t QEI1IOCH __attribute__((__sfr__));
typedef struct tagQEI1IOCHBITS {
  uint16_t HCAPEN:1;
} QEI1IOCHBITS;
extern volatile QEI1IOCHBITS QEI1IOCHbits __attribute__((__sfr__));


extern volatile uint16_t QEI1STAT __attribute__((__sfr__));
typedef struct tagQEI1STATBITS {
  uint16_t IDXIEN:1;
  uint16_t IDXIRQ:1;
  uint16_t HOMIEN:1;
  uint16_t HOMIRQ:1;
  uint16_t VELOVIEN:1;
  uint16_t VELOVIRQ:1;
  uint16_t PCIIEN:1;
  uint16_t PCIIRQ:1;
  uint16_t POSOVIEN:1;
  uint16_t POSOVIRQ:1;
  uint16_t PCLEQIEN:1;
  uint16_t PCLEQIRQ:1;
  uint16_t PCHEQIEN:1;
  uint16_t PCHEQIRQ:1;
} QEI1STATBITS;
extern volatile QEI1STATBITS QEI1STATbits __attribute__((__sfr__));


extern volatile uint16_t POS1CNTL __attribute__((__sfr__));

extern volatile uint16_t POS1CNTH __attribute__((__sfr__));

extern volatile uint16_t POS1HLD __attribute__((__sfr__));

extern volatile uint16_t VEL1CNT __attribute__((__sfr__));

extern volatile uint16_t VEL1CNTH __attribute__((__sfr__));

extern volatile uint16_t VEL1HLD __attribute__((__sfr__));

extern volatile uint16_t INT1TMRL __attribute__((__sfr__));

extern volatile uint16_t INT1TMRH __attribute__((__sfr__));

extern volatile uint16_t INT1HLDL __attribute__((__sfr__));

extern volatile uint16_t INT1HLDH __attribute__((__sfr__));

extern volatile uint16_t INDX1CNTL __attribute__((__sfr__));

extern volatile uint16_t INDX1CNTH __attribute__((__sfr__));

extern volatile uint16_t INDX1HLD __attribute__((__sfr__));

extern volatile uint16_t QEI1GECL __attribute__((__sfr__));

extern volatile uint16_t QEI1ICL __attribute__((__sfr__));

extern volatile uint16_t QEI1GECH __attribute__((__sfr__));

extern volatile uint16_t QEI1ICH __attribute__((__sfr__));

extern volatile uint16_t QEI1LECL __attribute__((__sfr__));

extern volatile uint16_t QEI1LECH __attribute__((__sfr__));

extern volatile uint16_t MSI1CON __attribute__((__sfr__));
__extension__ typedef struct tagMSI1CONBITS {
  union {
    struct {
      uint16_t :7;
      uint16_t SRSTIE:1;
      uint16_t STMIACK:1;
      uint16_t MTSIRQ:1;
      uint16_t RFITSEL:2;
      uint16_t :3;
      uint16_t SLVEN:1;
    };
    struct {
      uint16_t :10;
      uint16_t RFITSEL0:1;
      uint16_t RFITSEL1:1;
    };
  };
} MSI1CONBITS;
extern volatile MSI1CONBITS MSI1CONbits __attribute__((__sfr__));


extern volatile uint16_t MSI1STAT __attribute__((__sfr__));
__extension__ typedef struct tagMSI1STATBITS {
  union {
    struct {
      uint16_t :8;
      uint16_t MTSIACK:1;
      uint16_t STMIRQ:1;
      uint16_t SLVP2ACT:1;
      uint16_t VERFERR:1;
      uint16_t SLVPWR:2;
      uint16_t SLVWDRST:1;
      uint16_t SLVRST:1;
    };
    struct {
      uint16_t :12;
      uint16_t SLVPWR0:1;
      uint16_t SLVPWR1:1;
    };
  };
} MSI1STATBITS;
extern volatile MSI1STATBITS MSI1STATbits __attribute__((__sfr__));


extern volatile uint16_t MSI1KEY __attribute__((__sfr__));
__extension__ typedef struct tagMSI1KEYBITS {
  union {
    struct {
      uint16_t MSI1KEY:8;
    };
    struct {
      uint16_t MSI1KEY0:1;
      uint16_t MSI1KEY1:1;
      uint16_t MSI1KEY2:1;
      uint16_t MSI1KEY3:1;
      uint16_t MSI1KEY4:1;
      uint16_t MSI1KEY5:1;
      uint16_t MSI1KEY6:1;
      uint16_t MSI1KEY7:1;
    };
  };
} MSI1KEYBITS;
extern volatile MSI1KEYBITS MSI1KEYbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBXS __attribute__((__sfr__));
typedef struct tagMSI1MBXSBITS {
  uint16_t DTRDYA:1;
  uint16_t DTRDYB:1;
  uint16_t DTRDYC:1;
  uint16_t DTRDYD:1;
  uint16_t DTRDYE:1;
  uint16_t DTRDYF:1;
  uint16_t DTRDYG:1;
  uint16_t DTRDYH:1;
} MSI1MBXSBITS;
extern volatile MSI1MBXSBITS MSI1MBXSbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX0D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX0DBITS {
  union {
    struct {
      uint16_t MSI1MBX0D:16;
    };
    struct {
      uint16_t MSI1MBX0D0:1;
      uint16_t MSI1MBX0D1:1;
      uint16_t MSI1MBX0D2:1;
      uint16_t MSI1MBX0D3:1;
      uint16_t MSI1MBX0D4:1;
      uint16_t MSI1MBX0D5:1;
      uint16_t MSI1MBX0D6:1;
      uint16_t MSI1MBX0D7:1;
      uint16_t MSI1MBX0D8:1;
      uint16_t MSI1MBX0D9:1;
      uint16_t MSI1MBX0D10:1;
      uint16_t MSI1MBX0D11:1;
      uint16_t MSI1MBX0D12:1;
      uint16_t MSI1MBX0D13:1;
      uint16_t MSI1MBX0D14:1;
      uint16_t MSI1MBX0D15:1;
    };
  };
} MSI1MBX0DBITS;
extern volatile MSI1MBX0DBITS MSI1MBX0Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX1D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX1DBITS {
  union {
    struct {
      uint16_t MSI1MBX1D:16;
    };
    struct {
      uint16_t MSI1MBX1D0:1;
      uint16_t MSI1MBX1D1:1;
      uint16_t MSI1MBX1D2:1;
      uint16_t MSI1MBX1D3:1;
      uint16_t MSI1MBX1D4:1;
      uint16_t MSI1MBX1D5:1;
      uint16_t MSI1MBX1D6:1;
      uint16_t MSI1MBX1D7:1;
      uint16_t MSI1MBX1D8:1;
      uint16_t MSI1MBX1D9:1;
      uint16_t MSI1MBX1D10:1;
      uint16_t MSI1MBX1D11:1;
      uint16_t MSI1MBX1D12:1;
      uint16_t MSI1MBX1D13:1;
      uint16_t MSI1MBX1D14:1;
      uint16_t MSI1MBX1D15:1;
    };
  };
} MSI1MBX1DBITS;
extern volatile MSI1MBX1DBITS MSI1MBX1Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX2D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX2DBITS {
  union {
    struct {
      uint16_t MSI1MBX2D:16;
    };
    struct {
      uint16_t MSI1MBX2D0:1;
      uint16_t MSI1MBX2D1:1;
      uint16_t MSI1MBX2D2:1;
      uint16_t MSI1MBX2D3:1;
      uint16_t MSI1MBX2D4:1;
      uint16_t MSI1MBX2D5:1;
      uint16_t MSI1MBX2D6:1;
      uint16_t MSI1MBX2D7:1;
      uint16_t MSI1MBX2D8:1;
      uint16_t MSI1MBX2D9:1;
      uint16_t MSI1MBX2D10:1;
      uint16_t MSI1MBX2D11:1;
      uint16_t MSI1MBX2D12:1;
      uint16_t MSI1MBX2D13:1;
      uint16_t MSI1MBX2D14:1;
      uint16_t MSI1MBX2D15:1;
    };
  };
} MSI1MBX2DBITS;
extern volatile MSI1MBX2DBITS MSI1MBX2Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX3D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX3DBITS {
  union {
    struct {
      uint16_t MSI1MBX3D:16;
    };
    struct {
      uint16_t MSI1MBX3D0:1;
      uint16_t MSI1MBX3D1:1;
      uint16_t MSI1MBX3D2:1;
      uint16_t MSI1MBX3D3:1;
      uint16_t MSI1MBX3D4:1;
      uint16_t MSI1MBX3D5:1;
      uint16_t MSI1MBX3D6:1;
      uint16_t MSI1MBX3D7:1;
      uint16_t MSI1MBX3D8:1;
      uint16_t MSI1MBX3D9:1;
      uint16_t MSI1MBX3D10:1;
      uint16_t MSI1MBX3D11:1;
      uint16_t MSI1MBX3D12:1;
      uint16_t MSI1MBX3D13:1;
      uint16_t MSI1MBX3D14:1;
      uint16_t MSI1MBX3D15:1;
    };
  };
} MSI1MBX3DBITS;
extern volatile MSI1MBX3DBITS MSI1MBX3Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX4D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX4DBITS {
  union {
    struct {
      uint16_t MSI1MBX4D:16;
    };
    struct {
      uint16_t MSI1MBX4D0:1;
      uint16_t MSI1MBX4D1:1;
      uint16_t MSI1MBX4D2:1;
      uint16_t MSI1MBX4D3:1;
      uint16_t MSI1MBX4D4:1;
      uint16_t MSI1MBX4D5:1;
      uint16_t MSI1MBX4D6:1;
      uint16_t MSI1MBX4D7:1;
      uint16_t MSI1MBX4D8:1;
      uint16_t MSI1MBX4D9:1;
      uint16_t MSI1MBX4D10:1;
      uint16_t MSI1MBX4D11:1;
      uint16_t MSI1MBX4D12:1;
      uint16_t MSI1MBX4D13:1;
      uint16_t MSI1MBX4D14:1;
      uint16_t MSI1MBX4D15:1;
    };
  };
} MSI1MBX4DBITS;
extern volatile MSI1MBX4DBITS MSI1MBX4Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX5D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX5DBITS {
  union {
    struct {
      uint16_t MSI1MBX5D:16;
    };
    struct {
      uint16_t MSI1MBX5D0:1;
      uint16_t MSI1MBX5D1:1;
      uint16_t MSI1MBX5D2:1;
      uint16_t MSI1MBX5D3:1;
      uint16_t MSI1MBX5D4:1;
      uint16_t MSI1MBX5D5:1;
      uint16_t MSI1MBX5D6:1;
      uint16_t MSI1MBX5D7:1;
      uint16_t MSI1MBX5D8:1;
      uint16_t MSI1MBX5D9:1;
      uint16_t MSI1MBX5D10:1;
      uint16_t MSI1MBX5D11:1;
      uint16_t MSI1MBX5D12:1;
      uint16_t MSI1MBX5D13:1;
      uint16_t MSI1MBX5D14:1;
      uint16_t MSI1MBX5D15:1;
    };
  };
} MSI1MBX5DBITS;
extern volatile MSI1MBX5DBITS MSI1MBX5Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX6D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX6DBITS {
  union {
    struct {
      uint16_t MSI1MBX6D:16;
    };
    struct {
      uint16_t MSI1MBX6D0:1;
      uint16_t MSI1MBX6D1:1;
      uint16_t MSI1MBX6D2:1;
      uint16_t MSI1MBX6D3:1;
      uint16_t MSI1MBX6D4:1;
      uint16_t MSI1MBX6D5:1;
      uint16_t MSI1MBX6D6:1;
      uint16_t MSI1MBX6D7:1;
      uint16_t MSI1MBX6D8:1;
      uint16_t MSI1MBX6D9:1;
      uint16_t MSI1MBX6D10:1;
      uint16_t MSI1MBX6D11:1;
      uint16_t MSI1MBX6D12:1;
      uint16_t MSI1MBX6D13:1;
      uint16_t MSI1MBX6D14:1;
      uint16_t MSI1MBX6D15:1;
    };
  };
} MSI1MBX6DBITS;
extern volatile MSI1MBX6DBITS MSI1MBX6Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX7D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX7DBITS {
  union {
    struct {
      uint16_t MSI1MBX7D:16;
    };
    struct {
      uint16_t MSI1MBX7D0:1;
      uint16_t MSI1MBX7D1:1;
      uint16_t MSI1MBX7D2:1;
      uint16_t MSI1MBX7D3:1;
      uint16_t MSI1MBX7D4:1;
      uint16_t MSI1MBX7D5:1;
      uint16_t MSI1MBX7D6:1;
      uint16_t MSI1MBX7D7:1;
      uint16_t MSI1MBX7D8:1;
      uint16_t MSI1MBX7D9:1;
      uint16_t MSI1MBX7D10:1;
      uint16_t MSI1MBX7D11:1;
      uint16_t MSI1MBX7D12:1;
      uint16_t MSI1MBX7D13:1;
      uint16_t MSI1MBX7D14:1;
      uint16_t MSI1MBX7D15:1;
    };
  };
} MSI1MBX7DBITS;
extern volatile MSI1MBX7DBITS MSI1MBX7Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX8D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX8DBITS {
  union {
    struct {
      uint16_t MSI1MBX8D:16;
    };
    struct {
      uint16_t MSI1MBX8D0:1;
      uint16_t MSI1MBX8D1:1;
      uint16_t MSI1MBX8D2:1;
      uint16_t MSI1MBX8D3:1;
      uint16_t MSI1MBX8D4:1;
      uint16_t MSI1MBX8D5:1;
      uint16_t MSI1MBX8D6:1;
      uint16_t MSI1MBX8D7:1;
      uint16_t MSI1MBX8D8:1;
      uint16_t MSI1MBX8D9:1;
      uint16_t MSI1MBX8D10:1;
      uint16_t MSI1MBX8D11:1;
      uint16_t MSI1MBX8D12:1;
      uint16_t MSI1MBX8D13:1;
      uint16_t MSI1MBX8D14:1;
      uint16_t MSI1MBX8D15:1;
    };
  };
} MSI1MBX8DBITS;
extern volatile MSI1MBX8DBITS MSI1MBX8Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX9D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX9DBITS {
  union {
    struct {
      uint16_t MSI1MBX9D:16;
    };
    struct {
      uint16_t MSI1MBX9D0:1;
      uint16_t MSI1MBX9D1:1;
      uint16_t MSI1MBX9D2:1;
      uint16_t MSI1MBX9D3:1;
      uint16_t MSI1MBX9D4:1;
      uint16_t MSI1MBX9D5:1;
      uint16_t MSI1MBX9D6:1;
      uint16_t MSI1MBX9D7:1;
      uint16_t MSI1MBX9D8:1;
      uint16_t MSI1MBX9D9:1;
      uint16_t MSI1MBX9D10:1;
      uint16_t MSI1MBX9D11:1;
      uint16_t MSI1MBX9D12:1;
      uint16_t MSI1MBX9D13:1;
      uint16_t MSI1MBX9D14:1;
      uint16_t MSI1MBX9D15:1;
    };
  };
} MSI1MBX9DBITS;
extern volatile MSI1MBX9DBITS MSI1MBX9Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX10D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX10DBITS {
  union {
    struct {
      uint16_t MSI1MBX10D:16;
    };
    struct {
      uint16_t MSI1MBX10D0:1;
      uint16_t MSI1MBX10D1:1;
      uint16_t MSI1MBX10D2:1;
      uint16_t MSI1MBX10D3:1;
      uint16_t MSI1MBX10D4:1;
      uint16_t MSI1MBX10D5:1;
      uint16_t MSI1MBX10D6:1;
      uint16_t MSI1MBX10D7:1;
      uint16_t MSI1MBX10D8:1;
      uint16_t MSI1MBX10D9:1;
      uint16_t MSI1MBX10D10:1;
      uint16_t MSI1MBX10D11:1;
      uint16_t MSI1MBX10D12:1;
      uint16_t MSI1MBX10D13:1;
      uint16_t MSI1MBX10D14:1;
      uint16_t MSI1MBX10D15:1;
    };
  };
} MSI1MBX10DBITS;
extern volatile MSI1MBX10DBITS MSI1MBX10Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX11D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX11DBITS {
  union {
    struct {
      uint16_t MSI1MBX11D:16;
    };
    struct {
      uint16_t MSI1MBX11D0:1;
      uint16_t MSI1MBX11D1:1;
      uint16_t MSI1MBX11D2:1;
      uint16_t MSI1MBX11D3:1;
      uint16_t MSI1MBX11D4:1;
      uint16_t MSI1MBX11D5:1;
      uint16_t MSI1MBX11D6:1;
      uint16_t MSI1MBX11D7:1;
      uint16_t MSI1MBX11D8:1;
      uint16_t MSI1MBX11D9:1;
      uint16_t MSI1MBX11D10:1;
      uint16_t MSI1MBX11D11:1;
      uint16_t MSI1MBX11D12:1;
      uint16_t MSI1MBX11D13:1;
      uint16_t MSI1MBX11D14:1;
      uint16_t MSI1MBX11D15:1;
    };
  };
} MSI1MBX11DBITS;
extern volatile MSI1MBX11DBITS MSI1MBX11Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX12D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX12DBITS {
  union {
    struct {
      uint16_t MSI1MBX12D:16;
    };
    struct {
      uint16_t MSI1MBX12D0:1;
      uint16_t MSI1MBX12D1:1;
      uint16_t MSI1MBX12D2:1;
      uint16_t MSI1MBX12D3:1;
      uint16_t MSI1MBX12D4:1;
      uint16_t MSI1MBX12D5:1;
      uint16_t MSI1MBX12D6:1;
      uint16_t MSI1MBX12D7:1;
      uint16_t MSI1MBX12D8:1;
      uint16_t MSI1MBX12D9:1;
      uint16_t MSI1MBX12D10:1;
      uint16_t MSI1MBX12D11:1;
      uint16_t MSI1MBX12D12:1;
      uint16_t MSI1MBX12D13:1;
      uint16_t MSI1MBX12D14:1;
      uint16_t MSI1MBX12D15:1;
    };
  };
} MSI1MBX12DBITS;
extern volatile MSI1MBX12DBITS MSI1MBX12Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX13D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX13DBITS {
  union {
    struct {
      uint16_t MSI1MBX13D:16;
    };
    struct {
      uint16_t MSI1MBX13D0:1;
      uint16_t MSI1MBX13D1:1;
      uint16_t MSI1MBX13D2:1;
      uint16_t MSI1MBX13D3:1;
      uint16_t MSI1MBX13D4:1;
      uint16_t MSI1MBX13D5:1;
      uint16_t MSI1MBX13D6:1;
      uint16_t MSI1MBX13D7:1;
      uint16_t MSI1MBX13D8:1;
      uint16_t MSI1MBX13D9:1;
      uint16_t MSI1MBX13D10:1;
      uint16_t MSI1MBX13D11:1;
      uint16_t MSI1MBX13D12:1;
      uint16_t MSI1MBX13D13:1;
      uint16_t MSI1MBX13D14:1;
      uint16_t MSI1MBX13D15:1;
    };
  };
} MSI1MBX13DBITS;
extern volatile MSI1MBX13DBITS MSI1MBX13Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX14D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX14DBITS {
  union {
    struct {
      uint16_t MSI1MBX14D:16;
    };
    struct {
      uint16_t MSI1MBX14D0:1;
      uint16_t MSI1MBX14D1:1;
      uint16_t MSI1MBX14D2:1;
      uint16_t MSI1MBX14D3:1;
      uint16_t MSI1MBX14D4:1;
      uint16_t MSI1MBX14D5:1;
      uint16_t MSI1MBX14D6:1;
      uint16_t MSI1MBX14D7:1;
      uint16_t MSI1MBX14D8:1;
      uint16_t MSI1MBX14D9:1;
      uint16_t MSI1MBX14D10:1;
      uint16_t MSI1MBX14D11:1;
      uint16_t MSI1MBX14D12:1;
      uint16_t MSI1MBX14D13:1;
      uint16_t MSI1MBX14D14:1;
      uint16_t MSI1MBX14D15:1;
    };
  };
} MSI1MBX14DBITS;
extern volatile MSI1MBX14DBITS MSI1MBX14Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1MBX15D __attribute__((__sfr__));
__extension__ typedef struct tagMSI1MBX15DBITS {
  union {
    struct {
      uint16_t MSI1MBX15D:16;
    };
    struct {
      uint16_t MSI1MBX15D0:1;
      uint16_t MSI1MBX15D1:1;
      uint16_t MSI1MBX15D2:1;
      uint16_t MSI1MBX15D3:1;
      uint16_t MSI1MBX15D4:1;
      uint16_t MSI1MBX15D5:1;
      uint16_t MSI1MBX15D6:1;
      uint16_t MSI1MBX15D7:1;
      uint16_t MSI1MBX15D8:1;
      uint16_t MSI1MBX15D9:1;
      uint16_t MSI1MBX15D10:1;
      uint16_t MSI1MBX15D11:1;
      uint16_t MSI1MBX15D12:1;
      uint16_t MSI1MBX15D13:1;
      uint16_t MSI1MBX15D14:1;
      uint16_t MSI1MBX15D15:1;
    };
  };
} MSI1MBX15DBITS;
extern volatile MSI1MBX15DBITS MSI1MBX15Dbits __attribute__((__sfr__));


extern volatile uint16_t MSI1FIFOCS __attribute__((__sfr__));
typedef struct tagMSI1FIFOCSBITS {
  uint16_t RFEMPTY:1;
  uint16_t RFFULL:1;
  uint16_t RFUF:1;
  uint16_t RFOF:1;
  uint16_t :3;
  uint16_t RFEN:1;
  uint16_t WFEMPTY:1;
  uint16_t WFFULL:1;
  uint16_t WFUF:1;
  uint16_t WFOF:1;
  uint16_t :3;
  uint16_t WFEN:1;
} MSI1FIFOCSBITS;
extern volatile MSI1FIFOCSBITS MSI1FIFOCSbits __attribute__((__sfr__));


extern volatile uint16_t MRSWFDATA __attribute__((__sfr__));
__extension__ typedef struct tagMRSWFDATABITS {
  union {
    struct {
      uint16_t MRSWFDATA:16;
    };
    struct {
      uint16_t MRSWFDATA0:1;
      uint16_t MRSWFDATA1:1;
      uint16_t MRSWFDATA2:1;
      uint16_t MRSWFDATA3:1;
      uint16_t MRSWFDATA4:1;
      uint16_t MRSWFDATA5:1;
      uint16_t MRSWFDATA6:1;
      uint16_t MRSWFDATA7:1;
      uint16_t MRSWFDATA8:1;
      uint16_t MRSWFDATA9:1;
      uint16_t MRSWFDATA10:1;
      uint16_t MRSWFDATA11:1;
      uint16_t MRSWFDATA12:1;
      uint16_t MRSWFDATA13:1;
      uint16_t MRSWFDATA14:1;
      uint16_t MRSWFDATA15:1;
    };
  };
} MRSWFDATABITS;
extern volatile MRSWFDATABITS MRSWFDATAbits __attribute__((__sfr__));


extern volatile uint16_t MWSRFDATA __attribute__((__sfr__));
__extension__ typedef struct tagMWSRFDATABITS {
  union {
    struct {
      uint16_t MWSRFDATA:16;
    };
    struct {
      uint16_t MWSRFDATA0:1;
      uint16_t MWSRFDATA1:1;
      uint16_t MWSRFDATA2:1;
      uint16_t MWSRFDATA3:1;
      uint16_t MWSRFDATA4:1;
      uint16_t MWSRFDATA5:1;
      uint16_t MWSRFDATA6:1;
      uint16_t MWSRFDATA7:1;
      uint16_t MWSRFDATA8:1;
      uint16_t MWSRFDATA9:1;
      uint16_t MWSRFDATA10:1;
      uint16_t MWSRFDATA11:1;
      uint16_t MWSRFDATA12:1;
      uint16_t MWSRFDATA13:1;
      uint16_t MWSRFDATA14:1;
      uint16_t MWSRFDATA15:1;
    };
  };
} MWSRFDATABITS;
extern volatile MWSRFDATABITS MWSRFDATAbits __attribute__((__sfr__));


extern volatile uint16_t I2C1CON1 __attribute__((__sfr__));
typedef struct tagI2C1CON1BITS {
  uint16_t SEN:1;
  uint16_t RSEN:1;
  uint16_t PEN:1;
  uint16_t RCEN:1;
  uint16_t ACKEN:1;
  uint16_t ACKDT:1;
  uint16_t STREN:1;
  uint16_t GCEN:1;
  uint16_t SMEN:1;
  uint16_t DISSLW:1;
  uint16_t A10M:1;
  uint16_t STRICT:1;
  uint16_t SCLREL:1;
  uint16_t I2CSIDL:1;
  uint16_t :1;
  uint16_t I2CEN:1;
} I2C1CON1BITS;
extern volatile I2C1CON1BITS I2C1CON1bits __attribute__((__sfr__));


extern volatile uint16_t I2C1CONL __attribute__((__sfr__));
typedef struct tagI2C1CONLBITS {
  uint16_t SEN:1;
  uint16_t RSEN:1;
  uint16_t PEN:1;
  uint16_t RCEN:1;
  uint16_t ACKEN:1;
  uint16_t ACKDT:1;
  uint16_t STREN:1;
  uint16_t GCEN:1;
  uint16_t SMEN:1;
  uint16_t DISSLW:1;
  uint16_t A10M:1;
  uint16_t STRICT:1;
  uint16_t SCLREL:1;
  uint16_t I2CSIDL:1;
  uint16_t :1;
  uint16_t I2CEN:1;
} I2C1CONLBITS;
extern volatile I2C1CONLBITS I2C1CONLbits __attribute__((__sfr__));


extern volatile uint16_t I2C1CON2 __attribute__((__sfr__));
typedef struct tagI2C1CON2BITS {
  uint16_t DHEN:1;
  uint16_t AHEN:1;
  uint16_t SBCDE:1;
  uint16_t SDAHT:1;
  uint16_t BOEN:1;
  uint16_t SCIE:1;
  uint16_t PCIE:1;
} I2C1CON2BITS;
extern volatile I2C1CON2BITS I2C1CON2bits __attribute__((__sfr__));


extern volatile uint16_t I2C1CONH __attribute__((__sfr__));
typedef struct tagI2C1CONHBITS {
  uint16_t DHEN:1;
  uint16_t AHEN:1;
  uint16_t SBCDE:1;
  uint16_t SDAHT:1;
  uint16_t BOEN:1;
  uint16_t SCIE:1;
  uint16_t PCIE:1;
} I2C1CONHBITS;
extern volatile I2C1CONHBITS I2C1CONHbits __attribute__((__sfr__));


extern volatile uint16_t I2C1STAT __attribute__((__sfr__));
typedef struct tagI2C1STATBITS {
  uint16_t TBF:1;
  uint16_t RBF:1;
  uint16_t R_W:1;
  uint16_t S:1;
  uint16_t P:1;
  uint16_t D_A:1;
  uint16_t I2COV:1;
  uint16_t IWCOL:1;
  uint16_t ADD10:1;
  uint16_t GCSTAT:1;
  uint16_t BCL:1;
  uint16_t :2;
  uint16_t ACKTIM:1;
  uint16_t TRSTAT:1;
  uint16_t ACKSTAT:1;
} I2C1STATBITS;
extern volatile I2C1STATBITS I2C1STATbits __attribute__((__sfr__));


extern volatile uint16_t I2C1ADD __attribute__((__sfr__));
typedef struct tagI2C1ADDBITS {
  uint16_t ADD:10;
} I2C1ADDBITS;
extern volatile I2C1ADDBITS I2C1ADDbits __attribute__((__sfr__));


extern volatile uint16_t I2C1MSK __attribute__((__sfr__));
__extension__ typedef struct tagI2C1MSKBITS {
  union {
    struct {
      uint16_t AMSK:10;
    };
    struct {
      uint16_t AMSK0:1;
      uint16_t AMSK1:1;
      uint16_t AMSK2:1;
      uint16_t AMSK3:1;
      uint16_t AMSK4:1;
      uint16_t AMSK5:1;
      uint16_t AMSK6:1;
      uint16_t AMSK7:1;
      uint16_t AMSK8:1;
      uint16_t AMSK9:1;
    };
  };
} I2C1MSKBITS;
extern volatile I2C1MSKBITS I2C1MSKbits __attribute__((__sfr__));


extern volatile uint16_t I2C1BRG __attribute__((__sfr__));

extern volatile uint16_t I2C1TRN __attribute__((__sfr__));
typedef struct tagI2C1TRNBITS {
  uint16_t I2CTXDATA:8;
} I2C1TRNBITS;
extern volatile I2C1TRNBITS I2C1TRNbits __attribute__((__sfr__));


extern volatile uint16_t I2C1RCV __attribute__((__sfr__));
typedef struct tagI2C1RCVBITS {
  uint16_t I2CRXDATA:8;
} I2C1RCVBITS;
extern volatile I2C1RCVBITS I2C1RCVbits __attribute__((__sfr__));


extern volatile uint16_t I2C2CON1 __attribute__((__sfr__));
typedef struct tagI2C2CON1BITS {
  uint16_t SEN:1;
  uint16_t RSEN:1;
  uint16_t PEN:1;
  uint16_t RCEN:1;
  uint16_t ACKEN:1;
  uint16_t ACKDT:1;
  uint16_t STREN:1;
  uint16_t GCEN:1;
  uint16_t SMEN:1;
  uint16_t DISSLW:1;
  uint16_t A10M:1;
  uint16_t STRICT:1;
  uint16_t SCLREL:1;
  uint16_t I2CSIDL:1;
  uint16_t :1;
  uint16_t I2CEN:1;
} I2C2CON1BITS;
extern volatile I2C2CON1BITS I2C2CON1bits __attribute__((__sfr__));


extern volatile uint16_t I2C2CONL __attribute__((__sfr__));
typedef struct tagI2C2CONLBITS {
  uint16_t SEN:1;
  uint16_t RSEN:1;
  uint16_t PEN:1;
  uint16_t RCEN:1;
  uint16_t ACKEN:1;
  uint16_t ACKDT:1;
  uint16_t STREN:1;
  uint16_t GCEN:1;
  uint16_t SMEN:1;
  uint16_t DISSLW:1;
  uint16_t A10M:1;
  uint16_t STRICT:1;
  uint16_t SCLREL:1;
  uint16_t I2CSIDL:1;
  uint16_t :1;
  uint16_t I2CEN:1;
} I2C2CONLBITS;
extern volatile I2C2CONLBITS I2C2CONLbits __attribute__((__sfr__));


extern volatile uint16_t I2C2CON2 __attribute__((__sfr__));
typedef struct tagI2C2CON2BITS {
  uint16_t DHEN:1;
  uint16_t AHEN:1;
  uint16_t SBCDE:1;
  uint16_t SDAHT:1;
  uint16_t BOEN:1;
  uint16_t SCIE:1;
  uint16_t PCIE:1;
} I2C2CON2BITS;
extern volatile I2C2CON2BITS I2C2CON2bits __attribute__((__sfr__));


extern volatile uint16_t I2C2CONH __attribute__((__sfr__));
typedef struct tagI2C2CONHBITS {
  uint16_t DHEN:1;
  uint16_t AHEN:1;
  uint16_t SBCDE:1;
  uint16_t SDAHT:1;
  uint16_t BOEN:1;
  uint16_t SCIE:1;
  uint16_t PCIE:1;
} I2C2CONHBITS;
extern volatile I2C2CONHBITS I2C2CONHbits __attribute__((__sfr__));


extern volatile uint16_t I2C2STAT __attribute__((__sfr__));
typedef struct tagI2C2STATBITS {
  uint16_t TBF:1;
  uint16_t RBF:1;
  uint16_t R_W:1;
  uint16_t S:1;
  uint16_t P:1;
  uint16_t D_A:1;
  uint16_t I2COV:1;
  uint16_t IWCOL:1;
  uint16_t ADD10:1;
  uint16_t GCSTAT:1;
  uint16_t BCL:1;
  uint16_t :2;
  uint16_t ACKTIM:1;
  uint16_t TRSTAT:1;
  uint16_t ACKSTAT:1;
} I2C2STATBITS;
extern volatile I2C2STATBITS I2C2STATbits __attribute__((__sfr__));


extern volatile uint16_t I2C2ADD __attribute__((__sfr__));
typedef struct tagI2C2ADDBITS {
  uint16_t ADD:10;
} I2C2ADDBITS;
extern volatile I2C2ADDBITS I2C2ADDbits __attribute__((__sfr__));


extern volatile uint16_t I2C2MSK __attribute__((__sfr__));
__extension__ typedef struct tagI2C2MSKBITS {
  union {
    struct {
      uint16_t AMSK:10;
    };
    struct {
      uint16_t AMSK0:1;
      uint16_t AMSK1:1;
      uint16_t AMSK2:1;
      uint16_t AMSK3:1;
      uint16_t AMSK4:1;
      uint16_t AMSK5:1;
      uint16_t AMSK6:1;
      uint16_t AMSK7:1;
      uint16_t AMSK8:1;
      uint16_t AMSK9:1;
    };
  };
} I2C2MSKBITS;
extern volatile I2C2MSKBITS I2C2MSKbits __attribute__((__sfr__));


extern volatile uint16_t I2C2BRG __attribute__((__sfr__));

extern volatile uint16_t I2C2TRN __attribute__((__sfr__));
typedef struct tagI2C2TRNBITS {
  uint16_t I2CTXDATA:8;
} I2C2TRNBITS;
extern volatile I2C2TRNBITS I2C2TRNbits __attribute__((__sfr__));


extern volatile uint16_t I2C2RCV __attribute__((__sfr__));
typedef struct tagI2C2RCVBITS {
  uint16_t I2CRXDATA:8;
} I2C2RCVBITS;
extern volatile I2C2RCVBITS I2C2RCVbits __attribute__((__sfr__));



typedef struct tagUART {
        uint16_t uxmode;
        uint16_t uxsta;
        uint16_t uxtxreg;
        uint16_t uxrxreg;
        uint16_t uxbrg;
} UART, *PUART;
# 2348 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern volatile UART UART1 __attribute__((__sfr__));

extern volatile UART UART2 __attribute__((__sfr__));


extern volatile uint16_t U1MODE __attribute__((__sfr__));
__extension__ typedef struct tagU1MODEBITS {
  union {
    struct {
      uint16_t MOD:4;
      uint16_t URXEN:1;
      uint16_t UTXEN:1;
      uint16_t ABAUD:1;
      uint16_t BRGH:1;
      uint16_t UTXBRK:1;
      uint16_t BRKOVR:1;
      uint16_t :1;
      uint16_t RXBIMD:1;
      uint16_t WAKE:1;
      uint16_t USIDL:1;
      uint16_t :1;
      uint16_t UARTEN:1;
    };
    struct {
      uint16_t MOD0:1;
      uint16_t MOD1:1;
      uint16_t MOD2:1;
      uint16_t MOD3:1;
    };
  };
} U1MODEBITS;
extern volatile U1MODEBITS U1MODEbits __attribute__((__sfr__));


extern volatile uint16_t U1MODEH __attribute__((__sfr__));
__extension__ typedef struct tagU1MODEHBITS {
  union {
    struct {
      uint16_t FLO:2;
      uint16_t UTXINV:1;
      uint16_t C0EN:1;
      uint16_t STSEL:2;
      uint16_t URXINV:1;
      uint16_t RUNOVF:1;
      uint16_t HALFDPLX:1;
      uint16_t BCLKSEL:2;
      uint16_t BCLKMOD:1;
      uint16_t :2;
      uint16_t ACTIVE:1;
      uint16_t SLPEN:1;
    };
    struct {
      uint16_t FLO0:1;
      uint16_t FLO1:1;
      uint16_t :2;
      uint16_t STSEL0:1;
      uint16_t STSEL1:1;
      uint16_t :3;
      uint16_t BCLKSEL0:1;
      uint16_t BCLKSEL1:1;
    };
  };
} U1MODEHBITS;
extern volatile U1MODEHBITS U1MODEHbits __attribute__((__sfr__));


extern volatile uint16_t U1STA __attribute__((__sfr__));
typedef struct tagU1STABITS {
  uint16_t TXCIF:1;
  uint16_t OERR:1;
  uint16_t RXBKIF:1;
  uint16_t FERR:1;
  uint16_t CERIF:1;
  uint16_t ABDOVF:1;
  uint16_t PERR:1;
  uint16_t TRMT:1;
  uint16_t TXCIE:1;
  uint16_t OERIE:1;
  uint16_t RXBKIE:1;
  uint16_t FERIE:1;
  uint16_t CERIE:1;
  uint16_t ABDOVE:1;
  uint16_t PERIE:1;
  uint16_t TXMTIE:1;
} U1STABITS;
extern volatile U1STABITS U1STAbits __attribute__((__sfr__));


extern volatile uint16_t U1STAH __attribute__((__sfr__));
__extension__ typedef struct tagU1STAHBITS {
  union {
    struct {
      uint16_t URXBF:1;
      uint16_t URXBE:1;
      uint16_t XON:1;
      uint16_t RIDLE:1;
      uint16_t UTXBF:1;
      uint16_t UTXBE:1;
      uint16_t STPMD:1;
      uint16_t TXWRE:1;
      uint16_t URXISEL:3;
      uint16_t :1;
      uint16_t UTXISEL:3;
    };
    struct {
      uint16_t :8;
      uint16_t URXISEL0:1;
      uint16_t URXISEL1:1;
      uint16_t URXISEL2:1;
      uint16_t :1;
      uint16_t UTXISEL0:1;
      uint16_t UTXISEL1:1;
      uint16_t UTXISEL2:1;
    };
  };
} U1STAHBITS;
extern volatile U1STAHBITS U1STAHbits __attribute__((__sfr__));


extern volatile uint16_t U1BRG __attribute__((__sfr__));
__extension__ typedef struct tagU1BRGBITS {
  union {
    struct {
      uint16_t BRG:16;
    };
    struct {
      uint16_t BRG0:1;
      uint16_t BRG1:1;
      uint16_t BRG2:1;
      uint16_t BRG3:1;
      uint16_t BRG4:1;
      uint16_t BRG5:1;
      uint16_t BRG6:1;
      uint16_t BRG7:1;
      uint16_t BRG8:1;
      uint16_t BRG9:1;
      uint16_t BRG10:1;
      uint16_t BRG11:1;
      uint16_t BRG12:1;
      uint16_t BRG13:1;
      uint16_t BRG14:1;
      uint16_t BRG15:1;
    };
  };
} U1BRGBITS;
extern volatile U1BRGBITS U1BRGbits __attribute__((__sfr__));


extern volatile uint16_t U1BRGH __attribute__((__sfr__));
__extension__ typedef struct tagU1BRGHBITS {
  union {
    struct {
      uint16_t BRG:4;
    };
    struct {
      uint16_t BRG16:1;
      uint16_t BRG1:1;
      uint16_t BRG18:1;
      uint16_t BRG19:1;
    };
  };
} U1BRGHBITS;
extern volatile U1BRGHBITS U1BRGHbits __attribute__((__sfr__));


extern volatile uint16_t U1RXREG __attribute__((__sfr__));
__extension__ typedef struct tagU1RXREGBITS {
  union {
    struct {
      uint16_t RXREG:8;
    };
    struct {
      uint16_t RXREG0:1;
      uint16_t RXREG1:1;
      uint16_t RXREG2:1;
      uint16_t RXREG3:1;
      uint16_t RXREG4:1;
      uint16_t RXREG5:1;
      uint16_t RXREG6:1;
      uint16_t RXREG7:1;
    };
  };
} U1RXREGBITS;
extern volatile U1RXREGBITS U1RXREGbits __attribute__((__sfr__));


extern volatile uint16_t U1TXREG __attribute__((__sfr__));
__extension__ typedef struct tagU1TXREGBITS {
  union {
    struct {
      uint16_t TXREG:8;
      uint16_t :7;
      uint16_t LAST:1;
    };
    struct {
      uint16_t TXREG0:1;
      uint16_t TXREG1:1;
      uint16_t TXREG2:1;
      uint16_t TXREG3:1;
      uint16_t TXREG4:1;
      uint16_t TXREG5:1;
      uint16_t TXREG6:1;
      uint16_t TXREG7:1;
    };
  };
} U1TXREGBITS;
extern volatile U1TXREGBITS U1TXREGbits __attribute__((__sfr__));


extern volatile uint16_t U1P1 __attribute__((__sfr__));
__extension__ typedef struct tagU1P1BITS {
  union {
    struct {
      uint16_t P1:9;
    };
    struct {
      uint16_t P10:1;
      uint16_t P11:1;
      uint16_t P12:1;
      uint16_t P13:1;
      uint16_t P14:1;
      uint16_t P15:1;
      uint16_t P16:1;
      uint16_t P17:1;
      uint16_t P18:1;
    };
  };
} U1P1BITS;
extern volatile U1P1BITS U1P1bits __attribute__((__sfr__));


extern volatile uint16_t U1P2 __attribute__((__sfr__));
__extension__ typedef struct tagU1P2BITS {
  union {
    struct {
      uint16_t P2:9;
    };
    struct {
      uint16_t P20:1;
      uint16_t P21:1;
      uint16_t P22:1;
      uint16_t P23:1;
      uint16_t P24:1;
      uint16_t P25:1;
      uint16_t P26:1;
      uint16_t P27:1;
      uint16_t P28:1;
    };
  };
} U1P2BITS;
extern volatile U1P2BITS U1P2bits __attribute__((__sfr__));


extern volatile uint16_t U1P3 __attribute__((__sfr__));
__extension__ typedef struct tagU1P3BITS {
  union {
    struct {
      uint16_t P3:16;
    };
    struct {
      uint16_t P30:1;
      uint16_t P31:1;
      uint16_t P32:1;
      uint16_t P33:1;
      uint16_t P34:1;
      uint16_t P35:1;
      uint16_t P36:1;
      uint16_t P37:1;
      uint16_t P38:1;
      uint16_t P39:1;
      uint16_t P310:1;
      uint16_t P311:1;
      uint16_t P312:1;
      uint16_t P313:1;
      uint16_t P314:1;
      uint16_t P315:1;
    };
  };
} U1P3BITS;
extern volatile U1P3BITS U1P3bits __attribute__((__sfr__));


extern volatile uint16_t U1P3H __attribute__((__sfr__));
__extension__ typedef struct tagU1P3HBITS {
  union {
    struct {
      uint16_t P3H:8;
    };
    struct {
      uint16_t P316:1;
      uint16_t P317:1;
      uint16_t P318:1;
      uint16_t P319:1;
      uint16_t P320:1;
      uint16_t P321:1;
      uint16_t P322:1;
      uint16_t P323:1;
    };
  };
} U1P3HBITS;
extern volatile U1P3HBITS U1P3Hbits __attribute__((__sfr__));


extern volatile uint16_t U1TXCHK __attribute__((__sfr__));
__extension__ typedef struct tagU1TXCHKBITS {
  union {
    struct {
      uint16_t TXCHK:8;
    };
    struct {
      uint16_t TXCHK0:1;
      uint16_t TXCHK1:1;
      uint16_t TXCHK2:1;
      uint16_t TXCHK3:1;
      uint16_t TXCHK4:1;
      uint16_t TXCHK5:1;
      uint16_t TXCHK6:1;
      uint16_t TXCHK7:1;
    };
  };
} U1TXCHKBITS;
extern volatile U1TXCHKBITS U1TXCHKbits __attribute__((__sfr__));


extern volatile uint16_t U1RXCHK __attribute__((__sfr__));
typedef struct tagU1RXCHKBITS {
  uint16_t RXCHK:8;
} U1RXCHKBITS;
extern volatile U1RXCHKBITS U1RXCHKbits __attribute__((__sfr__));


extern volatile uint16_t U1SCCON __attribute__((__sfr__));
__extension__ typedef struct tagU1SCCONBITS {
  union {
    struct {
      uint16_t :1;
      uint16_t PTRCL:1;
      uint16_t T0PD:1;
      uint16_t CONV:1;
      uint16_t TXRPT:2;
    };
    struct {
      uint16_t :4;
      uint16_t TXRPT0:1;
      uint16_t TXRPT1:1;
    };
  };
} U1SCCONBITS;
extern volatile U1SCCONBITS U1SCCONbits __attribute__((__sfr__));


extern volatile uint16_t U1SCINT __attribute__((__sfr__));
typedef struct tagU1SCINTBITS {
  uint16_t GTCIE:1;
  uint16_t WTCIE:1;
  uint16_t BTCIE:1;
  uint16_t :1;
  uint16_t TXRPTIE:1;
  uint16_t RXRPTIE:1;
  uint16_t :2;
  uint16_t GTCIF:1;
  uint16_t WTCIF:1;
  uint16_t BTCIF:1;
  uint16_t :1;
  uint16_t TXRPTIF:1;
  uint16_t RXRPTIF:1;
} U1SCINTBITS;
extern volatile U1SCINTBITS U1SCINTbits __attribute__((__sfr__));


extern volatile uint16_t U1INT __attribute__((__sfr__));
typedef struct tagU1INTBITS {
  uint16_t :2;
  uint16_t ABDIE:1;
  uint16_t :3;
  uint16_t ABDIF:1;
  uint16_t WUIF:1;
} U1INTBITS;
extern volatile U1INTBITS U1INTbits __attribute__((__sfr__));


extern volatile uint16_t U2MODE __attribute__((__sfr__));
__extension__ typedef struct tagU2MODEBITS {
  union {
    struct {
      uint16_t MOD:4;
      uint16_t URXEN:1;
      uint16_t UTXEN:1;
      uint16_t ABAUD:1;
      uint16_t BRGH:1;
      uint16_t UTXBRK:1;
      uint16_t BRKOVR:1;
      uint16_t :1;
      uint16_t RXBIMD:1;
      uint16_t WAKE:1;
      uint16_t USIDL:1;
      uint16_t :1;
      uint16_t UARTEN:1;
    };
    struct {
      uint16_t MOD0:1;
      uint16_t MOD1:1;
      uint16_t MOD2:1;
      uint16_t MOD3:1;
    };
  };
} U2MODEBITS;
extern volatile U2MODEBITS U2MODEbits __attribute__((__sfr__));


extern volatile uint16_t U2MODEH __attribute__((__sfr__));
__extension__ typedef struct tagU2MODEHBITS {
  union {
    struct {
      uint16_t FLO:2;
      uint16_t UTXINV:1;
      uint16_t C0EN:1;
      uint16_t STSEL:2;
      uint16_t URXINV:1;
      uint16_t RUNOVF:1;
      uint16_t HALFDPLX:1;
      uint16_t BCLKSEL:2;
      uint16_t BCLKMOD:1;
      uint16_t :2;
      uint16_t ACTIVE:1;
      uint16_t SLPEN:1;
    };
    struct {
      uint16_t FLO0:1;
      uint16_t FLO1:1;
      uint16_t :2;
      uint16_t STSEL0:1;
      uint16_t STSEL1:1;
      uint16_t :3;
      uint16_t BCLKSEL0:1;
      uint16_t BCLKSEL1:1;
    };
  };
} U2MODEHBITS;
extern volatile U2MODEHBITS U2MODEHbits __attribute__((__sfr__));


extern volatile uint16_t U2STA __attribute__((__sfr__));
typedef struct tagU2STABITS {
  uint16_t TXCIF:1;
  uint16_t OERR:1;
  uint16_t RXBKIF:1;
  uint16_t FERR:1;
  uint16_t CERIF:1;
  uint16_t ABDOVF:1;
  uint16_t PERR:1;
  uint16_t TRMT:1;
  uint16_t TXCIE:1;
  uint16_t OERIE:1;
  uint16_t RXBKIE:1;
  uint16_t FERIE:1;
  uint16_t CERIE:1;
  uint16_t ABDOVE:1;
  uint16_t PERIE:1;
  uint16_t TXMTIE:1;
} U2STABITS;
extern volatile U2STABITS U2STAbits __attribute__((__sfr__));


extern volatile uint16_t U2STAH __attribute__((__sfr__));
__extension__ typedef struct tagU2STAHBITS {
  union {
    struct {
      uint16_t URXBF:1;
      uint16_t URXBE:1;
      uint16_t XON:1;
      uint16_t RIDLE:1;
      uint16_t UTXBF:1;
      uint16_t UTXBE:1;
      uint16_t STPMD:1;
      uint16_t TXWRE:1;
      uint16_t URXISEL:3;
      uint16_t :1;
      uint16_t UTXISEL:3;
    };
    struct {
      uint16_t :8;
      uint16_t URXISEL0:1;
      uint16_t URXISEL1:1;
      uint16_t URXISEL2:1;
      uint16_t :1;
      uint16_t UTXISEL0:1;
      uint16_t UTXISEL1:1;
      uint16_t UTXISEL2:1;
    };
  };
} U2STAHBITS;
extern volatile U2STAHBITS U2STAHbits __attribute__((__sfr__));


extern volatile uint16_t U2BRG __attribute__((__sfr__));
__extension__ typedef struct tagU2BRGBITS {
  union {
    struct {
      uint16_t BRG:16;
    };
    struct {
      uint16_t BRG0:1;
      uint16_t BRG1:1;
      uint16_t BRG2:1;
      uint16_t BRG3:1;
      uint16_t BRG4:1;
      uint16_t BRG5:1;
      uint16_t BRG6:1;
      uint16_t BRG7:1;
      uint16_t BRG8:1;
      uint16_t BRG9:1;
      uint16_t BRG10:1;
      uint16_t BRG11:1;
      uint16_t BRG12:1;
      uint16_t BRG13:1;
      uint16_t BRG14:1;
      uint16_t BRG15:1;
    };
  };
} U2BRGBITS;
extern volatile U2BRGBITS U2BRGbits __attribute__((__sfr__));


extern volatile uint16_t U2BRGH __attribute__((__sfr__));
__extension__ typedef struct tagU2BRGHBITS {
  union {
    struct {
      uint16_t BRG:4;
    };
    struct {
      uint16_t BRG16:1;
      uint16_t BRG1:1;
      uint16_t BRG18:1;
      uint16_t BRG19:1;
    };
  };
} U2BRGHBITS;
extern volatile U2BRGHBITS U2BRGHbits __attribute__((__sfr__));


extern volatile uint16_t U2RXREG __attribute__((__sfr__));
__extension__ typedef struct tagU2RXREGBITS {
  union {
    struct {
      uint16_t RXREG:8;
    };
    struct {
      uint16_t RXREG0:1;
      uint16_t RXREG1:1;
      uint16_t RXREG2:1;
      uint16_t RXREG3:1;
      uint16_t RXREG4:1;
      uint16_t RXREG5:1;
      uint16_t RXREG6:1;
      uint16_t RXREG7:1;
    };
  };
} U2RXREGBITS;
extern volatile U2RXREGBITS U2RXREGbits __attribute__((__sfr__));


extern volatile uint16_t U2TXREG __attribute__((__sfr__));
__extension__ typedef struct tagU2TXREGBITS {
  union {
    struct {
      uint16_t TXREG:8;
      uint16_t :7;
      uint16_t LAST:1;
    };
    struct {
      uint16_t TXREG0:1;
      uint16_t TXREG1:1;
      uint16_t TXREG2:1;
      uint16_t TXREG3:1;
      uint16_t TXREG4:1;
      uint16_t TXREG5:1;
      uint16_t TXREG6:1;
      uint16_t TXREG7:1;
    };
  };
} U2TXREGBITS;
extern volatile U2TXREGBITS U2TXREGbits __attribute__((__sfr__));


extern volatile uint16_t U2P1 __attribute__((__sfr__));
__extension__ typedef struct tagU2P1BITS {
  union {
    struct {
      uint16_t P1:9;
    };
    struct {
      uint16_t P10:1;
      uint16_t P11:1;
      uint16_t P12:1;
      uint16_t P13:1;
      uint16_t P14:1;
      uint16_t P15:1;
      uint16_t P16:1;
      uint16_t P17:1;
      uint16_t P18:1;
    };
  };
} U2P1BITS;
extern volatile U2P1BITS U2P1bits __attribute__((__sfr__));


extern volatile uint16_t U2P2 __attribute__((__sfr__));
__extension__ typedef struct tagU2P2BITS {
  union {
    struct {
      uint16_t P2:9;
    };
    struct {
      uint16_t P20:1;
      uint16_t P21:1;
      uint16_t P22:1;
      uint16_t P23:1;
      uint16_t P24:1;
      uint16_t P25:1;
      uint16_t P26:1;
      uint16_t P27:1;
      uint16_t P28:1;
    };
  };
} U2P2BITS;
extern volatile U2P2BITS U2P2bits __attribute__((__sfr__));


extern volatile uint16_t U2P3 __attribute__((__sfr__));
__extension__ typedef struct tagU2P3BITS {
  union {
    struct {
      uint16_t P3:16;
    };
    struct {
      uint16_t P30:1;
      uint16_t P31:1;
      uint16_t P32:1;
      uint16_t P33:1;
      uint16_t P34:1;
      uint16_t P35:1;
      uint16_t P36:1;
      uint16_t P37:1;
      uint16_t P38:1;
      uint16_t P39:1;
      uint16_t P310:1;
      uint16_t P311:1;
      uint16_t P312:1;
      uint16_t P313:1;
      uint16_t P314:1;
      uint16_t P315:1;
    };
  };
} U2P3BITS;
extern volatile U2P3BITS U2P3bits __attribute__((__sfr__));


extern volatile uint16_t U2P3H __attribute__((__sfr__));
__extension__ typedef struct tagU2P3HBITS {
  union {
    struct {
      uint16_t P3H:8;
    };
    struct {
      uint16_t P316:1;
      uint16_t P317:1;
      uint16_t P318:1;
      uint16_t P319:1;
      uint16_t P320:1;
      uint16_t P321:1;
      uint16_t P322:1;
      uint16_t P323:1;
    };
  };
} U2P3HBITS;
extern volatile U2P3HBITS U2P3Hbits __attribute__((__sfr__));


extern volatile uint16_t U2TXCHK __attribute__((__sfr__));
__extension__ typedef struct tagU2TXCHKBITS {
  union {
    struct {
      uint16_t TXCHK:8;
    };
    struct {
      uint16_t TXCHK0:1;
      uint16_t TXCHK1:1;
      uint16_t TXCHK2:1;
      uint16_t TXCHK3:1;
      uint16_t TXCHK4:1;
      uint16_t TXCHK5:1;
      uint16_t TXCHK6:1;
      uint16_t TXCHK7:1;
    };
  };
} U2TXCHKBITS;
extern volatile U2TXCHKBITS U2TXCHKbits __attribute__((__sfr__));


extern volatile uint16_t U2RXCHK __attribute__((__sfr__));
typedef struct tagU2RXCHKBITS {
  uint16_t RXCHK:8;
} U2RXCHKBITS;
extern volatile U2RXCHKBITS U2RXCHKbits __attribute__((__sfr__));


extern volatile uint16_t U2SCCON __attribute__((__sfr__));
__extension__ typedef struct tagU2SCCONBITS {
  union {
    struct {
      uint16_t :1;
      uint16_t PTRCL:1;
      uint16_t T0PD:1;
      uint16_t CONV:1;
      uint16_t TXRPT:2;
    };
    struct {
      uint16_t :4;
      uint16_t TXRPT0:1;
      uint16_t TXRPT1:1;
    };
  };
} U2SCCONBITS;
extern volatile U2SCCONBITS U2SCCONbits __attribute__((__sfr__));


extern volatile uint16_t U2SCINT __attribute__((__sfr__));
typedef struct tagU2SCINTBITS {
  uint16_t GTCIE:1;
  uint16_t WTCIE:1;
  uint16_t BTCIE:1;
  uint16_t :1;
  uint16_t TXRPTIE:1;
  uint16_t RXRPTIE:1;
  uint16_t :2;
  uint16_t GTCIF:1;
  uint16_t WTCIF:1;
  uint16_t BTCIF:1;
  uint16_t :1;
  uint16_t TXRPTIF:1;
  uint16_t RXRPTIF:1;
} U2SCINTBITS;
extern volatile U2SCINTBITS U2SCINTbits __attribute__((__sfr__));


extern volatile uint16_t U2INT __attribute__((__sfr__));
typedef struct tagU2INTBITS {
  uint16_t :2;
  uint16_t ABDIE:1;
  uint16_t :3;
  uint16_t ABDIF:1;
  uint16_t WUIF:1;
} U2INTBITS;
extern volatile U2INTBITS U2INTbits __attribute__((__sfr__));


extern volatile uint16_t SPI1CON1 __attribute__((__sfr__));
__extension__ typedef struct tagSPI1CON1BITS {
  union {
    struct {
      uint16_t ENHBUF:1;
      uint16_t SPIFE:1;
      uint16_t MCLKEN:1;
      uint16_t DISSCK:1;
      uint16_t DISSDI:1;
      uint16_t MSTEN:1;
      uint16_t CKP:1;
      uint16_t SSEN:1;
      uint16_t CKE:1;
      uint16_t SMP:1;
      uint16_t MODE16:1;
      uint16_t MODE32:1;
      uint16_t DISSDO:1;
      uint16_t SPISIDL:1;
      uint16_t :1;
      uint16_t SPIEN:1;
    };
    struct {
      uint16_t :10;
      uint16_t MODE:2;
    };
  };
} SPI1CON1BITS;
extern volatile SPI1CON1BITS SPI1CON1bits __attribute__((__sfr__));


extern volatile uint16_t SPI1CON1L __attribute__((__sfr__));
__extension__ typedef struct tagSPI1CON1LBITS {
  union {
    struct {
      uint16_t ENHBUF:1;
      uint16_t SPIFE:1;
      uint16_t MCLKEN:1;
      uint16_t DISSCK:1;
      uint16_t DISSDI:1;
      uint16_t MSTEN:1;
      uint16_t CKP:1;
      uint16_t SSEN:1;
      uint16_t CKE:1;
      uint16_t SMP:1;
      uint16_t MODE16:1;
      uint16_t MODE32:1;
      uint16_t DISSDO:1;
      uint16_t SPISIDL:1;
      uint16_t :1;
      uint16_t SPIEN:1;
    };
    struct {
      uint16_t :10;
      uint16_t MODE:2;
    };
  };
} SPI1CON1LBITS;
extern volatile SPI1CON1LBITS SPI1CON1Lbits __attribute__((__sfr__));


extern volatile uint16_t SPI1CON1H __attribute__((__sfr__));
__extension__ typedef struct tagSPI1CON1HBITS {
  union {
    struct {
      uint16_t FRMCNT:3;
      uint16_t FRMSYPW:1;
      uint16_t MSSEN:1;
      uint16_t FRMPOL:1;
      uint16_t FRMSYNC:1;
      uint16_t FRMEN:1;
      uint16_t AUDMOD:2;
      uint16_t URDTEN:1;
      uint16_t AUDMONO:1;
      uint16_t IGNTUR:1;
      uint16_t IGNROV:1;
      uint16_t SPISGNEXT:1;
      uint16_t AUDEN:1;
    };
    struct {
      uint16_t FRMCNT0:1;
      uint16_t FRMCNT1:1;
      uint16_t FRMCNT2:1;
      uint16_t :5;
      uint16_t AUDMOD0:1;
      uint16_t AUDMOD1:1;
    };
  };
} SPI1CON1HBITS;
extern volatile SPI1CON1HBITS SPI1CON1Hbits __attribute__((__sfr__));


extern volatile uint16_t SPI1CON2 __attribute__((__sfr__));
__extension__ typedef struct tagSPI1CON2BITS {
  union {
    struct {
      uint16_t FRMCNT:3;
      uint16_t FRMSYPW:1;
      uint16_t MSSEN:1;
      uint16_t FRMPOL:1;
      uint16_t FRMSYNC:1;
      uint16_t FRMEN:1;
      uint16_t AUDMOD:2;
      uint16_t URDTEN:1;
      uint16_t AUDMONO:1;
      uint16_t IGNTUR:1;
      uint16_t IGNROV:1;
      uint16_t SPISGNEXT:1;
      uint16_t AUDEN:1;
    };
    struct {
      uint16_t FRMCNT0:1;
      uint16_t FRMCNT1:1;
      uint16_t FRMCNT2:1;
      uint16_t :5;
      uint16_t AUDMOD0:1;
      uint16_t AUDMOD1:1;
    };
  };
} SPI1CON2BITS;
extern volatile SPI1CON2BITS SPI1CON2bits __attribute__((__sfr__));


extern volatile uint16_t SPI1CON2L __attribute__((__sfr__));
typedef struct tagSPI1CON2LBITS {
  uint16_t WLENGTH:5;
} SPI1CON2LBITS;
extern volatile SPI1CON2LBITS SPI1CON2Lbits __attribute__((__sfr__));


extern volatile uint16_t SPI1CON3 __attribute__((__sfr__));
typedef struct tagSPI1CON3BITS {
  uint16_t WLENGTH:5;
} SPI1CON3BITS;
extern volatile SPI1CON3BITS SPI1CON3bits __attribute__((__sfr__));


extern volatile uint16_t SPI1CON2H __attribute__((__sfr__));

extern volatile uint16_t SPI1CON4 __attribute__((__sfr__));

extern volatile uint16_t SPI1STATL __attribute__((__sfr__));
typedef struct tagSPI1STATLBITS {
  uint16_t SPIRBF:1;
  uint16_t SPITBF:1;
  uint16_t :1;
  uint16_t SPITBE:1;
  uint16_t :1;
  uint16_t SPIRBE:1;
  uint16_t SPIROV:1;
  uint16_t SRMT:1;
  uint16_t SPITUR:1;
  uint16_t :2;
  uint16_t SPIBUSY:1;
  uint16_t FRMERR:1;
} SPI1STATLBITS;
extern volatile SPI1STATLBITS SPI1STATLbits __attribute__((__sfr__));


extern volatile uint16_t SPI1STATH __attribute__((__sfr__));
__extension__ typedef struct tagSPI1STATHBITS {
  union {
    struct {
      uint16_t TXELM:6;
      uint16_t :2;
      uint16_t RXELM:6;
    };
    struct {
      uint16_t TXELM0:1;
      uint16_t TXELM1:1;
      uint16_t TXELM2:1;
      uint16_t TXELM3:1;
      uint16_t TXELM4:1;
      uint16_t TXELM5:1;
      uint16_t :2;
      uint16_t RXELM0:1;
      uint16_t RXELM1:1;
      uint16_t RXELM2:1;
      uint16_t RXELM3:1;
      uint16_t RXELM4:1;
      uint16_t RXELM5:1;
    };
  };
} SPI1STATHBITS;
extern volatile SPI1STATHBITS SPI1STATHbits __attribute__((__sfr__));


extern volatile uint16_t SPI1BUFL __attribute__((__sfr__));
__extension__ typedef struct tagSPI1BUFLBITS {
  union {
    struct {
      uint16_t SPI1BUFL:16;
    };
    struct {
      uint16_t DATA:16;
    };
  };
} SPI1BUFLBITS;
extern volatile SPI1BUFLBITS SPI1BUFLbits __attribute__((__sfr__));


extern volatile uint16_t SPI1BUFH __attribute__((__sfr__));
__extension__ typedef struct tagSPI1BUFHBITS {
  union {
    struct {
      uint16_t SPI1BUFH:16;
    };
    struct {
      uint16_t DATA:16;
    };
  };
} SPI1BUFHBITS;
extern volatile SPI1BUFHBITS SPI1BUFHbits __attribute__((__sfr__));


extern volatile uint16_t SPI1BRGL __attribute__((__sfr__));
__extension__ typedef struct tagSPI1BRGLBITS {
  union {
    struct {
      uint16_t SPI1BRGL:13;
    };
    struct {
      uint16_t BRG:13;
    };
  };
} SPI1BRGLBITS;
extern volatile SPI1BRGLBITS SPI1BRGLbits __attribute__((__sfr__));


extern volatile uint16_t SPI1BRGH __attribute__((__sfr__));

extern volatile uint16_t SPI1IMSK1 __attribute__((__sfr__));
typedef struct tagSPI1IMSK1BITS {
  uint16_t SPIRBFEN:1;
  uint16_t SPITBFEN:1;
  uint16_t :1;
  uint16_t SPITBEN:1;
  uint16_t :1;
  uint16_t SPIRBEN:1;
  uint16_t SPIROVEN:1;
  uint16_t SRMTEN:1;
  uint16_t SPITUREN:1;
  uint16_t :2;
  uint16_t BUSYEN:1;
  uint16_t FRMERREN:1;
} SPI1IMSK1BITS;
extern volatile SPI1IMSK1BITS SPI1IMSK1bits __attribute__((__sfr__));


extern volatile uint16_t SPI1IMSKL __attribute__((__sfr__));
typedef struct tagSPI1IMSKLBITS {
  uint16_t SPIRBFEN:1;
  uint16_t SPITBFEN:1;
  uint16_t :1;
  uint16_t SPITBEN:1;
  uint16_t :1;
  uint16_t SPIRBEN:1;
  uint16_t SPIROVEN:1;
  uint16_t SRMTEN:1;
  uint16_t SPITUREN:1;
  uint16_t :2;
  uint16_t BUSYEN:1;
  uint16_t FRMERREN:1;
} SPI1IMSKLBITS;
extern volatile SPI1IMSKLBITS SPI1IMSKLbits __attribute__((__sfr__));


extern volatile uint16_t SPI1IMSK2 __attribute__((__sfr__));
__extension__ typedef struct tagSPI1IMSK2BITS {
  union {
    struct {
      uint16_t TXMSK:6;
      uint16_t :1;
      uint16_t TXWIEN:1;
      uint16_t RXMSK:6;
      uint16_t :1;
      uint16_t RXWIEN:1;
    };
    struct {
      uint16_t TXMSK0:1;
      uint16_t TXMSK1:1;
      uint16_t TXMSK2:1;
      uint16_t TXMSK3:1;
      uint16_t TXMSK4:1;
      uint16_t TXMSK5:1;
      uint16_t :2;
      uint16_t RXMSK0:1;
      uint16_t RXMSK1:1;
      uint16_t RXMSK2:1;
      uint16_t RXMSK3:1;
      uint16_t RXMSK4:1;
      uint16_t RXMSK5:1;
    };
  };
} SPI1IMSK2BITS;
extern volatile SPI1IMSK2BITS SPI1IMSK2bits __attribute__((__sfr__));


extern volatile uint16_t SPI1IMSKH __attribute__((__sfr__));
__extension__ typedef struct tagSPI1IMSKHBITS {
  union {
    struct {
      uint16_t TXMSK:6;
      uint16_t :1;
      uint16_t TXWIEN:1;
      uint16_t RXMSK:6;
      uint16_t :1;
      uint16_t RXWIEN:1;
    };
    struct {
      uint16_t TXMSK0:1;
      uint16_t TXMSK1:1;
      uint16_t TXMSK2:1;
      uint16_t TXMSK3:1;
      uint16_t TXMSK4:1;
      uint16_t TXMSK5:1;
      uint16_t :2;
      uint16_t RXMSK0:1;
      uint16_t RXMSK1:1;
      uint16_t RXMSK2:1;
      uint16_t RXMSK3:1;
      uint16_t RXMSK4:1;
      uint16_t RXMSK5:1;
    };
  };
} SPI1IMSKHBITS;
extern volatile SPI1IMSKHBITS SPI1IMSKHbits __attribute__((__sfr__));


extern volatile uint16_t SPI1URDTL __attribute__((__sfr__));
__extension__ typedef struct tagSPI1URDTLBITS {
  union {
    struct {
      uint16_t SPI1URDTL:16;
    };
    struct {
      uint16_t URDATA:16;
    };
  };
} SPI1URDTLBITS;
extern volatile SPI1URDTLBITS SPI1URDTLbits __attribute__((__sfr__));


extern volatile uint16_t SPI1URDTH __attribute__((__sfr__));
__extension__ typedef struct tagSPI1URDTHBITS {
  union {
    struct {
      uint16_t SPI1URDTH:16;
    };
    struct {
      uint16_t URDATA:16;
    };
  };
} SPI1URDTHBITS;
extern volatile SPI1URDTHBITS SPI1URDTHbits __attribute__((__sfr__));


extern volatile uint16_t SPI2CON1 __attribute__((__sfr__));
__extension__ typedef struct tagSPI2CON1BITS {
  union {
    struct {
      uint16_t ENHBUF:1;
      uint16_t SPIFE:1;
      uint16_t MCLKEN:1;
      uint16_t DISSCK:1;
      uint16_t DISSDI:1;
      uint16_t MSTEN:1;
      uint16_t CKP:1;
      uint16_t SSEN:1;
      uint16_t CKE:1;
      uint16_t SMP:1;
      uint16_t MODE16:1;
      uint16_t MODE32:1;
      uint16_t DISSDO:1;
      uint16_t SPISIDL:1;
      uint16_t :1;
      uint16_t SPIEN:1;
    };
    struct {
      uint16_t :10;
      uint16_t MODE:2;
    };
  };
} SPI2CON1BITS;
extern volatile SPI2CON1BITS SPI2CON1bits __attribute__((__sfr__));


extern volatile uint16_t SPI2CON1L __attribute__((__sfr__));
__extension__ typedef struct tagSPI2CON1LBITS {
  union {
    struct {
      uint16_t ENHBUF:1;
      uint16_t SPIFE:1;
      uint16_t MCLKEN:1;
      uint16_t DISSCK:1;
      uint16_t DISSDI:1;
      uint16_t MSTEN:1;
      uint16_t CKP:1;
      uint16_t SSEN:1;
      uint16_t CKE:1;
      uint16_t SMP:1;
      uint16_t MODE16:1;
      uint16_t MODE32:1;
      uint16_t DISSDO:1;
      uint16_t SPISIDL:1;
      uint16_t :1;
      uint16_t SPIEN:1;
    };
    struct {
      uint16_t :10;
      uint16_t MODE:2;
    };
  };
} SPI2CON1LBITS;
extern volatile SPI2CON1LBITS SPI2CON1Lbits __attribute__((__sfr__));


extern volatile uint16_t SPI2CON1H __attribute__((__sfr__));
__extension__ typedef struct tagSPI2CON1HBITS {
  union {
    struct {
      uint16_t FRMCNT:3;
      uint16_t FRMSYPW:1;
      uint16_t MSSEN:1;
      uint16_t FRMPOL:1;
      uint16_t FRMSYNC:1;
      uint16_t FRMEN:1;
      uint16_t AUDMOD:2;
      uint16_t URDTEN:1;
      uint16_t AUDMONO:1;
      uint16_t IGNTUR:1;
      uint16_t IGNROV:1;
      uint16_t SPISGNEXT:1;
      uint16_t AUDEN:1;
    };
    struct {
      uint16_t FRMCNT0:1;
      uint16_t FRMCNT1:1;
      uint16_t FRMCNT2:1;
      uint16_t :5;
      uint16_t AUDMOD0:1;
      uint16_t AUDMOD1:1;
    };
  };
} SPI2CON1HBITS;
extern volatile SPI2CON1HBITS SPI2CON1Hbits __attribute__((__sfr__));


extern volatile uint16_t SPI2CON2 __attribute__((__sfr__));
__extension__ typedef struct tagSPI2CON2BITS {
  union {
    struct {
      uint16_t FRMCNT:3;
      uint16_t FRMSYPW:1;
      uint16_t MSSEN:1;
      uint16_t FRMPOL:1;
      uint16_t FRMSYNC:1;
      uint16_t FRMEN:1;
      uint16_t AUDMOD:2;
      uint16_t URDTEN:1;
      uint16_t AUDMONO:1;
      uint16_t IGNTUR:1;
      uint16_t IGNROV:1;
      uint16_t SPISGNEXT:1;
      uint16_t AUDEN:1;
    };
    struct {
      uint16_t FRMCNT0:1;
      uint16_t FRMCNT1:1;
      uint16_t FRMCNT2:1;
      uint16_t :5;
      uint16_t AUDMOD0:1;
      uint16_t AUDMOD1:1;
    };
  };
} SPI2CON2BITS;
extern volatile SPI2CON2BITS SPI2CON2bits __attribute__((__sfr__));


extern volatile uint16_t SPI2CON2L __attribute__((__sfr__));
typedef struct tagSPI2CON2LBITS {
  uint16_t WLENGTH:5;
} SPI2CON2LBITS;
extern volatile SPI2CON2LBITS SPI2CON2Lbits __attribute__((__sfr__));


extern volatile uint16_t SPI2CON3 __attribute__((__sfr__));
typedef struct tagSPI2CON3BITS {
  uint16_t WLENGTH:5;
} SPI2CON3BITS;
extern volatile SPI2CON3BITS SPI2CON3bits __attribute__((__sfr__));


extern volatile uint16_t SPI2CON2H __attribute__((__sfr__));

extern volatile uint16_t SPI2CON4 __attribute__((__sfr__));

extern volatile uint16_t SPI2STATL __attribute__((__sfr__));
typedef struct tagSPI2STATLBITS {
  uint16_t SPIRBF:1;
  uint16_t SPITBF:1;
  uint16_t :1;
  uint16_t SPITBE:1;
  uint16_t :1;
  uint16_t SPIRBE:1;
  uint16_t SPIROV:1;
  uint16_t SRMT:1;
  uint16_t SPITUR:1;
  uint16_t :2;
  uint16_t SPIBUSY:1;
  uint16_t FRMERR:1;
} SPI2STATLBITS;
extern volatile SPI2STATLBITS SPI2STATLbits __attribute__((__sfr__));


extern volatile uint16_t SPI2STATH __attribute__((__sfr__));
__extension__ typedef struct tagSPI2STATHBITS {
  union {
    struct {
      uint16_t TXELM:6;
      uint16_t :2;
      uint16_t RXELM:6;
    };
    struct {
      uint16_t TXELM0:1;
      uint16_t TXELM1:1;
      uint16_t TXELM2:1;
      uint16_t TXELM3:1;
      uint16_t TXELM4:1;
      uint16_t TXELM5:1;
      uint16_t :2;
      uint16_t RXELM0:1;
      uint16_t RXELM1:1;
      uint16_t RXELM2:1;
      uint16_t RXELM3:1;
      uint16_t RXELM4:1;
      uint16_t RXELM5:1;
    };
  };
} SPI2STATHBITS;
extern volatile SPI2STATHBITS SPI2STATHbits __attribute__((__sfr__));


extern volatile uint16_t SPI2BUFL __attribute__((__sfr__));
__extension__ typedef struct tagSPI2BUFLBITS {
  union {
    struct {
      uint16_t SPI2BUFL:16;
    };
    struct {
      uint16_t DATA:16;
    };
  };
} SPI2BUFLBITS;
extern volatile SPI2BUFLBITS SPI2BUFLbits __attribute__((__sfr__));


extern volatile uint16_t SPI2BUFH __attribute__((__sfr__));
__extension__ typedef struct tagSPI2BUFHBITS {
  union {
    struct {
      uint16_t SPI2BUFH:16;
    };
    struct {
      uint16_t DATA:16;
    };
  };
} SPI2BUFHBITS;
extern volatile SPI2BUFHBITS SPI2BUFHbits __attribute__((__sfr__));


extern volatile uint16_t SPI2BRGL __attribute__((__sfr__));
__extension__ typedef struct tagSPI2BRGLBITS {
  union {
    struct {
      uint16_t SPI2BRGL:13;
    };
    struct {
      uint16_t BRG:13;
    };
  };
} SPI2BRGLBITS;
extern volatile SPI2BRGLBITS SPI2BRGLbits __attribute__((__sfr__));


extern volatile uint16_t SPI2BRGH __attribute__((__sfr__));

extern volatile uint16_t SPI2IMSK1 __attribute__((__sfr__));
typedef struct tagSPI2IMSK1BITS {
  uint16_t SPIRBFEN:1;
  uint16_t SPITBFEN:1;
  uint16_t :1;
  uint16_t SPITBEN:1;
  uint16_t :1;
  uint16_t SPIRBEN:1;
  uint16_t SPIROVEN:1;
  uint16_t SRMTEN:1;
  uint16_t SPITUREN:1;
  uint16_t :2;
  uint16_t BUSYEN:1;
  uint16_t FRMERREN:1;
} SPI2IMSK1BITS;
extern volatile SPI2IMSK1BITS SPI2IMSK1bits __attribute__((__sfr__));


extern volatile uint16_t SPI2IMSKL __attribute__((__sfr__));
typedef struct tagSPI2IMSKLBITS {
  uint16_t SPIRBFEN:1;
  uint16_t SPITBFEN:1;
  uint16_t :1;
  uint16_t SPITBEN:1;
  uint16_t :1;
  uint16_t SPIRBEN:1;
  uint16_t SPIROVEN:1;
  uint16_t SRMTEN:1;
  uint16_t SPITUREN:1;
  uint16_t :2;
  uint16_t BUSYEN:1;
  uint16_t FRMERREN:1;
} SPI2IMSKLBITS;
extern volatile SPI2IMSKLBITS SPI2IMSKLbits __attribute__((__sfr__));


extern volatile uint16_t SPI2IMSK2 __attribute__((__sfr__));
__extension__ typedef struct tagSPI2IMSK2BITS {
  union {
    struct {
      uint16_t TXMSK:6;
      uint16_t :1;
      uint16_t TXWIEN:1;
      uint16_t RXMSK:6;
      uint16_t :1;
      uint16_t RXWIEN:1;
    };
    struct {
      uint16_t TXMSK0:1;
      uint16_t TXMSK1:1;
      uint16_t TXMSK2:1;
      uint16_t TXMSK3:1;
      uint16_t TXMSK4:1;
      uint16_t TXMSK5:1;
      uint16_t :2;
      uint16_t RXMSK0:1;
      uint16_t RXMSK1:1;
      uint16_t RXMSK2:1;
      uint16_t RXMSK3:1;
      uint16_t RXMSK4:1;
      uint16_t RXMSK5:1;
    };
  };
} SPI2IMSK2BITS;
extern volatile SPI2IMSK2BITS SPI2IMSK2bits __attribute__((__sfr__));


extern volatile uint16_t SPI2IMSKH __attribute__((__sfr__));
__extension__ typedef struct tagSPI2IMSKHBITS {
  union {
    struct {
      uint16_t TXMSK:6;
      uint16_t :1;
      uint16_t TXWIEN:1;
      uint16_t RXMSK:6;
      uint16_t :1;
      uint16_t RXWIEN:1;
    };
    struct {
      uint16_t TXMSK0:1;
      uint16_t TXMSK1:1;
      uint16_t TXMSK2:1;
      uint16_t TXMSK3:1;
      uint16_t TXMSK4:1;
      uint16_t TXMSK5:1;
      uint16_t :2;
      uint16_t RXMSK0:1;
      uint16_t RXMSK1:1;
      uint16_t RXMSK2:1;
      uint16_t RXMSK3:1;
      uint16_t RXMSK4:1;
      uint16_t RXMSK5:1;
    };
  };
} SPI2IMSKHBITS;
extern volatile SPI2IMSKHBITS SPI2IMSKHbits __attribute__((__sfr__));


extern volatile uint16_t SPI2URDTL __attribute__((__sfr__));
__extension__ typedef struct tagSPI2URDTLBITS {
  union {
    struct {
      uint16_t SPI2URDTL:16;
    };
    struct {
      uint16_t URDATA:16;
    };
  };
} SPI2URDTLBITS;
extern volatile SPI2URDTLBITS SPI2URDTLbits __attribute__((__sfr__));


extern volatile uint16_t SPI2URDTH __attribute__((__sfr__));
__extension__ typedef struct tagSPI2URDTHBITS {
  union {
    struct {
      uint16_t SPI2URDTH:16;
    };
    struct {
      uint16_t URDATA:16;
    };
  };
} SPI2URDTHBITS;
extern volatile SPI2URDTHBITS SPI2URDTHbits __attribute__((__sfr__));


extern volatile uint16_t PCLKCON __attribute__((__sfr__));
typedef struct tagPCLKCONBITS {
  uint16_t MCLKSEL:2;
  uint16_t :2;
  uint16_t DIVSEL:2;
  uint16_t :2;
  uint16_t LOCK:1;
  uint16_t :5;
  uint16_t HRERR:1;
  uint16_t HRRDY:1;
} PCLKCONBITS;
extern volatile PCLKCONBITS PCLKCONbits __attribute__((__sfr__));


extern volatile uint16_t FSCL __attribute__((__sfr__));

extern volatile uint16_t FSMINPER __attribute__((__sfr__));

extern volatile uint16_t MPHASE __attribute__((__sfr__));

extern volatile uint16_t MDC __attribute__((__sfr__));

extern volatile uint16_t MPER __attribute__((__sfr__));

extern volatile uint16_t LFSR __attribute__((__sfr__));
typedef struct tagLFSRBITS {
  uint16_t LFSR:15;
} LFSRBITS;
extern volatile LFSRBITS LFSRbits __attribute__((__sfr__));


extern volatile uint16_t CMBTRIGL __attribute__((__sfr__));
typedef struct tagCMBTRIGLBITS {
  uint16_t CTA1EN:1;
  uint16_t CTA2EN:1;
  uint16_t CTA3EN:1;
  uint16_t CTA4EN:1;
  uint16_t CTA5EN:1;
  uint16_t CTA6EN:1;
  uint16_t CTA7EN:1;
  uint16_t CTA8EN:1;
} CMBTRIGLBITS;
extern volatile CMBTRIGLBITS CMBTRIGLbits __attribute__((__sfr__));


extern volatile uint16_t CMBTRIGH __attribute__((__sfr__));
typedef struct tagCMBTRIGHBITS {
  uint16_t CTB1EN:1;
  uint16_t CTB2EN:1;
  uint16_t CTB3EN:1;
  uint16_t CTB4EN:1;
  uint16_t CTB5EN:1;
  uint16_t CTB6EN:1;
  uint16_t CTB7EN:1;
  uint16_t CTB8EN:1;
} CMBTRIGHBITS;
extern volatile CMBTRIGHBITS CMBTRIGHbits __attribute__((__sfr__));


extern volatile uint16_t LOGCONA __attribute__((__sfr__));
typedef struct tagLOGCONABITS {
  uint16_t PWMLFAD:3;
  uint16_t :1;
  uint16_t PWMLFA:2;
  uint16_t S2APOL:1;
  uint16_t S1APOL:1;
  uint16_t PWMS2A:4;
  uint16_t PWMS1A:4;
} LOGCONABITS;
extern volatile LOGCONABITS LOGCONAbits __attribute__((__sfr__));


extern volatile uint16_t LOGCONB __attribute__((__sfr__));
typedef struct tagLOGCONBBITS {
  uint16_t PWMLFBD:3;
  uint16_t :1;
  uint16_t PWMLFB:2;
  uint16_t S2BPOL:1;
  uint16_t S1BPOL:1;
  uint16_t PWMS2B:4;
  uint16_t PWMS1B:4;
} LOGCONBBITS;
extern volatile LOGCONBBITS LOGCONBbits __attribute__((__sfr__));


extern volatile uint16_t LOGCONC __attribute__((__sfr__));
typedef struct tagLOGCONCBITS {
  uint16_t PWMLFCD:3;
  uint16_t :1;
  uint16_t PWMLFC:2;
  uint16_t S2CPOL:1;
  uint16_t S1CPOL:1;
  uint16_t PWMS2C:4;
  uint16_t PWMS1C:4;
} LOGCONCBITS;
extern volatile LOGCONCBITS LOGCONCbits __attribute__((__sfr__));


extern volatile uint16_t LOGCOND __attribute__((__sfr__));
typedef struct tagLOGCONDBITS {
  uint16_t PWMLFDD:3;
  uint16_t :1;
  uint16_t PWMLFD:2;
  uint16_t S2DPOL:1;
  uint16_t S1DPOL:1;
  uint16_t PWMS2D:4;
  uint16_t PWMS1D:4;
} LOGCONDBITS;
extern volatile LOGCONDBITS LOGCONDbits __attribute__((__sfr__));


extern volatile uint16_t LOGCONE __attribute__((__sfr__));
typedef struct tagLOGCONEBITS {
  uint16_t PWMLFED:3;
  uint16_t :1;
  uint16_t PWMLFE:2;
  uint16_t S2EPOL:1;
  uint16_t S1EPOL:1;
  uint16_t PWMS2E:4;
  uint16_t PWMS1E:4;
} LOGCONEBITS;
extern volatile LOGCONEBITS LOGCONEbits __attribute__((__sfr__));


extern volatile uint16_t LOGCONF __attribute__((__sfr__));
typedef struct tagLOGCONFBITS {
  uint16_t PWMLFFD:3;
  uint16_t :1;
  uint16_t PWMLFF:2;
  uint16_t S2FPOL:1;
  uint16_t S1FPOL:1;
  uint16_t PWMS2F:4;
  uint16_t PWMS1F:4;
} LOGCONFBITS;
extern volatile LOGCONFBITS LOGCONFbits __attribute__((__sfr__));


extern volatile uint16_t PWMEVTA __attribute__((__sfr__));
typedef struct tagPWMEVTABITS {
  uint16_t EVTAPGS:3;
  uint16_t :1;
  uint16_t EVTASEL:4;
  uint16_t :4;
  uint16_t EVTASYNC:1;
  uint16_t EVTASTRD:1;
  uint16_t EVTAPOL:1;
  uint16_t EVTAOEN:1;
} PWMEVTABITS;
extern volatile PWMEVTABITS PWMEVTAbits __attribute__((__sfr__));


extern volatile uint16_t PWMEVTB __attribute__((__sfr__));
typedef struct tagPWMEVTBBITS {
  uint16_t EVTBPGS:3;
  uint16_t :1;
  uint16_t EVTBSEL:4;
  uint16_t :4;
  uint16_t EVTBSYNC:1;
  uint16_t EVTBSTRD:1;
  uint16_t EVTBPOL:1;
  uint16_t EVTBOEN:1;
} PWMEVTBBITS;
extern volatile PWMEVTBBITS PWMEVTBbits __attribute__((__sfr__));


extern volatile uint16_t PWMEVTC __attribute__((__sfr__));
typedef struct tagPWMEVTCBITS {
  uint16_t EVTCPGS:3;
  uint16_t :1;
  uint16_t EVTCSEL:4;
  uint16_t :4;
  uint16_t EVTCSYNC:1;
  uint16_t EVTCSTRD:1;
  uint16_t EVTCPOL:1;
  uint16_t EVTCOEN:1;
} PWMEVTCBITS;
extern volatile PWMEVTCBITS PWMEVTCbits __attribute__((__sfr__));


extern volatile uint16_t PWMEVTD __attribute__((__sfr__));
typedef struct tagPWMEVTDBITS {
  uint16_t EVTDPGS:3;
  uint16_t :1;
  uint16_t EVTDSEL:4;
  uint16_t :4;
  uint16_t EVTDSYNC:1;
  uint16_t EVTDSTRD:1;
  uint16_t EVTDPOL:1;
  uint16_t EVTDOEN:1;
} PWMEVTDBITS;
extern volatile PWMEVTDBITS PWMEVTDbits __attribute__((__sfr__));


extern volatile uint16_t PWMEVTE __attribute__((__sfr__));
typedef struct tagPWMEVTEBITS {
  uint16_t EVTEPGS:3;
  uint16_t :1;
  uint16_t EVTESEL:4;
  uint16_t :4;
  uint16_t EVTESYNC:1;
  uint16_t EVTESTRD:1;
  uint16_t EVTEPOL:1;
  uint16_t EVTEOEN:1;
} PWMEVTEBITS;
extern volatile PWMEVTEBITS PWMEVTEbits __attribute__((__sfr__));


extern volatile uint16_t PWMEVTF __attribute__((__sfr__));
typedef struct tagPWMEVTFBITS {
  uint16_t EVTFPGS:3;
  uint16_t :1;
  uint16_t EVTFSEL:4;
  uint16_t :4;
  uint16_t EVTFSYNC:1;
  uint16_t EVTFSTRD:1;
  uint16_t EVTFPOL:1;
  uint16_t EVTFOEN:1;
} PWMEVTFBITS;
extern volatile PWMEVTFBITS PWMEVTFbits __attribute__((__sfr__));


extern volatile uint16_t PG1CONL __attribute__((__sfr__));
typedef struct tagPG1CONLBITS {
  uint16_t MODSEL:3;
  uint16_t CLKSEL:2;
  uint16_t :2;
  uint16_t HREN:1;
  uint16_t TRGCNT:3;
  uint16_t :4;
  uint16_t ON:1;
} PG1CONLBITS;
extern volatile PG1CONLBITS PG1CONLbits __attribute__((__sfr__));


extern volatile uint16_t PG1CONH __attribute__((__sfr__));
typedef struct tagPG1CONHBITS {
  uint16_t SOCS:4;
  uint16_t :2;
  uint16_t TRGMOD:1;
  uint16_t :1;
  uint16_t UPDMOD:3;
  uint16_t MSTEN:1;
  uint16_t :1;
  uint16_t MPHSEL:1;
  uint16_t MPERSEL:1;
  uint16_t MDCSEL:1;
} PG1CONHBITS;
extern volatile PG1CONHBITS PG1CONHbits __attribute__((__sfr__));


extern volatile uint16_t PG1STAT __attribute__((__sfr__));
typedef struct tagPG1STATBITS {
  uint16_t TRIG:1;
  uint16_t CAHALF:1;
  uint16_t STEER:1;
  uint16_t UPDREQ:1;
  uint16_t UPDATE:1;
  uint16_t CAP:1;
  uint16_t TRCLR:1;
  uint16_t TRSET:1;
  uint16_t FFACT:1;
  uint16_t CLACT:1;
  uint16_t FLTACT:1;
  uint16_t SACT:1;
  uint16_t FFEVT:1;
  uint16_t CLEVT:1;
  uint16_t FLTEVT:1;
  uint16_t SEVT:1;
} PG1STATBITS;
extern volatile PG1STATBITS PG1STATbits __attribute__((__sfr__));


extern volatile uint16_t PG1IOCONL __attribute__((__sfr__));
typedef struct tagPG1IOCONLBITS {
  uint16_t DBDAT:2;
  uint16_t FFDAT:2;
  uint16_t CLDAT:2;
  uint16_t FLTDAT:2;
  uint16_t OSYNC:2;
  uint16_t OVRDAT:2;
  uint16_t OVRENL:1;
  uint16_t OVRENH:1;
  uint16_t SWAP:1;
  uint16_t CLMOD:1;
} PG1IOCONLBITS;
extern volatile PG1IOCONLBITS PG1IOCONLbits __attribute__((__sfr__));


extern volatile uint16_t PG1IOCONH __attribute__((__sfr__));
typedef struct tagPG1IOCONHBITS {
  uint16_t POLL:1;
  uint16_t POLH:1;
  uint16_t PENL:1;
  uint16_t PENH:1;
  uint16_t PMOD:2;
  uint16_t :2;
  uint16_t DTCMPSEL:1;
  uint16_t :3;
  uint16_t CAPSRC:3;
} PG1IOCONHBITS;
extern volatile PG1IOCONHBITS PG1IOCONHbits __attribute__((__sfr__));


extern volatile uint16_t PG1EVTL __attribute__((__sfr__));
typedef struct tagPG1EVTLBITS {
  uint16_t PGTRGSEL:3;
  uint16_t UPDTRG:2;
  uint16_t :3;
  uint16_t ADTR1EN1:1;
  uint16_t ADTR1EN2:1;
  uint16_t ADTR1EN3:1;
  uint16_t ADTR1PS:5;
} PG1EVTLBITS;
extern volatile PG1EVTLBITS PG1EVTLbits __attribute__((__sfr__));


extern volatile uint16_t PG1EVTH __attribute__((__sfr__));
typedef struct tagPG1EVTHBITS {
  uint16_t ADTR1OFS:5;
  uint16_t ADTR2EN1:1;
  uint16_t ADTR2EN2:1;
  uint16_t ADTR2EN3:1;
  uint16_t IEVTSEL:2;
  uint16_t :2;
  uint16_t SIEN:1;
  uint16_t FFIEN:1;
  uint16_t CLIEN:1;
  uint16_t FLTIEN:1;
} PG1EVTHBITS;
extern volatile PG1EVTHBITS PG1EVTHbits __attribute__((__sfr__));


extern volatile uint16_t PG1FPCIL __attribute__((__sfr__));
typedef struct tagPG1FPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG1FPCILBITS;
extern volatile PG1FPCILBITS PG1FPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG1FPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG1FPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG1FPCIHBITS;
extern volatile PG1FPCIHBITS PG1FPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG1CLPCIL __attribute__((__sfr__));
typedef struct tagPG1CLPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG1CLPCILBITS;
extern volatile PG1CLPCILBITS PG1CLPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG1CLPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG1CLPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG1CLPCIHBITS;
extern volatile PG1CLPCIHBITS PG1CLPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG1FFPCIL __attribute__((__sfr__));
typedef struct tagPG1FFPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG1FFPCILBITS;
extern volatile PG1FFPCILBITS PG1FFPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG1FFPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG1FFPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG1FFPCIHBITS;
extern volatile PG1FFPCIHBITS PG1FFPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG1SPCIL __attribute__((__sfr__));
typedef struct tagPG1SPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG1SPCILBITS;
extern volatile PG1SPCILBITS PG1SPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG1SPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG1SPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG1SPCIHBITS;
extern volatile PG1SPCIHBITS PG1SPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG1LEBL __attribute__((__sfr__));

extern volatile uint16_t PG1LEBH __attribute__((__sfr__));
typedef struct tagPG1LEBHBITS {
  uint16_t PLF:1;
  uint16_t PLR:1;
  uint16_t PHF:1;
  uint16_t PHR:1;
  uint16_t :4;
  uint16_t PWMPCI:3;
} PG1LEBHBITS;
extern volatile PG1LEBHBITS PG1LEBHbits __attribute__((__sfr__));


extern volatile uint16_t PG1PHASE __attribute__((__sfr__));

extern volatile uint16_t PG1DC __attribute__((__sfr__));

extern volatile uint16_t PG1DCA __attribute__((__sfr__));
typedef struct tagPG1DCABITS {
  uint16_t DCA:8;
} PG1DCABITS;
extern volatile PG1DCABITS PG1DCAbits __attribute__((__sfr__));


extern volatile uint16_t PG1PER __attribute__((__sfr__));

extern volatile uint16_t PG1TRIGA __attribute__((__sfr__));

extern volatile uint16_t PG1TRIGB __attribute__((__sfr__));

extern volatile uint16_t PG1TRIGC __attribute__((__sfr__));

extern volatile uint16_t PG1DTL __attribute__((__sfr__));
typedef struct tagPG1DTLBITS {
  uint16_t DTL:14;
} PG1DTLBITS;
extern volatile PG1DTLBITS PG1DTLbits __attribute__((__sfr__));


extern volatile uint16_t PG1DTH __attribute__((__sfr__));
typedef struct tagPG1DTHBITS {
  uint16_t DTH:14;
} PG1DTHBITS;
extern volatile PG1DTHBITS PG1DTHbits __attribute__((__sfr__));


extern volatile uint16_t PG1CAP __attribute__((__sfr__));

extern volatile uint16_t PG2CONL __attribute__((__sfr__));
typedef struct tagPG2CONLBITS {
  uint16_t MODSEL:3;
  uint16_t CLKSEL:2;
  uint16_t :2;
  uint16_t HREN:1;
  uint16_t TRGCNT:3;
  uint16_t :4;
  uint16_t ON:1;
} PG2CONLBITS;
extern volatile PG2CONLBITS PG2CONLbits __attribute__((__sfr__));


extern volatile uint16_t PG2CONH __attribute__((__sfr__));
typedef struct tagPG2CONHBITS {
  uint16_t SOCS:4;
  uint16_t :2;
  uint16_t TRGMOD:1;
  uint16_t :1;
  uint16_t UPDMOD:3;
  uint16_t MSTEN:1;
  uint16_t :1;
  uint16_t MPHSEL:1;
  uint16_t MPERSEL:1;
  uint16_t MDCSEL:1;
} PG2CONHBITS;
extern volatile PG2CONHBITS PG2CONHbits __attribute__((__sfr__));


extern volatile uint16_t PG2STAT __attribute__((__sfr__));
typedef struct tagPG2STATBITS {
  uint16_t TRIG:1;
  uint16_t CAHALF:1;
  uint16_t STEER:1;
  uint16_t UPDREQ:1;
  uint16_t UPDATE:1;
  uint16_t CAP:1;
  uint16_t TRCLR:1;
  uint16_t TRSET:1;
  uint16_t FFACT:1;
  uint16_t CLACT:1;
  uint16_t FLTACT:1;
  uint16_t SACT:1;
  uint16_t FFEVT:1;
  uint16_t CLEVT:1;
  uint16_t FLTEVT:1;
  uint16_t SEVT:1;
} PG2STATBITS;
extern volatile PG2STATBITS PG2STATbits __attribute__((__sfr__));


extern volatile uint16_t PG2IOCONL __attribute__((__sfr__));
typedef struct tagPG2IOCONLBITS {
  uint16_t DBDAT:2;
  uint16_t FFDAT:2;
  uint16_t CLDAT:2;
  uint16_t FLTDAT:2;
  uint16_t OSYNC:2;
  uint16_t OVRDAT:2;
  uint16_t OVRENL:1;
  uint16_t OVRENH:1;
  uint16_t SWAP:1;
  uint16_t CLMOD:1;
} PG2IOCONLBITS;
extern volatile PG2IOCONLBITS PG2IOCONLbits __attribute__((__sfr__));


extern volatile uint16_t PG2IOCONH __attribute__((__sfr__));
typedef struct tagPG2IOCONHBITS {
  uint16_t POLL:1;
  uint16_t POLH:1;
  uint16_t PENL:1;
  uint16_t PENH:1;
  uint16_t PMOD:2;
  uint16_t :2;
  uint16_t DTCMPSEL:1;
  uint16_t :3;
  uint16_t CAPSRC:3;
} PG2IOCONHBITS;
extern volatile PG2IOCONHBITS PG2IOCONHbits __attribute__((__sfr__));


extern volatile uint16_t PG2EVTL __attribute__((__sfr__));
typedef struct tagPG2EVTLBITS {
  uint16_t PGTRGSEL:3;
  uint16_t UPDTRG:2;
  uint16_t :3;
  uint16_t ADTR1EN1:1;
  uint16_t ADTR1EN2:1;
  uint16_t ADTR1EN3:1;
  uint16_t ADTR1PS:5;
} PG2EVTLBITS;
extern volatile PG2EVTLBITS PG2EVTLbits __attribute__((__sfr__));


extern volatile uint16_t PG2EVTH __attribute__((__sfr__));
typedef struct tagPG2EVTHBITS {
  uint16_t ADTR1OFS:5;
  uint16_t ADTR2EN1:1;
  uint16_t ADTR2EN2:1;
  uint16_t ADTR2EN3:1;
  uint16_t IEVTSEL:2;
  uint16_t :2;
  uint16_t SIEN:1;
  uint16_t FFIEN:1;
  uint16_t CLIEN:1;
  uint16_t FLTIEN:1;
} PG2EVTHBITS;
extern volatile PG2EVTHBITS PG2EVTHbits __attribute__((__sfr__));


extern volatile uint16_t PG2FPCIL __attribute__((__sfr__));
typedef struct tagPG2FPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG2FPCILBITS;
extern volatile PG2FPCILBITS PG2FPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG2FPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG2FPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG2FPCIHBITS;
extern volatile PG2FPCIHBITS PG2FPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG2CLPCIL __attribute__((__sfr__));
typedef struct tagPG2CLPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG2CLPCILBITS;
extern volatile PG2CLPCILBITS PG2CLPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG2CLPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG2CLPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG2CLPCIHBITS;
extern volatile PG2CLPCIHBITS PG2CLPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG2FFPCIL __attribute__((__sfr__));
typedef struct tagPG2FFPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG2FFPCILBITS;
extern volatile PG2FFPCILBITS PG2FFPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG2FFPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG2FFPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG2FFPCIHBITS;
extern volatile PG2FFPCIHBITS PG2FFPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG2SPCIL __attribute__((__sfr__));
typedef struct tagPG2SPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG2SPCILBITS;
extern volatile PG2SPCILBITS PG2SPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG2SPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG2SPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG2SPCIHBITS;
extern volatile PG2SPCIHBITS PG2SPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG2LEBL __attribute__((__sfr__));

extern volatile uint16_t PG2LEBH __attribute__((__sfr__));
typedef struct tagPG2LEBHBITS {
  uint16_t PLF:1;
  uint16_t PLR:1;
  uint16_t PHF:1;
  uint16_t PHR:1;
  uint16_t :4;
  uint16_t PWMPCI:3;
} PG2LEBHBITS;
extern volatile PG2LEBHBITS PG2LEBHbits __attribute__((__sfr__));


extern volatile uint16_t PG2PHASE __attribute__((__sfr__));

extern volatile uint16_t PG2DC __attribute__((__sfr__));

extern volatile uint16_t PG2DCA __attribute__((__sfr__));
typedef struct tagPG2DCABITS {
  uint16_t DCA:8;
} PG2DCABITS;
extern volatile PG2DCABITS PG2DCAbits __attribute__((__sfr__));


extern volatile uint16_t PG2PER __attribute__((__sfr__));

extern volatile uint16_t PG2TRIGA __attribute__((__sfr__));

extern volatile uint16_t PG2TRIGB __attribute__((__sfr__));

extern volatile uint16_t PG2TRIGC __attribute__((__sfr__));

extern volatile uint16_t PG2DTL __attribute__((__sfr__));
typedef struct tagPG2DTLBITS {
  uint16_t DTL:14;
} PG2DTLBITS;
extern volatile PG2DTLBITS PG2DTLbits __attribute__((__sfr__));


extern volatile uint16_t PG2DTH __attribute__((__sfr__));
typedef struct tagPG2DTHBITS {
  uint16_t DTH:14;
} PG2DTHBITS;
extern volatile PG2DTHBITS PG2DTHbits __attribute__((__sfr__));


extern volatile uint16_t PG2CAP __attribute__((__sfr__));

extern volatile uint16_t PG3CONL __attribute__((__sfr__));
typedef struct tagPG3CONLBITS {
  uint16_t MODSEL:3;
  uint16_t CLKSEL:2;
  uint16_t :2;
  uint16_t HREN:1;
  uint16_t TRGCNT:3;
  uint16_t :4;
  uint16_t ON:1;
} PG3CONLBITS;
extern volatile PG3CONLBITS PG3CONLbits __attribute__((__sfr__));


extern volatile uint16_t PG3CONH __attribute__((__sfr__));
typedef struct tagPG3CONHBITS {
  uint16_t SOCS:4;
  uint16_t :2;
  uint16_t TRGMOD:1;
  uint16_t :1;
  uint16_t UPDMOD:3;
  uint16_t MSTEN:1;
  uint16_t :1;
  uint16_t MPHSEL:1;
  uint16_t MPERSEL:1;
  uint16_t MDCSEL:1;
} PG3CONHBITS;
extern volatile PG3CONHBITS PG3CONHbits __attribute__((__sfr__));


extern volatile uint16_t PG3STAT __attribute__((__sfr__));
typedef struct tagPG3STATBITS {
  uint16_t TRIG:1;
  uint16_t CAHALF:1;
  uint16_t STEER:1;
  uint16_t UPDREQ:1;
  uint16_t UPDATE:1;
  uint16_t CAP:1;
  uint16_t TRCLR:1;
  uint16_t TRSET:1;
  uint16_t FFACT:1;
  uint16_t CLACT:1;
  uint16_t FLTACT:1;
  uint16_t SACT:1;
  uint16_t FFEVT:1;
  uint16_t CLEVT:1;
  uint16_t FLTEVT:1;
  uint16_t SEVT:1;
} PG3STATBITS;
extern volatile PG3STATBITS PG3STATbits __attribute__((__sfr__));


extern volatile uint16_t PG3IOCONL __attribute__((__sfr__));
typedef struct tagPG3IOCONLBITS {
  uint16_t DBDAT:2;
  uint16_t FFDAT:2;
  uint16_t CLDAT:2;
  uint16_t FLTDAT:2;
  uint16_t OSYNC:2;
  uint16_t OVRDAT:2;
  uint16_t OVRENL:1;
  uint16_t OVRENH:1;
  uint16_t SWAP:1;
  uint16_t CLMOD:1;
} PG3IOCONLBITS;
extern volatile PG3IOCONLBITS PG3IOCONLbits __attribute__((__sfr__));


extern volatile uint16_t PG3IOCONH __attribute__((__sfr__));
typedef struct tagPG3IOCONHBITS {
  uint16_t POLL:1;
  uint16_t POLH:1;
  uint16_t PENL:1;
  uint16_t PENH:1;
  uint16_t PMOD:2;
  uint16_t :2;
  uint16_t DTCMPSEL:1;
  uint16_t :3;
  uint16_t CAPSRC:3;
} PG3IOCONHBITS;
extern volatile PG3IOCONHBITS PG3IOCONHbits __attribute__((__sfr__));


extern volatile uint16_t PG3EVTL __attribute__((__sfr__));
typedef struct tagPG3EVTLBITS {
  uint16_t PGTRGSEL:3;
  uint16_t UPDTRG:2;
  uint16_t :3;
  uint16_t ADTR1EN1:1;
  uint16_t ADTR1EN2:1;
  uint16_t ADTR1EN3:1;
  uint16_t ADTR1PS:5;
} PG3EVTLBITS;
extern volatile PG3EVTLBITS PG3EVTLbits __attribute__((__sfr__));


extern volatile uint16_t PG3EVTH __attribute__((__sfr__));
typedef struct tagPG3EVTHBITS {
  uint16_t ADTR1OFS:5;
  uint16_t ADTR2EN1:1;
  uint16_t ADTR2EN2:1;
  uint16_t ADTR2EN3:1;
  uint16_t IEVTSEL:2;
  uint16_t :2;
  uint16_t SIEN:1;
  uint16_t FFIEN:1;
  uint16_t CLIEN:1;
  uint16_t FLTIEN:1;
} PG3EVTHBITS;
extern volatile PG3EVTHBITS PG3EVTHbits __attribute__((__sfr__));


extern volatile uint16_t PG3FPCIL __attribute__((__sfr__));
typedef struct tagPG3FPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG3FPCILBITS;
extern volatile PG3FPCILBITS PG3FPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG3FPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG3FPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG3FPCIHBITS;
extern volatile PG3FPCIHBITS PG3FPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG3CLPCIL __attribute__((__sfr__));
typedef struct tagPG3CLPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG3CLPCILBITS;
extern volatile PG3CLPCILBITS PG3CLPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG3CLPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG3CLPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG3CLPCIHBITS;
extern volatile PG3CLPCIHBITS PG3CLPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG3FFPCIL __attribute__((__sfr__));
typedef struct tagPG3FFPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG3FFPCILBITS;
extern volatile PG3FFPCILBITS PG3FFPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG3FFPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG3FFPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG3FFPCIHBITS;
extern volatile PG3FFPCIHBITS PG3FFPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG3SPCIL __attribute__((__sfr__));
typedef struct tagPG3SPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG3SPCILBITS;
extern volatile PG3SPCILBITS PG3SPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG3SPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG3SPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG3SPCIHBITS;
extern volatile PG3SPCIHBITS PG3SPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG3LEBL __attribute__((__sfr__));

extern volatile uint16_t PG3LEBH __attribute__((__sfr__));
typedef struct tagPG3LEBHBITS {
  uint16_t PLF:1;
  uint16_t PLR:1;
  uint16_t PHF:1;
  uint16_t PHR:1;
  uint16_t :4;
  uint16_t PWMPCI:3;
} PG3LEBHBITS;
extern volatile PG3LEBHBITS PG3LEBHbits __attribute__((__sfr__));


extern volatile uint16_t PG3PHASE __attribute__((__sfr__));

extern volatile uint16_t PG3DC __attribute__((__sfr__));

extern volatile uint16_t PG3DCA __attribute__((__sfr__));
typedef struct tagPG3DCABITS {
  uint16_t DCA:8;
} PG3DCABITS;
extern volatile PG3DCABITS PG3DCAbits __attribute__((__sfr__));


extern volatile uint16_t PG3PER __attribute__((__sfr__));

extern volatile uint16_t PG3TRIGA __attribute__((__sfr__));

extern volatile uint16_t PG3TRIGB __attribute__((__sfr__));

extern volatile uint16_t PG3TRIGC __attribute__((__sfr__));

extern volatile uint16_t PG3DTL __attribute__((__sfr__));
typedef struct tagPG3DTLBITS {
  uint16_t DTL:14;
} PG3DTLBITS;
extern volatile PG3DTLBITS PG3DTLbits __attribute__((__sfr__));


extern volatile uint16_t PG3DTH __attribute__((__sfr__));
typedef struct tagPG3DTHBITS {
  uint16_t DTH:14;
} PG3DTHBITS;
extern volatile PG3DTHBITS PG3DTHbits __attribute__((__sfr__));


extern volatile uint16_t PG3CAP __attribute__((__sfr__));

extern volatile uint16_t PG4CONL __attribute__((__sfr__));
typedef struct tagPG4CONLBITS {
  uint16_t MODSEL:3;
  uint16_t CLKSEL:2;
  uint16_t :2;
  uint16_t HREN:1;
  uint16_t TRGCNT:3;
  uint16_t :4;
  uint16_t ON:1;
} PG4CONLBITS;
extern volatile PG4CONLBITS PG4CONLbits __attribute__((__sfr__));


extern volatile uint16_t PG4CONH __attribute__((__sfr__));
typedef struct tagPG4CONHBITS {
  uint16_t SOCS:4;
  uint16_t :2;
  uint16_t TRGMOD:1;
  uint16_t :1;
  uint16_t UPDMOD:3;
  uint16_t MSTEN:1;
  uint16_t :1;
  uint16_t MPHSEL:1;
  uint16_t MPERSEL:1;
  uint16_t MDCSEL:1;
} PG4CONHBITS;
extern volatile PG4CONHBITS PG4CONHbits __attribute__((__sfr__));


extern volatile uint16_t PG4STAT __attribute__((__sfr__));
typedef struct tagPG4STATBITS {
  uint16_t TRIG:1;
  uint16_t CAHALF:1;
  uint16_t STEER:1;
  uint16_t UPDREQ:1;
  uint16_t UPDATE:1;
  uint16_t CAP:1;
  uint16_t TRCLR:1;
  uint16_t TRSET:1;
  uint16_t FFACT:1;
  uint16_t CLACT:1;
  uint16_t FLTACT:1;
  uint16_t SACT:1;
  uint16_t FFEVT:1;
  uint16_t CLEVT:1;
  uint16_t FLTEVT:1;
  uint16_t SEVT:1;
} PG4STATBITS;
extern volatile PG4STATBITS PG4STATbits __attribute__((__sfr__));


extern volatile uint16_t PG4IOCONL __attribute__((__sfr__));
typedef struct tagPG4IOCONLBITS {
  uint16_t DBDAT:2;
  uint16_t FFDAT:2;
  uint16_t CLDAT:2;
  uint16_t FLTDAT:2;
  uint16_t OSYNC:2;
  uint16_t OVRDAT:2;
  uint16_t OVRENL:1;
  uint16_t OVRENH:1;
  uint16_t SWAP:1;
  uint16_t CLMOD:1;
} PG4IOCONLBITS;
extern volatile PG4IOCONLBITS PG4IOCONLbits __attribute__((__sfr__));


extern volatile uint16_t PG4IOCONH __attribute__((__sfr__));
typedef struct tagPG4IOCONHBITS {
  uint16_t POLL:1;
  uint16_t POLH:1;
  uint16_t PENL:1;
  uint16_t PENH:1;
  uint16_t PMOD:2;
  uint16_t :2;
  uint16_t DTCMPSEL:1;
  uint16_t :3;
  uint16_t CAPSRC:3;
} PG4IOCONHBITS;
extern volatile PG4IOCONHBITS PG4IOCONHbits __attribute__((__sfr__));


extern volatile uint16_t PG4EVTL __attribute__((__sfr__));
typedef struct tagPG4EVTLBITS {
  uint16_t PGTRGSEL:3;
  uint16_t UPDTRG:2;
  uint16_t :3;
  uint16_t ADTR1EN1:1;
  uint16_t ADTR1EN2:1;
  uint16_t ADTR1EN3:1;
  uint16_t ADTR1PS:5;
} PG4EVTLBITS;
extern volatile PG4EVTLBITS PG4EVTLbits __attribute__((__sfr__));


extern volatile uint16_t PG4EVTH __attribute__((__sfr__));
typedef struct tagPG4EVTHBITS {
  uint16_t ADTR1OFS:5;
  uint16_t ADTR2EN1:1;
  uint16_t ADTR2EN2:1;
  uint16_t ADTR2EN3:1;
  uint16_t IEVTSEL:2;
  uint16_t :2;
  uint16_t SIEN:1;
  uint16_t FFIEN:1;
  uint16_t CLIEN:1;
  uint16_t FLTIEN:1;
} PG4EVTHBITS;
extern volatile PG4EVTHBITS PG4EVTHbits __attribute__((__sfr__));


extern volatile uint16_t PG4FPCIL __attribute__((__sfr__));
typedef struct tagPG4FPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG4FPCILBITS;
extern volatile PG4FPCILBITS PG4FPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG4FPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG4FPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG4FPCIHBITS;
extern volatile PG4FPCIHBITS PG4FPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG4CLPCIL __attribute__((__sfr__));
typedef struct tagPG4CLPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG4CLPCILBITS;
extern volatile PG4CLPCILBITS PG4CLPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG4CLPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG4CLPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG4CLPCIHBITS;
extern volatile PG4CLPCIHBITS PG4CLPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG4FFPCIL __attribute__((__sfr__));
typedef struct tagPG4FFPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG4FFPCILBITS;
extern volatile PG4FFPCILBITS PG4FFPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG4FFPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG4FFPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG4FFPCIHBITS;
extern volatile PG4FFPCIHBITS PG4FFPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG4SPCIL __attribute__((__sfr__));
typedef struct tagPG4SPCILBITS {
  uint16_t PSS:5;
  uint16_t PPS:1;
  uint16_t PSYNC:1;
  uint16_t SWTERM:1;
  uint16_t AQSS:3;
  uint16_t AQPS:1;
  uint16_t TERM:3;
  uint16_t TSYNCDIS:1;
} PG4SPCILBITS;
extern volatile PG4SPCILBITS PG4SPCILbits __attribute__((__sfr__));


extern volatile uint16_t PG4SPCIH __attribute__((__sfr__));
__extension__ typedef struct tagPG4SPCIHBITS {
  union {
    struct {
      uint16_t TQSS:3;
      uint16_t TQPS:1;
      uint16_t LATMOD:1;
      uint16_t SWPCIM:2;
      uint16_t SWPCI:1;
      uint16_t ACP:3;
      uint16_t :1;
      uint16_t BPSEL:3;
      uint16_t BPEN:1;
    };
    struct {
      uint16_t :4;
      uint16_t PCIGT:1;
    };
  };
} PG4SPCIHBITS;
extern volatile PG4SPCIHBITS PG4SPCIHbits __attribute__((__sfr__));


extern volatile uint16_t PG4LEBL __attribute__((__sfr__));

extern volatile uint16_t PG4LEBH __attribute__((__sfr__));
typedef struct tagPG4LEBHBITS {
  uint16_t PLF:1;
  uint16_t PLR:1;
  uint16_t PHF:1;
  uint16_t PHR:1;
  uint16_t :4;
  uint16_t PWMPCI:3;
} PG4LEBHBITS;
extern volatile PG4LEBHBITS PG4LEBHbits __attribute__((__sfr__));


extern volatile uint16_t PG4PHASE __attribute__((__sfr__));

extern volatile uint16_t PG4DC __attribute__((__sfr__));

extern volatile uint16_t PG4DCA __attribute__((__sfr__));
typedef struct tagPG4DCABITS {
  uint16_t DCA:8;
} PG4DCABITS;
extern volatile PG4DCABITS PG4DCAbits __attribute__((__sfr__));


extern volatile uint16_t PG4PER __attribute__((__sfr__));

extern volatile uint16_t PG4TRIGA __attribute__((__sfr__));

extern volatile uint16_t PG4TRIGB __attribute__((__sfr__));

extern volatile uint16_t PG4TRIGC __attribute__((__sfr__));

extern volatile uint16_t PG4DTL __attribute__((__sfr__));
typedef struct tagPG4DTLBITS {
  uint16_t DTL:14;
} PG4DTLBITS;
extern volatile PG4DTLBITS PG4DTLbits __attribute__((__sfr__));


extern volatile uint16_t PG4DTH __attribute__((__sfr__));
typedef struct tagPG4DTHBITS {
  uint16_t DTH:14;
} PG4DTHBITS;
extern volatile PG4DTHBITS PG4DTHbits __attribute__((__sfr__));


extern volatile uint16_t PG4CAP __attribute__((__sfr__));

extern volatile uint16_t C2CONL __attribute__((__sfr__));
__extension__ typedef struct tagC2CONLBITS {
  union {
    struct {
      uint16_t DNCNT:5;
      uint16_t ISOCRCEN:1;
      uint16_t PXEDIS:1;
      uint16_t CLKSEL:1;
      uint16_t WAKFIL:1;
      uint16_t WFT:2;
      uint16_t BUSY:1;
      uint16_t BRSDIS:1;
      uint16_t SIDL:1;
      uint16_t :1;
      uint16_t CON:1;
    };
    struct {
      uint16_t DNCNT0:1;
      uint16_t DNCNT1:1;
      uint16_t DNCNT2:1;
      uint16_t DNCNT3:1;
      uint16_t DNCNT4:1;
      uint16_t :4;
      uint16_t WFT0:1;
      uint16_t WFT1:1;
    };
  };
} C2CONLBITS;
extern volatile C2CONLBITS C2CONLbits __attribute__((__sfr__));


extern volatile uint16_t C2CONH __attribute__((__sfr__));
__extension__ typedef struct tagC2CONHBITS {
  union {
    struct {
      uint16_t RTXAT:1;
      uint16_t ESIGM:1;
      uint16_t SERRLOM:1;
      uint16_t STEF:1;
      uint16_t TXQEN:1;
      uint16_t OPMOD:3;
      uint16_t REQOP:3;
      uint16_t ABAT:1;
      uint16_t TXBWS:4;
    };
    struct {
      uint16_t :5;
      uint16_t OPMOD0:1;
      uint16_t OPMOD1:1;
      uint16_t OPMOD2:1;
      uint16_t REQOP0:1;
      uint16_t REQOP1:1;
      uint16_t REQOP2:1;
      uint16_t :1;
      uint16_t TXBWS0:1;
      uint16_t TXBWS1:1;
      uint16_t TXBWS2:1;
      uint16_t TXBWS3:1;
    };
  };
} C2CONHBITS;
extern volatile C2CONHBITS C2CONHbits __attribute__((__sfr__));


extern volatile uint16_t C2NBTCFGL __attribute__((__sfr__));
__extension__ typedef struct tagC2NBTCFGLBITS {
  union {
    struct {
      uint16_t SJW:7;
      uint16_t :1;
      uint16_t TSEG2:7;
    };
    struct {
      uint16_t SJW0:1;
      uint16_t SJW1:1;
      uint16_t SJW2:1;
      uint16_t SJW3:1;
      uint16_t SJW4:1;
      uint16_t SJW5:1;
      uint16_t SJW6:1;
      uint16_t :1;
      uint16_t TSEG20:1;
      uint16_t TSEG21:1;
      uint16_t TSEG22:1;
      uint16_t TSEG23:1;
      uint16_t TSEG24:1;
      uint16_t TSEG25:1;
      uint16_t TSEG26:1;
    };
  };
} C2NBTCFGLBITS;
extern volatile C2NBTCFGLBITS C2NBTCFGLbits __attribute__((__sfr__));


extern volatile uint16_t C2NBTCFGH __attribute__((__sfr__));
__extension__ typedef struct tagC2NBTCFGHBITS {
  union {
    struct {
      uint16_t TSEG1:8;
      uint16_t BRP:8;
    };
    struct {
      uint16_t TSEG10:1;
      uint16_t TSEG11:1;
      uint16_t TSEG12:1;
      uint16_t TSEG13:1;
      uint16_t TSEG14:1;
      uint16_t TSEG15:1;
      uint16_t TSEG16:1;
      uint16_t TSEG17:1;
      uint16_t BRP0:1;
      uint16_t BRP1:1;
      uint16_t BRP2:1;
      uint16_t BRP3:1;
      uint16_t BRP4:1;
      uint16_t BRP5:1;
      uint16_t BRP6:1;
      uint16_t BRP7:1;
    };
  };
} C2NBTCFGHBITS;
extern volatile C2NBTCFGHBITS C2NBTCFGHbits __attribute__((__sfr__));


extern volatile uint16_t C2DBTCFGL __attribute__((__sfr__));
__extension__ typedef struct tagC2DBTCFGLBITS {
  union {
    struct {
      uint16_t SJW:4;
      uint16_t :4;
      uint16_t TSEG2:4;
    };
    struct {
      uint16_t SJW0:1;
      uint16_t SJW1:1;
      uint16_t SJW2:1;
      uint16_t SJW3:1;
      uint16_t :4;
      uint16_t TSEG20:1;
      uint16_t TSEG21:1;
      uint16_t TSEG22:1;
      uint16_t TSEG23:1;
    };
  };
} C2DBTCFGLBITS;
extern volatile C2DBTCFGLBITS C2DBTCFGLbits __attribute__((__sfr__));


extern volatile uint16_t C2DBTCFGH __attribute__((__sfr__));
__extension__ typedef struct tagC2DBTCFGHBITS {
  union {
    struct {
      uint16_t TSEG1:5;
      uint16_t :3;
      uint16_t BRP:8;
    };
    struct {
      uint16_t TSEG10:1;
      uint16_t TSEG11:1;
      uint16_t TSEG12:1;
      uint16_t TSEG13:1;
      uint16_t TSEG14:1;
      uint16_t :3;
      uint16_t BRP0:1;
      uint16_t BRP1:1;
      uint16_t BRP2:1;
      uint16_t BRP3:1;
      uint16_t BRP4:1;
      uint16_t BRP5:1;
      uint16_t BRP6:1;
      uint16_t BRP7:1;
    };
  };
} C2DBTCFGHBITS;
extern volatile C2DBTCFGHBITS C2DBTCFGHbits __attribute__((__sfr__));


extern volatile uint16_t C2TDCL __attribute__((__sfr__));
__extension__ typedef struct tagC2TDCLBITS {
  union {
    struct {
      uint16_t TDCV:6;
      uint16_t :2;
      uint16_t TDCO:7;
    };
    struct {
      uint16_t TDCV0:1;
      uint16_t TDCV1:1;
      uint16_t TDCV2:1;
      uint16_t TDCV3:1;
      uint16_t TDCV4:1;
      uint16_t TDCV5:1;
      uint16_t :2;
      uint16_t TDCO0:1;
      uint16_t TDCO1:1;
      uint16_t TDCO2:1;
      uint16_t TDCO3:1;
      uint16_t TDCO4:1;
      uint16_t TDCO5:1;
      uint16_t TDCO6:1;
    };
  };
} C2TDCLBITS;
extern volatile C2TDCLBITS C2TDCLbits __attribute__((__sfr__));


extern volatile uint16_t C2TDCH __attribute__((__sfr__));
__extension__ typedef struct tagC2TDCHBITS {
  union {
    struct {
      uint16_t TDCMOD:2;
      uint16_t :6;
      uint16_t SID11EN:1;
      uint16_t EDGFLTEN:1;
    };
    struct {
      uint16_t TDCMOD0:1;
      uint16_t TDCMOD1:1;
    };
  };
} C2TDCHBITS;
extern volatile C2TDCHBITS C2TDCHbits __attribute__((__sfr__));


extern volatile uint16_t C2TBCL __attribute__((__sfr__));
__extension__ typedef struct tagC2TBCLBITS {
  union {
    struct {
      uint16_t TBC:16;
    };
    struct {
      uint16_t TBC0:1;
      uint16_t TBC1:1;
      uint16_t TBC2:1;
      uint16_t TBC3:1;
      uint16_t TBC4:1;
      uint16_t TBC5:1;
      uint16_t TBC6:1;
      uint16_t TBC7:1;
      uint16_t TBC8:1;
      uint16_t TBC9:1;
      uint16_t TBC10:1;
      uint16_t TBC11:1;
      uint16_t TBC12:1;
      uint16_t TBC13:1;
      uint16_t TBC14:1;
      uint16_t TBC15:1;
    };
  };
} C2TBCLBITS;
extern volatile C2TBCLBITS C2TBCLbits __attribute__((__sfr__));


extern volatile uint16_t C2TBCH __attribute__((__sfr__));
__extension__ typedef struct tagC2TBCHBITS {
  union {
    struct {
      uint16_t TBC:16;
    };
    struct {
      uint16_t TBC16:1;
      uint16_t TBC17:1;
      uint16_t TBC18:1;
      uint16_t TBC19:1;
      uint16_t TBC20:1;
      uint16_t TBC21:1;
      uint16_t TBC22:1;
      uint16_t TBC23:1;
      uint16_t TBC24:1;
      uint16_t TBC25:1;
      uint16_t TBC26:1;
      uint16_t TBC27:1;
      uint16_t TBC28:1;
      uint16_t TBC29:1;
      uint16_t TBC30:1;
      uint16_t TBC31:1;
    };
  };
} C2TBCHBITS;
extern volatile C2TBCHBITS C2TBCHbits __attribute__((__sfr__));


extern volatile uint16_t C2TSCONL __attribute__((__sfr__));
__extension__ typedef struct tagC2TSCONLBITS {
  union {
    struct {
      uint16_t TBCPRE:10;
    };
    struct {
      uint16_t TBCPRE0:1;
      uint16_t TBCPRE1:1;
      uint16_t TBCPRE2:1;
      uint16_t TBCPRE3:1;
      uint16_t TBCPRE4:1;
      uint16_t TBCPRE5:1;
      uint16_t TBCPRE6:1;
      uint16_t TBCPRE7:1;
      uint16_t TBCPRE8:1;
      uint16_t TBCPRE9:1;
    };
  };
} C2TSCONLBITS;
extern volatile C2TSCONLBITS C2TSCONLbits __attribute__((__sfr__));


extern volatile uint16_t C2TSCONH __attribute__((__sfr__));
typedef struct tagC2TSCONHBITS {
  uint16_t TBCEN:1;
  uint16_t TSEOF:1;
  uint16_t TSRES:1;
} C2TSCONHBITS;
extern volatile C2TSCONHBITS C2TSCONHbits __attribute__((__sfr__));


extern volatile uint16_t C2VECL __attribute__((__sfr__));
__extension__ typedef struct tagC2VECLBITS {
  union {
    struct {
      uint16_t ICODE:7;
      uint16_t :1;
      uint16_t FILHIT:5;
    };
    struct {
      uint16_t ICODE0:1;
      uint16_t ICODE1:1;
      uint16_t ICODE2:1;
      uint16_t ICODE3:1;
      uint16_t ICODE4:1;
      uint16_t ICODE5:1;
      uint16_t ICODE6:1;
      uint16_t :1;
      uint16_t FILHIT0:1;
      uint16_t FILHIT1:1;
      uint16_t FILHIT2:1;
      uint16_t FILHIT3:1;
      uint16_t FILHIT4:1;
    };
  };
} C2VECLBITS;
extern volatile C2VECLBITS C2VECLbits __attribute__((__sfr__));


extern volatile uint16_t C2VECH __attribute__((__sfr__));
__extension__ typedef struct tagC2VECHBITS {
  union {
    struct {
      uint16_t TXCODE:7;
      uint16_t :1;
      uint16_t RXCODE:7;
    };
    struct {
      uint16_t TXCODE0:1;
      uint16_t TXCODE1:1;
      uint16_t TXCODE2:1;
      uint16_t TXCODE3:1;
      uint16_t TXCODE4:1;
      uint16_t TXCODE5:1;
      uint16_t TXCODE6:1;
      uint16_t :1;
      uint16_t RXCODE0:1;
      uint16_t RXCODE1:1;
      uint16_t RXCODE2:1;
      uint16_t RXCODE3:1;
      uint16_t RXCODE4:1;
      uint16_t RXCODE5:1;
      uint16_t RXCODE6:1;
    };
  };
} C2VECHBITS;
extern volatile C2VECHBITS C2VECHbits __attribute__((__sfr__));


extern volatile uint16_t C2INTL __attribute__((__sfr__));
typedef struct tagC2INTLBITS {
  uint16_t TXIF:1;
  uint16_t RXIF:1;
  uint16_t TBCIF:1;
  uint16_t MODIF:1;
  uint16_t TEFIF:1;
  uint16_t :5;
  uint16_t TXATIF:1;
  uint16_t RXOVIF:1;
  uint16_t SERRIF:1;
  uint16_t CERRIF:1;
  uint16_t WAKIF:1;
  uint16_t IVMIF:1;
} C2INTLBITS;
extern volatile C2INTLBITS C2INTLbits __attribute__((__sfr__));


extern volatile uint16_t C2INTH __attribute__((__sfr__));
typedef struct tagC2INTHBITS {
  uint16_t TXIE:1;
  uint16_t RXIE:1;
  uint16_t TBCIE:1;
  uint16_t MODIE:1;
  uint16_t TEFIE:1;
  uint16_t :5;
  uint16_t TXATIE:1;
  uint16_t RXOVIE:1;
  uint16_t SERRIE:1;
  uint16_t CERRIE:1;
  uint16_t WAKIE:1;
  uint16_t IVMIE:1;
} C2INTHBITS;
extern volatile C2INTHBITS C2INTHbits __attribute__((__sfr__));


extern volatile uint16_t C2RXIFL __attribute__((__sfr__));
__extension__ typedef struct tagC2RXIFLBITS {
  union {
    struct {
      uint16_t :1;
      uint16_t RFIF:15;
    };
    struct {
      uint16_t :1;
      uint16_t RFIF1:1;
      uint16_t RFIF2:1;
      uint16_t RFIF3:1;
      uint16_t RFIF4:1;
      uint16_t RFIF5:1;
      uint16_t RFIF6:1;
      uint16_t RFIF7:1;
      uint16_t RFIF8:1;
      uint16_t RFIF9:1;
      uint16_t RFIF10:1;
      uint16_t RFIF11:1;
      uint16_t RFIF12:1;
      uint16_t RFIF13:1;
      uint16_t RFIF14:1;
      uint16_t RFIF15:1;
    };
  };
} C2RXIFLBITS;
extern volatile C2RXIFLBITS C2RXIFLbits __attribute__((__sfr__));


extern volatile uint16_t C2RXIFH __attribute__((__sfr__));
__extension__ typedef struct tagC2RXIFHBITS {
  union {
    struct {
      uint16_t RFIF:16;
    };
    struct {
      uint16_t RFIF16:1;
      uint16_t RFIF17:1;
      uint16_t RFIF18:1;
      uint16_t RFIF19:1;
      uint16_t RFIF20:1;
      uint16_t RFIF21:1;
      uint16_t RFIF22:1;
      uint16_t RFIF23:1;
      uint16_t RFIF24:1;
      uint16_t RFIF25:1;
      uint16_t RFIF26:1;
      uint16_t RFIF27:1;
      uint16_t RFIF28:1;
      uint16_t RFIF29:1;
      uint16_t RFIF30:1;
      uint16_t RFIF31:1;
    };
  };
} C2RXIFHBITS;
extern volatile C2RXIFHBITS C2RXIFHbits __attribute__((__sfr__));


extern volatile uint16_t C2TXIFL __attribute__((__sfr__));
__extension__ typedef struct tagC2TXIFLBITS {
  union {
    struct {
      uint16_t TFIF:16;
    };
    struct {
      uint16_t TFIF0:1;
      uint16_t TFIF1:1;
      uint16_t TFIF2:1;
      uint16_t TFIF3:1;
      uint16_t TFIF4:1;
      uint16_t TFIF5:1;
      uint16_t TFIF6:1;
      uint16_t TFIF7:1;
      uint16_t TFIF8:1;
      uint16_t TFIF9:1;
      uint16_t TFIF10:1;
      uint16_t TFIF11:1;
      uint16_t TFIF12:1;
      uint16_t TFIF13:1;
      uint16_t TFIF14:1;
      uint16_t TFIF15:1;
    };
  };
} C2TXIFLBITS;
extern volatile C2TXIFLBITS C2TXIFLbits __attribute__((__sfr__));


extern volatile uint16_t C2TXIFH __attribute__((__sfr__));
__extension__ typedef struct tagC2TXIFHBITS {
  union {
    struct {
      uint16_t TFIF:16;
    };
    struct {
      uint16_t TFIF16:1;
      uint16_t TFIF17:1;
      uint16_t TFIF18:1;
      uint16_t TFIF19:1;
      uint16_t TFIF20:1;
      uint16_t TFIF21:1;
      uint16_t TFIF22:1;
      uint16_t TFIF23:1;
      uint16_t TFIF24:1;
      uint16_t TFIF25:1;
      uint16_t TFIF26:1;
      uint16_t TFIF27:1;
      uint16_t TFIF28:1;
      uint16_t TFIF29:1;
      uint16_t TFIF30:1;
      uint16_t TFIF31:1;
    };
  };
} C2TXIFHBITS;
extern volatile C2TXIFHBITS C2TXIFHbits __attribute__((__sfr__));


extern volatile uint16_t C2RXOVIFL __attribute__((__sfr__));
__extension__ typedef struct tagC2RXOVIFLBITS {
  union {
    struct {
      uint16_t :1;
      uint16_t RFOVIF:15;
    };
    struct {
      uint16_t :1;
      uint16_t RFOVIF1:1;
      uint16_t RFOVIF2:1;
      uint16_t RFOVIF3:1;
      uint16_t RFOVIF4:1;
      uint16_t RFOVIF5:1;
      uint16_t RFOVIF6:1;
      uint16_t RFOVIF7:1;
      uint16_t RFOVIF8:1;
      uint16_t RFOVIF9:1;
      uint16_t RFOVIF10:1;
      uint16_t RFOVIF11:1;
      uint16_t RFOVIF12:1;
      uint16_t RFOVIF13:1;
      uint16_t RFOVIF14:1;
      uint16_t RFOVIF15:1;
    };
  };
} C2RXOVIFLBITS;
extern volatile C2RXOVIFLBITS C2RXOVIFLbits __attribute__((__sfr__));


extern volatile uint16_t C2RXOVIFH __attribute__((__sfr__));
__extension__ typedef struct tagC2RXOVIFHBITS {
  union {
    struct {
      uint16_t RFOVIF:16;
    };
    struct {
      uint16_t RFOVIF16:1;
      uint16_t RFOVIF17:1;
      uint16_t RFOVIF18:1;
      uint16_t RFOVIF19:1;
      uint16_t RFOVIF20:1;
      uint16_t RFOVIF21:1;
      uint16_t RFOVIF22:1;
      uint16_t RFOVIF23:1;
      uint16_t RFOVIF24:1;
      uint16_t RFOVIF25:1;
      uint16_t RFOVIF26:1;
      uint16_t RFOVIF27:1;
      uint16_t RFOVIF28:1;
      uint16_t RFOVIF29:1;
      uint16_t RFOVIF30:1;
      uint16_t RFOVIF31:1;
    };
  };
} C2RXOVIFHBITS;
extern volatile C2RXOVIFHBITS C2RXOVIFHbits __attribute__((__sfr__));


extern volatile uint16_t C2TXATIFL __attribute__((__sfr__));
__extension__ typedef struct tagC2TXATIFLBITS {
  union {
    struct {
      uint16_t TFATIF:16;
    };
    struct {
      uint16_t TFATIF0:1;
      uint16_t TFATIF1:1;
      uint16_t TFATIF2:1;
      uint16_t TFATIF3:1;
      uint16_t TFATIF4:1;
      uint16_t TFATIF5:1;
      uint16_t TFATIF6:1;
      uint16_t TFATIF7:1;
      uint16_t TFATIF8:1;
      uint16_t TFATIF9:1;
      uint16_t TFATIF10:1;
      uint16_t TFATIF11:1;
      uint16_t TFATIF12:1;
      uint16_t TFATIF13:1;
      uint16_t TFATIF14:1;
      uint16_t TFATIF15:1;
    };
  };
} C2TXATIFLBITS;
extern volatile C2TXATIFLBITS C2TXATIFLbits __attribute__((__sfr__));


extern volatile uint16_t C2TXATIFH __attribute__((__sfr__));
__extension__ typedef struct tagC2TXATIFHBITS {
  union {
    struct {
      uint16_t TFATIF:16;
    };
    struct {
      uint16_t TFATIF16:1;
      uint16_t TFATIF17:1;
      uint16_t TFATIF18:1;
      uint16_t TFATIF19:1;
      uint16_t TFATIF20:1;
      uint16_t TFATIF21:1;
      uint16_t TFATIF22:1;
      uint16_t TFATIF23:1;
      uint16_t TFATIF24:1;
      uint16_t TFATIF25:1;
      uint16_t TFATIF26:1;
      uint16_t TFATIF27:1;
      uint16_t TFATIF28:1;
      uint16_t TFATIF29:1;
      uint16_t TFATIF30:1;
      uint16_t TFATIF31:1;
    };
  };
} C2TXATIFHBITS;
extern volatile C2TXATIFHBITS C2TXATIFHbits __attribute__((__sfr__));


extern volatile uint16_t C2TXREQL __attribute__((__sfr__));
__extension__ typedef struct tagC2TXREQLBITS {
  union {
    struct {
      uint16_t TXREQ:16;
    };
    struct {
      uint16_t TXREQ0:1;
      uint16_t TXREQ1:1;
      uint16_t TXREQ2:1;
      uint16_t TXREQ3:1;
      uint16_t TXREQ4:1;
      uint16_t TXREQ5:1;
      uint16_t TXREQ6:1;
      uint16_t TXREQ7:1;
      uint16_t TXREQ8:1;
      uint16_t TXREQ9:1;
      uint16_t TXREQ10:1;
      uint16_t TXREQ11:1;
      uint16_t TXREQ12:1;
      uint16_t TXREQ13:1;
      uint16_t TXREQ14:1;
      uint16_t TXREQ15:1;
    };
  };
} C2TXREQLBITS;
extern volatile C2TXREQLBITS C2TXREQLbits __attribute__((__sfr__));


extern volatile uint16_t C2TXREQH __attribute__((__sfr__));
__extension__ typedef struct tagC2TXREQHBITS {
  union {
    struct {
      uint16_t TXREQ:16;
    };
    struct {
      uint16_t TXREQ16:1;
      uint16_t TXREQ17:1;
      uint16_t TXREQ18:1;
      uint16_t TXREQ19:1;
      uint16_t TXREQ20:1;
      uint16_t TXREQ21:1;
      uint16_t TXREQ22:1;
      uint16_t TXREQ23:1;
      uint16_t TXREQ24:1;
      uint16_t TXREQ25:1;
      uint16_t TXREQ26:1;
      uint16_t TXREQ27:1;
      uint16_t TXREQ28:1;
      uint16_t TXREQ29:1;
      uint16_t TXREQ30:1;
      uint16_t TXREQ31:1;
    };
  };
} C2TXREQHBITS;
extern volatile C2TXREQHBITS C2TXREQHbits __attribute__((__sfr__));


extern volatile uint16_t C2TRECL __attribute__((__sfr__));
__extension__ typedef struct tagC2TRECLBITS {
  union {
    struct {
      uint16_t RERRCNT:8;
      uint16_t TERRCNT:8;
    };
    struct {
      uint16_t RERRCNT0:1;
      uint16_t RERRCNT1:1;
      uint16_t RERRCNT2:1;
      uint16_t RERRCNT3:1;
      uint16_t RERRCNT4:1;
      uint16_t RERRCNT5:1;
      uint16_t RERRCNT6:1;
      uint16_t RERRCNT7:1;
      uint16_t TERRCNT0:1;
      uint16_t TERRCNT1:1;
      uint16_t TERRCNT2:1;
      uint16_t TERRCNT3:1;
      uint16_t TERRCNT4:1;
      uint16_t TERRCNT5:1;
      uint16_t TERRCNT6:1;
      uint16_t TERRCNT7:1;
    };
  };
} C2TRECLBITS;
extern volatile C2TRECLBITS C2TRECLbits __attribute__((__sfr__));


extern volatile uint16_t C2TRECH __attribute__((__sfr__));
typedef struct tagC2TRECHBITS {
  uint16_t EWARN:1;
  uint16_t RXWARN:1;
  uint16_t TXWARN:1;
  uint16_t RXBP:1;
  uint16_t TXBP:1;
  uint16_t TXBO:1;
} C2TRECHBITS;
extern volatile C2TRECHBITS C2TRECHbits __attribute__((__sfr__));


extern volatile uint16_t C2BDIAG0L __attribute__((__sfr__));
__extension__ typedef struct tagC2BDIAG0LBITS {
  union {
    struct {
      uint16_t NRERRCNT:8;
      uint16_t NTERRCNT:8;
    };
    struct {
      uint16_t NRERRCNT0:1;
      uint16_t NRERRCNT1:1;
      uint16_t NRERRCNT2:1;
      uint16_t NRERRCNT3:1;
      uint16_t NRERRCNT4:1;
      uint16_t NRERRCNT5:1;
      uint16_t NRERRCNT6:1;
      uint16_t NRERRCNT7:1;
      uint16_t NTERRCNT0:1;
      uint16_t NTERRCNT1:1;
      uint16_t NTERRCNT2:1;
      uint16_t NTERRCNT3:1;
      uint16_t NTERRCNT4:1;
      uint16_t NTERRCNT5:1;
      uint16_t NTERRCNT6:1;
      uint16_t NTERRCNT7:1;
    };
  };
} C2BDIAG0LBITS;
extern volatile C2BDIAG0LBITS C2BDIAG0Lbits __attribute__((__sfr__));


extern volatile uint16_t C2BDIAG0H __attribute__((__sfr__));
__extension__ typedef struct tagC2BDIAG0HBITS {
  union {
    struct {
      uint16_t DRERRCNT:8;
      uint16_t DTERRCNT:8;
    };
    struct {
      uint16_t DRERRCNT0:1;
      uint16_t DRERRCNT1:1;
      uint16_t DRERRCNT2:1;
      uint16_t DRERRCNT3:1;
      uint16_t DRERRCNT4:1;
      uint16_t DRERRCNT5:1;
      uint16_t DRERRCNT6:1;
      uint16_t DRERRCNT7:1;
      uint16_t DTERRCNT0:1;
      uint16_t DTERRCNT1:1;
      uint16_t DTERRCNT2:1;
      uint16_t DTERRCNT3:1;
      uint16_t DTERRCNT4:1;
      uint16_t DTERRCNT5:1;
      uint16_t DTERRCNT6:1;
      uint16_t DTERRCNT7:1;
    };
  };
} C2BDIAG0HBITS;
extern volatile C2BDIAG0HBITS C2BDIAG0Hbits __attribute__((__sfr__));


extern volatile uint16_t C2BDIAG1L __attribute__((__sfr__));
__extension__ typedef struct tagC2BDIAG1LBITS {
  union {
    struct {
      uint16_t EFMSGCNT:16;
    };
    struct {
      uint16_t EFMSGCNT0:1;
      uint16_t EFMSGCNT1:1;
      uint16_t EFMSGCNT2:1;
      uint16_t EFMSGCNT3:1;
      uint16_t EFMSGCNT4:1;
      uint16_t EFMSGCNT5:1;
      uint16_t EFMSGCNT6:1;
      uint16_t EFMSGCNT7:1;
      uint16_t EFMSGCNT8:1;
      uint16_t EFMSGCNT9:1;
      uint16_t EFMSGCNT10:1;
      uint16_t EFMSGCNT11:1;
      uint16_t EFMSGCNT12:1;
      uint16_t EFMSGCNT13:1;
      uint16_t EFMSGCNT14:1;
      uint16_t EFMSGCNT15:1;
    };
  };
} C2BDIAG1LBITS;
extern volatile C2BDIAG1LBITS C2BDIAG1Lbits __attribute__((__sfr__));


extern volatile uint16_t C2BDIAG1H __attribute__((__sfr__));
typedef struct tagC2BDIAG1HBITS {
  uint16_t NBIT0ERR:1;
  uint16_t NBIT1ERR:1;
  uint16_t NACKERR:1;
  uint16_t NFORMERR:1;
  uint16_t NSTUFERR:1;
  uint16_t NCRCERR:1;
  uint16_t :1;
  uint16_t TXBOERR:1;
  uint16_t DBIT0ERR:1;
  uint16_t DBIT1ERR:1;
  uint16_t :1;
  uint16_t DFORMERR:1;
  uint16_t DSTUFERR:1;
  uint16_t DCRCERR:1;
  uint16_t ESI:1;
  uint16_t DLCMM:1;
} C2BDIAG1HBITS;
extern volatile C2BDIAG1HBITS C2BDIAG1Hbits __attribute__((__sfr__));


extern volatile uint16_t C2TEFCONL __attribute__((__sfr__));
typedef struct tagC2TEFCONLBITS {
  uint16_t TEFNEIE:1;
  uint16_t TEFHIE:1;
  uint16_t TEFFIE:1;
  uint16_t TEFOVIE:1;
  uint16_t :1;
  uint16_t TEFTSEN:1;
  uint16_t :2;
  uint16_t UINC:1;
  uint16_t :1;
  uint16_t FRESET:1;
} C2TEFCONLBITS;
extern volatile C2TEFCONLBITS C2TEFCONLbits __attribute__((__sfr__));


extern volatile uint16_t C2TEFCONH __attribute__((__sfr__));
__extension__ typedef struct tagC2TEFCONHBITS {
  union {
    struct {
      uint16_t :8;
      uint16_t FSIZE:5;
    };
    struct {
      uint16_t :8;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
    };
  };
} C2TEFCONHBITS;
extern volatile C2TEFCONHBITS C2TEFCONHbits __attribute__((__sfr__));


extern volatile uint16_t C2TEFSTA __attribute__((__sfr__));
typedef struct tagC2TEFSTABITS {
  uint16_t TEFNEIF:1;
  uint16_t TEFHIF:1;
  uint16_t TEFFIF:1;
  uint16_t TEFOVIF:1;
} C2TEFSTABITS;
extern volatile C2TEFSTABITS C2TEFSTAbits __attribute__((__sfr__));


extern volatile uint16_t C2TEFUAL __attribute__((__sfr__));
__extension__ typedef struct tagC2TEFUALBITS {
  union {
    struct {
      uint16_t TEFUA:16;
    };
    struct {
      uint16_t TEFUA0:1;
      uint16_t TEFUA1:1;
      uint16_t TEFUA2:1;
      uint16_t TEFUA3:1;
      uint16_t TEFUA4:1;
      uint16_t TEFUA5:1;
      uint16_t TEFUA6:1;
      uint16_t TEFUA7:1;
      uint16_t TEFUA8:1;
      uint16_t TEFUA9:1;
      uint16_t TEFUA10:1;
      uint16_t TEFUA11:1;
      uint16_t TEFUA12:1;
      uint16_t TEFUA13:1;
      uint16_t TEFUA14:1;
      uint16_t TEFUA15:1;
    };
  };
} C2TEFUALBITS;
extern volatile C2TEFUALBITS C2TEFUALbits __attribute__((__sfr__));


extern volatile uint16_t C2TEFUAH __attribute__((__sfr__));
__extension__ typedef struct tagC2TEFUAHBITS {
  union {
    struct {
      uint16_t TEFUA:16;
    };
    struct {
      uint16_t TEFUA16:1;
      uint16_t TEFUA17:1;
      uint16_t TEFUA18:1;
      uint16_t TEFUA19:1;
      uint16_t TEFUA20:1;
      uint16_t TEFUA21:1;
      uint16_t TEFUA22:1;
      uint16_t TEFUA23:1;
      uint16_t TEFUA24:1;
      uint16_t TEFUA25:1;
      uint16_t TEFUA26:1;
      uint16_t TEFUA27:1;
      uint16_t TEFUA28:1;
      uint16_t TEFUA29:1;
      uint16_t TEFUA30:1;
      uint16_t TEFUA31:1;
    };
  };
} C2TEFUAHBITS;
extern volatile C2TEFUAHBITS C2TEFUAHbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOBAL __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOBALBITS {
  union {
    struct {
      uint16_t FIFOBA:16;
    };
    struct {
      uint16_t FIFOBA0:1;
      uint16_t FIFOBA1:1;
      uint16_t FIFOBA2:1;
      uint16_t FIFOBA3:1;
      uint16_t FIFOBA4:1;
      uint16_t FIFOBA5:1;
      uint16_t FIFOBA6:1;
      uint16_t FIFOBA7:1;
      uint16_t FIFOBA8:1;
      uint16_t FIFOBA9:1;
      uint16_t FIFOBA10:1;
      uint16_t FIFOBA11:1;
      uint16_t FIFOBA12:1;
      uint16_t FIFOBA13:1;
      uint16_t FIFOBA14:1;
      uint16_t FIFOBA15:1;
    };
  };
} C2FIFOBALBITS;
extern volatile C2FIFOBALBITS C2FIFOBALbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOBAH __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOBAHBITS {
  union {
    struct {
      uint16_t FIFOBA:16;
    };
    struct {
      uint16_t FIFOBA16:1;
      uint16_t FIFOBA17:1;
      uint16_t FIFOBA18:1;
      uint16_t FIFOBA19:1;
      uint16_t FIFOBA20:1;
      uint16_t FIFOBA21:1;
      uint16_t FIFOBA22:1;
      uint16_t FIFOBA23:1;
      uint16_t FIFOBA24:1;
      uint16_t FIFOBA25:1;
      uint16_t FIFOBA26:1;
      uint16_t FIFOBA27:1;
      uint16_t FIFOBA28:1;
      uint16_t FIFOBA29:1;
      uint16_t FIFOBA30:1;
      uint16_t FIFOBA31:1;
    };
  };
} C2FIFOBAHBITS;
extern volatile C2FIFOBAHBITS C2FIFOBAHbits __attribute__((__sfr__));


extern volatile uint16_t C2TXQCONL __attribute__((__sfr__));
typedef struct tagC2TXQCONLBITS {
  uint16_t TXQNIE:1;
  uint16_t :1;
  uint16_t TXQEIE:1;
  uint16_t :1;
  uint16_t TXATIE:1;
  uint16_t :2;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C2TXQCONLBITS;
extern volatile C2TXQCONLBITS C2TXQCONLbits __attribute__((__sfr__));


extern volatile uint16_t C2TXQCONH __attribute__((__sfr__));
__extension__ typedef struct tagC2TXQCONHBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C2TXQCONHBITS;
extern volatile C2TXQCONHBITS C2TXQCONHbits __attribute__((__sfr__));


extern volatile uint16_t C2TXQSTA __attribute__((__sfr__));
__extension__ typedef struct tagC2TXQSTABITS {
  union {
    struct {
      uint16_t TXQNIF:1;
      uint16_t :1;
      uint16_t TXQEIF:1;
      uint16_t :1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t TXQCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t TXQCI0:1;
      uint16_t TXQCI1:1;
      uint16_t TXQCI2:1;
      uint16_t TXQCI3:1;
      uint16_t TXQCI4:1;
    };
  };
} C2TXQSTABITS;
extern volatile C2TXQSTABITS C2TXQSTAbits __attribute__((__sfr__));


extern volatile uint16_t C2TXQUAL __attribute__((__sfr__));
__extension__ typedef struct tagC2TXQUALBITS {
  union {
    struct {
      uint16_t TXQUA:16;
    };
    struct {
      uint16_t TXQUA0:1;
      uint16_t TXQUA1:1;
      uint16_t TXQUA2:1;
      uint16_t TXQUA3:1;
      uint16_t TXQUA4:1;
      uint16_t TXQUA5:1;
      uint16_t TXQUA6:1;
      uint16_t TXQUA7:1;
      uint16_t TXQUA8:1;
      uint16_t TXQUA9:1;
      uint16_t TXQUA10:1;
      uint16_t TXQUA11:1;
      uint16_t TXQUA12:1;
      uint16_t TXQUA13:1;
      uint16_t TXQUA14:1;
      uint16_t TXQUA15:1;
    };
  };
} C2TXQUALBITS;
extern volatile C2TXQUALBITS C2TXQUALbits __attribute__((__sfr__));


extern volatile uint16_t C2TXQUAH __attribute__((__sfr__));
__extension__ typedef struct tagC2TXQUAHBITS {
  union {
    struct {
      uint16_t TXQUA:16;
    };
    struct {
      uint16_t TXQUA16:1;
      uint16_t TXQUA17:1;
      uint16_t TXQUA18:1;
      uint16_t TXQUA19:1;
      uint16_t TXQUA20:1;
      uint16_t TXQUA21:1;
      uint16_t TXQUA22:1;
      uint16_t TXQUA23:1;
      uint16_t TXQUA24:1;
      uint16_t TXQUA25:1;
      uint16_t TXQUA26:1;
      uint16_t TXQUA27:1;
      uint16_t TXQUA28:1;
      uint16_t TXQUA29:1;
      uint16_t TXQUA30:1;
      uint16_t TXQUA31:1;
    };
  };
} C2TXQUAHBITS;
extern volatile C2TXQUAHBITS C2TXQUAHbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON1L __attribute__((__sfr__));
typedef struct tagC2FIFOCON1LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C2FIFOCON1LBITS;
extern volatile C2FIFOCON1LBITS C2FIFOCON1Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON1H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOCON1HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C2FIFOCON1HBITS;
extern volatile C2FIFOCON1HBITS C2FIFOCON1Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOSTA1 __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOSTA1BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C2FIFOSTA1BITS;
extern volatile C2FIFOSTA1BITS C2FIFOSTA1bits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA1L __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA1LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C2FIFOUA1LBITS;
extern volatile C2FIFOUA1LBITS C2FIFOUA1Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA1H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA1HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C2FIFOUA1HBITS;
extern volatile C2FIFOUA1HBITS C2FIFOUA1Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON2L __attribute__((__sfr__));
typedef struct tagC2FIFOCON2LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C2FIFOCON2LBITS;
extern volatile C2FIFOCON2LBITS C2FIFOCON2Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON2H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOCON2HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C2FIFOCON2HBITS;
extern volatile C2FIFOCON2HBITS C2FIFOCON2Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOSTA2 __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOSTA2BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C2FIFOSTA2BITS;
extern volatile C2FIFOSTA2BITS C2FIFOSTA2bits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA2L __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA2LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C2FIFOUA2LBITS;
extern volatile C2FIFOUA2LBITS C2FIFOUA2Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA2H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA2HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C2FIFOUA2HBITS;
extern volatile C2FIFOUA2HBITS C2FIFOUA2Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON3L __attribute__((__sfr__));
typedef struct tagC2FIFOCON3LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C2FIFOCON3LBITS;
extern volatile C2FIFOCON3LBITS C2FIFOCON3Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON3H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOCON3HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C2FIFOCON3HBITS;
extern volatile C2FIFOCON3HBITS C2FIFOCON3Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOSTA3 __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOSTA3BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C2FIFOSTA3BITS;
extern volatile C2FIFOSTA3BITS C2FIFOSTA3bits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA3L __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA3LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C2FIFOUA3LBITS;
extern volatile C2FIFOUA3LBITS C2FIFOUA3Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA3H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA3HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C2FIFOUA3HBITS;
extern volatile C2FIFOUA3HBITS C2FIFOUA3Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON4L __attribute__((__sfr__));
typedef struct tagC2FIFOCON4LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C2FIFOCON4LBITS;
extern volatile C2FIFOCON4LBITS C2FIFOCON4Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON4H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOCON4HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C2FIFOCON4HBITS;
extern volatile C2FIFOCON4HBITS C2FIFOCON4Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOSTA4 __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOSTA4BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C2FIFOSTA4BITS;
extern volatile C2FIFOSTA4BITS C2FIFOSTA4bits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA4L __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA4LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C2FIFOUA4LBITS;
extern volatile C2FIFOUA4LBITS C2FIFOUA4Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA4H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA4HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C2FIFOUA4HBITS;
extern volatile C2FIFOUA4HBITS C2FIFOUA4Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON5L __attribute__((__sfr__));
typedef struct tagC2FIFOCON5LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C2FIFOCON5LBITS;
extern volatile C2FIFOCON5LBITS C2FIFOCON5Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON5H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOCON5HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C2FIFOCON5HBITS;
extern volatile C2FIFOCON5HBITS C2FIFOCON5Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOSTA5 __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOSTA5BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C2FIFOSTA5BITS;
extern volatile C2FIFOSTA5BITS C2FIFOSTA5bits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA5L __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA5LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C2FIFOUA5LBITS;
extern volatile C2FIFOUA5LBITS C2FIFOUA5Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA5H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA5HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C2FIFOUA5HBITS;
extern volatile C2FIFOUA5HBITS C2FIFOUA5Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON6L __attribute__((__sfr__));
typedef struct tagC2FIFOCON6LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C2FIFOCON6LBITS;
extern volatile C2FIFOCON6LBITS C2FIFOCON6Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON6H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOCON6HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C2FIFOCON6HBITS;
extern volatile C2FIFOCON6HBITS C2FIFOCON6Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOSTA6 __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOSTA6BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C2FIFOSTA6BITS;
extern volatile C2FIFOSTA6BITS C2FIFOSTA6bits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA6L __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA6LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C2FIFOUA6LBITS;
extern volatile C2FIFOUA6LBITS C2FIFOUA6Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA6H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA6HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C2FIFOUA6HBITS;
extern volatile C2FIFOUA6HBITS C2FIFOUA6Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON7L __attribute__((__sfr__));
typedef struct tagC2FIFOCON7LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C2FIFOCON7LBITS;
extern volatile C2FIFOCON7LBITS C2FIFOCON7Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOCON7H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOCON7HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C2FIFOCON7HBITS;
extern volatile C2FIFOCON7HBITS C2FIFOCON7Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOSTA7 __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOSTA7BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C2FIFOSTA7BITS;
extern volatile C2FIFOSTA7BITS C2FIFOSTA7bits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA7L __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA7LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C2FIFOUA7LBITS;
extern volatile C2FIFOUA7LBITS C2FIFOUA7Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FIFOUA7H __attribute__((__sfr__));
__extension__ typedef struct tagC2FIFOUA7HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C2FIFOUA7HBITS;
extern volatile C2FIFOUA7HBITS C2FIFOUA7Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTCON0L __attribute__((__sfr__));
typedef struct tagC2FLTCON0LBITS {
  uint16_t F0BP:5;
  uint16_t :2;
  uint16_t FLTEN0:1;
  uint16_t F1BP:5;
  uint16_t :2;
  uint16_t FLTEN1:1;
} C2FLTCON0LBITS;
extern volatile C2FLTCON0LBITS C2FLTCON0Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTCON0H __attribute__((__sfr__));
typedef struct tagC2FLTCON0HBITS {
  uint16_t F2BP:5;
  uint16_t :2;
  uint16_t FLTEN2:1;
  uint16_t F3BP:5;
  uint16_t :2;
  uint16_t FLTEN3:1;
} C2FLTCON0HBITS;
extern volatile C2FLTCON0HBITS C2FLTCON0Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTCON1L __attribute__((__sfr__));
typedef struct tagC2FLTCON1LBITS {
  uint16_t F4BP:5;
  uint16_t :2;
  uint16_t FLTEN4:1;
  uint16_t F5BP:5;
  uint16_t :2;
  uint16_t FLTEN5:1;
} C2FLTCON1LBITS;
extern volatile C2FLTCON1LBITS C2FLTCON1Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTCON1H __attribute__((__sfr__));
typedef struct tagC2FLTCON1HBITS {
  uint16_t F6BP:5;
  uint16_t :2;
  uint16_t FLTEN6:1;
  uint16_t F7BP:5;
  uint16_t :2;
  uint16_t FLTEN7:1;
} C2FLTCON1HBITS;
extern volatile C2FLTCON1HBITS C2FLTCON1Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTCON2L __attribute__((__sfr__));
typedef struct tagC2FLTCON2LBITS {
  uint16_t F8BP:5;
  uint16_t :2;
  uint16_t FLTEN8:1;
  uint16_t F9BP:5;
  uint16_t :2;
  uint16_t FLTEN9:1;
} C2FLTCON2LBITS;
extern volatile C2FLTCON2LBITS C2FLTCON2Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTCON2H __attribute__((__sfr__));
typedef struct tagC2FLTCON2HBITS {
  uint16_t F10BP:5;
  uint16_t :2;
  uint16_t FLTEN10:1;
  uint16_t F11BP:5;
  uint16_t :2;
  uint16_t FLTEN11:1;
} C2FLTCON2HBITS;
extern volatile C2FLTCON2HBITS C2FLTCON2Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTCON3L __attribute__((__sfr__));
typedef struct tagC2FLTCON3LBITS {
  uint16_t F12BP:5;
  uint16_t :2;
  uint16_t FLTEN12:1;
  uint16_t F13BP:5;
  uint16_t :2;
  uint16_t FLTEN13:1;
} C2FLTCON3LBITS;
extern volatile C2FLTCON3LBITS C2FLTCON3Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTCON3H __attribute__((__sfr__));
typedef struct tagC2FLTCON3HBITS {
  uint16_t F14BP:5;
  uint16_t :2;
  uint16_t FLTEN14:1;
  uint16_t F15BP:5;
  uint16_t :2;
  uint16_t FLTEN15:1;
} C2FLTCON3HBITS;
extern volatile C2FLTCON3HBITS C2FLTCON3Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ0L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ0LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ0LBITS;
extern volatile C2FLTOBJ0LBITS C2FLTOBJ0Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ0H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ0HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ0HBITS;
extern volatile C2FLTOBJ0HBITS C2FLTOBJ0Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK0L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK0LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK0LBITS;
extern volatile C2MASK0LBITS C2MASK0Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK0H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK0HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK0HBITS;
extern volatile C2MASK0HBITS C2MASK0Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ1L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ1LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ1LBITS;
extern volatile C2FLTOBJ1LBITS C2FLTOBJ1Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ1H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ1HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ1HBITS;
extern volatile C2FLTOBJ1HBITS C2FLTOBJ1Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK1L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK1LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK1LBITS;
extern volatile C2MASK1LBITS C2MASK1Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK1H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK1HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK1HBITS;
extern volatile C2MASK1HBITS C2MASK1Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ2L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ2LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ2LBITS;
extern volatile C2FLTOBJ2LBITS C2FLTOBJ2Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ2H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ2HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ2HBITS;
extern volatile C2FLTOBJ2HBITS C2FLTOBJ2Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK2L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK2LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK2LBITS;
extern volatile C2MASK2LBITS C2MASK2Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK2H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK2HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK2HBITS;
extern volatile C2MASK2HBITS C2MASK2Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ3L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ3LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ3LBITS;
extern volatile C2FLTOBJ3LBITS C2FLTOBJ3Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ3H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ3HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ3HBITS;
extern volatile C2FLTOBJ3HBITS C2FLTOBJ3Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK3L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK3LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK3LBITS;
extern volatile C2MASK3LBITS C2MASK3Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK3H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK3HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK3HBITS;
extern volatile C2MASK3HBITS C2MASK3Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ4L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ4LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ4LBITS;
extern volatile C2FLTOBJ4LBITS C2FLTOBJ4Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ4H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ4HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ4HBITS;
extern volatile C2FLTOBJ4HBITS C2FLTOBJ4Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK4L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK4LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK4LBITS;
extern volatile C2MASK4LBITS C2MASK4Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK4H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK4HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK4HBITS;
extern volatile C2MASK4HBITS C2MASK4Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ5L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ5LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ5LBITS;
extern volatile C2FLTOBJ5LBITS C2FLTOBJ5Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ5H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ5HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ5HBITS;
extern volatile C2FLTOBJ5HBITS C2FLTOBJ5Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK5L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK5LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK5LBITS;
extern volatile C2MASK5LBITS C2MASK5Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK5H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK5HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK5HBITS;
extern volatile C2MASK5HBITS C2MASK5Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ6L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ6LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ6LBITS;
extern volatile C2FLTOBJ6LBITS C2FLTOBJ6Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ6H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ6HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ6HBITS;
extern volatile C2FLTOBJ6HBITS C2FLTOBJ6Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK6L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK6LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK6LBITS;
extern volatile C2MASK6LBITS C2MASK6Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK6H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK6HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK6HBITS;
extern volatile C2MASK6HBITS C2MASK6Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ7L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ7LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ7LBITS;
extern volatile C2FLTOBJ7LBITS C2FLTOBJ7Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ7H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ7HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ7HBITS;
extern volatile C2FLTOBJ7HBITS C2FLTOBJ7Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK7L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK7LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK7LBITS;
extern volatile C2MASK7LBITS C2MASK7Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK7H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK7HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK7HBITS;
extern volatile C2MASK7HBITS C2MASK7Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ8L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ8LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ8LBITS;
extern volatile C2FLTOBJ8LBITS C2FLTOBJ8Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ8H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ8HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ8HBITS;
extern volatile C2FLTOBJ8HBITS C2FLTOBJ8Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK8L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK8LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK8LBITS;
extern volatile C2MASK8LBITS C2MASK8Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK8H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK8HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK8HBITS;
extern volatile C2MASK8HBITS C2MASK8Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ9L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ9LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ9LBITS;
extern volatile C2FLTOBJ9LBITS C2FLTOBJ9Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ9H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ9HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ9HBITS;
extern volatile C2FLTOBJ9HBITS C2FLTOBJ9Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK9L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK9LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK9LBITS;
extern volatile C2MASK9LBITS C2MASK9Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK9H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK9HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK9HBITS;
extern volatile C2MASK9HBITS C2MASK9Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ10L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ10LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ10LBITS;
extern volatile C2FLTOBJ10LBITS C2FLTOBJ10Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ10H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ10HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ10HBITS;
extern volatile C2FLTOBJ10HBITS C2FLTOBJ10Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK10L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK10LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK10LBITS;
extern volatile C2MASK10LBITS C2MASK10Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK10H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK10HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK10HBITS;
extern volatile C2MASK10HBITS C2MASK10Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ11L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ11LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ11LBITS;
extern volatile C2FLTOBJ11LBITS C2FLTOBJ11Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ11H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ11HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ11HBITS;
extern volatile C2FLTOBJ11HBITS C2FLTOBJ11Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK11L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK11LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK11LBITS;
extern volatile C2MASK11LBITS C2MASK11Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK11H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK11HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK11HBITS;
extern volatile C2MASK11HBITS C2MASK11Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ12L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ12LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ12LBITS;
extern volatile C2FLTOBJ12LBITS C2FLTOBJ12Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ12H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ12HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ12HBITS;
extern volatile C2FLTOBJ12HBITS C2FLTOBJ12Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK12L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK12LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK12LBITS;
extern volatile C2MASK12LBITS C2MASK12Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK12H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK12HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK12HBITS;
extern volatile C2MASK12HBITS C2MASK12Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ13L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ13LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ13LBITS;
extern volatile C2FLTOBJ13LBITS C2FLTOBJ13Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ13H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ13HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ13HBITS;
extern volatile C2FLTOBJ13HBITS C2FLTOBJ13Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK13L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK13LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK13LBITS;
extern volatile C2MASK13LBITS C2MASK13Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK13H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK13HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK13HBITS;
extern volatile C2MASK13HBITS C2MASK13Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ14L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ14LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ14LBITS;
extern volatile C2FLTOBJ14LBITS C2FLTOBJ14Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ14H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ14HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ14HBITS;
extern volatile C2FLTOBJ14HBITS C2FLTOBJ14Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK14L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK14LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK14LBITS;
extern volatile C2MASK14LBITS C2MASK14Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK14H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK14HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK14HBITS;
extern volatile C2MASK14HBITS C2MASK14Hbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ15L __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ15LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C2FLTOBJ15LBITS;
extern volatile C2FLTOBJ15LBITS C2FLTOBJ15Lbits __attribute__((__sfr__));


extern volatile uint16_t C2FLTOBJ15H __attribute__((__sfr__));
__extension__ typedef struct tagC2FLTOBJ15HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C2FLTOBJ15HBITS;
extern volatile C2FLTOBJ15HBITS C2FLTOBJ15Hbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK15L __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK15LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C2MASK15LBITS;
extern volatile C2MASK15LBITS C2MASK15Lbits __attribute__((__sfr__));


extern volatile uint16_t C2MASK15H __attribute__((__sfr__));
__extension__ typedef struct tagC2MASK15HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C2MASK15HBITS;
extern volatile C2MASK15HBITS C2MASK15Hbits __attribute__((__sfr__));


extern volatile uint16_t FEPDBGL __attribute__((__sfr__));

extern volatile uint16_t C1CONL __attribute__((__sfr__));
__extension__ typedef struct tagC1CONLBITS {
  union {
    struct {
      uint16_t DNCNT:5;
      uint16_t ISOCRCEN:1;
      uint16_t PXEDIS:1;
      uint16_t CLKSEL:1;
      uint16_t WAKFIL:1;
      uint16_t WFT:2;
      uint16_t BUSY:1;
      uint16_t BRSDIS:1;
      uint16_t SIDL:1;
      uint16_t :1;
      uint16_t CON:1;
    };
    struct {
      uint16_t DNCNT0:1;
      uint16_t DNCNT1:1;
      uint16_t DNCNT2:1;
      uint16_t DNCNT3:1;
      uint16_t DNCNT4:1;
      uint16_t :4;
      uint16_t WFT0:1;
      uint16_t WFT1:1;
    };
  };
} C1CONLBITS;
extern volatile C1CONLBITS C1CONLbits __attribute__((__sfr__));


extern volatile uint16_t C1CONH __attribute__((__sfr__));
__extension__ typedef struct tagC1CONHBITS {
  union {
    struct {
      uint16_t RTXAT:1;
      uint16_t ESIGM:1;
      uint16_t SERRLOM:1;
      uint16_t STEF:1;
      uint16_t TXQEN:1;
      uint16_t OPMOD:3;
      uint16_t REQOP:3;
      uint16_t ABAT:1;
      uint16_t TXBWS:4;
    };
    struct {
      uint16_t :5;
      uint16_t OPMOD0:1;
      uint16_t OPMOD1:1;
      uint16_t OPMOD2:1;
      uint16_t REQOP0:1;
      uint16_t REQOP1:1;
      uint16_t REQOP2:1;
      uint16_t :1;
      uint16_t TXBWS0:1;
      uint16_t TXBWS1:1;
      uint16_t TXBWS2:1;
      uint16_t TXBWS3:1;
    };
  };
} C1CONHBITS;
extern volatile C1CONHBITS C1CONHbits __attribute__((__sfr__));


extern volatile uint16_t C1NBTCFGL __attribute__((__sfr__));
__extension__ typedef struct tagC1NBTCFGLBITS {
  union {
    struct {
      uint16_t SJW:7;
      uint16_t :1;
      uint16_t TSEG2:7;
    };
    struct {
      uint16_t SJW0:1;
      uint16_t SJW1:1;
      uint16_t SJW2:1;
      uint16_t SJW3:1;
      uint16_t SJW4:1;
      uint16_t SJW5:1;
      uint16_t SJW6:1;
      uint16_t :1;
      uint16_t TSEG20:1;
      uint16_t TSEG21:1;
      uint16_t TSEG22:1;
      uint16_t TSEG23:1;
      uint16_t TSEG24:1;
      uint16_t TSEG25:1;
      uint16_t TSEG26:1;
    };
  };
} C1NBTCFGLBITS;
extern volatile C1NBTCFGLBITS C1NBTCFGLbits __attribute__((__sfr__));


extern volatile uint16_t C1NBTCFGH __attribute__((__sfr__));
__extension__ typedef struct tagC1NBTCFGHBITS {
  union {
    struct {
      uint16_t TSEG1:8;
      uint16_t BRP:8;
    };
    struct {
      uint16_t TSEG10:1;
      uint16_t TSEG11:1;
      uint16_t TSEG12:1;
      uint16_t TSEG13:1;
      uint16_t TSEG14:1;
      uint16_t TSEG15:1;
      uint16_t TSEG16:1;
      uint16_t TSEG17:1;
      uint16_t BRP0:1;
      uint16_t BRP1:1;
      uint16_t BRP2:1;
      uint16_t BRP3:1;
      uint16_t BRP4:1;
      uint16_t BRP5:1;
      uint16_t BRP6:1;
      uint16_t BRP7:1;
    };
  };
} C1NBTCFGHBITS;
extern volatile C1NBTCFGHBITS C1NBTCFGHbits __attribute__((__sfr__));


extern volatile uint16_t C1DBTCFGL __attribute__((__sfr__));
__extension__ typedef struct tagC1DBTCFGLBITS {
  union {
    struct {
      uint16_t SJW:4;
      uint16_t :4;
      uint16_t TSEG2:4;
    };
    struct {
      uint16_t SJW0:1;
      uint16_t SJW1:1;
      uint16_t SJW2:1;
      uint16_t SJW3:1;
      uint16_t :4;
      uint16_t TSEG20:1;
      uint16_t TSEG21:1;
      uint16_t TSEG22:1;
      uint16_t TSEG23:1;
    };
  };
} C1DBTCFGLBITS;
extern volatile C1DBTCFGLBITS C1DBTCFGLbits __attribute__((__sfr__));


extern volatile uint16_t C1DBTCFGH __attribute__((__sfr__));
__extension__ typedef struct tagC1DBTCFGHBITS {
  union {
    struct {
      uint16_t TSEG1:5;
      uint16_t :3;
      uint16_t BRP:8;
    };
    struct {
      uint16_t TSEG10:1;
      uint16_t TSEG11:1;
      uint16_t TSEG12:1;
      uint16_t TSEG13:1;
      uint16_t TSEG14:1;
      uint16_t :3;
      uint16_t BRP0:1;
      uint16_t BRP1:1;
      uint16_t BRP2:1;
      uint16_t BRP3:1;
      uint16_t BRP4:1;
      uint16_t BRP5:1;
      uint16_t BRP6:1;
      uint16_t BRP7:1;
    };
  };
} C1DBTCFGHBITS;
extern volatile C1DBTCFGHBITS C1DBTCFGHbits __attribute__((__sfr__));


extern volatile uint16_t C1TDCL __attribute__((__sfr__));
__extension__ typedef struct tagC1TDCLBITS {
  union {
    struct {
      uint16_t TDCV:6;
      uint16_t :2;
      uint16_t TDCO:7;
    };
    struct {
      uint16_t TDCV0:1;
      uint16_t TDCV1:1;
      uint16_t TDCV2:1;
      uint16_t TDCV3:1;
      uint16_t TDCV4:1;
      uint16_t TDCV5:1;
      uint16_t :2;
      uint16_t TDCO0:1;
      uint16_t TDCO1:1;
      uint16_t TDCO2:1;
      uint16_t TDCO3:1;
      uint16_t TDCO4:1;
      uint16_t TDCO5:1;
      uint16_t TDCO6:1;
    };
  };
} C1TDCLBITS;
extern volatile C1TDCLBITS C1TDCLbits __attribute__((__sfr__));


extern volatile uint16_t C1TDCH __attribute__((__sfr__));
__extension__ typedef struct tagC1TDCHBITS {
  union {
    struct {
      uint16_t TDCMOD:2;
      uint16_t :6;
      uint16_t SID11EN:1;
      uint16_t EDGFLTEN:1;
    };
    struct {
      uint16_t TDCMOD0:1;
      uint16_t TDCMOD1:1;
    };
  };
} C1TDCHBITS;
extern volatile C1TDCHBITS C1TDCHbits __attribute__((__sfr__));


extern volatile uint16_t C1TBCL __attribute__((__sfr__));
__extension__ typedef struct tagC1TBCLBITS {
  union {
    struct {
      uint16_t TBC:16;
    };
    struct {
      uint16_t TBC0:1;
      uint16_t TBC1:1;
      uint16_t TBC2:1;
      uint16_t TBC3:1;
      uint16_t TBC4:1;
      uint16_t TBC5:1;
      uint16_t TBC6:1;
      uint16_t TBC7:1;
      uint16_t TBC8:1;
      uint16_t TBC9:1;
      uint16_t TBC10:1;
      uint16_t TBC11:1;
      uint16_t TBC12:1;
      uint16_t TBC13:1;
      uint16_t TBC14:1;
      uint16_t TBC15:1;
    };
  };
} C1TBCLBITS;
extern volatile C1TBCLBITS C1TBCLbits __attribute__((__sfr__));


extern volatile uint16_t C1TBCH __attribute__((__sfr__));
__extension__ typedef struct tagC1TBCHBITS {
  union {
    struct {
      uint16_t TBC:16;
    };
    struct {
      uint16_t TBC16:1;
      uint16_t TBC17:1;
      uint16_t TBC18:1;
      uint16_t TBC19:1;
      uint16_t TBC20:1;
      uint16_t TBC21:1;
      uint16_t TBC22:1;
      uint16_t TBC23:1;
      uint16_t TBC24:1;
      uint16_t TBC25:1;
      uint16_t TBC26:1;
      uint16_t TBC27:1;
      uint16_t TBC28:1;
      uint16_t TBC29:1;
      uint16_t TBC30:1;
      uint16_t TBC31:1;
    };
  };
} C1TBCHBITS;
extern volatile C1TBCHBITS C1TBCHbits __attribute__((__sfr__));


extern volatile uint16_t C1TSCONL __attribute__((__sfr__));
__extension__ typedef struct tagC1TSCONLBITS {
  union {
    struct {
      uint16_t TBCPRE:10;
    };
    struct {
      uint16_t TBCPRE0:1;
      uint16_t TBCPRE1:1;
      uint16_t TBCPRE2:1;
      uint16_t TBCPRE3:1;
      uint16_t TBCPRE4:1;
      uint16_t TBCPRE5:1;
      uint16_t TBCPRE6:1;
      uint16_t TBCPRE7:1;
      uint16_t TBCPRE8:1;
      uint16_t TBCPRE9:1;
    };
  };
} C1TSCONLBITS;
extern volatile C1TSCONLBITS C1TSCONLbits __attribute__((__sfr__));


extern volatile uint16_t C1TSCONH __attribute__((__sfr__));
typedef struct tagC1TSCONHBITS {
  uint16_t TBCEN:1;
  uint16_t TSEOF:1;
  uint16_t TSRES:1;
} C1TSCONHBITS;
extern volatile C1TSCONHBITS C1TSCONHbits __attribute__((__sfr__));


extern volatile uint16_t C1VECL __attribute__((__sfr__));
__extension__ typedef struct tagC1VECLBITS {
  union {
    struct {
      uint16_t ICODE:7;
      uint16_t :1;
      uint16_t FILHIT:5;
    };
    struct {
      uint16_t ICODE0:1;
      uint16_t ICODE1:1;
      uint16_t ICODE2:1;
      uint16_t ICODE3:1;
      uint16_t ICODE4:1;
      uint16_t ICODE5:1;
      uint16_t ICODE6:1;
      uint16_t :1;
      uint16_t FILHIT0:1;
      uint16_t FILHIT1:1;
      uint16_t FILHIT2:1;
      uint16_t FILHIT3:1;
      uint16_t FILHIT4:1;
    };
  };
} C1VECLBITS;
extern volatile C1VECLBITS C1VECLbits __attribute__((__sfr__));


extern volatile uint16_t C1VECH __attribute__((__sfr__));
__extension__ typedef struct tagC1VECHBITS {
  union {
    struct {
      uint16_t TXCODE:7;
      uint16_t :1;
      uint16_t RXCODE:7;
    };
    struct {
      uint16_t TXCODE0:1;
      uint16_t TXCODE1:1;
      uint16_t TXCODE2:1;
      uint16_t TXCODE3:1;
      uint16_t TXCODE4:1;
      uint16_t TXCODE5:1;
      uint16_t TXCODE6:1;
      uint16_t :1;
      uint16_t RXCODE0:1;
      uint16_t RXCODE1:1;
      uint16_t RXCODE2:1;
      uint16_t RXCODE3:1;
      uint16_t RXCODE4:1;
      uint16_t RXCODE5:1;
      uint16_t RXCODE6:1;
    };
  };
} C1VECHBITS;
extern volatile C1VECHBITS C1VECHbits __attribute__((__sfr__));


extern volatile uint16_t C1INTL __attribute__((__sfr__));
typedef struct tagC1INTLBITS {
  uint16_t TXIF:1;
  uint16_t RXIF:1;
  uint16_t TBCIF:1;
  uint16_t MODIF:1;
  uint16_t TEFIF:1;
  uint16_t :5;
  uint16_t TXATIF:1;
  uint16_t RXOVIF:1;
  uint16_t SERRIF:1;
  uint16_t CERRIF:1;
  uint16_t WAKIF:1;
  uint16_t IVMIF:1;
} C1INTLBITS;
extern volatile C1INTLBITS C1INTLbits __attribute__((__sfr__));


extern volatile uint16_t C1INTH __attribute__((__sfr__));
typedef struct tagC1INTHBITS {
  uint16_t TXIE:1;
  uint16_t RXIE:1;
  uint16_t TBCIE:1;
  uint16_t MODIE:1;
  uint16_t TEFIE:1;
  uint16_t :5;
  uint16_t TXATIE:1;
  uint16_t RXOVIE:1;
  uint16_t SERRIE:1;
  uint16_t CERRIE:1;
  uint16_t WAKIE:1;
  uint16_t IVMIE:1;
} C1INTHBITS;
extern volatile C1INTHBITS C1INTHbits __attribute__((__sfr__));


extern volatile uint16_t C1RXIFL __attribute__((__sfr__));
__extension__ typedef struct tagC1RXIFLBITS {
  union {
    struct {
      uint16_t :1;
      uint16_t RFIF:15;
    };
    struct {
      uint16_t :1;
      uint16_t RFIF1:1;
      uint16_t RFIF2:1;
      uint16_t RFIF3:1;
      uint16_t RFIF4:1;
      uint16_t RFIF5:1;
      uint16_t RFIF6:1;
      uint16_t RFIF7:1;
      uint16_t RFIF8:1;
      uint16_t RFIF9:1;
      uint16_t RFIF10:1;
      uint16_t RFIF11:1;
      uint16_t RFIF12:1;
      uint16_t RFIF13:1;
      uint16_t RFIF14:1;
      uint16_t RFIF15:1;
    };
  };
} C1RXIFLBITS;
extern volatile C1RXIFLBITS C1RXIFLbits __attribute__((__sfr__));


extern volatile uint16_t C1RXIFH __attribute__((__sfr__));
__extension__ typedef struct tagC1RXIFHBITS {
  union {
    struct {
      uint16_t RFIF:16;
    };
    struct {
      uint16_t RFIF16:1;
      uint16_t RFIF17:1;
      uint16_t RFIF18:1;
      uint16_t RFIF19:1;
      uint16_t RFIF20:1;
      uint16_t RFIF21:1;
      uint16_t RFIF22:1;
      uint16_t RFIF23:1;
      uint16_t RFIF24:1;
      uint16_t RFIF25:1;
      uint16_t RFIF26:1;
      uint16_t RFIF27:1;
      uint16_t RFIF28:1;
      uint16_t RFIF29:1;
      uint16_t RFIF30:1;
      uint16_t RFIF31:1;
    };
  };
} C1RXIFHBITS;
extern volatile C1RXIFHBITS C1RXIFHbits __attribute__((__sfr__));


extern volatile uint16_t C1TXIFL __attribute__((__sfr__));
__extension__ typedef struct tagC1TXIFLBITS {
  union {
    struct {
      uint16_t TFIF:16;
    };
    struct {
      uint16_t TFIF0:1;
      uint16_t TFIF1:1;
      uint16_t TFIF2:1;
      uint16_t TFIF3:1;
      uint16_t TFIF4:1;
      uint16_t TFIF5:1;
      uint16_t TFIF6:1;
      uint16_t TFIF7:1;
      uint16_t TFIF8:1;
      uint16_t TFIF9:1;
      uint16_t TFIF10:1;
      uint16_t TFIF11:1;
      uint16_t TFIF12:1;
      uint16_t TFIF13:1;
      uint16_t TFIF14:1;
      uint16_t TFIF15:1;
    };
  };
} C1TXIFLBITS;
extern volatile C1TXIFLBITS C1TXIFLbits __attribute__((__sfr__));


extern volatile uint16_t C1TXIFH __attribute__((__sfr__));
__extension__ typedef struct tagC1TXIFHBITS {
  union {
    struct {
      uint16_t TFIF:16;
    };
    struct {
      uint16_t TFIF16:1;
      uint16_t TFIF17:1;
      uint16_t TFIF18:1;
      uint16_t TFIF19:1;
      uint16_t TFIF20:1;
      uint16_t TFIF21:1;
      uint16_t TFIF22:1;
      uint16_t TFIF23:1;
      uint16_t TFIF24:1;
      uint16_t TFIF25:1;
      uint16_t TFIF26:1;
      uint16_t TFIF27:1;
      uint16_t TFIF28:1;
      uint16_t TFIF29:1;
      uint16_t TFIF30:1;
      uint16_t TFIF31:1;
    };
  };
} C1TXIFHBITS;
extern volatile C1TXIFHBITS C1TXIFHbits __attribute__((__sfr__));


extern volatile uint16_t C1RXOVIFL __attribute__((__sfr__));
__extension__ typedef struct tagC1RXOVIFLBITS {
  union {
    struct {
      uint16_t :1;
      uint16_t RFOVIF:15;
    };
    struct {
      uint16_t :1;
      uint16_t RFOVIF1:1;
      uint16_t RFOVIF2:1;
      uint16_t RFOVIF3:1;
      uint16_t RFOVIF4:1;
      uint16_t RFOVIF5:1;
      uint16_t RFOVIF6:1;
      uint16_t RFOVIF7:1;
      uint16_t RFOVIF8:1;
      uint16_t RFOVIF9:1;
      uint16_t RFOVIF10:1;
      uint16_t RFOVIF11:1;
      uint16_t RFOVIF12:1;
      uint16_t RFOVIF13:1;
      uint16_t RFOVIF14:1;
      uint16_t RFOVIF15:1;
    };
  };
} C1RXOVIFLBITS;
extern volatile C1RXOVIFLBITS C1RXOVIFLbits __attribute__((__sfr__));


extern volatile uint16_t C1RXOVIFH __attribute__((__sfr__));
__extension__ typedef struct tagC1RXOVIFHBITS {
  union {
    struct {
      uint16_t RFOVIF:16;
    };
    struct {
      uint16_t RFOVIF16:1;
      uint16_t RFOVIF17:1;
      uint16_t RFOVIF18:1;
      uint16_t RFOVIF19:1;
      uint16_t RFOVIF20:1;
      uint16_t RFOVIF21:1;
      uint16_t RFOVIF22:1;
      uint16_t RFOVIF23:1;
      uint16_t RFOVIF24:1;
      uint16_t RFOVIF25:1;
      uint16_t RFOVIF26:1;
      uint16_t RFOVIF27:1;
      uint16_t RFOVIF28:1;
      uint16_t RFOVIF29:1;
      uint16_t RFOVIF30:1;
      uint16_t RFOVIF31:1;
    };
  };
} C1RXOVIFHBITS;
extern volatile C1RXOVIFHBITS C1RXOVIFHbits __attribute__((__sfr__));


extern volatile uint16_t C1TXATIFL __attribute__((__sfr__));
__extension__ typedef struct tagC1TXATIFLBITS {
  union {
    struct {
      uint16_t TFATIF:16;
    };
    struct {
      uint16_t TFATIF0:1;
      uint16_t TFATIF1:1;
      uint16_t TFATIF2:1;
      uint16_t TFATIF3:1;
      uint16_t TFATIF4:1;
      uint16_t TFATIF5:1;
      uint16_t TFATIF6:1;
      uint16_t TFATIF7:1;
      uint16_t TFATIF8:1;
      uint16_t TFATIF9:1;
      uint16_t TFATIF10:1;
      uint16_t TFATIF11:1;
      uint16_t TFATIF12:1;
      uint16_t TFATIF13:1;
      uint16_t TFATIF14:1;
      uint16_t TFATIF15:1;
    };
  };
} C1TXATIFLBITS;
extern volatile C1TXATIFLBITS C1TXATIFLbits __attribute__((__sfr__));


extern volatile uint16_t C1TXATIFH __attribute__((__sfr__));
__extension__ typedef struct tagC1TXATIFHBITS {
  union {
    struct {
      uint16_t TFATIF:16;
    };
    struct {
      uint16_t TFATIF16:1;
      uint16_t TFATIF17:1;
      uint16_t TFATIF18:1;
      uint16_t TFATIF19:1;
      uint16_t TFATIF20:1;
      uint16_t TFATIF21:1;
      uint16_t TFATIF22:1;
      uint16_t TFATIF23:1;
      uint16_t TFATIF24:1;
      uint16_t TFATIF25:1;
      uint16_t TFATIF26:1;
      uint16_t TFATIF27:1;
      uint16_t TFATIF28:1;
      uint16_t TFATIF29:1;
      uint16_t TFATIF30:1;
      uint16_t TFATIF31:1;
    };
  };
} C1TXATIFHBITS;
extern volatile C1TXATIFHBITS C1TXATIFHbits __attribute__((__sfr__));


extern volatile uint16_t C1TXREQL __attribute__((__sfr__));
__extension__ typedef struct tagC1TXREQLBITS {
  union {
    struct {
      uint16_t TXREQ:16;
    };
    struct {
      uint16_t TXREQ0:1;
      uint16_t TXREQ1:1;
      uint16_t TXREQ2:1;
      uint16_t TXREQ3:1;
      uint16_t TXREQ4:1;
      uint16_t TXREQ5:1;
      uint16_t TXREQ6:1;
      uint16_t TXREQ7:1;
      uint16_t TXREQ8:1;
      uint16_t TXREQ9:1;
      uint16_t TXREQ10:1;
      uint16_t TXREQ11:1;
      uint16_t TXREQ12:1;
      uint16_t TXREQ13:1;
      uint16_t TXREQ14:1;
      uint16_t TXREQ15:1;
    };
  };
} C1TXREQLBITS;
extern volatile C1TXREQLBITS C1TXREQLbits __attribute__((__sfr__));


extern volatile uint16_t C1TXREQH __attribute__((__sfr__));
__extension__ typedef struct tagC1TXREQHBITS {
  union {
    struct {
      uint16_t TXREQ:16;
    };
    struct {
      uint16_t TXREQ16:1;
      uint16_t TXREQ17:1;
      uint16_t TXREQ18:1;
      uint16_t TXREQ19:1;
      uint16_t TXREQ20:1;
      uint16_t TXREQ21:1;
      uint16_t TXREQ22:1;
      uint16_t TXREQ23:1;
      uint16_t TXREQ24:1;
      uint16_t TXREQ25:1;
      uint16_t TXREQ26:1;
      uint16_t TXREQ27:1;
      uint16_t TXREQ28:1;
      uint16_t TXREQ29:1;
      uint16_t TXREQ30:1;
      uint16_t TXREQ31:1;
    };
  };
} C1TXREQHBITS;
extern volatile C1TXREQHBITS C1TXREQHbits __attribute__((__sfr__));


extern volatile uint16_t C1TRECL __attribute__((__sfr__));
__extension__ typedef struct tagC1TRECLBITS {
  union {
    struct {
      uint16_t RERRCNT:8;
      uint16_t TERRCNT:8;
    };
    struct {
      uint16_t RERRCNT0:1;
      uint16_t RERRCNT1:1;
      uint16_t RERRCNT2:1;
      uint16_t RERRCNT3:1;
      uint16_t RERRCNT4:1;
      uint16_t RERRCNT5:1;
      uint16_t RERRCNT6:1;
      uint16_t RERRCNT7:1;
      uint16_t TERRCNT0:1;
      uint16_t TERRCNT1:1;
      uint16_t TERRCNT2:1;
      uint16_t TERRCNT3:1;
      uint16_t TERRCNT4:1;
      uint16_t TERRCNT5:1;
      uint16_t TERRCNT6:1;
      uint16_t TERRCNT7:1;
    };
  };
} C1TRECLBITS;
extern volatile C1TRECLBITS C1TRECLbits __attribute__((__sfr__));


extern volatile uint16_t C1TRECH __attribute__((__sfr__));
typedef struct tagC1TRECHBITS {
  uint16_t EWARN:1;
  uint16_t RXWARN:1;
  uint16_t TXWARN:1;
  uint16_t RXBP:1;
  uint16_t TXBP:1;
  uint16_t TXBO:1;
} C1TRECHBITS;
extern volatile C1TRECHBITS C1TRECHbits __attribute__((__sfr__));


extern volatile uint16_t C1BDIAG0L __attribute__((__sfr__));
__extension__ typedef struct tagC1BDIAG0LBITS {
  union {
    struct {
      uint16_t NRERRCNT:8;
      uint16_t NTERRCNT:8;
    };
    struct {
      uint16_t NRERRCNT0:1;
      uint16_t NRERRCNT1:1;
      uint16_t NRERRCNT2:1;
      uint16_t NRERRCNT3:1;
      uint16_t NRERRCNT4:1;
      uint16_t NRERRCNT5:1;
      uint16_t NRERRCNT6:1;
      uint16_t NRERRCNT7:1;
      uint16_t NTERRCNT0:1;
      uint16_t NTERRCNT1:1;
      uint16_t NTERRCNT2:1;
      uint16_t NTERRCNT3:1;
      uint16_t NTERRCNT4:1;
      uint16_t NTERRCNT5:1;
      uint16_t NTERRCNT6:1;
      uint16_t NTERRCNT7:1;
    };
  };
} C1BDIAG0LBITS;
extern volatile C1BDIAG0LBITS C1BDIAG0Lbits __attribute__((__sfr__));


extern volatile uint16_t C1BDIAG0H __attribute__((__sfr__));
__extension__ typedef struct tagC1BDIAG0HBITS {
  union {
    struct {
      uint16_t DRERRCNT:8;
      uint16_t DTERRCNT:8;
    };
    struct {
      uint16_t DRERRCNT0:1;
      uint16_t DRERRCNT1:1;
      uint16_t DRERRCNT2:1;
      uint16_t DRERRCNT3:1;
      uint16_t DRERRCNT4:1;
      uint16_t DRERRCNT5:1;
      uint16_t DRERRCNT6:1;
      uint16_t DRERRCNT7:1;
      uint16_t DTERRCNT0:1;
      uint16_t DTERRCNT1:1;
      uint16_t DTERRCNT2:1;
      uint16_t DTERRCNT3:1;
      uint16_t DTERRCNT4:1;
      uint16_t DTERRCNT5:1;
      uint16_t DTERRCNT6:1;
      uint16_t DTERRCNT7:1;
    };
  };
} C1BDIAG0HBITS;
extern volatile C1BDIAG0HBITS C1BDIAG0Hbits __attribute__((__sfr__));


extern volatile uint16_t C1BDIAG1L __attribute__((__sfr__));
__extension__ typedef struct tagC1BDIAG1LBITS {
  union {
    struct {
      uint16_t EFMSGCNT:16;
    };
    struct {
      uint16_t EFMSGCNT0:1;
      uint16_t EFMSGCNT1:1;
      uint16_t EFMSGCNT2:1;
      uint16_t EFMSGCNT3:1;
      uint16_t EFMSGCNT4:1;
      uint16_t EFMSGCNT5:1;
      uint16_t EFMSGCNT6:1;
      uint16_t EFMSGCNT7:1;
      uint16_t EFMSGCNT8:1;
      uint16_t EFMSGCNT9:1;
      uint16_t EFMSGCNT10:1;
      uint16_t EFMSGCNT11:1;
      uint16_t EFMSGCNT12:1;
      uint16_t EFMSGCNT13:1;
      uint16_t EFMSGCNT14:1;
      uint16_t EFMSGCNT15:1;
    };
  };
} C1BDIAG1LBITS;
extern volatile C1BDIAG1LBITS C1BDIAG1Lbits __attribute__((__sfr__));


extern volatile uint16_t C1BDIAG1H __attribute__((__sfr__));
typedef struct tagC1BDIAG1HBITS {
  uint16_t NBIT0ERR:1;
  uint16_t NBIT1ERR:1;
  uint16_t NACKERR:1;
  uint16_t NFORMERR:1;
  uint16_t NSTUFERR:1;
  uint16_t NCRCERR:1;
  uint16_t :1;
  uint16_t TXBOERR:1;
  uint16_t DBIT0ERR:1;
  uint16_t DBIT1ERR:1;
  uint16_t :1;
  uint16_t DFORMERR:1;
  uint16_t DSTUFERR:1;
  uint16_t DCRCERR:1;
  uint16_t ESI:1;
  uint16_t DLCMM:1;
} C1BDIAG1HBITS;
extern volatile C1BDIAG1HBITS C1BDIAG1Hbits __attribute__((__sfr__));


extern volatile uint16_t C1TEFCONL __attribute__((__sfr__));
typedef struct tagC1TEFCONLBITS {
  uint16_t TEFNEIE:1;
  uint16_t TEFHIE:1;
  uint16_t TEFFIE:1;
  uint16_t TEFOVIE:1;
  uint16_t :1;
  uint16_t TEFTSEN:1;
  uint16_t :2;
  uint16_t UINC:1;
  uint16_t :1;
  uint16_t FRESET:1;
} C1TEFCONLBITS;
extern volatile C1TEFCONLBITS C1TEFCONLbits __attribute__((__sfr__));


extern volatile uint16_t C1TEFCONH __attribute__((__sfr__));
__extension__ typedef struct tagC1TEFCONHBITS {
  union {
    struct {
      uint16_t :8;
      uint16_t FSIZE:5;
    };
    struct {
      uint16_t :8;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
    };
  };
} C1TEFCONHBITS;
extern volatile C1TEFCONHBITS C1TEFCONHbits __attribute__((__sfr__));


extern volatile uint16_t C1TEFSTA __attribute__((__sfr__));
typedef struct tagC1TEFSTABITS {
  uint16_t TEFNEIF:1;
  uint16_t TEFHIF:1;
  uint16_t TEFFIF:1;
  uint16_t TEFOVIF:1;
} C1TEFSTABITS;
extern volatile C1TEFSTABITS C1TEFSTAbits __attribute__((__sfr__));


extern volatile uint16_t C1TEFUAL __attribute__((__sfr__));
__extension__ typedef struct tagC1TEFUALBITS {
  union {
    struct {
      uint16_t TEFUA:16;
    };
    struct {
      uint16_t TEFUA0:1;
      uint16_t TEFUA1:1;
      uint16_t TEFUA2:1;
      uint16_t TEFUA3:1;
      uint16_t TEFUA4:1;
      uint16_t TEFUA5:1;
      uint16_t TEFUA6:1;
      uint16_t TEFUA7:1;
      uint16_t TEFUA8:1;
      uint16_t TEFUA9:1;
      uint16_t TEFUA10:1;
      uint16_t TEFUA11:1;
      uint16_t TEFUA12:1;
      uint16_t TEFUA13:1;
      uint16_t TEFUA14:1;
      uint16_t TEFUA15:1;
    };
  };
} C1TEFUALBITS;
extern volatile C1TEFUALBITS C1TEFUALbits __attribute__((__sfr__));


extern volatile uint16_t C1TEFUAH __attribute__((__sfr__));
__extension__ typedef struct tagC1TEFUAHBITS {
  union {
    struct {
      uint16_t TEFUA:16;
    };
    struct {
      uint16_t TEFUA16:1;
      uint16_t TEFUA17:1;
      uint16_t TEFUA18:1;
      uint16_t TEFUA19:1;
      uint16_t TEFUA20:1;
      uint16_t TEFUA21:1;
      uint16_t TEFUA22:1;
      uint16_t TEFUA23:1;
      uint16_t TEFUA24:1;
      uint16_t TEFUA25:1;
      uint16_t TEFUA26:1;
      uint16_t TEFUA27:1;
      uint16_t TEFUA28:1;
      uint16_t TEFUA29:1;
      uint16_t TEFUA30:1;
      uint16_t TEFUA31:1;
    };
  };
} C1TEFUAHBITS;
extern volatile C1TEFUAHBITS C1TEFUAHbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOBAL __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOBALBITS {
  union {
    struct {
      uint16_t FIFOBA:16;
    };
    struct {
      uint16_t FIFOBA0:1;
      uint16_t FIFOBA1:1;
      uint16_t FIFOBA2:1;
      uint16_t FIFOBA3:1;
      uint16_t FIFOBA4:1;
      uint16_t FIFOBA5:1;
      uint16_t FIFOBA6:1;
      uint16_t FIFOBA7:1;
      uint16_t FIFOBA8:1;
      uint16_t FIFOBA9:1;
      uint16_t FIFOBA10:1;
      uint16_t FIFOBA11:1;
      uint16_t FIFOBA12:1;
      uint16_t FIFOBA13:1;
      uint16_t FIFOBA14:1;
      uint16_t FIFOBA15:1;
    };
  };
} C1FIFOBALBITS;
extern volatile C1FIFOBALBITS C1FIFOBALbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOBAH __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOBAHBITS {
  union {
    struct {
      uint16_t FIFOBA:16;
    };
    struct {
      uint16_t FIFOBA16:1;
      uint16_t FIFOBA17:1;
      uint16_t FIFOBA18:1;
      uint16_t FIFOBA19:1;
      uint16_t FIFOBA20:1;
      uint16_t FIFOBA21:1;
      uint16_t FIFOBA22:1;
      uint16_t FIFOBA23:1;
      uint16_t FIFOBA24:1;
      uint16_t FIFOBA25:1;
      uint16_t FIFOBA26:1;
      uint16_t FIFOBA27:1;
      uint16_t FIFOBA28:1;
      uint16_t FIFOBA29:1;
      uint16_t FIFOBA30:1;
      uint16_t FIFOBA31:1;
    };
  };
} C1FIFOBAHBITS;
extern volatile C1FIFOBAHBITS C1FIFOBAHbits __attribute__((__sfr__));


extern volatile uint16_t C1TXQCONL __attribute__((__sfr__));
typedef struct tagC1TXQCONLBITS {
  uint16_t TXQNIE:1;
  uint16_t :1;
  uint16_t TXQEIE:1;
  uint16_t :1;
  uint16_t TXATIE:1;
  uint16_t :2;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C1TXQCONLBITS;
extern volatile C1TXQCONLBITS C1TXQCONLbits __attribute__((__sfr__));


extern volatile uint16_t C1TXQCONH __attribute__((__sfr__));
__extension__ typedef struct tagC1TXQCONHBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C1TXQCONHBITS;
extern volatile C1TXQCONHBITS C1TXQCONHbits __attribute__((__sfr__));


extern volatile uint16_t C1TXQSTA __attribute__((__sfr__));
__extension__ typedef struct tagC1TXQSTABITS {
  union {
    struct {
      uint16_t TXQNIF:1;
      uint16_t :1;
      uint16_t TXQEIF:1;
      uint16_t :1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t TXQCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t TXQCI0:1;
      uint16_t TXQCI1:1;
      uint16_t TXQCI2:1;
      uint16_t TXQCI3:1;
      uint16_t TXQCI4:1;
    };
  };
} C1TXQSTABITS;
extern volatile C1TXQSTABITS C1TXQSTAbits __attribute__((__sfr__));


extern volatile uint16_t C1TXQUAL __attribute__((__sfr__));
__extension__ typedef struct tagC1TXQUALBITS {
  union {
    struct {
      uint16_t TXQUA:16;
    };
    struct {
      uint16_t TXQUA0:1;
      uint16_t TXQUA1:1;
      uint16_t TXQUA2:1;
      uint16_t TXQUA3:1;
      uint16_t TXQUA4:1;
      uint16_t TXQUA5:1;
      uint16_t TXQUA6:1;
      uint16_t TXQUA7:1;
      uint16_t TXQUA8:1;
      uint16_t TXQUA9:1;
      uint16_t TXQUA10:1;
      uint16_t TXQUA11:1;
      uint16_t TXQUA12:1;
      uint16_t TXQUA13:1;
      uint16_t TXQUA14:1;
      uint16_t TXQUA15:1;
    };
  };
} C1TXQUALBITS;
extern volatile C1TXQUALBITS C1TXQUALbits __attribute__((__sfr__));


extern volatile uint16_t C1TXQUAH __attribute__((__sfr__));
__extension__ typedef struct tagC1TXQUAHBITS {
  union {
    struct {
      uint16_t TXQUA:16;
    };
    struct {
      uint16_t TXQUA16:1;
      uint16_t TXQUA17:1;
      uint16_t TXQUA18:1;
      uint16_t TXQUA19:1;
      uint16_t TXQUA20:1;
      uint16_t TXQUA21:1;
      uint16_t TXQUA22:1;
      uint16_t TXQUA23:1;
      uint16_t TXQUA24:1;
      uint16_t TXQUA25:1;
      uint16_t TXQUA26:1;
      uint16_t TXQUA27:1;
      uint16_t TXQUA28:1;
      uint16_t TXQUA29:1;
      uint16_t TXQUA30:1;
      uint16_t TXQUA31:1;
    };
  };
} C1TXQUAHBITS;
extern volatile C1TXQUAHBITS C1TXQUAHbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON1L __attribute__((__sfr__));
typedef struct tagC1FIFOCON1LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C1FIFOCON1LBITS;
extern volatile C1FIFOCON1LBITS C1FIFOCON1Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON1H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOCON1HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C1FIFOCON1HBITS;
extern volatile C1FIFOCON1HBITS C1FIFOCON1Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOSTA1 __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOSTA1BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C1FIFOSTA1BITS;
extern volatile C1FIFOSTA1BITS C1FIFOSTA1bits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA1L __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA1LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C1FIFOUA1LBITS;
extern volatile C1FIFOUA1LBITS C1FIFOUA1Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA1H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA1HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C1FIFOUA1HBITS;
extern volatile C1FIFOUA1HBITS C1FIFOUA1Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON2L __attribute__((__sfr__));
typedef struct tagC1FIFOCON2LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C1FIFOCON2LBITS;
extern volatile C1FIFOCON2LBITS C1FIFOCON2Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON2H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOCON2HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C1FIFOCON2HBITS;
extern volatile C1FIFOCON2HBITS C1FIFOCON2Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOSTA2 __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOSTA2BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C1FIFOSTA2BITS;
extern volatile C1FIFOSTA2BITS C1FIFOSTA2bits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA2L __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA2LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C1FIFOUA2LBITS;
extern volatile C1FIFOUA2LBITS C1FIFOUA2Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA2H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA2HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C1FIFOUA2HBITS;
extern volatile C1FIFOUA2HBITS C1FIFOUA2Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON3L __attribute__((__sfr__));
typedef struct tagC1FIFOCON3LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C1FIFOCON3LBITS;
extern volatile C1FIFOCON3LBITS C1FIFOCON3Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON3H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOCON3HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C1FIFOCON3HBITS;
extern volatile C1FIFOCON3HBITS C1FIFOCON3Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOSTA3 __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOSTA3BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C1FIFOSTA3BITS;
extern volatile C1FIFOSTA3BITS C1FIFOSTA3bits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA3L __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA3LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C1FIFOUA3LBITS;
extern volatile C1FIFOUA3LBITS C1FIFOUA3Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA3H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA3HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C1FIFOUA3HBITS;
extern volatile C1FIFOUA3HBITS C1FIFOUA3Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON4L __attribute__((__sfr__));
typedef struct tagC1FIFOCON4LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C1FIFOCON4LBITS;
extern volatile C1FIFOCON4LBITS C1FIFOCON4Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON4H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOCON4HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C1FIFOCON4HBITS;
extern volatile C1FIFOCON4HBITS C1FIFOCON4Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOSTA4 __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOSTA4BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C1FIFOSTA4BITS;
extern volatile C1FIFOSTA4BITS C1FIFOSTA4bits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA4L __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA4LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C1FIFOUA4LBITS;
extern volatile C1FIFOUA4LBITS C1FIFOUA4Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA4H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA4HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C1FIFOUA4HBITS;
extern volatile C1FIFOUA4HBITS C1FIFOUA4Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON5L __attribute__((__sfr__));
typedef struct tagC1FIFOCON5LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C1FIFOCON5LBITS;
extern volatile C1FIFOCON5LBITS C1FIFOCON5Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON5H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOCON5HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C1FIFOCON5HBITS;
extern volatile C1FIFOCON5HBITS C1FIFOCON5Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOSTA5 __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOSTA5BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C1FIFOSTA5BITS;
extern volatile C1FIFOSTA5BITS C1FIFOSTA5bits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA5L __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA5LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C1FIFOUA5LBITS;
extern volatile C1FIFOUA5LBITS C1FIFOUA5Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA5H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA5HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C1FIFOUA5HBITS;
extern volatile C1FIFOUA5HBITS C1FIFOUA5Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON6L __attribute__((__sfr__));
typedef struct tagC1FIFOCON6LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C1FIFOCON6LBITS;
extern volatile C1FIFOCON6LBITS C1FIFOCON6Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON6H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOCON6HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C1FIFOCON6HBITS;
extern volatile C1FIFOCON6HBITS C1FIFOCON6Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOSTA6 __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOSTA6BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C1FIFOSTA6BITS;
extern volatile C1FIFOSTA6BITS C1FIFOSTA6bits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA6L __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA6LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C1FIFOUA6LBITS;
extern volatile C1FIFOUA6LBITS C1FIFOUA6Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA6H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA6HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C1FIFOUA6HBITS;
extern volatile C1FIFOUA6HBITS C1FIFOUA6Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON7L __attribute__((__sfr__));
typedef struct tagC1FIFOCON7LBITS {
  uint16_t TFNRFNIE:1;
  uint16_t TFHRFHIE:1;
  uint16_t TFERFFIE:1;
  uint16_t RXOVIE:1;
  uint16_t TXATIE:1;
  uint16_t RXTSEN:1;
  uint16_t RTREN:1;
  uint16_t TXEN:1;
  uint16_t UINC:1;
  uint16_t TXREQ:1;
  uint16_t FRESET:1;
} C1FIFOCON7LBITS;
extern volatile C1FIFOCON7LBITS C1FIFOCON7Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOCON7H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOCON7HBITS {
  union {
    struct {
      uint16_t TXPRI:5;
      uint16_t TXAT:2;
      uint16_t :1;
      uint16_t FSIZE:5;
      uint16_t PLSIZE:3;
    };
    struct {
      uint16_t TXPRI0:1;
      uint16_t TXPRI1:1;
      uint16_t TXPRI2:1;
      uint16_t TXPRI3:1;
      uint16_t TXPRI4:1;
      uint16_t TXAT0:1;
      uint16_t TXAT1:1;
      uint16_t :1;
      uint16_t FSIZE0:1;
      uint16_t FSIZE1:1;
      uint16_t FSIZE2:1;
      uint16_t FSIZE3:1;
      uint16_t FSIZE4:1;
      uint16_t PLSIZE0:1;
      uint16_t PLSIZE1:1;
      uint16_t PLSIZE2:1;
    };
  };
} C1FIFOCON7HBITS;
extern volatile C1FIFOCON7HBITS C1FIFOCON7Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOSTA7 __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOSTA7BITS {
  union {
    struct {
      uint16_t TFNRFNIF:1;
      uint16_t TFHRFHIF:1;
      uint16_t TFERFFIF:1;
      uint16_t RXOVIF:1;
      uint16_t TXATIF:1;
      uint16_t TXERR:1;
      uint16_t TXLARB:1;
      uint16_t TXABT:1;
      uint16_t FIFOCI:5;
    };
    struct {
      uint16_t :8;
      uint16_t FIFOCI0:1;
      uint16_t FIFOCI1:1;
      uint16_t FIFOCI2:1;
      uint16_t FIFOCI3:1;
      uint16_t FIFOCI4:1;
    };
  };
} C1FIFOSTA7BITS;
extern volatile C1FIFOSTA7BITS C1FIFOSTA7bits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA7L __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA7LBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA0:1;
      uint16_t FIFOUA1:1;
      uint16_t FIFOUA2:1;
      uint16_t FIFOUA3:1;
      uint16_t FIFOUA4:1;
      uint16_t FIFOUA5:1;
      uint16_t FIFOUA6:1;
      uint16_t FIFOUA7:1;
      uint16_t FIFOUA8:1;
      uint16_t FIFOUA9:1;
      uint16_t FIFOUA10:1;
      uint16_t FIFOUA11:1;
      uint16_t FIFOUA12:1;
      uint16_t FIFOUA13:1;
      uint16_t FIFOUA14:1;
      uint16_t FIFOUA15:1;
    };
  };
} C1FIFOUA7LBITS;
extern volatile C1FIFOUA7LBITS C1FIFOUA7Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FIFOUA7H __attribute__((__sfr__));
__extension__ typedef struct tagC1FIFOUA7HBITS {
  union {
    struct {
      uint16_t FIFOUA:16;
    };
    struct {
      uint16_t FIFOUA16:1;
      uint16_t FIFOUA17:1;
      uint16_t FIFOUA18:1;
      uint16_t FIFOUA19:1;
      uint16_t FIFOUA20:1;
      uint16_t FIFOUA21:1;
      uint16_t FIFOUA22:1;
      uint16_t FIFOUA23:1;
      uint16_t FIFOUA24:1;
      uint16_t FIFOUA25:1;
      uint16_t FIFOUA26:1;
      uint16_t FIFOUA27:1;
      uint16_t FIFOUA28:1;
      uint16_t FIFOUA29:1;
      uint16_t FIFOUA30:1;
      uint16_t FIFOUA31:1;
    };
  };
} C1FIFOUA7HBITS;
extern volatile C1FIFOUA7HBITS C1FIFOUA7Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTCON0L __attribute__((__sfr__));
typedef struct tagC1FLTCON0LBITS {
  uint16_t F0BP:5;
  uint16_t :2;
  uint16_t FLTEN0:1;
  uint16_t F1BP:5;
  uint16_t :2;
  uint16_t FLTEN1:1;
} C1FLTCON0LBITS;
extern volatile C1FLTCON0LBITS C1FLTCON0Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTCON0H __attribute__((__sfr__));
typedef struct tagC1FLTCON0HBITS {
  uint16_t F2BP:5;
  uint16_t :2;
  uint16_t FLTEN2:1;
  uint16_t F3BP:5;
  uint16_t :2;
  uint16_t FLTEN3:1;
} C1FLTCON0HBITS;
extern volatile C1FLTCON0HBITS C1FLTCON0Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTCON1L __attribute__((__sfr__));
typedef struct tagC1FLTCON1LBITS {
  uint16_t F4BP:5;
  uint16_t :2;
  uint16_t FLTEN4:1;
  uint16_t F5BP:5;
  uint16_t :2;
  uint16_t FLTEN5:1;
} C1FLTCON1LBITS;
extern volatile C1FLTCON1LBITS C1FLTCON1Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTCON1H __attribute__((__sfr__));
typedef struct tagC1FLTCON1HBITS {
  uint16_t F6BP:5;
  uint16_t :2;
  uint16_t FLTEN6:1;
  uint16_t F7BP:5;
  uint16_t :2;
  uint16_t FLTEN7:1;
} C1FLTCON1HBITS;
extern volatile C1FLTCON1HBITS C1FLTCON1Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTCON2L __attribute__((__sfr__));
typedef struct tagC1FLTCON2LBITS {
  uint16_t F8BP:5;
  uint16_t :2;
  uint16_t FLTEN8:1;
  uint16_t F9BP:5;
  uint16_t :2;
  uint16_t FLTEN9:1;
} C1FLTCON2LBITS;
extern volatile C1FLTCON2LBITS C1FLTCON2Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTCON2H __attribute__((__sfr__));
typedef struct tagC1FLTCON2HBITS {
  uint16_t F10BP:5;
  uint16_t :2;
  uint16_t FLTEN10:1;
  uint16_t F11BP:5;
  uint16_t :2;
  uint16_t FLTEN11:1;
} C1FLTCON2HBITS;
extern volatile C1FLTCON2HBITS C1FLTCON2Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTCON3L __attribute__((__sfr__));
typedef struct tagC1FLTCON3LBITS {
  uint16_t F12BP:5;
  uint16_t :2;
  uint16_t FLTEN12:1;
  uint16_t F13BP:5;
  uint16_t :2;
  uint16_t FLTEN13:1;
} C1FLTCON3LBITS;
extern volatile C1FLTCON3LBITS C1FLTCON3Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTCON3H __attribute__((__sfr__));
typedef struct tagC1FLTCON3HBITS {
  uint16_t F14BP:5;
  uint16_t :2;
  uint16_t FLTEN14:1;
  uint16_t F15BP:5;
  uint16_t :2;
  uint16_t FLTEN15:1;
} C1FLTCON3HBITS;
extern volatile C1FLTCON3HBITS C1FLTCON3Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ0L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ0LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ0LBITS;
extern volatile C1FLTOBJ0LBITS C1FLTOBJ0Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ0H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ0HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ0HBITS;
extern volatile C1FLTOBJ0HBITS C1FLTOBJ0Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK0L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK0LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK0LBITS;
extern volatile C1MASK0LBITS C1MASK0Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK0H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK0HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK0HBITS;
extern volatile C1MASK0HBITS C1MASK0Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ1L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ1LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ1LBITS;
extern volatile C1FLTOBJ1LBITS C1FLTOBJ1Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ1H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ1HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ1HBITS;
extern volatile C1FLTOBJ1HBITS C1FLTOBJ1Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK1L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK1LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK1LBITS;
extern volatile C1MASK1LBITS C1MASK1Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK1H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK1HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK1HBITS;
extern volatile C1MASK1HBITS C1MASK1Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ2L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ2LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ2LBITS;
extern volatile C1FLTOBJ2LBITS C1FLTOBJ2Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ2H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ2HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ2HBITS;
extern volatile C1FLTOBJ2HBITS C1FLTOBJ2Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK2L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK2LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK2LBITS;
extern volatile C1MASK2LBITS C1MASK2Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK2H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK2HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK2HBITS;
extern volatile C1MASK2HBITS C1MASK2Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ3L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ3LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ3LBITS;
extern volatile C1FLTOBJ3LBITS C1FLTOBJ3Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ3H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ3HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ3HBITS;
extern volatile C1FLTOBJ3HBITS C1FLTOBJ3Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK3L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK3LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK3LBITS;
extern volatile C1MASK3LBITS C1MASK3Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK3H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK3HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK3HBITS;
extern volatile C1MASK3HBITS C1MASK3Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ4L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ4LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ4LBITS;
extern volatile C1FLTOBJ4LBITS C1FLTOBJ4Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ4H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ4HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ4HBITS;
extern volatile C1FLTOBJ4HBITS C1FLTOBJ4Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK4L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK4LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK4LBITS;
extern volatile C1MASK4LBITS C1MASK4Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK4H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK4HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK4HBITS;
extern volatile C1MASK4HBITS C1MASK4Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ5L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ5LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ5LBITS;
extern volatile C1FLTOBJ5LBITS C1FLTOBJ5Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ5H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ5HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ5HBITS;
extern volatile C1FLTOBJ5HBITS C1FLTOBJ5Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK5L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK5LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK5LBITS;
extern volatile C1MASK5LBITS C1MASK5Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK5H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK5HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK5HBITS;
extern volatile C1MASK5HBITS C1MASK5Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ6L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ6LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ6LBITS;
extern volatile C1FLTOBJ6LBITS C1FLTOBJ6Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ6H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ6HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ6HBITS;
extern volatile C1FLTOBJ6HBITS C1FLTOBJ6Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK6L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK6LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK6LBITS;
extern volatile C1MASK6LBITS C1MASK6Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK6H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK6HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK6HBITS;
extern volatile C1MASK6HBITS C1MASK6Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ7L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ7LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ7LBITS;
extern volatile C1FLTOBJ7LBITS C1FLTOBJ7Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ7H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ7HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ7HBITS;
extern volatile C1FLTOBJ7HBITS C1FLTOBJ7Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK7L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK7LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK7LBITS;
extern volatile C1MASK7LBITS C1MASK7Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK7H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK7HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK7HBITS;
extern volatile C1MASK7HBITS C1MASK7Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ8L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ8LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ8LBITS;
extern volatile C1FLTOBJ8LBITS C1FLTOBJ8Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ8H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ8HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ8HBITS;
extern volatile C1FLTOBJ8HBITS C1FLTOBJ8Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK8L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK8LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK8LBITS;
extern volatile C1MASK8LBITS C1MASK8Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK8H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK8HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK8HBITS;
extern volatile C1MASK8HBITS C1MASK8Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ9L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ9LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ9LBITS;
extern volatile C1FLTOBJ9LBITS C1FLTOBJ9Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ9H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ9HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ9HBITS;
extern volatile C1FLTOBJ9HBITS C1FLTOBJ9Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK9L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK9LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK9LBITS;
extern volatile C1MASK9LBITS C1MASK9Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK9H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK9HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK9HBITS;
extern volatile C1MASK9HBITS C1MASK9Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ10L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ10LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ10LBITS;
extern volatile C1FLTOBJ10LBITS C1FLTOBJ10Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ10H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ10HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ10HBITS;
extern volatile C1FLTOBJ10HBITS C1FLTOBJ10Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK10L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK10LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK10LBITS;
extern volatile C1MASK10LBITS C1MASK10Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK10H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK10HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK10HBITS;
extern volatile C1MASK10HBITS C1MASK10Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ11L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ11LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ11LBITS;
extern volatile C1FLTOBJ11LBITS C1FLTOBJ11Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ11H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ11HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ11HBITS;
extern volatile C1FLTOBJ11HBITS C1FLTOBJ11Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK11L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK11LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK11LBITS;
extern volatile C1MASK11LBITS C1MASK11Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK11H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK11HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK11HBITS;
extern volatile C1MASK11HBITS C1MASK11Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ12L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ12LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ12LBITS;
extern volatile C1FLTOBJ12LBITS C1FLTOBJ12Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ12H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ12HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ12HBITS;
extern volatile C1FLTOBJ12HBITS C1FLTOBJ12Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK12L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK12LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK12LBITS;
extern volatile C1MASK12LBITS C1MASK12Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK12H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK12HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK12HBITS;
extern volatile C1MASK12HBITS C1MASK12Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ13L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ13LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ13LBITS;
extern volatile C1FLTOBJ13LBITS C1FLTOBJ13Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ13H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ13HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ13HBITS;
extern volatile C1FLTOBJ13HBITS C1FLTOBJ13Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK13L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK13LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK13LBITS;
extern volatile C1MASK13LBITS C1MASK13Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK13H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK13HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK13HBITS;
extern volatile C1MASK13HBITS C1MASK13Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ14L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ14LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ14LBITS;
extern volatile C1FLTOBJ14LBITS C1FLTOBJ14Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ14H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ14HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ14HBITS;
extern volatile C1FLTOBJ14HBITS C1FLTOBJ14Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK14L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK14LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK14LBITS;
extern volatile C1MASK14LBITS C1MASK14Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK14H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK14HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK14HBITS;
extern volatile C1MASK14HBITS C1MASK14Hbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ15L __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ15LBITS {
  union {
    struct {
      uint16_t SID:11;
      uint16_t EID:5;
    };
    struct {
      uint16_t SID0:1;
      uint16_t SID1:1;
      uint16_t SID2:1;
      uint16_t SID3:1;
      uint16_t SID4:1;
      uint16_t SID5:1;
      uint16_t SID6:1;
      uint16_t SID7:1;
      uint16_t SID8:1;
      uint16_t SID9:1;
      uint16_t SID10:1;
      uint16_t EID0:1;
      uint16_t EID1:1;
      uint16_t EID2:1;
      uint16_t EID3:1;
      uint16_t EID4:1;
    };
  };
} C1FLTOBJ15LBITS;
extern volatile C1FLTOBJ15LBITS C1FLTOBJ15Lbits __attribute__((__sfr__));


extern volatile uint16_t C1FLTOBJ15H __attribute__((__sfr__));
__extension__ typedef struct tagC1FLTOBJ15HBITS {
  union {
    struct {
      uint16_t EID:13;
      uint16_t SID11:1;
      uint16_t EXIDE:1;
    };
    struct {
      uint16_t EID5:1;
      uint16_t EID6:1;
      uint16_t EID7:1;
      uint16_t EID8:1;
      uint16_t EID9:1;
      uint16_t EID10:1;
      uint16_t EID11:1;
      uint16_t EID12:1;
      uint16_t EID13:1;
      uint16_t EID14:1;
      uint16_t EID15:1;
      uint16_t EID16:1;
      uint16_t EID17:1;
    };
  };
} C1FLTOBJ15HBITS;
extern volatile C1FLTOBJ15HBITS C1FLTOBJ15Hbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK15L __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK15LBITS {
  union {
    struct {
      uint16_t MSID:11;
      uint16_t MEID:5;
    };
    struct {
      uint16_t MSID0:1;
      uint16_t MSID1:1;
      uint16_t MSID2:1;
      uint16_t MSID3:1;
      uint16_t MSID4:1;
      uint16_t MSID5:1;
      uint16_t MSID6:1;
      uint16_t MSID7:1;
      uint16_t MSID8:1;
      uint16_t MSID9:1;
      uint16_t MSID10:1;
      uint16_t MEID0:1;
      uint16_t MEID1:1;
      uint16_t MEID2:1;
      uint16_t MEID3:1;
      uint16_t MEID4:1;
    };
  };
} C1MASK15LBITS;
extern volatile C1MASK15LBITS C1MASK15Lbits __attribute__((__sfr__));


extern volatile uint16_t C1MASK15H __attribute__((__sfr__));
__extension__ typedef struct tagC1MASK15HBITS {
  union {
    struct {
      uint16_t MEID:13;
      uint16_t MSID11:1;
      uint16_t MIDE:1;
    };
    struct {
      uint16_t MEID5:1;
      uint16_t MEID6:1;
      uint16_t MEID7:1;
      uint16_t MEID8:1;
      uint16_t MEID9:1;
      uint16_t MEID10:1;
      uint16_t MEID11:1;
      uint16_t MEID12:1;
      uint16_t MEID13:1;
      uint16_t MEID14:1;
      uint16_t MEID15:1;
      uint16_t MEID16:1;
      uint16_t MEID17:1;
    };
  };
} C1MASK15HBITS;
extern volatile C1MASK15HBITS C1MASK15Hbits __attribute__((__sfr__));


extern volatile uint16_t IFS0 __attribute__((__sfr__));
typedef struct tagIFS0BITS {
  uint16_t INT0IF:1;
  uint16_t T1IF:1;
  uint16_t CNAIF:1;
  uint16_t CNBIF:1;
  uint16_t DMA0IF:1;
  uint16_t :1;
  uint16_t CCP1IF:1;
  uint16_t CCT1IF:1;
  uint16_t DMA1IF:1;
  uint16_t SPI1RXIF:1;
  uint16_t SPI1TXIF:1;
  uint16_t U1RXIF:1;
  uint16_t U1TXIF:1;
  uint16_t ECCSBEIF:1;
  uint16_t NVMIF:1;
  uint16_t INT1IF:1;
} IFS0BITS;
extern volatile IFS0BITS IFS0bits __attribute__((__sfr__));


extern volatile uint16_t IFS1 __attribute__((__sfr__));
typedef struct tagIFS1BITS {
  uint16_t SI2C1IF:1;
  uint16_t MI2C1IF:1;
  uint16_t DMA2IF:1;
  uint16_t CNCIF:1;
  uint16_t INT2IF:1;
  uint16_t DMA3IF:1;
  uint16_t DMA4IF:1;
  uint16_t CCP2IF:1;
  uint16_t CCT2IF:1;
  uint16_t C1IF:1;
  uint16_t INT3IF:1;
  uint16_t U2RXIF:1;
  uint16_t U2TXIF:1;
  uint16_t SPI2RXIF:1;
  uint16_t SPI2TXIF:1;
  uint16_t C1RXIF:1;
} IFS1BITS;
extern volatile IFS1BITS IFS1bits __attribute__((__sfr__));


extern volatile uint16_t IFS2 __attribute__((__sfr__));
typedef struct tagIFS2BITS {
  uint16_t C2RXIF:1;
  uint16_t C2IF:1;
  uint16_t DMA5IF:1;
  uint16_t CCP3IF:1;
  uint16_t CCT3IF:1;
  uint16_t SI2C2IF:1;
  uint16_t MI2C2IF:1;
  uint16_t :1;
  uint16_t CCP4IF:1;
  uint16_t CCT4IF:1;
  uint16_t :1;
  uint16_t CCP5IF:1;
  uint16_t CCT5IF:1;
  uint16_t DMTIF:1;
  uint16_t CCP6IF:1;
  uint16_t CCT6IF:1;
} IFS2BITS;
extern volatile IFS2BITS IFS2bits __attribute__((__sfr__));


extern volatile uint16_t IFS3 __attribute__((__sfr__));
typedef struct tagIFS3BITS {
  uint16_t QEI1IF:1;
  uint16_t U1EIF:1;
  uint16_t U2EIF:1;
  uint16_t CRCIF:1;
  uint16_t C1TXIF:1;
  uint16_t C2TXIF:1;
  uint16_t :8;
  uint16_t JTAGIF:1;
  uint16_t PTGSTEPIF:1;
} IFS3BITS;
extern volatile IFS3BITS IFS3bits __attribute__((__sfr__));


extern volatile uint16_t IFS4 __attribute__((__sfr__));
typedef struct tagIFS4BITS {
  uint16_t I2C1BCIF:1;
  uint16_t I2C2BCIF:1;
  uint16_t :1;
  uint16_t PWM1IF:1;
  uint16_t PWM2IF:1;
  uint16_t PWM3IF:1;
  uint16_t PWM4IF:1;
  uint16_t :4;
  uint16_t CNDIF:1;
  uint16_t CNEIF:1;
  uint16_t CMP1IF:1;
} IFS4BITS;
extern volatile IFS4BITS IFS4bits __attribute__((__sfr__));


extern volatile uint16_t IFS5 __attribute__((__sfr__));
typedef struct tagIFS5BITS {
  uint16_t :1;
  uint16_t PTGWDTIF:1;
  uint16_t PTG0IF:1;
  uint16_t PTG1IF:1;
  uint16_t PTG2IF:1;
  uint16_t PTG3IF:1;
  uint16_t SENT1IF:1;
  uint16_t SENT1EIF:1;
  uint16_t SENT2IF:1;
  uint16_t SENT2EIF:1;
  uint16_t ADCIF:1;
  uint16_t ADCAN0IF:1;
  uint16_t ADCAN1IF:1;
  uint16_t ADCAN2IF:1;
  uint16_t ADCAN3IF:1;
  uint16_t ADCAN4IF:1;
} IFS5BITS;
extern volatile IFS5BITS IFS5bits __attribute__((__sfr__));


extern volatile uint16_t IFS6 __attribute__((__sfr__));
typedef struct tagIFS6BITS {
  uint16_t ADCAN5IF:1;
  uint16_t ADCAN6IF:1;
  uint16_t ADCAN7IF:1;
  uint16_t ADCAN8IF:1;
  uint16_t ADCAN9IF:1;
  uint16_t ADCAN10IF:1;
  uint16_t ADCAN11IF:1;
  uint16_t ADCAN12IF:1;
  uint16_t ADCAN13IF:1;
  uint16_t ADCAN14IF:1;
  uint16_t ADCAN15IF:1;
  uint16_t ADCAN16IF:1;
  uint16_t ADCAN17IF:1;
  uint16_t ADCAN18IF:1;
  uint16_t ADCAN19IF:1;
  uint16_t ADCAN20IF:1;
} IFS6BITS;
extern volatile IFS6BITS IFS6bits __attribute__((__sfr__));


extern volatile uint16_t IFS7 __attribute__((__sfr__));
typedef struct tagIFS7BITS {
  uint16_t :3;
  uint16_t ADFLTIF:1;
  uint16_t ADCMP0IF:1;
  uint16_t ADCMP1IF:1;
  uint16_t ADCMP2IF:1;
  uint16_t ADCMP3IF:1;
  uint16_t ADFLTR0IF:1;
  uint16_t ADFLTR1IF:1;
  uint16_t ADFLTR2IF:1;
  uint16_t ADFLTR3IF:1;
  uint16_t CLC1PIF:1;
  uint16_t CLC2PIF:1;
  uint16_t SPI1IF:1;
  uint16_t SPI2IF:1;
} IFS7BITS;
extern volatile IFS7BITS IFS7bits __attribute__((__sfr__));


extern volatile uint16_t IFS8 __attribute__((__sfr__));
typedef struct tagIFS8BITS {
  uint16_t :1;
  uint16_t MSIS1IF:1;
  uint16_t MSIAIF:1;
  uint16_t MSIBIF:1;
  uint16_t MSICIF:1;
  uint16_t MSIDIF:1;
  uint16_t MSIEIF:1;
  uint16_t MSIFIF:1;
  uint16_t MSIGIF:1;
  uint16_t MSIHIF:1;
  uint16_t MSIDTIF:1;
  uint16_t MSIWFEIF:1;
  uint16_t MSIFLTIF:1;
  uint16_t S1RSTIF:1;
} IFS8BITS;
extern volatile IFS8BITS IFS8bits __attribute__((__sfr__));


extern volatile uint16_t IFS9 __attribute__((__sfr__));
typedef struct tagIFS9BITS {
  uint16_t :2;
  uint16_t S1BRKIF:1;
  uint16_t :2;
  uint16_t CCP7IF:1;
  uint16_t CCT7IF:1;
  uint16_t :1;
  uint16_t CCP8IF:1;
  uint16_t CCT8IF:1;
  uint16_t :3;
  uint16_t S1CLKFIF:1;
} IFS9BITS;
extern volatile IFS9BITS IFS9bits __attribute__((__sfr__));


extern volatile uint16_t IFS10 __attribute__((__sfr__));
typedef struct tagIFS10BITS {
  uint16_t :8;
  uint16_t ADFIFOIF:1;
  uint16_t PEVTAIF:1;
  uint16_t PEVTBIF:1;
  uint16_t PEVTCIF:1;
  uint16_t PEVTDIF:1;
  uint16_t PEVTEIF:1;
  uint16_t PEVTFIF:1;
  uint16_t CLC3PIF:1;
} IFS10BITS;
extern volatile IFS10BITS IFS10bits __attribute__((__sfr__));


extern volatile uint16_t IFS11 __attribute__((__sfr__));
typedef struct tagIFS11BITS {
  uint16_t CLC4PIF:1;
  uint16_t CLC1NIF:1;
  uint16_t CLC2NIF:1;
  uint16_t CLC3NIF:1;
  uint16_t CLC4NIF:1;
  uint16_t :8;
  uint16_t U1EVTIF:1;
  uint16_t U2EVTIF:1;
} IFS11BITS;
extern volatile IFS11BITS IFS11bits __attribute__((__sfr__));


extern volatile uint16_t IEC0 __attribute__((__sfr__));
typedef struct tagIEC0BITS {
  uint16_t INT0IE:1;
  uint16_t T1IE:1;
  uint16_t CNAIE:1;
  uint16_t CNBIE:1;
  uint16_t DMA0IE:1;
  uint16_t :1;
  uint16_t CCP1IE:1;
  uint16_t CCT1IE:1;
  uint16_t DMA1IE:1;
  uint16_t SPI1RXIE:1;
  uint16_t SPI1TXIE:1;
  uint16_t U1RXIE:1;
  uint16_t U1TXIE:1;
  uint16_t ECCSBEIE:1;
  uint16_t NVMIE:1;
  uint16_t INT1IE:1;
} IEC0BITS;
extern volatile IEC0BITS IEC0bits __attribute__((__sfr__));


extern volatile uint16_t IEC1 __attribute__((__sfr__));
typedef struct tagIEC1BITS {
  uint16_t SI2C1IE:1;
  uint16_t MI2C1IE:1;
  uint16_t DMA2IE:1;
  uint16_t CNCIE:1;
  uint16_t INT2IE:1;
  uint16_t DMA3IE:1;
  uint16_t DMA4IE:1;
  uint16_t CCP2IE:1;
  uint16_t CCT2IE:1;
  uint16_t C1IE:1;
  uint16_t INT3IE:1;
  uint16_t U2RXIE:1;
  uint16_t U2TXIE:1;
  uint16_t SPI2RXIE:1;
  uint16_t SPI2TXIE:1;
  uint16_t C1RXIE:1;
} IEC1BITS;
extern volatile IEC1BITS IEC1bits __attribute__((__sfr__));


extern volatile uint16_t IEC2 __attribute__((__sfr__));
typedef struct tagIEC2BITS {
  uint16_t C2RXIE:1;
  uint16_t C2IE:1;
  uint16_t DMA5IE:1;
  uint16_t CCP3IE:1;
  uint16_t CCT3IE:1;
  uint16_t SI2C2IE:1;
  uint16_t MI2C2IE:1;
  uint16_t :1;
  uint16_t CCP4IE:1;
  uint16_t CCT4IE:1;
  uint16_t :1;
  uint16_t CCP5IE:1;
  uint16_t CCT5IE:1;
  uint16_t DMTIE:1;
  uint16_t CCP6IE:1;
  uint16_t CCT6IE:1;
} IEC2BITS;
extern volatile IEC2BITS IEC2bits __attribute__((__sfr__));


extern volatile uint16_t IEC3 __attribute__((__sfr__));
typedef struct tagIEC3BITS {
  uint16_t QEI1IE:1;
  uint16_t U1EIE:1;
  uint16_t U2EIE:1;
  uint16_t CRCIE:1;
  uint16_t C1TXIE:1;
  uint16_t C2TXIE:1;
  uint16_t :8;
  uint16_t JTAGIE:1;
  uint16_t PTGSTEPIE:1;
} IEC3BITS;
extern volatile IEC3BITS IEC3bits __attribute__((__sfr__));


extern volatile uint16_t IEC4 __attribute__((__sfr__));
typedef struct tagIEC4BITS {
  uint16_t I2C1BCIE:1;
  uint16_t I2C2BCIE:1;
  uint16_t :1;
  uint16_t PWM1IE:1;
  uint16_t PWM2IE:1;
  uint16_t PWM3IE:1;
  uint16_t PWM4IE:1;
  uint16_t :4;
  uint16_t CNDIE:1;
  uint16_t CNEIE:1;
  uint16_t CMP1IE:1;
} IEC4BITS;
extern volatile IEC4BITS IEC4bits __attribute__((__sfr__));


extern volatile uint16_t IEC5 __attribute__((__sfr__));
typedef struct tagIEC5BITS {
  uint16_t :1;
  uint16_t PTGWDTIE:1;
  uint16_t PTG0IE:1;
  uint16_t PTG1IE:1;
  uint16_t PTG2IE:1;
  uint16_t PTG3IE:1;
  uint16_t SENT1IE:1;
  uint16_t SENT1EIE:1;
  uint16_t SENT2IE:1;
  uint16_t SENT2EIE:1;
  uint16_t ADCIE:1;
  uint16_t ADCAN0IE:1;
  uint16_t ADCAN1IE:1;
  uint16_t ADCAN2IE:1;
  uint16_t ADCAN3IE:1;
  uint16_t ADCAN4IE:1;
} IEC5BITS;
extern volatile IEC5BITS IEC5bits __attribute__((__sfr__));


extern volatile uint16_t IEC6 __attribute__((__sfr__));
typedef struct tagIEC6BITS {
  uint16_t ADCAN5IE:1;
  uint16_t ADCAN6IE:1;
  uint16_t ADCAN7IE:1;
  uint16_t ADCAN8IE:1;
  uint16_t ADCAN9IE:1;
  uint16_t ADCAN10IE:1;
  uint16_t ADCAN11IE:1;
  uint16_t ADCAN12IE:1;
  uint16_t ADCAN13IE:1;
  uint16_t ADCAN14IE:1;
  uint16_t ADCAN15IE:1;
  uint16_t ADCAN16IE:1;
  uint16_t ADCAN17IE:1;
  uint16_t ADCAN18IE:1;
  uint16_t ADCAN19IE:1;
  uint16_t ADCAN20IE:1;
} IEC6BITS;
extern volatile IEC6BITS IEC6bits __attribute__((__sfr__));


extern volatile uint16_t IEC7 __attribute__((__sfr__));
typedef struct tagIEC7BITS {
  uint16_t :3;
  uint16_t ADFLTIE:1;
  uint16_t ADCMP0IE:1;
  uint16_t ADCMP1IE:1;
  uint16_t ADCMP2IE:1;
  uint16_t ADCMP3IE:1;
  uint16_t ADFLTR0IE:1;
  uint16_t ADFLTR1IE:1;
  uint16_t ADFLTR2IE:1;
  uint16_t ADFLTR3IE:1;
  uint16_t CLC1PIE:1;
  uint16_t CLC2PIE:1;
  uint16_t SPI1IE:1;
  uint16_t SPI2IE:1;
} IEC7BITS;
extern volatile IEC7BITS IEC7bits __attribute__((__sfr__));


extern volatile uint16_t IEC8 __attribute__((__sfr__));
typedef struct tagIEC8BITS {
  uint16_t :1;
  uint16_t MSIS1IE:1;
  uint16_t MSIAIE:1;
  uint16_t MSIBIE:1;
  uint16_t MSICIE:1;
  uint16_t MSIDIE:1;
  uint16_t MSIEIE:1;
  uint16_t MSIFIE:1;
  uint16_t MSIGIE:1;
  uint16_t MSIHIE:1;
  uint16_t MSIDTIE:1;
  uint16_t MSIWFEIE:1;
  uint16_t MSIFLTIE:1;
  uint16_t S1RSTIE:1;
} IEC8BITS;
extern volatile IEC8BITS IEC8bits __attribute__((__sfr__));


extern volatile uint16_t IEC9 __attribute__((__sfr__));
typedef struct tagIEC9BITS {
  uint16_t :2;
  uint16_t S1BRKIE:1;
  uint16_t :2;
  uint16_t CCP7IE:1;
  uint16_t CCT7IE:1;
  uint16_t :1;
  uint16_t CCP8IE:1;
  uint16_t CCT8IE:1;
  uint16_t :3;
  uint16_t S1CLKFIE:1;
} IEC9BITS;
extern volatile IEC9BITS IEC9bits __attribute__((__sfr__));


extern volatile uint16_t IEC10 __attribute__((__sfr__));
typedef struct tagIEC10BITS {
  uint16_t :8;
  uint16_t ADFIFOIE:1;
  uint16_t PEVTAIE:1;
  uint16_t PEVTBIE:1;
  uint16_t PEVTCIE:1;
  uint16_t PEVTDIE:1;
  uint16_t PEVTEIE:1;
  uint16_t PEVTFIE:1;
  uint16_t CLC3PIE:1;
} IEC10BITS;
extern volatile IEC10BITS IEC10bits __attribute__((__sfr__));


extern volatile uint16_t IEC11 __attribute__((__sfr__));
typedef struct tagIEC11BITS {
  uint16_t CLC4PIE:1;
  uint16_t CLC1NIE:1;
  uint16_t CLC2NIE:1;
  uint16_t CLC3NIE:1;
  uint16_t CLC4NIE:1;
  uint16_t :8;
  uint16_t U1EVTIE:1;
  uint16_t U2EVTIE:1;
} IEC11BITS;
extern volatile IEC11BITS IEC11bits __attribute__((__sfr__));


extern volatile uint16_t IPC0 __attribute__((__sfr__));
typedef struct tagIPC0BITS {
  uint16_t INT0IP:3;
  uint16_t :1;
  uint16_t T1IP:3;
  uint16_t :1;
  uint16_t CNAIP:3;
  uint16_t :1;
  uint16_t CNBIP:3;
} IPC0BITS;
extern volatile IPC0BITS IPC0bits __attribute__((__sfr__));


extern volatile uint16_t IPC1 __attribute__((__sfr__));
typedef struct tagIPC1BITS {
  uint16_t DMA0IP:3;
  uint16_t :5;
  uint16_t CCP1IP:3;
  uint16_t :1;
  uint16_t CCT1IP:3;
} IPC1BITS;
extern volatile IPC1BITS IPC1bits __attribute__((__sfr__));


extern volatile uint16_t IPC2 __attribute__((__sfr__));
typedef struct tagIPC2BITS {
  uint16_t DMA1IP:3;
  uint16_t :1;
  uint16_t SPI1RXIP:3;
  uint16_t :1;
  uint16_t SPI1TXIP:3;
  uint16_t :1;
  uint16_t U1RXIP:3;
} IPC2BITS;
extern volatile IPC2BITS IPC2bits __attribute__((__sfr__));


extern volatile uint16_t IPC3 __attribute__((__sfr__));
typedef struct tagIPC3BITS {
  uint16_t U1TXIP:3;
  uint16_t :1;
  uint16_t ECCSBEIP:3;
  uint16_t :1;
  uint16_t NVMIP:3;
  uint16_t :1;
  uint16_t INT1IP:3;
} IPC3BITS;
extern volatile IPC3BITS IPC3bits __attribute__((__sfr__));


extern volatile uint16_t IPC4 __attribute__((__sfr__));
typedef struct tagIPC4BITS {
  uint16_t SI2C1IP:3;
  uint16_t :1;
  uint16_t MI2C1IP:3;
  uint16_t :1;
  uint16_t DMA2IP:3;
  uint16_t :1;
  uint16_t CNCIP:3;
} IPC4BITS;
extern volatile IPC4BITS IPC4bits __attribute__((__sfr__));


extern volatile uint16_t IPC5 __attribute__((__sfr__));
typedef struct tagIPC5BITS {
  uint16_t INT2IP:3;
  uint16_t :1;
  uint16_t DMA3IP:3;
  uint16_t :1;
  uint16_t DMA4IP:3;
  uint16_t :1;
  uint16_t CCP2IP:3;
} IPC5BITS;
extern volatile IPC5BITS IPC5bits __attribute__((__sfr__));


extern volatile uint16_t IPC6 __attribute__((__sfr__));
typedef struct tagIPC6BITS {
  uint16_t CCT2IP:3;
  uint16_t :1;
  uint16_t C1IP:3;
  uint16_t :1;
  uint16_t INT3IP:3;
  uint16_t :1;
  uint16_t U2RXIP:3;
} IPC6BITS;
extern volatile IPC6BITS IPC6bits __attribute__((__sfr__));


extern volatile uint16_t IPC7 __attribute__((__sfr__));
typedef struct tagIPC7BITS {
  uint16_t U2TXIP:3;
  uint16_t :1;
  uint16_t SPI2RXIP:3;
  uint16_t :1;
  uint16_t SPI2TXIP:3;
  uint16_t :1;
  uint16_t C1RXIP:3;
} IPC7BITS;
extern volatile IPC7BITS IPC7bits __attribute__((__sfr__));


extern volatile uint16_t IPC8 __attribute__((__sfr__));
typedef struct tagIPC8BITS {
  uint16_t C2RXIP:3;
  uint16_t :1;
  uint16_t C2IP:3;
  uint16_t :1;
  uint16_t DMA5IP:3;
  uint16_t :1;
  uint16_t CCP3IP:3;
} IPC8BITS;
extern volatile IPC8BITS IPC8bits __attribute__((__sfr__));


extern volatile uint16_t IPC9 __attribute__((__sfr__));
typedef struct tagIPC9BITS {
  uint16_t CCT3IP:3;
  uint16_t :1;
  uint16_t SI2C2IP:3;
  uint16_t :1;
  uint16_t MI2C2IP:3;
} IPC9BITS;
extern volatile IPC9BITS IPC9bits __attribute__((__sfr__));


extern volatile uint16_t IPC10 __attribute__((__sfr__));
typedef struct tagIPC10BITS {
  uint16_t CCP4IP:3;
  uint16_t :1;
  uint16_t CCT4IP:3;
  uint16_t :5;
  uint16_t CCP5IP:3;
} IPC10BITS;
extern volatile IPC10BITS IPC10bits __attribute__((__sfr__));


extern volatile uint16_t IPC11 __attribute__((__sfr__));
typedef struct tagIPC11BITS {
  uint16_t CCT5IP:3;
  uint16_t :1;
  uint16_t DMTIP:3;
  uint16_t :1;
  uint16_t CCP6IP:3;
  uint16_t :1;
  uint16_t CCT6IP:3;
} IPC11BITS;
extern volatile IPC11BITS IPC11bits __attribute__((__sfr__));


extern volatile uint16_t IPC12 __attribute__((__sfr__));
typedef struct tagIPC12BITS {
  uint16_t QEI1IP:3;
  uint16_t :1;
  uint16_t U1EIP:3;
  uint16_t :1;
  uint16_t U2EIP:3;
  uint16_t :1;
  uint16_t CRCIP:3;
} IPC12BITS;
extern volatile IPC12BITS IPC12bits __attribute__((__sfr__));


extern volatile uint16_t IPC13 __attribute__((__sfr__));
typedef struct tagIPC13BITS {
  uint16_t C1TXIP:3;
  uint16_t :1;
  uint16_t C2TXIP:3;
} IPC13BITS;
extern volatile IPC13BITS IPC13bits __attribute__((__sfr__));


extern volatile uint16_t IPC15 __attribute__((__sfr__));
typedef struct tagIPC15BITS {
  uint16_t :4;
  uint16_t ICDIP:3;
  uint16_t :1;
  uint16_t JTAGIP:3;
  uint16_t :1;
  uint16_t PTGSTEPIP:3;
} IPC15BITS;
extern volatile IPC15BITS IPC15bits __attribute__((__sfr__));


extern volatile uint16_t IPC16 __attribute__((__sfr__));
typedef struct tagIPC16BITS {
  uint16_t I2C1BCIP:3;
  uint16_t :1;
  uint16_t I2C2BCIP:3;
  uint16_t :5;
  uint16_t PWM1IP:3;
} IPC16BITS;
extern volatile IPC16BITS IPC16bits __attribute__((__sfr__));


extern volatile uint16_t IPC17 __attribute__((__sfr__));
typedef struct tagIPC17BITS {
  uint16_t PWM2IP:3;
  uint16_t :1;
  uint16_t PWM3IP:3;
  uint16_t :1;
  uint16_t PWM4IP:3;
} IPC17BITS;
extern volatile IPC17BITS IPC17bits __attribute__((__sfr__));


extern volatile uint16_t IPC18 __attribute__((__sfr__));
typedef struct tagIPC18BITS {
  uint16_t :12;
  uint16_t CNDIP:3;
} IPC18BITS;
extern volatile IPC18BITS IPC18bits __attribute__((__sfr__));


extern volatile uint16_t IPC19 __attribute__((__sfr__));
typedef struct tagIPC19BITS {
  uint16_t CNEIP:3;
  uint16_t :1;
  uint16_t CMP1IP:3;
} IPC19BITS;
extern volatile IPC19BITS IPC19bits __attribute__((__sfr__));


extern volatile uint16_t IPC20 __attribute__((__sfr__));
typedef struct tagIPC20BITS {
  uint16_t :4;
  uint16_t PTGWDTIP:3;
  uint16_t :1;
  uint16_t PTG0IP:3;
  uint16_t :1;
  uint16_t PTG1IP:3;
} IPC20BITS;
extern volatile IPC20BITS IPC20bits __attribute__((__sfr__));


extern volatile uint16_t IPC21 __attribute__((__sfr__));
typedef struct tagIPC21BITS {
  uint16_t PTG2IP:3;
  uint16_t :1;
  uint16_t PTG3IP:3;
  uint16_t :1;
  uint16_t SENT1IP:3;
  uint16_t :1;
  uint16_t SENT1EIP:3;
} IPC21BITS;
extern volatile IPC21BITS IPC21bits __attribute__((__sfr__));


extern volatile uint16_t IPC22 __attribute__((__sfr__));
typedef struct tagIPC22BITS {
  uint16_t SENT2IP:3;
  uint16_t :1;
  uint16_t SENT2EIP:3;
  uint16_t :1;
  uint16_t ADCIP:3;
  uint16_t :1;
  uint16_t ADCAN0IP:3;
} IPC22BITS;
extern volatile IPC22BITS IPC22bits __attribute__((__sfr__));


extern volatile uint16_t IPC23 __attribute__((__sfr__));
typedef struct tagIPC23BITS {
  uint16_t ADCAN1IP:3;
  uint16_t :1;
  uint16_t ADCAN2IP:3;
  uint16_t :1;
  uint16_t ADCAN3IP:3;
  uint16_t :1;
  uint16_t ADCAN4IP:3;
} IPC23BITS;
extern volatile IPC23BITS IPC23bits __attribute__((__sfr__));


extern volatile uint16_t IPC24 __attribute__((__sfr__));
typedef struct tagIPC24BITS {
  uint16_t ADCAN5IP:3;
  uint16_t :1;
  uint16_t ADCAN6IP:3;
  uint16_t :1;
  uint16_t ADCAN7IP:3;
  uint16_t :1;
  uint16_t ADCAN8IP:3;
} IPC24BITS;
extern volatile IPC24BITS IPC24bits __attribute__((__sfr__));


extern volatile uint16_t IPC25 __attribute__((__sfr__));
typedef struct tagIPC25BITS {
  uint16_t ADCAN9IP:3;
  uint16_t :1;
  uint16_t ADCAN10IP:3;
  uint16_t :1;
  uint16_t ADCAN11IP:3;
  uint16_t :1;
  uint16_t ADCAN12IP:3;
} IPC25BITS;
extern volatile IPC25BITS IPC25bits __attribute__((__sfr__));


extern volatile uint16_t IPC26 __attribute__((__sfr__));
typedef struct tagIPC26BITS {
  uint16_t ADCAN13IP:3;
  uint16_t :1;
  uint16_t ADCAN14IP:3;
  uint16_t :1;
  uint16_t ADCAN15IP:3;
  uint16_t :1;
  uint16_t ADCAN16IP:3;
} IPC26BITS;
extern volatile IPC26BITS IPC26bits __attribute__((__sfr__));


extern volatile uint16_t IPC27 __attribute__((__sfr__));
typedef struct tagIPC27BITS {
  uint16_t ADCAN17IP:3;
  uint16_t :1;
  uint16_t ADCAN18IP:3;
  uint16_t :1;
  uint16_t ADCAN19IP:3;
  uint16_t :1;
  uint16_t ADCAN20IP:3;
} IPC27BITS;
extern volatile IPC27BITS IPC27bits __attribute__((__sfr__));


extern volatile uint16_t IPC28 __attribute__((__sfr__));
typedef struct tagIPC28BITS {
  uint16_t :12;
  uint16_t ADFLTIP:3;
} IPC28BITS;
extern volatile IPC28BITS IPC28bits __attribute__((__sfr__));


extern volatile uint16_t IPC29 __attribute__((__sfr__));
typedef struct tagIPC29BITS {
  uint16_t ADCMP0IP:3;
  uint16_t :1;
  uint16_t ADCMP1IP:3;
  uint16_t :1;
  uint16_t ADCMP2IP:3;
  uint16_t :1;
  uint16_t ADCMP3IP:3;
} IPC29BITS;
extern volatile IPC29BITS IPC29bits __attribute__((__sfr__));


extern volatile uint16_t IPC30 __attribute__((__sfr__));
typedef struct tagIPC30BITS {
  uint16_t ADFLTR0IP:3;
  uint16_t :1;
  uint16_t ADFLTR1IP:3;
  uint16_t :1;
  uint16_t ADFLTR2IP:3;
  uint16_t :1;
  uint16_t ADFLTR3IP:3;
} IPC30BITS;
extern volatile IPC30BITS IPC30bits __attribute__((__sfr__));


extern volatile uint16_t IPC31 __attribute__((__sfr__));
typedef struct tagIPC31BITS {
  uint16_t CLC1PEIP:3;
  uint16_t :1;
  uint16_t CLC2PEIP:3;
  uint16_t :1;
  uint16_t SPI1IP:3;
  uint16_t :1;
  uint16_t SPI2IP:3;
} IPC31BITS;
extern volatile IPC31BITS IPC31bits __attribute__((__sfr__));


extern volatile uint16_t IPC32 __attribute__((__sfr__));
typedef struct tagIPC32BITS {
  uint16_t :4;
  uint16_t MSIS1IP:3;
  uint16_t :1;
  uint16_t MSIAIP:3;
  uint16_t :1;
  uint16_t MSIBIP:3;
} IPC32BITS;
extern volatile IPC32BITS IPC32bits __attribute__((__sfr__));


extern volatile uint16_t IPC33 __attribute__((__sfr__));
typedef struct tagIPC33BITS {
  uint16_t MSICIP:3;
  uint16_t :1;
  uint16_t MSIDIP:3;
  uint16_t :1;
  uint16_t MSIEIP:3;
  uint16_t :1;
  uint16_t MSIFIP:3;
} IPC33BITS;
extern volatile IPC33BITS IPC33bits __attribute__((__sfr__));


extern volatile uint16_t IPC34 __attribute__((__sfr__));
typedef struct tagIPC34BITS {
  uint16_t MSIGIP:3;
  uint16_t :1;
  uint16_t MSIHIP:3;
  uint16_t :1;
  uint16_t MSIDTIP:3;
  uint16_t :1;
  uint16_t MSIWFEIP:3;
} IPC34BITS;
extern volatile IPC34BITS IPC34bits __attribute__((__sfr__));


extern volatile uint16_t IPC35 __attribute__((__sfr__));
typedef struct tagIPC35BITS {
  uint16_t MSIFLTIP:3;
  uint16_t :1;
  uint16_t S1RSTIP:3;
} IPC35BITS;
extern volatile IPC35BITS IPC35bits __attribute__((__sfr__));


extern volatile uint16_t IPC36 __attribute__((__sfr__));
typedef struct tagIPC36BITS {
  uint16_t :8;
  uint16_t S1BRKIP:3;
} IPC36BITS;
extern volatile IPC36BITS IPC36bits __attribute__((__sfr__));


extern volatile uint16_t IPC37 __attribute__((__sfr__));
typedef struct tagIPC37BITS {
  uint16_t :4;
  uint16_t CCP7IP:3;
  uint16_t :1;
  uint16_t CCT7IP:3;
} IPC37BITS;
extern volatile IPC37BITS IPC37bits __attribute__((__sfr__));


extern volatile uint16_t IPC38 __attribute__((__sfr__));
typedef struct tagIPC38BITS {
  uint16_t CCP8IP:3;
  uint16_t :1;
  uint16_t CCT8IP:3;
} IPC38BITS;
extern volatile IPC38BITS IPC38bits __attribute__((__sfr__));


extern volatile uint16_t IPC39 __attribute__((__sfr__));
typedef struct tagIPC39BITS {
  uint16_t :4;
  uint16_t S1CLKFIP:3;
} IPC39BITS;
extern volatile IPC39BITS IPC39bits __attribute__((__sfr__));


extern volatile uint16_t IPC42 __attribute__((__sfr__));
typedef struct tagIPC42BITS {
  uint16_t ADFIFOIP:3;
  uint16_t :1;
  uint16_t PEVTAIP:3;
  uint16_t :1;
  uint16_t PEVTBIP:3;
  uint16_t :1;
  uint16_t PEVTCIP:3;
} IPC42BITS;
extern volatile IPC42BITS IPC42bits __attribute__((__sfr__));


extern volatile uint16_t IPC43 __attribute__((__sfr__));
typedef struct tagIPC43BITS {
  uint16_t PEVTDIP:3;
  uint16_t :1;
  uint16_t PEVTEIP:3;
  uint16_t :1;
  uint16_t PEVTFIP:3;
  uint16_t :1;
  uint16_t CLC3PEIP:3;
} IPC43BITS;
extern volatile IPC43BITS IPC43bits __attribute__((__sfr__));


extern volatile uint16_t IPC44 __attribute__((__sfr__));
typedef struct tagIPC44BITS {
  uint16_t CLC4PEIP:3;
  uint16_t :1;
  uint16_t CLC1NEIP:3;
  uint16_t :1;
  uint16_t CLC2NEIP:3;
  uint16_t :1;
  uint16_t CLC3NEIP:3;
} IPC44BITS;
extern volatile IPC44BITS IPC44bits __attribute__((__sfr__));


extern volatile uint16_t IPC45 __attribute__((__sfr__));
typedef struct tagIPC45BITS {
  uint16_t CLC4NEIP:3;
} IPC45BITS;
extern volatile IPC45BITS IPC45bits __attribute__((__sfr__));


extern volatile uint16_t IPC47 __attribute__((__sfr__));
typedef struct tagIPC47BITS {
  uint16_t :4;
  uint16_t U1EVTIP:3;
  uint16_t :1;
  uint16_t U2EVTIP:3;
} IPC47BITS;
extern volatile IPC47BITS IPC47bits __attribute__((__sfr__));


extern volatile uint16_t INTCON1 __attribute__((__sfr__));
typedef struct tagINTCON1BITS {
  uint16_t :1;
  uint16_t OSCFAIL:1;
  uint16_t STKERR:1;
  uint16_t ADDRERR:1;
  uint16_t MATHERR:1;
  uint16_t DMACERR:1;
  uint16_t DIV0ERR:1;
  uint16_t SFTACERR:1;
  uint16_t COVTE:1;
  uint16_t OVBTE:1;
  uint16_t OVATE:1;
  uint16_t COVBERR:1;
  uint16_t COVAERR:1;
  uint16_t OVBERR:1;
  uint16_t OVAERR:1;
  uint16_t NSTDIS:1;
} INTCON1BITS;
extern volatile INTCON1BITS INTCON1bits __attribute__((__sfr__));


extern volatile uint16_t INTCON2 __attribute__((__sfr__));
typedef struct tagINTCON2BITS {
  uint16_t INT0EP:1;
  uint16_t INT1EP:1;
  uint16_t INT2EP:1;
  uint16_t INT3EP:1;
  uint16_t :4;
  uint16_t AIVTEN:1;
  uint16_t :4;
  uint16_t SWTRAP:1;
  uint16_t DISI:1;
  uint16_t GIE:1;
} INTCON2BITS;
extern volatile INTCON2BITS INTCON2bits __attribute__((__sfr__));


extern volatile uint16_t INTCON3 __attribute__((__sfr__));
typedef struct tagINTCON3BITS {
  uint16_t APLL:1;
  uint16_t :3;
  uint16_t DOOVR:1;
  uint16_t DAE:1;
  uint16_t CAN2:1;
  uint16_t :1;
  uint16_t NAE:1;
  uint16_t CAN:1;
} INTCON3BITS;
extern volatile INTCON3BITS INTCON3bits __attribute__((__sfr__));


extern volatile uint16_t INTCON4 __attribute__((__sfr__));
typedef struct tagINTCON4BITS {
  uint16_t SGHT:1;
  uint16_t ECCDBE:1;
} INTCON4BITS;
extern volatile INTCON4BITS INTCON4bits __attribute__((__sfr__));


extern volatile uint16_t INTTREG __attribute__((__sfr__));
__extension__ typedef struct tagINTTREGBITS {
  union {
    struct {
      uint16_t VECNUM:8;
      uint16_t ILR:4;
      uint16_t :1;
      uint16_t VHOLD:1;
      uint16_t TMODE:1;
      uint16_t IRQCPU:1;
    };
    struct {
      uint16_t VECNUM0:1;
      uint16_t VECNUM1:1;
      uint16_t VECNUM2:1;
      uint16_t VECNUM3:1;
      uint16_t VECNUM4:1;
      uint16_t VECNUM5:1;
      uint16_t VECNUM6:1;
      uint16_t VECNUM7:1;
      uint16_t ILR0:1;
      uint16_t ILR1:1;
      uint16_t ILR2:1;
      uint16_t ILR3:1;
    };
  };
} INTTREGBITS;
extern volatile INTTREGBITS INTTREGbits __attribute__((__sfr__));


extern volatile uint16_t NVMCON __attribute__((__sfr__));
__extension__ typedef struct tagNVMCONBITS {
  union {
    struct {
      uint16_t NVMOP:4;
      uint16_t :4;
      uint16_t URERR:1;
      uint16_t RPDF:1;
      uint16_t P2ACTIV:1;
      uint16_t SFTSWP:1;
      uint16_t NVMSIDL:1;
      uint16_t WRERR:1;
      uint16_t WREN:1;
      uint16_t WR:1;
    };
    struct {
      uint16_t NVMOP0:1;
      uint16_t NVMOP1:1;
      uint16_t NVMOP2:1;
      uint16_t NVMOP3:1;
    };
  };
} NVMCONBITS;
extern volatile NVMCONBITS NVMCONbits __attribute__((__sfr__));


extern volatile uint16_t NVMADR __attribute__((__sfr__));
__extension__ typedef struct tagNVMADRBITS {
  union {
    struct {
      uint16_t :1;
      uint16_t NVMADRL:15;
    };
    struct {
      uint16_t :1;
      uint16_t NVMADR:15;
    };
  };
} NVMADRBITS;
extern volatile NVMADRBITS NVMADRbits __attribute__((__sfr__));


extern volatile uint16_t NVMADRL __attribute__((__sfr__));
__extension__ typedef struct tagNVMADRLBITS {
  union {
    struct {
      uint16_t :1;
      uint16_t NVMADRL:15;
    };
    struct {
      uint16_t :1;
      uint16_t NVMADR:15;
    };
  };
} NVMADRLBITS;
extern volatile NVMADRLBITS NVMADRLbits __attribute__((__sfr__));


extern volatile uint16_t NVMADRH __attribute__((__sfr__));
__extension__ typedef struct tagNVMADRHBITS {
  union {
    struct {
      uint16_t NVMADRH:8;
    };
    struct {
      uint16_t NVMADRU:8;
    };
  };
} NVMADRHBITS;
extern volatile NVMADRHBITS NVMADRHbits __attribute__((__sfr__));


extern volatile uint16_t NVMADRU __attribute__((__sfr__));
__extension__ typedef struct tagNVMADRUBITS {
  union {
    struct {
      uint16_t NVMADRH:8;
    };
    struct {
      uint16_t NVMADRU:8;
    };
  };
} NVMADRUBITS;
extern volatile NVMADRUBITS NVMADRUbits __attribute__((__sfr__));


extern volatile uint16_t NVMKEY __attribute__((__sfr__));

extern volatile uint16_t NVMSRCADDR __attribute__((__sfr__));
typedef struct tagNVMSRCADDRBITS {
  uint16_t :1;
  uint16_t NVMSRCADRL:15;
} NVMSRCADDRBITS;
extern volatile NVMSRCADDRBITS NVMSRCADDRbits __attribute__((__sfr__));


extern volatile uint16_t NVMSRCADR __attribute__((__sfr__));
typedef struct tagNVMSRCADRBITS {
  uint16_t :1;
  uint16_t NVMSRCADRL:15;
} NVMSRCADRBITS;
extern volatile NVMSRCADRBITS NVMSRCADRbits __attribute__((__sfr__));


extern volatile uint16_t NVMSRCADRL __attribute__((__sfr__));
typedef struct tagNVMSRCADRLBITS {
  uint16_t :1;
  uint16_t NVMSRCADRL:15;
} NVMSRCADRLBITS;
extern volatile NVMSRCADRLBITS NVMSRCADRLbits __attribute__((__sfr__));


extern volatile uint16_t NVMSRCADRH __attribute__((__sfr__));
typedef struct tagNVMSRCADRHBITS {
  uint16_t NVMSRCADRH:8;
} NVMSRCADRHBITS;
extern volatile NVMSRCADRHBITS NVMSRCADRHbits __attribute__((__sfr__));


extern volatile uint16_t BIASCON __attribute__((__sfr__));
typedef struct tagBIASCONBITS {
  uint16_t I10EN0:1;
  uint16_t I10EN1:1;
  uint16_t I10EN2:1;
  uint16_t I10EN3:1;
  uint16_t :11;
  uint16_t ON:1;
} BIASCONBITS;
extern volatile BIASCONBITS BIASCONbits __attribute__((__sfr__));


extern volatile uint16_t IBIASCONL __attribute__((__sfr__));
typedef struct tagIBIASCONLBITS {
  uint16_t SNKEN0:1;
  uint16_t SRCEN0:1;
  uint16_t GENSNKEN0:1;
  uint16_t GENSRCEN0:1;
  uint16_t SHRSNKEN0:1;
  uint16_t SHRSRCEN0:1;
  uint16_t :2;
  uint16_t SNKEN1:1;
  uint16_t SRCEN1:1;
  uint16_t GENSNKEN1:1;
  uint16_t GENSRCEN1:1;
  uint16_t SHRSNKEN1:1;
  uint16_t SHRSRCEN1:1;
} IBIASCONLBITS;
extern volatile IBIASCONLBITS IBIASCONLbits __attribute__((__sfr__));


extern volatile uint16_t IBIASCONH __attribute__((__sfr__));
typedef struct tagIBIASCONHBITS {
  uint16_t SNKEN2:1;
  uint16_t SRCEN2:1;
  uint16_t GENSNKEN2:1;
  uint16_t GENSRCEN2:1;
  uint16_t SHRSNKEN2:1;
  uint16_t SHRSRCEN2:1;
  uint16_t :2;
  uint16_t SNKEN3:1;
  uint16_t SRCEN3:1;
  uint16_t GENSNKEN3:1;
  uint16_t GENSRCEN3:1;
  uint16_t SHRSNKEN3:1;
  uint16_t SHRSRCEN3:1;
} IBIASCONHBITS;
extern volatile IBIASCONHBITS IBIASCONHbits __attribute__((__sfr__));


extern volatile uint16_t PTGCST __attribute__((__sfr__));
typedef struct tagPTGCSTBITS {
  uint16_t PTGITM:2;
  uint16_t :3;
  uint16_t PTGBUSY:1;
  uint16_t PTGWTO:1;
  uint16_t PTGSTRT:1;
  uint16_t PTGIVIS:1;
  uint16_t PTGSSEN:1;
  uint16_t PTGSWT:1;
  uint16_t :1;
  uint16_t PTGTOGL:1;
  uint16_t PTGSIDL:1;
  uint16_t :1;
  uint16_t PTGEN:1;
} PTGCSTBITS;
extern volatile PTGCSTBITS PTGCSTbits __attribute__((__sfr__));


extern volatile uint16_t PTGCON __attribute__((__sfr__));
typedef struct tagPTGCONBITS {
  uint16_t PTGWDT:3;
  uint16_t :1;
  uint16_t PTGPWD:4;
  uint16_t PTGDIV:5;
  uint16_t PTGCLK:3;
} PTGCONBITS;
extern volatile PTGCONBITS PTGCONbits __attribute__((__sfr__));


extern volatile uint16_t PTGBTE __attribute__((__sfr__));
typedef struct tagPTGBTEBITS {
  uint16_t PTGBTE0:1;
  uint16_t PTGBTE1:1;
  uint16_t PTGBTE2:1;
  uint16_t PTGBTE3:1;
  uint16_t PTGBTE4:1;
  uint16_t PTGBTE5:1;
  uint16_t PTGBTE6:1;
  uint16_t PTGBTE7:1;
  uint16_t PTGBTE8:1;
  uint16_t PTGBTE9:1;
  uint16_t PTGBTE10:1;
  uint16_t PTGBTE11:1;
  uint16_t PTGBTE12:1;
  uint16_t PTGBTE13:1;
  uint16_t PTGBTE14:1;
  uint16_t PTGBTE15:1;
} PTGBTEBITS;
extern volatile PTGBTEBITS PTGBTEbits __attribute__((__sfr__));


extern volatile uint16_t PTGBTEH __attribute__((__sfr__));
typedef struct tagPTGBTEHBITS {
  uint16_t PTGBTE16:1;
  uint16_t PTGBTE17:1;
  uint16_t PTGBTE18:1;
  uint16_t PTGBTE19:1;
  uint16_t PTGBTE20:1;
  uint16_t PTGBTE21:1;
  uint16_t PTGBTE22:1;
  uint16_t PTGBTE23:1;
  uint16_t PTGBTE24:1;
  uint16_t PTGBTE25:1;
  uint16_t PTGBTE26:1;
  uint16_t PTGBTE27:1;
  uint16_t PTGBTE28:1;
  uint16_t PTGBTE29:1;
  uint16_t PTGBTE30:1;
  uint16_t PTGBTE31:1;
} PTGBTEHBITS;
extern volatile PTGBTEHBITS PTGBTEHbits __attribute__((__sfr__));


extern volatile uint16_t PTGHOLD __attribute__((__sfr__));

extern volatile uint16_t PTGT0LIM __attribute__((__sfr__));

extern volatile uint16_t PTGT1LIM __attribute__((__sfr__));

extern volatile uint16_t PTGSDLIM __attribute__((__sfr__));

extern volatile uint16_t PTGC0LIM __attribute__((__sfr__));

extern volatile uint16_t PTGC1LIM __attribute__((__sfr__));

extern volatile uint16_t PTGADJ __attribute__((__sfr__));

extern volatile uint16_t PTGL0 __attribute__((__sfr__));

extern volatile uint16_t PTGQPTR __attribute__((__sfr__));
typedef struct tagPTGQPTRBITS {
  uint16_t PTGQPTR:5;
} PTGQPTRBITS;
extern volatile PTGQPTRBITS PTGQPTRbits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE0 __attribute__((__sfr__));
typedef struct tagPTGQUE0BITS {
  uint16_t STEP0:8;
  uint16_t STEP1:8;
} PTGQUE0BITS;
extern volatile PTGQUE0BITS PTGQUE0bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE1 __attribute__((__sfr__));
typedef struct tagPTGQUE1BITS {
  uint16_t STEP2:8;
  uint16_t STEP3:8;
} PTGQUE1BITS;
extern volatile PTGQUE1BITS PTGQUE1bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE2 __attribute__((__sfr__));
typedef struct tagPTGQUE2BITS {
  uint16_t STEP4:8;
  uint16_t STEP5:8;
} PTGQUE2BITS;
extern volatile PTGQUE2BITS PTGQUE2bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE3 __attribute__((__sfr__));
typedef struct tagPTGQUE3BITS {
  uint16_t STEP6:8;
  uint16_t STEP7:8;
} PTGQUE3BITS;
extern volatile PTGQUE3BITS PTGQUE3bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE4 __attribute__((__sfr__));
typedef struct tagPTGQUE4BITS {
  uint16_t STEP8:8;
  uint16_t STEP9:8;
} PTGQUE4BITS;
extern volatile PTGQUE4BITS PTGQUE4bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE5 __attribute__((__sfr__));
typedef struct tagPTGQUE5BITS {
  uint16_t STEP10:8;
  uint16_t STEP11:8;
} PTGQUE5BITS;
extern volatile PTGQUE5BITS PTGQUE5bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE6 __attribute__((__sfr__));
typedef struct tagPTGQUE6BITS {
  uint16_t STEP12:8;
  uint16_t STEP13:8;
} PTGQUE6BITS;
extern volatile PTGQUE6BITS PTGQUE6bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE7 __attribute__((__sfr__));
typedef struct tagPTGQUE7BITS {
  uint16_t STEP14:8;
  uint16_t STEP15:8;
} PTGQUE7BITS;
extern volatile PTGQUE7BITS PTGQUE7bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE8 __attribute__((__sfr__));
typedef struct tagPTGQUE8BITS {
  uint16_t STEP16:8;
  uint16_t STEP17:8;
} PTGQUE8BITS;
extern volatile PTGQUE8BITS PTGQUE8bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE9 __attribute__((__sfr__));
typedef struct tagPTGQUE9BITS {
  uint16_t STEP18:8;
  uint16_t STEP19:8;
} PTGQUE9BITS;
extern volatile PTGQUE9BITS PTGQUE9bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE10 __attribute__((__sfr__));
typedef struct tagPTGQUE10BITS {
  uint16_t STEP20:8;
  uint16_t STEP21:8;
} PTGQUE10BITS;
extern volatile PTGQUE10BITS PTGQUE10bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE11 __attribute__((__sfr__));
typedef struct tagPTGQUE11BITS {
  uint16_t STEP22:8;
  uint16_t STEP23:8;
} PTGQUE11BITS;
extern volatile PTGQUE11BITS PTGQUE11bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE12 __attribute__((__sfr__));
typedef struct tagPTGQUE12BITS {
  uint16_t STEP24:8;
  uint16_t STEP25:8;
} PTGQUE12BITS;
extern volatile PTGQUE12BITS PTGQUE12bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE13 __attribute__((__sfr__));
typedef struct tagPTGQUE13BITS {
  uint16_t STEP26:8;
  uint16_t STEP27:8;
} PTGQUE13BITS;
extern volatile PTGQUE13BITS PTGQUE13bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE14 __attribute__((__sfr__));
typedef struct tagPTGQUE14BITS {
  uint16_t STEP28:8;
  uint16_t STEP29:8;
} PTGQUE14BITS;
extern volatile PTGQUE14BITS PTGQUE14bits __attribute__((__sfr__));


extern volatile uint16_t PTGQUE15 __attribute__((__sfr__));
typedef struct tagPTGQUE15BITS {
  uint16_t STEP30:8;
  uint16_t STEP31:8;
} PTGQUE15BITS;
extern volatile PTGQUE15BITS PTGQUE15bits __attribute__((__sfr__));


extern volatile uint16_t CCP1CON1L __attribute__((__sfr__));
__extension__ typedef struct tagCCP1CON1LBITS {
  union {
    struct {
      uint16_t MOD:4;
      uint16_t CCSEL:1;
      uint16_t T32:1;
      uint16_t TMRPS:2;
      uint16_t CLKSEL:3;
      uint16_t TMRSYNC:1;
      uint16_t CCPSLP:1;
      uint16_t CCPSIDL:1;
      uint16_t :1;
      uint16_t CCPON:1;
    };
    struct {
      uint16_t MOD0:1;
      uint16_t MOD1:1;
      uint16_t MOD2:1;
      uint16_t MOD3:1;
      uint16_t :1;
      uint16_t TMR32:1;
      uint16_t TMRPS0:1;
      uint16_t TMRPS1:1;
      uint16_t CLKSEL0:1;
      uint16_t CLKSEL1:1;
      uint16_t CLKSEL2:1;
    };
    struct {
      uint16_t CCPMOD:4;
    };
    struct {
      uint16_t CCPMOD0:1;
      uint16_t CCPMOD1:1;
      uint16_t CCPMOD2:1;
      uint16_t CCPMOD3:1;
    };
  };
} CCP1CON1LBITS;
extern volatile CCP1CON1LBITS CCP1CON1Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP1CON1H __attribute__((__sfr__));
__extension__ typedef struct tagCCP1CON1HBITS {
  union {
    struct {
      uint16_t SYNC:5;
      uint16_t ALTSYNC:1;
      uint16_t ONESHOT:1;
      uint16_t TRIGEN:1;
      uint16_t OPS:4;
      uint16_t :2;
      uint16_t RTRGEN:1;
      uint16_t OPSSRC:1;
    };
    struct {
      uint16_t SYNC0:1;
      uint16_t SYNC1:1;
      uint16_t SYNC2:1;
      uint16_t SYNC3:1;
      uint16_t SYNC4:1;
      uint16_t :3;
      uint16_t OPS0:1;
      uint16_t OPS1:1;
      uint16_t OPS2:1;
      uint16_t OPS3:1;
      uint16_t :3;
      uint16_t OPSRC:1;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS:4;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS0:1;
      uint16_t IOPS1:1;
      uint16_t IOPS2:1;
      uint16_t IOPS3:1;
    };
  };
} CCP1CON1HBITS;
extern volatile CCP1CON1HBITS CCP1CON1Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP1CON2L __attribute__((__sfr__));
__extension__ typedef struct tagCCP1CON2LBITS {
  union {
    struct {
      uint16_t ASDG:8;
      uint16_t :4;
      uint16_t SSDG:1;
      uint16_t :1;
      uint16_t ASDGM:1;
      uint16_t PWMRSEN:1;
    };
    struct {
      uint16_t ASDG0:1;
      uint16_t ASDG1:1;
      uint16_t ASDG2:1;
      uint16_t ASDG3:1;
      uint16_t ASDG4:1;
      uint16_t ASDG5:1;
      uint16_t ASDG6:1;
      uint16_t ASDG7:1;
    };
  };
} CCP1CON2LBITS;
extern volatile CCP1CON2LBITS CCP1CON2Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP1CON2H __attribute__((__sfr__));
__extension__ typedef struct tagCCP1CON2HBITS {
  union {
    struct {
      uint16_t ICS:3;
      uint16_t AUXOUT:2;
      uint16_t :1;
      uint16_t ICGSM:2;
      uint16_t OCAEN:1;
      uint16_t :6;
      uint16_t OENSYNC:1;
    };
    struct {
      uint16_t ICS0:1;
      uint16_t ICS1:1;
      uint16_t ICS2:1;
      uint16_t AUXOUT0:1;
      uint16_t AUXOUT1:1;
      uint16_t :1;
      uint16_t ICGSM0:1;
      uint16_t ICGSM1:1;
    };
    struct {
      uint16_t ICSEL:3;
    };
    struct {
      uint16_t ICSEL0:1;
      uint16_t ICSEL1:1;
      uint16_t ICSEL2:1;
    };
  };
} CCP1CON2HBITS;
extern volatile CCP1CON2HBITS CCP1CON2Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP1CON3H __attribute__((__sfr__));
__extension__ typedef struct tagCCP1CON3HBITS {
  union {
    struct {
      uint16_t :2;
      uint16_t PSSACE:2;
      uint16_t :1;
      uint16_t POLACE:1;
      uint16_t :6;
      uint16_t OSCNT:3;
      uint16_t OETRIG:1;
    };
    struct {
      uint16_t :2;
      uint16_t PSSACE0:1;
      uint16_t PSSACE1:1;
      uint16_t :8;
      uint16_t OSCNT0:1;
      uint16_t OSCNT1:1;
      uint16_t OSCNT2:1;
    };
  };
} CCP1CON3HBITS;
extern volatile CCP1CON3HBITS CCP1CON3Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP1STAT __attribute__((__sfr__));
__extension__ typedef struct tagCCP1STATBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP1STATBITS;
extern volatile CCP1STATBITS CCP1STATbits __attribute__((__sfr__));


extern volatile uint16_t CCP1STATL __attribute__((__sfr__));
__extension__ typedef struct tagCCP1STATLBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP1STATLBITS;
extern volatile CCP1STATLBITS CCP1STATLbits __attribute__((__sfr__));


extern volatile uint16_t CCP1STATH __attribute__((__sfr__));
typedef struct tagCCP1STATHBITS {
  uint16_t RAWIP:1;
  uint16_t RBWIP:1;
  uint16_t TMRLWIP:1;
  uint16_t TMRHWIP:1;
  uint16_t PRLWIP:1;
} CCP1STATHBITS;
extern volatile CCP1STATHBITS CCP1STATHbits __attribute__((__sfr__));


extern volatile uint16_t CCP1TMRL __attribute__((__sfr__));

extern volatile uint16_t CCP1TMRH __attribute__((__sfr__));

extern volatile uint16_t CCP1PRL __attribute__((__sfr__));

extern volatile uint16_t CCP1PRH __attribute__((__sfr__));

extern volatile uint16_t CCP1RA __attribute__((__sfr__));

extern volatile uint16_t CCP1RAL __attribute__((__sfr__));

extern volatile uint16_t CCP1RB __attribute__((__sfr__));

extern volatile uint16_t CCP1RBL __attribute__((__sfr__));

extern volatile uint16_t CCP1BUFL __attribute__((__sfr__));

extern volatile uint16_t CCP1BUFH __attribute__((__sfr__));

extern volatile uint16_t CCP2CON1L __attribute__((__sfr__));
__extension__ typedef struct tagCCP2CON1LBITS {
  union {
    struct {
      uint16_t MOD:4;
      uint16_t CCSEL:1;
      uint16_t T32:1;
      uint16_t TMRPS:2;
      uint16_t CLKSEL:3;
      uint16_t TMRSYNC:1;
      uint16_t CCPSLP:1;
      uint16_t CCPSIDL:1;
      uint16_t :1;
      uint16_t CCPON:1;
    };
    struct {
      uint16_t MOD0:1;
      uint16_t MOD1:1;
      uint16_t MOD2:1;
      uint16_t MOD3:1;
      uint16_t :1;
      uint16_t TMR32:1;
      uint16_t TMRPS0:1;
      uint16_t TMRPS1:1;
      uint16_t CLKSEL0:1;
      uint16_t CLKSEL1:1;
      uint16_t CLKSEL2:1;
    };
    struct {
      uint16_t CCPMOD:4;
    };
    struct {
      uint16_t CCPMOD0:1;
      uint16_t CCPMOD1:1;
      uint16_t CCPMOD2:1;
      uint16_t CCPMOD3:1;
    };
  };
} CCP2CON1LBITS;
extern volatile CCP2CON1LBITS CCP2CON1Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP2CON1H __attribute__((__sfr__));
__extension__ typedef struct tagCCP2CON1HBITS {
  union {
    struct {
      uint16_t SYNC:5;
      uint16_t ALTSYNC:1;
      uint16_t ONESHOT:1;
      uint16_t TRIGEN:1;
      uint16_t OPS:4;
      uint16_t :2;
      uint16_t RTRGEN:1;
      uint16_t OPSSRC:1;
    };
    struct {
      uint16_t SYNC0:1;
      uint16_t SYNC1:1;
      uint16_t SYNC2:1;
      uint16_t SYNC3:1;
      uint16_t SYNC4:1;
      uint16_t :3;
      uint16_t OPS0:1;
      uint16_t OPS1:1;
      uint16_t OPS2:1;
      uint16_t OPS3:1;
      uint16_t :3;
      uint16_t OPSRC:1;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS:4;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS0:1;
      uint16_t IOPS1:1;
      uint16_t IOPS2:1;
      uint16_t IOPS3:1;
    };
  };
} CCP2CON1HBITS;
extern volatile CCP2CON1HBITS CCP2CON1Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP2CON2L __attribute__((__sfr__));
__extension__ typedef struct tagCCP2CON2LBITS {
  union {
    struct {
      uint16_t ASDG:8;
      uint16_t :4;
      uint16_t SSDG:1;
      uint16_t :1;
      uint16_t ASDGM:1;
      uint16_t PWMRSEN:1;
    };
    struct {
      uint16_t ASDG0:1;
      uint16_t ASDG1:1;
      uint16_t ASDG2:1;
      uint16_t ASDG3:1;
      uint16_t ASDG4:1;
      uint16_t ASDG5:1;
      uint16_t ASDG6:1;
      uint16_t ASDG7:1;
    };
  };
} CCP2CON2LBITS;
extern volatile CCP2CON2LBITS CCP2CON2Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP2CON2H __attribute__((__sfr__));
__extension__ typedef struct tagCCP2CON2HBITS {
  union {
    struct {
      uint16_t ICS:3;
      uint16_t AUXOUT:2;
      uint16_t :1;
      uint16_t ICGSM:2;
      uint16_t OCAEN:1;
      uint16_t :6;
      uint16_t OENSYNC:1;
    };
    struct {
      uint16_t ICS0:1;
      uint16_t ICS1:1;
      uint16_t ICS2:1;
      uint16_t AUXOUT0:1;
      uint16_t AUXOUT1:1;
      uint16_t :1;
      uint16_t ICGSM0:1;
      uint16_t ICGSM1:1;
    };
    struct {
      uint16_t ICSEL:3;
    };
    struct {
      uint16_t ICSEL0:1;
      uint16_t ICSEL1:1;
      uint16_t ICSEL2:1;
    };
  };
} CCP2CON2HBITS;
extern volatile CCP2CON2HBITS CCP2CON2Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP2CON3H __attribute__((__sfr__));
__extension__ typedef struct tagCCP2CON3HBITS {
  union {
    struct {
      uint16_t :2;
      uint16_t PSSACE:2;
      uint16_t :1;
      uint16_t POLACE:1;
      uint16_t :6;
      uint16_t OSCNT:3;
      uint16_t OETRIG:1;
    };
    struct {
      uint16_t :2;
      uint16_t PSSACE0:1;
      uint16_t PSSACE1:1;
      uint16_t :8;
      uint16_t OSCNT0:1;
      uint16_t OSCNT1:1;
      uint16_t OSCNT2:1;
    };
  };
} CCP2CON3HBITS;
extern volatile CCP2CON3HBITS CCP2CON3Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP2STAT __attribute__((__sfr__));
__extension__ typedef struct tagCCP2STATBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP2STATBITS;
extern volatile CCP2STATBITS CCP2STATbits __attribute__((__sfr__));


extern volatile uint16_t CCP2STATL __attribute__((__sfr__));
__extension__ typedef struct tagCCP2STATLBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP2STATLBITS;
extern volatile CCP2STATLBITS CCP2STATLbits __attribute__((__sfr__));


extern volatile uint16_t CCP2STATH __attribute__((__sfr__));
typedef struct tagCCP2STATHBITS {
  uint16_t RAWIP:1;
  uint16_t RBWIP:1;
  uint16_t TMRLWIP:1;
  uint16_t TMRHWIP:1;
  uint16_t PRLWIP:1;
} CCP2STATHBITS;
extern volatile CCP2STATHBITS CCP2STATHbits __attribute__((__sfr__));


extern volatile uint16_t CCP2TMRL __attribute__((__sfr__));

extern volatile uint16_t CCP2TMRH __attribute__((__sfr__));

extern volatile uint16_t CCP2PRL __attribute__((__sfr__));

extern volatile uint16_t CCP2PRH __attribute__((__sfr__));

extern volatile uint16_t CCP2RA __attribute__((__sfr__));

extern volatile uint16_t CCP2RAL __attribute__((__sfr__));

extern volatile uint16_t CCP2RB __attribute__((__sfr__));

extern volatile uint16_t CCP2RBL __attribute__((__sfr__));

extern volatile uint16_t CCP2BUFL __attribute__((__sfr__));

extern volatile uint16_t CCP2BUFH __attribute__((__sfr__));

extern volatile uint16_t CCP3CON1L __attribute__((__sfr__));
__extension__ typedef struct tagCCP3CON1LBITS {
  union {
    struct {
      uint16_t MOD:4;
      uint16_t CCSEL:1;
      uint16_t T32:1;
      uint16_t TMRPS:2;
      uint16_t CLKSEL:3;
      uint16_t TMRSYNC:1;
      uint16_t CCPSLP:1;
      uint16_t CCPSIDL:1;
      uint16_t :1;
      uint16_t CCPON:1;
    };
    struct {
      uint16_t MOD0:1;
      uint16_t MOD1:1;
      uint16_t MOD2:1;
      uint16_t MOD3:1;
      uint16_t :1;
      uint16_t TMR32:1;
      uint16_t TMRPS0:1;
      uint16_t TMRPS1:1;
      uint16_t CLKSEL0:1;
      uint16_t CLKSEL1:1;
      uint16_t CLKSEL2:1;
    };
    struct {
      uint16_t CCPMOD:4;
    };
    struct {
      uint16_t CCPMOD0:1;
      uint16_t CCPMOD1:1;
      uint16_t CCPMOD2:1;
      uint16_t CCPMOD3:1;
    };
  };
} CCP3CON1LBITS;
extern volatile CCP3CON1LBITS CCP3CON1Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP3CON1H __attribute__((__sfr__));
__extension__ typedef struct tagCCP3CON1HBITS {
  union {
    struct {
      uint16_t SYNC:5;
      uint16_t ALTSYNC:1;
      uint16_t ONESHOT:1;
      uint16_t TRIGEN:1;
      uint16_t OPS:4;
      uint16_t :2;
      uint16_t RTRGEN:1;
      uint16_t OPSSRC:1;
    };
    struct {
      uint16_t SYNC0:1;
      uint16_t SYNC1:1;
      uint16_t SYNC2:1;
      uint16_t SYNC3:1;
      uint16_t SYNC4:1;
      uint16_t :3;
      uint16_t OPS0:1;
      uint16_t OPS1:1;
      uint16_t OPS2:1;
      uint16_t OPS3:1;
      uint16_t :3;
      uint16_t OPSRC:1;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS:4;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS0:1;
      uint16_t IOPS1:1;
      uint16_t IOPS2:1;
      uint16_t IOPS3:1;
    };
  };
} CCP3CON1HBITS;
extern volatile CCP3CON1HBITS CCP3CON1Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP3CON2L __attribute__((__sfr__));
__extension__ typedef struct tagCCP3CON2LBITS {
  union {
    struct {
      uint16_t ASDG:8;
      uint16_t :4;
      uint16_t SSDG:1;
      uint16_t :1;
      uint16_t ASDGM:1;
      uint16_t PWMRSEN:1;
    };
    struct {
      uint16_t ASDG0:1;
      uint16_t ASDG1:1;
      uint16_t ASDG2:1;
      uint16_t ASDG3:1;
      uint16_t ASDG4:1;
      uint16_t ASDG5:1;
      uint16_t ASDG6:1;
      uint16_t ASDG7:1;
    };
  };
} CCP3CON2LBITS;
extern volatile CCP3CON2LBITS CCP3CON2Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP3CON2H __attribute__((__sfr__));
__extension__ typedef struct tagCCP3CON2HBITS {
  union {
    struct {
      uint16_t ICS:3;
      uint16_t AUXOUT:2;
      uint16_t :1;
      uint16_t ICGSM:2;
      uint16_t OCAEN:1;
      uint16_t :6;
      uint16_t OENSYNC:1;
    };
    struct {
      uint16_t ICS0:1;
      uint16_t ICS1:1;
      uint16_t ICS2:1;
      uint16_t AUXOUT0:1;
      uint16_t AUXOUT1:1;
      uint16_t :1;
      uint16_t ICGSM0:1;
      uint16_t ICGSM1:1;
    };
    struct {
      uint16_t ICSEL:3;
    };
    struct {
      uint16_t ICSEL0:1;
      uint16_t ICSEL1:1;
      uint16_t ICSEL2:1;
    };
  };
} CCP3CON2HBITS;
extern volatile CCP3CON2HBITS CCP3CON2Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP3CON3H __attribute__((__sfr__));
__extension__ typedef struct tagCCP3CON3HBITS {
  union {
    struct {
      uint16_t :2;
      uint16_t PSSACE:2;
      uint16_t :1;
      uint16_t POLACE:1;
      uint16_t :6;
      uint16_t OSCNT:3;
      uint16_t OETRIG:1;
    };
    struct {
      uint16_t :2;
      uint16_t PSSACE0:1;
      uint16_t PSSACE1:1;
      uint16_t :8;
      uint16_t OSCNT0:1;
      uint16_t OSCNT1:1;
      uint16_t OSCNT2:1;
    };
  };
} CCP3CON3HBITS;
extern volatile CCP3CON3HBITS CCP3CON3Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP3STAT __attribute__((__sfr__));
__extension__ typedef struct tagCCP3STATBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP3STATBITS;
extern volatile CCP3STATBITS CCP3STATbits __attribute__((__sfr__));


extern volatile uint16_t CCP3STATL __attribute__((__sfr__));
__extension__ typedef struct tagCCP3STATLBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP3STATLBITS;
extern volatile CCP3STATLBITS CCP3STATLbits __attribute__((__sfr__));


extern volatile uint16_t CCP3STATH __attribute__((__sfr__));
typedef struct tagCCP3STATHBITS {
  uint16_t RAWIP:1;
  uint16_t RBWIP:1;
  uint16_t TMRLWIP:1;
  uint16_t TMRHWIP:1;
  uint16_t PRLWIP:1;
} CCP3STATHBITS;
extern volatile CCP3STATHBITS CCP3STATHbits __attribute__((__sfr__));


extern volatile uint16_t CCP3TMRL __attribute__((__sfr__));

extern volatile uint16_t CCP3TMRH __attribute__((__sfr__));

extern volatile uint16_t CCP3PRL __attribute__((__sfr__));

extern volatile uint16_t CCP3PRH __attribute__((__sfr__));

extern volatile uint16_t CCP3RA __attribute__((__sfr__));

extern volatile uint16_t CCP3RAL __attribute__((__sfr__));

extern volatile uint16_t CCP3RB __attribute__((__sfr__));

extern volatile uint16_t CCP3RBL __attribute__((__sfr__));

extern volatile uint16_t CCP3BUFL __attribute__((__sfr__));

extern volatile uint16_t CCP3BUFH __attribute__((__sfr__));

extern volatile uint16_t CCP4CON1L __attribute__((__sfr__));
__extension__ typedef struct tagCCP4CON1LBITS {
  union {
    struct {
      uint16_t MOD:4;
      uint16_t CCSEL:1;
      uint16_t T32:1;
      uint16_t TMRPS:2;
      uint16_t CLKSEL:3;
      uint16_t TMRSYNC:1;
      uint16_t CCPSLP:1;
      uint16_t CCPSIDL:1;
      uint16_t :1;
      uint16_t CCPON:1;
    };
    struct {
      uint16_t MOD0:1;
      uint16_t MOD1:1;
      uint16_t MOD2:1;
      uint16_t MOD3:1;
      uint16_t :1;
      uint16_t TMR32:1;
      uint16_t TMRPS0:1;
      uint16_t TMRPS1:1;
      uint16_t CLKSEL0:1;
      uint16_t CLKSEL1:1;
      uint16_t CLKSEL2:1;
    };
    struct {
      uint16_t CCPMOD:4;
    };
    struct {
      uint16_t CCPMOD0:1;
      uint16_t CCPMOD1:1;
      uint16_t CCPMOD2:1;
      uint16_t CCPMOD3:1;
    };
  };
} CCP4CON1LBITS;
extern volatile CCP4CON1LBITS CCP4CON1Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP4CON1H __attribute__((__sfr__));
__extension__ typedef struct tagCCP4CON1HBITS {
  union {
    struct {
      uint16_t SYNC:5;
      uint16_t ALTSYNC:1;
      uint16_t ONESHOT:1;
      uint16_t TRIGEN:1;
      uint16_t OPS:4;
      uint16_t :2;
      uint16_t RTRGEN:1;
      uint16_t OPSSRC:1;
    };
    struct {
      uint16_t SYNC0:1;
      uint16_t SYNC1:1;
      uint16_t SYNC2:1;
      uint16_t SYNC3:1;
      uint16_t SYNC4:1;
      uint16_t :3;
      uint16_t OPS0:1;
      uint16_t OPS1:1;
      uint16_t OPS2:1;
      uint16_t OPS3:1;
      uint16_t :3;
      uint16_t OPSRC:1;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS:4;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS0:1;
      uint16_t IOPS1:1;
      uint16_t IOPS2:1;
      uint16_t IOPS3:1;
    };
  };
} CCP4CON1HBITS;
extern volatile CCP4CON1HBITS CCP4CON1Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP4CON2L __attribute__((__sfr__));
__extension__ typedef struct tagCCP4CON2LBITS {
  union {
    struct {
      uint16_t ASDG:8;
      uint16_t :4;
      uint16_t SSDG:1;
      uint16_t :1;
      uint16_t ASDGM:1;
      uint16_t PWMRSEN:1;
    };
    struct {
      uint16_t ASDG0:1;
      uint16_t ASDG1:1;
      uint16_t ASDG2:1;
      uint16_t ASDG3:1;
      uint16_t ASDG4:1;
      uint16_t ASDG5:1;
      uint16_t ASDG6:1;
      uint16_t ASDG7:1;
    };
  };
} CCP4CON2LBITS;
extern volatile CCP4CON2LBITS CCP4CON2Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP4CON2H __attribute__((__sfr__));
__extension__ typedef struct tagCCP4CON2HBITS {
  union {
    struct {
      uint16_t ICS:3;
      uint16_t AUXOUT:2;
      uint16_t :1;
      uint16_t ICGSM:2;
      uint16_t OCAEN:1;
      uint16_t :6;
      uint16_t OENSYNC:1;
    };
    struct {
      uint16_t ICS0:1;
      uint16_t ICS1:1;
      uint16_t ICS2:1;
      uint16_t AUXOUT0:1;
      uint16_t AUXOUT1:1;
      uint16_t :1;
      uint16_t ICGSM0:1;
      uint16_t ICGSM1:1;
    };
    struct {
      uint16_t ICSEL:3;
    };
    struct {
      uint16_t ICSEL0:1;
      uint16_t ICSEL1:1;
      uint16_t ICSEL2:1;
    };
  };
} CCP4CON2HBITS;
extern volatile CCP4CON2HBITS CCP4CON2Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP4CON3H __attribute__((__sfr__));
__extension__ typedef struct tagCCP4CON3HBITS {
  union {
    struct {
      uint16_t :2;
      uint16_t PSSACE:2;
      uint16_t :1;
      uint16_t POLACE:1;
      uint16_t :6;
      uint16_t OSCNT:3;
      uint16_t OETRIG:1;
    };
    struct {
      uint16_t :2;
      uint16_t PSSACE0:1;
      uint16_t PSSACE1:1;
      uint16_t :8;
      uint16_t OSCNT0:1;
      uint16_t OSCNT1:1;
      uint16_t OSCNT2:1;
    };
  };
} CCP4CON3HBITS;
extern volatile CCP4CON3HBITS CCP4CON3Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP4STAT __attribute__((__sfr__));
__extension__ typedef struct tagCCP4STATBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP4STATBITS;
extern volatile CCP4STATBITS CCP4STATbits __attribute__((__sfr__));


extern volatile uint16_t CCP4STATL __attribute__((__sfr__));
__extension__ typedef struct tagCCP4STATLBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP4STATLBITS;
extern volatile CCP4STATLBITS CCP4STATLbits __attribute__((__sfr__));


extern volatile uint16_t CCP4STATH __attribute__((__sfr__));
typedef struct tagCCP4STATHBITS {
  uint16_t RAWIP:1;
  uint16_t RBWIP:1;
  uint16_t TMRLWIP:1;
  uint16_t TMRHWIP:1;
  uint16_t PRLWIP:1;
} CCP4STATHBITS;
extern volatile CCP4STATHBITS CCP4STATHbits __attribute__((__sfr__));


extern volatile uint16_t CCP4TMRL __attribute__((__sfr__));

extern volatile uint16_t CCP4TMRH __attribute__((__sfr__));

extern volatile uint16_t CCP4PRL __attribute__((__sfr__));

extern volatile uint16_t CCP4PRH __attribute__((__sfr__));

extern volatile uint16_t CCP4RA __attribute__((__sfr__));

extern volatile uint16_t CCP4RAL __attribute__((__sfr__));

extern volatile uint16_t CCP4RB __attribute__((__sfr__));

extern volatile uint16_t CCP4RBL __attribute__((__sfr__));

extern volatile uint16_t CCP4BUFL __attribute__((__sfr__));

extern volatile uint16_t CCP4BUFH __attribute__((__sfr__));

extern volatile uint16_t CCP5CON1L __attribute__((__sfr__));
__extension__ typedef struct tagCCP5CON1LBITS {
  union {
    struct {
      uint16_t MOD:4;
      uint16_t CCSEL:1;
      uint16_t T32:1;
      uint16_t TMRPS:2;
      uint16_t CLKSEL:3;
      uint16_t TMRSYNC:1;
      uint16_t CCPSLP:1;
      uint16_t CCPSIDL:1;
      uint16_t :1;
      uint16_t CCPON:1;
    };
    struct {
      uint16_t MOD0:1;
      uint16_t MOD1:1;
      uint16_t MOD2:1;
      uint16_t MOD3:1;
      uint16_t :1;
      uint16_t TMR32:1;
      uint16_t TMRPS0:1;
      uint16_t TMRPS1:1;
      uint16_t CLKSEL0:1;
      uint16_t CLKSEL1:1;
      uint16_t CLKSEL2:1;
    };
    struct {
      uint16_t CCPMOD:4;
    };
    struct {
      uint16_t CCPMOD0:1;
      uint16_t CCPMOD1:1;
      uint16_t CCPMOD2:1;
      uint16_t CCPMOD3:1;
    };
  };
} CCP5CON1LBITS;
extern volatile CCP5CON1LBITS CCP5CON1Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP5CON1H __attribute__((__sfr__));
__extension__ typedef struct tagCCP5CON1HBITS {
  union {
    struct {
      uint16_t SYNC:5;
      uint16_t ALTSYNC:1;
      uint16_t ONESHOT:1;
      uint16_t TRIGEN:1;
      uint16_t OPS:4;
      uint16_t :2;
      uint16_t RTRGEN:1;
      uint16_t OPSSRC:1;
    };
    struct {
      uint16_t SYNC0:1;
      uint16_t SYNC1:1;
      uint16_t SYNC2:1;
      uint16_t SYNC3:1;
      uint16_t SYNC4:1;
      uint16_t :3;
      uint16_t OPS0:1;
      uint16_t OPS1:1;
      uint16_t OPS2:1;
      uint16_t OPS3:1;
      uint16_t :3;
      uint16_t OPSRC:1;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS:4;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS0:1;
      uint16_t IOPS1:1;
      uint16_t IOPS2:1;
      uint16_t IOPS3:1;
    };
  };
} CCP5CON1HBITS;
extern volatile CCP5CON1HBITS CCP5CON1Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP5CON2L __attribute__((__sfr__));
__extension__ typedef struct tagCCP5CON2LBITS {
  union {
    struct {
      uint16_t ASDG:8;
      uint16_t :4;
      uint16_t SSDG:1;
      uint16_t :1;
      uint16_t ASDGM:1;
      uint16_t PWMRSEN:1;
    };
    struct {
      uint16_t ASDG0:1;
      uint16_t ASDG1:1;
      uint16_t ASDG2:1;
      uint16_t ASDG3:1;
      uint16_t ASDG4:1;
      uint16_t ASDG5:1;
      uint16_t ASDG6:1;
      uint16_t ASDG7:1;
    };
  };
} CCP5CON2LBITS;
extern volatile CCP5CON2LBITS CCP5CON2Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP5CON2H __attribute__((__sfr__));
__extension__ typedef struct tagCCP5CON2HBITS {
  union {
    struct {
      uint16_t ICS:3;
      uint16_t AUXOUT:2;
      uint16_t :1;
      uint16_t ICGSM:2;
      uint16_t OCAEN:1;
      uint16_t :6;
      uint16_t OENSYNC:1;
    };
    struct {
      uint16_t ICS0:1;
      uint16_t ICS1:1;
      uint16_t ICS2:1;
      uint16_t AUXOUT0:1;
      uint16_t AUXOUT1:1;
      uint16_t :1;
      uint16_t ICGSM0:1;
      uint16_t ICGSM1:1;
    };
    struct {
      uint16_t ICSEL:3;
    };
    struct {
      uint16_t ICSEL0:1;
      uint16_t ICSEL1:1;
      uint16_t ICSEL2:1;
    };
  };
} CCP5CON2HBITS;
extern volatile CCP5CON2HBITS CCP5CON2Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP5CON3H __attribute__((__sfr__));
__extension__ typedef struct tagCCP5CON3HBITS {
  union {
    struct {
      uint16_t :2;
      uint16_t PSSACE:2;
      uint16_t :1;
      uint16_t POLACE:1;
      uint16_t :6;
      uint16_t OSCNT:3;
      uint16_t OETRIG:1;
    };
    struct {
      uint16_t :2;
      uint16_t PSSACE0:1;
      uint16_t PSSACE1:1;
      uint16_t :8;
      uint16_t OSCNT0:1;
      uint16_t OSCNT1:1;
      uint16_t OSCNT2:1;
    };
  };
} CCP5CON3HBITS;
extern volatile CCP5CON3HBITS CCP5CON3Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP5STAT __attribute__((__sfr__));
__extension__ typedef struct tagCCP5STATBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP5STATBITS;
extern volatile CCP5STATBITS CCP5STATbits __attribute__((__sfr__));


extern volatile uint16_t CCP5STATL __attribute__((__sfr__));
__extension__ typedef struct tagCCP5STATLBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP5STATLBITS;
extern volatile CCP5STATLBITS CCP5STATLbits __attribute__((__sfr__));


extern volatile uint16_t CCP5STATH __attribute__((__sfr__));
typedef struct tagCCP5STATHBITS {
  uint16_t RAWIP:1;
  uint16_t RBWIP:1;
  uint16_t TMRLWIP:1;
  uint16_t TMRHWIP:1;
  uint16_t PRLWIP:1;
} CCP5STATHBITS;
extern volatile CCP5STATHBITS CCP5STATHbits __attribute__((__sfr__));


extern volatile uint16_t CCP5TMRL __attribute__((__sfr__));

extern volatile uint16_t CCP5TMRH __attribute__((__sfr__));

extern volatile uint16_t CCP5PRL __attribute__((__sfr__));

extern volatile uint16_t CCP5PRH __attribute__((__sfr__));

extern volatile uint16_t CCP5RA __attribute__((__sfr__));

extern volatile uint16_t CCP5RAL __attribute__((__sfr__));

extern volatile uint16_t CCP5RB __attribute__((__sfr__));

extern volatile uint16_t CCP5RBL __attribute__((__sfr__));

extern volatile uint16_t CCP5BUFL __attribute__((__sfr__));

extern volatile uint16_t CCP5BUFH __attribute__((__sfr__));

extern volatile uint16_t CCP6CON1L __attribute__((__sfr__));
__extension__ typedef struct tagCCP6CON1LBITS {
  union {
    struct {
      uint16_t MOD:4;
      uint16_t CCSEL:1;
      uint16_t T32:1;
      uint16_t TMRPS:2;
      uint16_t CLKSEL:3;
      uint16_t TMRSYNC:1;
      uint16_t CCPSLP:1;
      uint16_t CCPSIDL:1;
      uint16_t :1;
      uint16_t CCPON:1;
    };
    struct {
      uint16_t MOD0:1;
      uint16_t MOD1:1;
      uint16_t MOD2:1;
      uint16_t MOD3:1;
      uint16_t :1;
      uint16_t TMR32:1;
      uint16_t TMRPS0:1;
      uint16_t TMRPS1:1;
      uint16_t CLKSEL0:1;
      uint16_t CLKSEL1:1;
      uint16_t CLKSEL2:1;
    };
    struct {
      uint16_t CCPMOD:4;
    };
    struct {
      uint16_t CCPMOD0:1;
      uint16_t CCPMOD1:1;
      uint16_t CCPMOD2:1;
      uint16_t CCPMOD3:1;
    };
  };
} CCP6CON1LBITS;
extern volatile CCP6CON1LBITS CCP6CON1Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP6CON1H __attribute__((__sfr__));
__extension__ typedef struct tagCCP6CON1HBITS {
  union {
    struct {
      uint16_t SYNC:5;
      uint16_t ALTSYNC:1;
      uint16_t ONESHOT:1;
      uint16_t TRIGEN:1;
      uint16_t OPS:4;
      uint16_t :2;
      uint16_t RTRGEN:1;
      uint16_t OPSSRC:1;
    };
    struct {
      uint16_t SYNC0:1;
      uint16_t SYNC1:1;
      uint16_t SYNC2:1;
      uint16_t SYNC3:1;
      uint16_t SYNC4:1;
      uint16_t :3;
      uint16_t OPS0:1;
      uint16_t OPS1:1;
      uint16_t OPS2:1;
      uint16_t OPS3:1;
      uint16_t :3;
      uint16_t OPSRC:1;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS:4;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS0:1;
      uint16_t IOPS1:1;
      uint16_t IOPS2:1;
      uint16_t IOPS3:1;
    };
  };
} CCP6CON1HBITS;
extern volatile CCP6CON1HBITS CCP6CON1Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP6CON2L __attribute__((__sfr__));
__extension__ typedef struct tagCCP6CON2LBITS {
  union {
    struct {
      uint16_t ASDG:8;
      uint16_t :4;
      uint16_t SSDG:1;
      uint16_t :1;
      uint16_t ASDGM:1;
      uint16_t PWMRSEN:1;
    };
    struct {
      uint16_t ASDG0:1;
      uint16_t ASDG1:1;
      uint16_t ASDG2:1;
      uint16_t ASDG3:1;
      uint16_t ASDG4:1;
      uint16_t ASDG5:1;
      uint16_t ASDG6:1;
      uint16_t ASDG7:1;
    };
  };
} CCP6CON2LBITS;
extern volatile CCP6CON2LBITS CCP6CON2Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP6CON2H __attribute__((__sfr__));
__extension__ typedef struct tagCCP6CON2HBITS {
  union {
    struct {
      uint16_t ICS:3;
      uint16_t AUXOUT:2;
      uint16_t :1;
      uint16_t ICGSM:2;
      uint16_t OCAEN:1;
      uint16_t :6;
      uint16_t OENSYNC:1;
    };
    struct {
      uint16_t ICS0:1;
      uint16_t ICS1:1;
      uint16_t ICS2:1;
      uint16_t AUXOUT0:1;
      uint16_t AUXOUT1:1;
      uint16_t :1;
      uint16_t ICGSM0:1;
      uint16_t ICGSM1:1;
    };
    struct {
      uint16_t ICSEL:3;
    };
    struct {
      uint16_t ICSEL0:1;
      uint16_t ICSEL1:1;
      uint16_t ICSEL2:1;
    };
  };
} CCP6CON2HBITS;
extern volatile CCP6CON2HBITS CCP6CON2Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP6CON3H __attribute__((__sfr__));
__extension__ typedef struct tagCCP6CON3HBITS {
  union {
    struct {
      uint16_t :2;
      uint16_t PSSACE:2;
      uint16_t :1;
      uint16_t POLACE:1;
      uint16_t :6;
      uint16_t OSCNT:3;
      uint16_t OETRIG:1;
    };
    struct {
      uint16_t :2;
      uint16_t PSSACE0:1;
      uint16_t PSSACE1:1;
      uint16_t :8;
      uint16_t OSCNT0:1;
      uint16_t OSCNT1:1;
      uint16_t OSCNT2:1;
    };
  };
} CCP6CON3HBITS;
extern volatile CCP6CON3HBITS CCP6CON3Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP6STAT __attribute__((__sfr__));
__extension__ typedef struct tagCCP6STATBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP6STATBITS;
extern volatile CCP6STATBITS CCP6STATbits __attribute__((__sfr__));


extern volatile uint16_t CCP6STATL __attribute__((__sfr__));
__extension__ typedef struct tagCCP6STATLBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP6STATLBITS;
extern volatile CCP6STATLBITS CCP6STATLbits __attribute__((__sfr__));


extern volatile uint16_t CCP6STATH __attribute__((__sfr__));
typedef struct tagCCP6STATHBITS {
  uint16_t RAWIP:1;
  uint16_t RBWIP:1;
  uint16_t TMRLWIP:1;
  uint16_t TMRHWIP:1;
  uint16_t PRLWIP:1;
} CCP6STATHBITS;
extern volatile CCP6STATHBITS CCP6STATHbits __attribute__((__sfr__));


extern volatile uint16_t CCP6TMRL __attribute__((__sfr__));

extern volatile uint16_t CCP6TMRH __attribute__((__sfr__));

extern volatile uint16_t CCP6PRL __attribute__((__sfr__));

extern volatile uint16_t CCP6PRH __attribute__((__sfr__));

extern volatile uint16_t CCP6RA __attribute__((__sfr__));

extern volatile uint16_t CCP6RAL __attribute__((__sfr__));

extern volatile uint16_t CCP6RB __attribute__((__sfr__));

extern volatile uint16_t CCP6RBL __attribute__((__sfr__));

extern volatile uint16_t CCP6BUFL __attribute__((__sfr__));

extern volatile uint16_t CCP6BUFH __attribute__((__sfr__));

extern volatile uint16_t CCP7CON1L __attribute__((__sfr__));
__extension__ typedef struct tagCCP7CON1LBITS {
  union {
    struct {
      uint16_t MOD:4;
      uint16_t CCSEL:1;
      uint16_t T32:1;
      uint16_t TMRPS:2;
      uint16_t CLKSEL:3;
      uint16_t TMRSYNC:1;
      uint16_t CCPSLP:1;
      uint16_t CCPSIDL:1;
      uint16_t :1;
      uint16_t CCPON:1;
    };
    struct {
      uint16_t MOD0:1;
      uint16_t MOD1:1;
      uint16_t MOD2:1;
      uint16_t MOD3:1;
      uint16_t :1;
      uint16_t TMR32:1;
      uint16_t TMRPS0:1;
      uint16_t TMRPS1:1;
      uint16_t CLKSEL0:1;
      uint16_t CLKSEL1:1;
      uint16_t CLKSEL2:1;
    };
    struct {
      uint16_t CCPMOD:4;
    };
    struct {
      uint16_t CCPMOD0:1;
      uint16_t CCPMOD1:1;
      uint16_t CCPMOD2:1;
      uint16_t CCPMOD3:1;
    };
  };
} CCP7CON1LBITS;
extern volatile CCP7CON1LBITS CCP7CON1Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP7CON1H __attribute__((__sfr__));
__extension__ typedef struct tagCCP7CON1HBITS {
  union {
    struct {
      uint16_t SYNC:5;
      uint16_t ALTSYNC:1;
      uint16_t ONESHOT:1;
      uint16_t TRIGEN:1;
      uint16_t OPS:4;
      uint16_t :2;
      uint16_t RTRGEN:1;
      uint16_t OPSSRC:1;
    };
    struct {
      uint16_t SYNC0:1;
      uint16_t SYNC1:1;
      uint16_t SYNC2:1;
      uint16_t SYNC3:1;
      uint16_t SYNC4:1;
      uint16_t :3;
      uint16_t OPS0:1;
      uint16_t OPS1:1;
      uint16_t OPS2:1;
      uint16_t OPS3:1;
      uint16_t :3;
      uint16_t OPSRC:1;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS:4;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS0:1;
      uint16_t IOPS1:1;
      uint16_t IOPS2:1;
      uint16_t IOPS3:1;
    };
  };
} CCP7CON1HBITS;
extern volatile CCP7CON1HBITS CCP7CON1Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP7CON2L __attribute__((__sfr__));
__extension__ typedef struct tagCCP7CON2LBITS {
  union {
    struct {
      uint16_t ASDG:8;
      uint16_t :4;
      uint16_t SSDG:1;
      uint16_t :1;
      uint16_t ASDGM:1;
      uint16_t PWMRSEN:1;
    };
    struct {
      uint16_t ASDG0:1;
      uint16_t ASDG1:1;
      uint16_t ASDG2:1;
      uint16_t ASDG3:1;
      uint16_t ASDG4:1;
      uint16_t ASDG5:1;
      uint16_t ASDG6:1;
      uint16_t ASDG7:1;
    };
  };
} CCP7CON2LBITS;
extern volatile CCP7CON2LBITS CCP7CON2Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP7CON2H __attribute__((__sfr__));
__extension__ typedef struct tagCCP7CON2HBITS {
  union {
    struct {
      uint16_t ICS:3;
      uint16_t AUXOUT:2;
      uint16_t :1;
      uint16_t ICGSM:2;
      uint16_t OCAEN:1;
      uint16_t :6;
      uint16_t OENSYNC:1;
    };
    struct {
      uint16_t ICS0:1;
      uint16_t ICS1:1;
      uint16_t ICS2:1;
      uint16_t AUXOUT0:1;
      uint16_t AUXOUT1:1;
      uint16_t :1;
      uint16_t ICGSM0:1;
      uint16_t ICGSM1:1;
    };
    struct {
      uint16_t ICSEL:3;
    };
    struct {
      uint16_t ICSEL0:1;
      uint16_t ICSEL1:1;
      uint16_t ICSEL2:1;
    };
  };
} CCP7CON2HBITS;
extern volatile CCP7CON2HBITS CCP7CON2Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP7CON3H __attribute__((__sfr__));
__extension__ typedef struct tagCCP7CON3HBITS {
  union {
    struct {
      uint16_t :2;
      uint16_t PSSACE:2;
      uint16_t :1;
      uint16_t POLACE:1;
      uint16_t :6;
      uint16_t OSCNT:3;
      uint16_t OETRIG:1;
    };
    struct {
      uint16_t :2;
      uint16_t PSSACE0:1;
      uint16_t PSSACE1:1;
      uint16_t :8;
      uint16_t OSCNT0:1;
      uint16_t OSCNT1:1;
      uint16_t OSCNT2:1;
    };
  };
} CCP7CON3HBITS;
extern volatile CCP7CON3HBITS CCP7CON3Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP7STAT __attribute__((__sfr__));
__extension__ typedef struct tagCCP7STATBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP7STATBITS;
extern volatile CCP7STATBITS CCP7STATbits __attribute__((__sfr__));


extern volatile uint16_t CCP7STATL __attribute__((__sfr__));
__extension__ typedef struct tagCCP7STATLBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP7STATLBITS;
extern volatile CCP7STATLBITS CCP7STATLbits __attribute__((__sfr__));


extern volatile uint16_t CCP7STATH __attribute__((__sfr__));
typedef struct tagCCP7STATHBITS {
  uint16_t RAWIP:1;
  uint16_t RBWIP:1;
  uint16_t TMRLWIP:1;
  uint16_t TMRHWIP:1;
  uint16_t PRLWIP:1;
} CCP7STATHBITS;
extern volatile CCP7STATHBITS CCP7STATHbits __attribute__((__sfr__));


extern volatile uint16_t CCP7TMRL __attribute__((__sfr__));

extern volatile uint16_t CCP7TMRH __attribute__((__sfr__));

extern volatile uint16_t CCP7PRL __attribute__((__sfr__));

extern volatile uint16_t CCP7PRH __attribute__((__sfr__));

extern volatile uint16_t CCP7RA __attribute__((__sfr__));

extern volatile uint16_t CCP7RAL __attribute__((__sfr__));

extern volatile uint16_t CCP7RB __attribute__((__sfr__));

extern volatile uint16_t CCP7RBL __attribute__((__sfr__));

extern volatile uint16_t CCP7BUFL __attribute__((__sfr__));

extern volatile uint16_t CCP7BUFH __attribute__((__sfr__));

extern volatile uint16_t CCP8CON1L __attribute__((__sfr__));
__extension__ typedef struct tagCCP8CON1LBITS {
  union {
    struct {
      uint16_t MOD:4;
      uint16_t CCSEL:1;
      uint16_t T32:1;
      uint16_t TMRPS:2;
      uint16_t CLKSEL:3;
      uint16_t TMRSYNC:1;
      uint16_t CCPSLP:1;
      uint16_t CCPSIDL:1;
      uint16_t :1;
      uint16_t CCPON:1;
    };
    struct {
      uint16_t MOD0:1;
      uint16_t MOD1:1;
      uint16_t MOD2:1;
      uint16_t MOD3:1;
      uint16_t :1;
      uint16_t TMR32:1;
      uint16_t TMRPS0:1;
      uint16_t TMRPS1:1;
      uint16_t CLKSEL0:1;
      uint16_t CLKSEL1:1;
      uint16_t CLKSEL2:1;
    };
    struct {
      uint16_t CCPMOD:4;
    };
    struct {
      uint16_t CCPMOD0:1;
      uint16_t CCPMOD1:1;
      uint16_t CCPMOD2:1;
      uint16_t CCPMOD3:1;
    };
  };
} CCP8CON1LBITS;
extern volatile CCP8CON1LBITS CCP8CON1Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP8CON1H __attribute__((__sfr__));
__extension__ typedef struct tagCCP8CON1HBITS {
  union {
    struct {
      uint16_t SYNC:5;
      uint16_t ALTSYNC:1;
      uint16_t ONESHOT:1;
      uint16_t TRIGEN:1;
      uint16_t OPS:4;
      uint16_t :2;
      uint16_t RTRGEN:1;
      uint16_t OPSSRC:1;
    };
    struct {
      uint16_t SYNC0:1;
      uint16_t SYNC1:1;
      uint16_t SYNC2:1;
      uint16_t SYNC3:1;
      uint16_t SYNC4:1;
      uint16_t :3;
      uint16_t OPS0:1;
      uint16_t OPS1:1;
      uint16_t OPS2:1;
      uint16_t OPS3:1;
      uint16_t :3;
      uint16_t OPSRC:1;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS:4;
    };
    struct {
      uint16_t :8;
      uint16_t IOPS0:1;
      uint16_t IOPS1:1;
      uint16_t IOPS2:1;
      uint16_t IOPS3:1;
    };
  };
} CCP8CON1HBITS;
extern volatile CCP8CON1HBITS CCP8CON1Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP8CON2L __attribute__((__sfr__));
__extension__ typedef struct tagCCP8CON2LBITS {
  union {
    struct {
      uint16_t ASDG:8;
      uint16_t :4;
      uint16_t SSDG:1;
      uint16_t :1;
      uint16_t ASDGM:1;
      uint16_t PWMRSEN:1;
    };
    struct {
      uint16_t ASDG0:1;
      uint16_t ASDG1:1;
      uint16_t ASDG2:1;
      uint16_t ASDG3:1;
      uint16_t ASDG4:1;
      uint16_t ASDG5:1;
      uint16_t ASDG6:1;
      uint16_t ASDG7:1;
    };
  };
} CCP8CON2LBITS;
extern volatile CCP8CON2LBITS CCP8CON2Lbits __attribute__((__sfr__));


extern volatile uint16_t CCP8CON2H __attribute__((__sfr__));
__extension__ typedef struct tagCCP8CON2HBITS {
  union {
    struct {
      uint16_t ICS:3;
      uint16_t AUXOUT:2;
      uint16_t :1;
      uint16_t ICGSM:2;
      uint16_t OCAEN:1;
      uint16_t :6;
      uint16_t OENSYNC:1;
    };
    struct {
      uint16_t ICS0:1;
      uint16_t ICS1:1;
      uint16_t ICS2:1;
      uint16_t AUXOUT0:1;
      uint16_t AUXOUT1:1;
      uint16_t :1;
      uint16_t ICGSM0:1;
      uint16_t ICGSM1:1;
    };
    struct {
      uint16_t ICSEL:3;
    };
    struct {
      uint16_t ICSEL0:1;
      uint16_t ICSEL1:1;
      uint16_t ICSEL2:1;
    };
  };
} CCP8CON2HBITS;
extern volatile CCP8CON2HBITS CCP8CON2Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP8CON3H __attribute__((__sfr__));
__extension__ typedef struct tagCCP8CON3HBITS {
  union {
    struct {
      uint16_t :2;
      uint16_t PSSACE:2;
      uint16_t :1;
      uint16_t POLACE:1;
      uint16_t :6;
      uint16_t OSCNT:3;
      uint16_t OETRIG:1;
    };
    struct {
      uint16_t :2;
      uint16_t PSSACE0:1;
      uint16_t PSSACE1:1;
      uint16_t :8;
      uint16_t OSCNT0:1;
      uint16_t OSCNT1:1;
      uint16_t OSCNT2:1;
    };
  };
} CCP8CON3HBITS;
extern volatile CCP8CON3HBITS CCP8CON3Hbits __attribute__((__sfr__));


extern volatile uint16_t CCP8STAT __attribute__((__sfr__));
__extension__ typedef struct tagCCP8STATBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP8STATBITS;
extern volatile CCP8STATBITS CCP8STATbits __attribute__((__sfr__));


extern volatile uint16_t CCP8STATL __attribute__((__sfr__));
__extension__ typedef struct tagCCP8STATLBITS {
  union {
    struct {
      uint16_t ICBNE:1;
      uint16_t ICOV:1;
      uint16_t ICDIS:1;
      uint16_t SCEVT:1;
      uint16_t ASEVT:1;
      uint16_t TRCLR:1;
      uint16_t TRSET:1;
      uint16_t CCPTRIG:1;
      uint16_t :2;
      uint16_t ICGARM:1;
    };
    struct {
      uint16_t :7;
      uint16_t TRIG:1;
    };
  };
} CCP8STATLBITS;
extern volatile CCP8STATLBITS CCP8STATLbits __attribute__((__sfr__));


extern volatile uint16_t CCP8STATH __attribute__((__sfr__));
typedef struct tagCCP8STATHBITS {
  uint16_t RAWIP:1;
  uint16_t RBWIP:1;
  uint16_t TMRLWIP:1;
  uint16_t TMRHWIP:1;
  uint16_t PRLWIP:1;
} CCP8STATHBITS;
extern volatile CCP8STATHBITS CCP8STATHbits __attribute__((__sfr__));


extern volatile uint16_t CCP8TMRL __attribute__((__sfr__));

extern volatile uint16_t CCP8TMRH __attribute__((__sfr__));

extern volatile uint16_t CCP8PRL __attribute__((__sfr__));

extern volatile uint16_t CCP8PRH __attribute__((__sfr__));

extern volatile uint16_t CCP8RA __attribute__((__sfr__));

extern volatile uint16_t CCP8RAL __attribute__((__sfr__));

extern volatile uint16_t CCP8RB __attribute__((__sfr__));

extern volatile uint16_t CCP8RBL __attribute__((__sfr__));

extern volatile uint16_t CCP8BUFL __attribute__((__sfr__));

extern volatile uint16_t CCP8BUFH __attribute__((__sfr__));

extern volatile uint16_t DMACON __attribute__((__sfr__));
typedef struct tagDMACONBITS {
  uint16_t PRSSEL:1;
  uint16_t :14;
  uint16_t DMAEN:1;
} DMACONBITS;
extern volatile DMACONBITS DMACONbits __attribute__((__sfr__));


extern volatile uint16_t DMABUF __attribute__((__sfr__));

extern volatile uint16_t DMAL __attribute__((__sfr__));

extern volatile uint16_t DMAH __attribute__((__sfr__));

extern volatile uint16_t DMACH0 __attribute__((__sfr__));
__extension__ typedef struct tagDMACH0BITS {
  union {
    struct {
      uint16_t CHEN:1;
      uint16_t SIZE:1;
      uint16_t TRMODE:2;
      uint16_t DAMODE:2;
      uint16_t SAMODE:2;
      uint16_t CHREQ:1;
      uint16_t RELOAD:1;
      uint16_t NULLW:1;
    };
    struct {
      uint16_t :2;
      uint16_t TRMODE0:1;
      uint16_t TRMODE1:1;
      uint16_t DAMODE0:1;
      uint16_t DAMODE1:1;
      uint16_t SAMODE0:1;
      uint16_t SAMODE1:1;
    };
  };
} DMACH0BITS;
extern volatile DMACH0BITS DMACH0bits __attribute__((__sfr__));


extern volatile uint16_t DMAINT0 __attribute__((__sfr__));
__extension__ typedef struct tagDMAINT0BITS {
  union {
    struct {
      uint16_t HALFEN:1;
      uint16_t :2;
      uint16_t OVRUNIF:1;
      uint16_t HALFIF:1;
      uint16_t DONEIF:1;
      uint16_t LOWIF:1;
      uint16_t HIGHIF:1;
      uint16_t CHSEL:7;
      uint16_t DBUFWF:1;
    };
    struct {
      uint16_t :8;
      uint16_t CHSEL0:1;
      uint16_t CHSEL1:1;
      uint16_t CHSEL2:1;
      uint16_t CHSEL3:1;
      uint16_t CHSEL4:1;
      uint16_t CHSEL5:1;
      uint16_t CHSEL6:1;
    };
  };
} DMAINT0BITS;
extern volatile DMAINT0BITS DMAINT0bits __attribute__((__sfr__));


extern volatile uint16_t DMASRC0 __attribute__((__sfr__));

extern volatile uint16_t DMADST0 __attribute__((__sfr__));

extern volatile uint16_t DMACNT0 __attribute__((__sfr__));

extern volatile uint16_t DMACH1 __attribute__((__sfr__));
__extension__ typedef struct tagDMACH1BITS {
  union {
    struct {
      uint16_t CHEN:1;
      uint16_t SIZE:1;
      uint16_t TRMODE:2;
      uint16_t DAMODE:2;
      uint16_t SAMODE:2;
      uint16_t CHREQ:1;
      uint16_t RELOAD:1;
      uint16_t NULLW:1;
    };
    struct {
      uint16_t :2;
      uint16_t TRMODE0:1;
      uint16_t TRMODE1:1;
      uint16_t DAMODE0:1;
      uint16_t DAMODE1:1;
      uint16_t SAMODE0:1;
      uint16_t SAMODE1:1;
    };
  };
} DMACH1BITS;
extern volatile DMACH1BITS DMACH1bits __attribute__((__sfr__));


extern volatile uint16_t DMAINT1 __attribute__((__sfr__));
__extension__ typedef struct tagDMAINT1BITS {
  union {
    struct {
      uint16_t HALFEN:1;
      uint16_t :2;
      uint16_t OVRUNIF:1;
      uint16_t HALFIF:1;
      uint16_t DONEIF:1;
      uint16_t LOWIF:1;
      uint16_t HIGHIF:1;
      uint16_t CHSEL:7;
      uint16_t DBUFWF:1;
    };
    struct {
      uint16_t :8;
      uint16_t CHSEL0:1;
      uint16_t CHSEL1:1;
      uint16_t CHSEL2:1;
      uint16_t CHSEL3:1;
      uint16_t CHSEL4:1;
      uint16_t CHSEL5:1;
      uint16_t CHSEL6:1;
    };
  };
} DMAINT1BITS;
extern volatile DMAINT1BITS DMAINT1bits __attribute__((__sfr__));


extern volatile uint16_t DMASRC1 __attribute__((__sfr__));

extern volatile uint16_t DMADST1 __attribute__((__sfr__));

extern volatile uint16_t DMACNT1 __attribute__((__sfr__));

extern volatile uint16_t DMACH2 __attribute__((__sfr__));
__extension__ typedef struct tagDMACH2BITS {
  union {
    struct {
      uint16_t CHEN:1;
      uint16_t SIZE:1;
      uint16_t TRMODE:2;
      uint16_t DAMODE:2;
      uint16_t SAMODE:2;
      uint16_t CHREQ:1;
      uint16_t RELOAD:1;
      uint16_t NULLW:1;
    };
    struct {
      uint16_t :2;
      uint16_t TRMODE0:1;
      uint16_t TRMODE1:1;
      uint16_t DAMODE0:1;
      uint16_t DAMODE1:1;
      uint16_t SAMODE0:1;
      uint16_t SAMODE1:1;
    };
  };
} DMACH2BITS;
extern volatile DMACH2BITS DMACH2bits __attribute__((__sfr__));


extern volatile uint16_t DMAINT2 __attribute__((__sfr__));
__extension__ typedef struct tagDMAINT2BITS {
  union {
    struct {
      uint16_t HALFEN:1;
      uint16_t :2;
      uint16_t OVRUNIF:1;
      uint16_t HALFIF:1;
      uint16_t DONEIF:1;
      uint16_t LOWIF:1;
      uint16_t HIGHIF:1;
      uint16_t CHSEL:7;
      uint16_t DBUFWF:1;
    };
    struct {
      uint16_t :8;
      uint16_t CHSEL0:1;
      uint16_t CHSEL1:1;
      uint16_t CHSEL2:1;
      uint16_t CHSEL3:1;
      uint16_t CHSEL4:1;
      uint16_t CHSEL5:1;
      uint16_t CHSEL6:1;
    };
  };
} DMAINT2BITS;
extern volatile DMAINT2BITS DMAINT2bits __attribute__((__sfr__));


extern volatile uint16_t DMASRC2 __attribute__((__sfr__));

extern volatile uint16_t DMADST2 __attribute__((__sfr__));

extern volatile uint16_t DMACNT2 __attribute__((__sfr__));

extern volatile uint16_t DMACH3 __attribute__((__sfr__));
__extension__ typedef struct tagDMACH3BITS {
  union {
    struct {
      uint16_t CHEN:1;
      uint16_t SIZE:1;
      uint16_t TRMODE:2;
      uint16_t DAMODE:2;
      uint16_t SAMODE:2;
      uint16_t CHREQ:1;
      uint16_t RELOAD:1;
      uint16_t NULLW:1;
    };
    struct {
      uint16_t :2;
      uint16_t TRMODE0:1;
      uint16_t TRMODE1:1;
      uint16_t DAMODE0:1;
      uint16_t DAMODE1:1;
      uint16_t SAMODE0:1;
      uint16_t SAMODE1:1;
    };
  };
} DMACH3BITS;
extern volatile DMACH3BITS DMACH3bits __attribute__((__sfr__));


extern volatile uint16_t DMAINT3 __attribute__((__sfr__));
__extension__ typedef struct tagDMAINT3BITS {
  union {
    struct {
      uint16_t HALFEN:1;
      uint16_t :2;
      uint16_t OVRUNIF:1;
      uint16_t HALFIF:1;
      uint16_t DONEIF:1;
      uint16_t LOWIF:1;
      uint16_t HIGHIF:1;
      uint16_t CHSEL:7;
      uint16_t DBUFWF:1;
    };
    struct {
      uint16_t :8;
      uint16_t CHSEL0:1;
      uint16_t CHSEL1:1;
      uint16_t CHSEL2:1;
      uint16_t CHSEL3:1;
      uint16_t CHSEL4:1;
      uint16_t CHSEL5:1;
      uint16_t CHSEL6:1;
    };
  };
} DMAINT3BITS;
extern volatile DMAINT3BITS DMAINT3bits __attribute__((__sfr__));


extern volatile uint16_t DMASRC3 __attribute__((__sfr__));

extern volatile uint16_t DMADST3 __attribute__((__sfr__));

extern volatile uint16_t DMACNT3 __attribute__((__sfr__));

extern volatile uint16_t DMACH4 __attribute__((__sfr__));
__extension__ typedef struct tagDMACH4BITS {
  union {
    struct {
      uint16_t CHEN:1;
      uint16_t SIZE:1;
      uint16_t TRMODE:2;
      uint16_t DAMODE:2;
      uint16_t SAMODE:2;
      uint16_t CHREQ:1;
      uint16_t RELOAD:1;
      uint16_t NULLW:1;
    };
    struct {
      uint16_t :2;
      uint16_t TRMODE0:1;
      uint16_t TRMODE1:1;
      uint16_t DAMODE0:1;
      uint16_t DAMODE1:1;
      uint16_t SAMODE0:1;
      uint16_t SAMODE1:1;
    };
  };
} DMACH4BITS;
extern volatile DMACH4BITS DMACH4bits __attribute__((__sfr__));


extern volatile uint16_t DMAINT4 __attribute__((__sfr__));
__extension__ typedef struct tagDMAINT4BITS {
  union {
    struct {
      uint16_t HALFEN:1;
      uint16_t :2;
      uint16_t OVRUNIF:1;
      uint16_t HALFIF:1;
      uint16_t DONEIF:1;
      uint16_t LOWIF:1;
      uint16_t HIGHIF:1;
      uint16_t CHSEL:7;
      uint16_t DBUFWF:1;
    };
    struct {
      uint16_t :8;
      uint16_t CHSEL0:1;
      uint16_t CHSEL1:1;
      uint16_t CHSEL2:1;
      uint16_t CHSEL3:1;
      uint16_t CHSEL4:1;
      uint16_t CHSEL5:1;
      uint16_t CHSEL6:1;
    };
  };
} DMAINT4BITS;
extern volatile DMAINT4BITS DMAINT4bits __attribute__((__sfr__));


extern volatile uint16_t DMASRC4 __attribute__((__sfr__));

extern volatile uint16_t DMADST4 __attribute__((__sfr__));

extern volatile uint16_t DMACNT4 __attribute__((__sfr__));

extern volatile uint16_t DMACH5 __attribute__((__sfr__));
__extension__ typedef struct tagDMACH5BITS {
  union {
    struct {
      uint16_t CHEN:1;
      uint16_t SIZE:1;
      uint16_t TRMODE:2;
      uint16_t DAMODE:2;
      uint16_t SAMODE:2;
      uint16_t CHREQ:1;
      uint16_t RELOAD:1;
      uint16_t NULLW:1;
    };
    struct {
      uint16_t :2;
      uint16_t TRMODE0:1;
      uint16_t TRMODE1:1;
      uint16_t DAMODE0:1;
      uint16_t DAMODE1:1;
      uint16_t SAMODE0:1;
      uint16_t SAMODE1:1;
    };
  };
} DMACH5BITS;
extern volatile DMACH5BITS DMACH5bits __attribute__((__sfr__));


extern volatile uint16_t DMAINT5 __attribute__((__sfr__));
__extension__ typedef struct tagDMAINT5BITS {
  union {
    struct {
      uint16_t HALFEN:1;
      uint16_t :2;
      uint16_t OVRUNIF:1;
      uint16_t HALFIF:1;
      uint16_t DONEIF:1;
      uint16_t LOWIF:1;
      uint16_t HIGHIF:1;
      uint16_t CHSEL:7;
      uint16_t DBUFWF:1;
    };
    struct {
      uint16_t :8;
      uint16_t CHSEL0:1;
      uint16_t CHSEL1:1;
      uint16_t CHSEL2:1;
      uint16_t CHSEL3:1;
      uint16_t CHSEL4:1;
      uint16_t CHSEL5:1;
      uint16_t CHSEL6:1;
    };
  };
} DMAINT5BITS;
extern volatile DMAINT5BITS DMAINT5bits __attribute__((__sfr__));


extern volatile uint16_t DMASRC5 __attribute__((__sfr__));

extern volatile uint16_t DMADST5 __attribute__((__sfr__));

extern volatile uint16_t DMACNT5 __attribute__((__sfr__));

extern volatile uint16_t ADCON1L __attribute__((__sfr__));
typedef struct tagADCON1LBITS {
  uint16_t :13;
  uint16_t ADSIDL:1;
  uint16_t :1;
  uint16_t ADON:1;
} ADCON1LBITS;
extern volatile ADCON1LBITS ADCON1Lbits __attribute__((__sfr__));


extern volatile uint16_t ADCON1H __attribute__((__sfr__));
__extension__ typedef struct tagADCON1HBITS {
  union {
    struct {
      uint16_t :5;
      uint16_t SHRRES:2;
      uint16_t FORM:1;
    };
    struct {
      uint16_t :5;
      uint16_t SHRRES0:1;
      uint16_t SHRRES1:1;
    };
  };
} ADCON1HBITS;
extern volatile ADCON1HBITS ADCON1Hbits __attribute__((__sfr__));


extern volatile uint16_t ADCON2L __attribute__((__sfr__));
__extension__ typedef struct tagADCON2LBITS {
  union {
    struct {
      uint16_t SHRADCS:7;
      uint16_t :1;
      uint16_t SHREISEL:3;
      uint16_t PTGEN:1;
      uint16_t EIEN:1;
      uint16_t :1;
      uint16_t REFERCIE:1;
      uint16_t REFCIE:1;
    };
    struct {
      uint16_t SHRADCS0:1;
      uint16_t SHRADCS1:1;
      uint16_t SHRADCS2:1;
      uint16_t SHRADCS3:1;
      uint16_t SHRADCS4:1;
      uint16_t SHRADCS5:1;
      uint16_t SHRADCS6:1;
      uint16_t :1;
      uint16_t SHREISEL0:1;
      uint16_t SHREISEL1:1;
      uint16_t SHREISEL2:1;
    };
  };
} ADCON2LBITS;
extern volatile ADCON2LBITS ADCON2Lbits __attribute__((__sfr__));


extern volatile uint16_t ADCON2H __attribute__((__sfr__));
__extension__ typedef struct tagADCON2HBITS {
  union {
    struct {
      uint16_t SHRSAMC:10;
      uint16_t :4;
      uint16_t REFERR:1;
      uint16_t REFRDY:1;
    };
    struct {
      uint16_t SHRSAMC0:1;
      uint16_t SHRSAMC1:1;
      uint16_t SHRSAMC2:1;
      uint16_t SHRSAMC3:1;
      uint16_t SHRSAMC4:1;
      uint16_t SHRSAMC5:1;
      uint16_t SHRSAMC6:1;
      uint16_t SHRSAMC7:1;
      uint16_t SHRSAMC8:1;
      uint16_t SHRSAMC9:1;
    };
  };
} ADCON2HBITS;
extern volatile ADCON2HBITS ADCON2Hbits __attribute__((__sfr__));


extern volatile uint16_t ADCON3L __attribute__((__sfr__));
__extension__ typedef struct tagADCON3LBITS {
  union {
    struct {
      uint16_t CNVCHSEL:6;
      uint16_t SWCTRG:1;
      uint16_t SWLCTRG:1;
      uint16_t CNVRTCH:1;
      uint16_t SHRSAMP:1;
      uint16_t SUSPRDY:1;
      uint16_t SUSPCIE:1;
      uint16_t SUSPEND:1;
      uint16_t REFSEL:3;
    };
    struct {
      uint16_t CNVCHSEL0:1;
      uint16_t CNVCHSEL1:1;
      uint16_t CNVCHSEL2:1;
      uint16_t CNVCHSEL3:1;
      uint16_t CNVCHSEL4:1;
      uint16_t CNVCHSEL5:1;
      uint16_t :7;
      uint16_t REFSEL0:1;
      uint16_t REFSEL1:1;
      uint16_t REFSEL2:1;
    };
  };
} ADCON3LBITS;
extern volatile ADCON3LBITS ADCON3Lbits __attribute__((__sfr__));


extern volatile uint16_t ADCON3H __attribute__((__sfr__));
__extension__ typedef struct tagADCON3HBITS {
  union {
    struct {
      uint16_t :7;
      uint16_t SHREN:1;
      uint16_t CLKDIV:6;
      uint16_t CLKSEL:2;
    };
    struct {
      uint16_t :8;
      uint16_t CLKDIV0:1;
      uint16_t CLKDIV1:1;
      uint16_t CLKDIV2:1;
      uint16_t CLKDIV3:1;
      uint16_t CLKDIV4:1;
      uint16_t CLKDIV5:1;
      uint16_t CLKSEL0:1;
      uint16_t CLKSEL1:1;
    };
  };
} ADCON3HBITS;
extern volatile ADCON3HBITS ADCON3Hbits __attribute__((__sfr__));


extern volatile uint16_t ADMOD0L __attribute__((__sfr__));
typedef struct tagADMOD0LBITS {
  uint16_t SIGN0:1;
  uint16_t :1;
  uint16_t SIGN1:1;
  uint16_t :1;
  uint16_t SIGN2:1;
  uint16_t :1;
  uint16_t SIGN3:1;
  uint16_t :1;
  uint16_t SIGN4:1;
  uint16_t :1;
  uint16_t SIGN5:1;
  uint16_t :1;
  uint16_t SIGN6:1;
  uint16_t :1;
  uint16_t SIGN7:1;
} ADMOD0LBITS;
extern volatile ADMOD0LBITS ADMOD0Lbits __attribute__((__sfr__));


extern volatile uint16_t ADMOD0H __attribute__((__sfr__));
typedef struct tagADMOD0HBITS {
  uint16_t SIGN8:1;
  uint16_t :1;
  uint16_t SIGN9:1;
  uint16_t :1;
  uint16_t SIGN10:1;
  uint16_t :1;
  uint16_t SIGN11:1;
  uint16_t :1;
  uint16_t SIGN12:1;
  uint16_t :1;
  uint16_t SIGN13:1;
  uint16_t :1;
  uint16_t SIGN14:1;
  uint16_t :1;
  uint16_t SIGN15:1;
} ADMOD0HBITS;
extern volatile ADMOD0HBITS ADMOD0Hbits __attribute__((__sfr__));


extern volatile uint16_t ADMOD1L __attribute__((__sfr__));
typedef struct tagADMOD1LBITS {
  uint16_t SIGN16:1;
  uint16_t :1;
  uint16_t SIGN17:1;
  uint16_t :1;
  uint16_t SIGN18:1;
  uint16_t :1;
  uint16_t SIGN19:1;
  uint16_t :1;
  uint16_t SIGN20:1;
} ADMOD1LBITS;
extern volatile ADMOD1LBITS ADMOD1Lbits __attribute__((__sfr__));


extern volatile uint16_t ADIEL __attribute__((__sfr__));
typedef struct tagADIELBITS {
  uint16_t IE0:1;
  uint16_t IE1:1;
  uint16_t IE2:1;
  uint16_t IE3:1;
  uint16_t IE4:1;
  uint16_t IE5:1;
  uint16_t IE6:1;
  uint16_t IE7:1;
  uint16_t IE8:1;
  uint16_t IE9:1;
  uint16_t IE10:1;
  uint16_t IE11:1;
  uint16_t IE12:1;
  uint16_t IE13:1;
  uint16_t IE14:1;
  uint16_t IE15:1;
} ADIELBITS;
extern volatile ADIELBITS ADIELbits __attribute__((__sfr__));


extern volatile uint16_t ADIEH __attribute__((__sfr__));
typedef struct tagADIEHBITS {
  uint16_t IE16:1;
  uint16_t IE17:1;
  uint16_t IE18:1;
  uint16_t IE19:1;
  uint16_t IE20:1;
} ADIEHBITS;
extern volatile ADIEHBITS ADIEHbits __attribute__((__sfr__));


extern volatile uint16_t ADCSSL __attribute__((__sfr__));
typedef struct tagADCSSLBITS {
  uint16_t CSS0:1;
  uint16_t CSS1:1;
  uint16_t CSS2:1;
  uint16_t CSS3:1;
  uint16_t CSS4:1;
  uint16_t CSS5:1;
  uint16_t CSS6:1;
  uint16_t CSS7:1;
  uint16_t CSS8:1;
  uint16_t CSS9:1;
  uint16_t CSS10:1;
  uint16_t CSS11:1;
  uint16_t CSS12:1;
  uint16_t CSS13:1;
  uint16_t CSS14:1;
  uint16_t CSS15:1;
} ADCSSLBITS;
extern volatile ADCSSLBITS ADCSSLbits __attribute__((__sfr__));


extern volatile uint16_t ADSTATL __attribute__((__sfr__));
typedef struct tagADSTATLBITS {
  uint16_t AN0RDY:1;
  uint16_t AN1RDY:1;
  uint16_t AN2RDY:1;
  uint16_t AN3RDY:1;
  uint16_t AN4RDY:1;
  uint16_t AN5RDY:1;
  uint16_t AN6RDY:1;
  uint16_t AN7RDY:1;
  uint16_t AN8RDY:1;
  uint16_t AN9RDY:1;
  uint16_t AN10RDY:1;
  uint16_t AN11RDY:1;
  uint16_t AN12RDY:1;
  uint16_t AN13RDY:1;
  uint16_t AN14RDY:1;
  uint16_t AN15RDY:1;
} ADSTATLBITS;
extern volatile ADSTATLBITS ADSTATLbits __attribute__((__sfr__));


extern volatile uint16_t ADSTATH __attribute__((__sfr__));
typedef struct tagADSTATHBITS {
  uint16_t AN16RDY:1;
  uint16_t AN17RDY:1;
  uint16_t AN18RDY:1;
  uint16_t AN19RDY:1;
  uint16_t AN20RDY:1;
} ADSTATHBITS;
extern volatile ADSTATHBITS ADSTATHbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP0ENL __attribute__((__sfr__));
typedef struct tagADCMP0ENLBITS {
  uint16_t CMPEN0:1;
  uint16_t CMPEN1:1;
  uint16_t CMPEN2:1;
  uint16_t CMPEN3:1;
  uint16_t CMPEN4:1;
  uint16_t CMPEN5:1;
  uint16_t CMPEN6:1;
  uint16_t CMPEN7:1;
  uint16_t CMPEN8:1;
  uint16_t CMPEN9:1;
  uint16_t CMPEN10:1;
  uint16_t CMPEN11:1;
  uint16_t CMPEN12:1;
  uint16_t CMPEN13:1;
  uint16_t CMPEN14:1;
  uint16_t CMPEN15:1;
} ADCMP0ENLBITS;
extern volatile ADCMP0ENLBITS ADCMP0ENLbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP0ENH __attribute__((__sfr__));
typedef struct tagADCMP0ENHBITS {
  uint16_t CMPEN16:1;
  uint16_t CMPEN17:1;
  uint16_t CMPEN18:1;
  uint16_t CMPEN19:1;
  uint16_t CMPEN20:1;
} ADCMP0ENHBITS;
extern volatile ADCMP0ENHBITS ADCMP0ENHbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP0LO __attribute__((__sfr__));

extern volatile uint16_t ADCMP0HI __attribute__((__sfr__));

extern volatile uint16_t ADCMP1ENL __attribute__((__sfr__));
typedef struct tagADCMP1ENLBITS {
  uint16_t CMPEN0:1;
  uint16_t CMPEN1:1;
  uint16_t CMPEN2:1;
  uint16_t CMPEN3:1;
  uint16_t CMPEN4:1;
  uint16_t CMPEN5:1;
  uint16_t CMPEN6:1;
  uint16_t CMPEN7:1;
  uint16_t CMPEN8:1;
  uint16_t CMPEN9:1;
  uint16_t CMPEN10:1;
  uint16_t CMPEN11:1;
  uint16_t CMPEN12:1;
  uint16_t CMPEN13:1;
  uint16_t CMPEN14:1;
  uint16_t CMPEN15:1;
} ADCMP1ENLBITS;
extern volatile ADCMP1ENLBITS ADCMP1ENLbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP1ENH __attribute__((__sfr__));
typedef struct tagADCMP1ENHBITS {
  uint16_t CMPEN16:1;
  uint16_t CMPEN17:1;
  uint16_t CMPEN18:1;
  uint16_t CMPEN19:1;
  uint16_t CMPEN20:1;
} ADCMP1ENHBITS;
extern volatile ADCMP1ENHBITS ADCMP1ENHbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP1LO __attribute__((__sfr__));

extern volatile uint16_t ADCMP1HI __attribute__((__sfr__));

extern volatile uint16_t ADCMP2ENL __attribute__((__sfr__));
typedef struct tagADCMP2ENLBITS {
  uint16_t CMPEN0:1;
  uint16_t CMPEN1:1;
  uint16_t CMPEN2:1;
  uint16_t CMPEN3:1;
  uint16_t CMPEN4:1;
  uint16_t CMPEN5:1;
  uint16_t CMPEN6:1;
  uint16_t CMPEN7:1;
  uint16_t CMPEN8:1;
  uint16_t CMPEN9:1;
  uint16_t CMPEN10:1;
  uint16_t CMPEN11:1;
  uint16_t CMPEN12:1;
  uint16_t CMPEN13:1;
  uint16_t CMPEN14:1;
  uint16_t CMPEN15:1;
} ADCMP2ENLBITS;
extern volatile ADCMP2ENLBITS ADCMP2ENLbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP2ENH __attribute__((__sfr__));
typedef struct tagADCMP2ENHBITS {
  uint16_t CMPEN16:1;
  uint16_t CMPEN17:1;
  uint16_t CMPEN18:1;
  uint16_t CMPEN19:1;
  uint16_t CMPEN20:1;
} ADCMP2ENHBITS;
extern volatile ADCMP2ENHBITS ADCMP2ENHbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP2LO __attribute__((__sfr__));

extern volatile uint16_t ADCMP2HI __attribute__((__sfr__));

extern volatile uint16_t ADCMP3ENL __attribute__((__sfr__));
typedef struct tagADCMP3ENLBITS {
  uint16_t CMPEN0:1;
  uint16_t CMPEN1:1;
  uint16_t CMPEN2:1;
  uint16_t CMPEN3:1;
  uint16_t CMPEN4:1;
  uint16_t CMPEN5:1;
  uint16_t CMPEN6:1;
  uint16_t CMPEN7:1;
  uint16_t CMPEN8:1;
  uint16_t CMPEN9:1;
  uint16_t CMPEN10:1;
  uint16_t CMPEN11:1;
  uint16_t CMPEN12:1;
  uint16_t CMPEN13:1;
  uint16_t CMPEN14:1;
  uint16_t CMPEN15:1;
} ADCMP3ENLBITS;
extern volatile ADCMP3ENLBITS ADCMP3ENLbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP3ENH __attribute__((__sfr__));
typedef struct tagADCMP3ENHBITS {
  uint16_t CMPEN16:1;
  uint16_t CMPEN17:1;
  uint16_t CMPEN18:1;
  uint16_t CMPEN19:1;
  uint16_t CMPEN20:1;
} ADCMP3ENHBITS;
extern volatile ADCMP3ENHBITS ADCMP3ENHbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP3LO __attribute__((__sfr__));

extern volatile uint16_t ADCMP3HI __attribute__((__sfr__));

extern volatile uint16_t ADFL0DAT __attribute__((__sfr__));

extern volatile uint16_t ADFL0CON __attribute__((__sfr__));
__extension__ typedef struct tagADFL0CONBITS {
  union {
    struct {
      uint16_t FLCHSEL:5;
      uint16_t :3;
      uint16_t RDY:1;
      uint16_t IE:1;
      uint16_t OVRSAM:3;
      uint16_t MODE:2;
      uint16_t FLEN:1;
    };
    struct {
      uint16_t FLCHSEL0:1;
      uint16_t FLCHSEL1:1;
      uint16_t FLCHSEL2:1;
      uint16_t FLCHSEL3:1;
      uint16_t FLCHSEL4:1;
      uint16_t :5;
      uint16_t OVRSAM0:1;
      uint16_t OVRSAM1:1;
      uint16_t OVRSAM2:1;
    };
  };
} ADFL0CONBITS;
extern volatile ADFL0CONBITS ADFL0CONbits __attribute__((__sfr__));


extern volatile uint16_t ADFL1DAT __attribute__((__sfr__));

extern volatile uint16_t ADFL1CON __attribute__((__sfr__));
__extension__ typedef struct tagADFL1CONBITS {
  union {
    struct {
      uint16_t FLCHSEL:5;
      uint16_t :3;
      uint16_t RDY:1;
      uint16_t IE:1;
      uint16_t OVRSAM:3;
      uint16_t MODE:2;
      uint16_t FLEN:1;
    };
    struct {
      uint16_t FLCHSEL0:1;
      uint16_t FLCHSEL1:1;
      uint16_t FLCHSEL2:1;
      uint16_t FLCHSEL3:1;
      uint16_t FLCHSEL4:1;
      uint16_t :5;
      uint16_t OVRSAM0:1;
      uint16_t OVRSAM1:1;
      uint16_t OVRSAM2:1;
    };
  };
} ADFL1CONBITS;
extern volatile ADFL1CONBITS ADFL1CONbits __attribute__((__sfr__));


extern volatile uint16_t ADFL2DAT __attribute__((__sfr__));

extern volatile uint16_t ADFL2CON __attribute__((__sfr__));
__extension__ typedef struct tagADFL2CONBITS {
  union {
    struct {
      uint16_t FLCHSEL:5;
      uint16_t :3;
      uint16_t RDY:1;
      uint16_t IE:1;
      uint16_t OVRSAM:3;
      uint16_t MODE:2;
      uint16_t FLEN:1;
    };
    struct {
      uint16_t FLCHSEL0:1;
      uint16_t FLCHSEL1:1;
      uint16_t FLCHSEL2:1;
      uint16_t FLCHSEL3:1;
      uint16_t FLCHSEL4:1;
      uint16_t :5;
      uint16_t OVRSAM0:1;
      uint16_t OVRSAM1:1;
      uint16_t OVRSAM2:1;
    };
  };
} ADFL2CONBITS;
extern volatile ADFL2CONBITS ADFL2CONbits __attribute__((__sfr__));


extern volatile uint16_t ADFL3DAT __attribute__((__sfr__));

extern volatile uint16_t ADFL3CON __attribute__((__sfr__));
__extension__ typedef struct tagADFL3CONBITS {
  union {
    struct {
      uint16_t FLCHSEL:5;
      uint16_t :3;
      uint16_t RDY:1;
      uint16_t IE:1;
      uint16_t OVRSAM:3;
      uint16_t MODE:2;
      uint16_t FLEN:1;
    };
    struct {
      uint16_t FLCHSEL0:1;
      uint16_t FLCHSEL1:1;
      uint16_t FLCHSEL2:1;
      uint16_t FLCHSEL3:1;
      uint16_t FLCHSEL4:1;
      uint16_t :5;
      uint16_t OVRSAM0:1;
      uint16_t OVRSAM1:1;
      uint16_t OVRSAM2:1;
    };
  };
} ADFL3CONBITS;
extern volatile ADFL3CONBITS ADFL3CONbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG0L __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG0LBITS {
  union {
    struct {
      uint16_t TRGSRC0:5;
      uint16_t :3;
      uint16_t TRGSRC1:5;
    };
    struct {
      uint16_t TRIGSRC00:1;
      uint16_t TRIGSRC01:1;
      uint16_t TRIGSRC02:1;
      uint16_t TRIGSRC03:1;
      uint16_t TRIGSRC04:1;
      uint16_t :3;
      uint16_t TRGSRC10:1;
      uint16_t TRGSRC11:1;
      uint16_t TRGSRC12:1;
      uint16_t TRGSRC13:1;
      uint16_t TRGSRC14:1;
    };
    struct {
      uint16_t TRGSRC00:1;
      uint16_t TRGSRC01:1;
      uint16_t TRGSRC02:1;
      uint16_t TRGSRC03:1;
      uint16_t TRGSRC04:1;
    };
  };
} ADTRIG0LBITS;
extern volatile ADTRIG0LBITS ADTRIG0Lbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG0H __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG0HBITS {
  union {
    struct {
      uint16_t TRGSRC2:5;
      uint16_t :3;
      uint16_t TRGSRC3:5;
    };
    struct {
      uint16_t TRIGSRC20:1;
      uint16_t TRIGSRC21:1;
      uint16_t TRIGSRC22:1;
      uint16_t TRIGSRC23:1;
      uint16_t TRIGSRC24:1;
      uint16_t :3;
      uint16_t TRGSRC30:1;
      uint16_t TRGSRC31:1;
      uint16_t TRGSRC32:1;
      uint16_t TRGSRC33:1;
      uint16_t TRGSRC34:1;
    };
    struct {
      uint16_t TRGSRC20:1;
      uint16_t TRGSRC21:1;
      uint16_t TRGSRC22:1;
      uint16_t TRGSRC23:1;
      uint16_t TRGSRC24:1;
    };
  };
} ADTRIG0HBITS;
extern volatile ADTRIG0HBITS ADTRIG0Hbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG1L __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG1LBITS {
  union {
    struct {
      uint16_t TRGSRC4:5;
      uint16_t :3;
      uint16_t TRGSRC5:5;
    };
    struct {
      uint16_t TRIGSRC40:1;
      uint16_t TRIGSRC41:1;
      uint16_t TRIGSRC42:1;
      uint16_t TRIGSRC43:1;
      uint16_t TRIGSRC44:1;
      uint16_t :3;
      uint16_t TRGSRC50:1;
      uint16_t TRGSRC51:1;
      uint16_t TRGSRC52:1;
      uint16_t TRGSRC53:1;
      uint16_t TRGSRC54:1;
    };
    struct {
      uint16_t TRGSRC40:1;
      uint16_t TRGSRC41:1;
      uint16_t TRGSRC42:1;
      uint16_t TRGSRC43:1;
      uint16_t TRGSRC44:1;
    };
  };
} ADTRIG1LBITS;
extern volatile ADTRIG1LBITS ADTRIG1Lbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG1H __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG1HBITS {
  union {
    struct {
      uint16_t TRGSRC6:5;
      uint16_t :3;
      uint16_t TRGSRC7:5;
    };
    struct {
      uint16_t TRIGSRC60:1;
      uint16_t TRIGSRC61:1;
      uint16_t TRIGSRC62:1;
      uint16_t TRIGSRC63:1;
      uint16_t TRIGSRC64:1;
      uint16_t :3;
      uint16_t TRGSRC70:1;
      uint16_t TRGSRC71:1;
      uint16_t TRGSRC72:1;
      uint16_t TRGSRC73:1;
      uint16_t TRGSRC74:1;
    };
    struct {
      uint16_t TRGSRC60:1;
      uint16_t TRGSRC61:1;
      uint16_t TRGSRC62:1;
      uint16_t TRGSRC63:1;
      uint16_t TRGSRC64:1;
    };
  };
} ADTRIG1HBITS;
extern volatile ADTRIG1HBITS ADTRIG1Hbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG2L __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG2LBITS {
  union {
    struct {
      uint16_t TRGSRC8:5;
      uint16_t :3;
      uint16_t TRGSRC9:5;
    };
    struct {
      uint16_t TRIGSRC80:1;
      uint16_t TRIGSRC81:1;
      uint16_t TRIGSRC82:1;
      uint16_t TRIGSRC83:1;
      uint16_t TRIGSRC84:1;
      uint16_t :3;
      uint16_t TRGSRC90:1;
      uint16_t TRGSRC91:1;
      uint16_t TRGSRC92:1;
      uint16_t TRGSRC93:1;
      uint16_t TRGSRC94:1;
    };
    struct {
      uint16_t TRGSRC80:1;
      uint16_t TRGSRC81:1;
      uint16_t TRGSRC82:1;
      uint16_t TRGSRC83:1;
      uint16_t TRGSRC84:1;
    };
  };
} ADTRIG2LBITS;
extern volatile ADTRIG2LBITS ADTRIG2Lbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG2H __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG2HBITS {
  union {
    struct {
      uint16_t TRGSRC10:5;
      uint16_t :3;
      uint16_t TRGSRC11:5;
    };
    struct {
      uint16_t TRIGSRC100:1;
      uint16_t TRIGSRC101:1;
      uint16_t TRIGSRC102:1;
      uint16_t TRIGSRC103:1;
      uint16_t TRIGSRC104:1;
      uint16_t :3;
      uint16_t TRGSRC110:1;
      uint16_t TRGSRC111:1;
      uint16_t TRGSRC112:1;
      uint16_t TRGSRC113:1;
      uint16_t TRGSRC114:1;
    };
    struct {
      uint16_t TRGSRC100:1;
      uint16_t TRGSRC101:1;
      uint16_t TRGSRC102:1;
      uint16_t TRGSRC103:1;
      uint16_t TRGSRC104:1;
    };
  };
} ADTRIG2HBITS;
extern volatile ADTRIG2HBITS ADTRIG2Hbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG3L __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG3LBITS {
  union {
    struct {
      uint16_t TRGSRC12:5;
      uint16_t :3;
      uint16_t TRGSRC13:5;
    };
    struct {
      uint16_t TRIGSRC120:1;
      uint16_t TRIGSRC121:1;
      uint16_t TRIGSRC122:1;
      uint16_t TRIGSRC123:1;
      uint16_t TRIGSRC124:1;
      uint16_t :3;
      uint16_t TRGSRC130:1;
      uint16_t TRGSRC131:1;
      uint16_t TRGSRC132:1;
      uint16_t TRGSRC133:1;
      uint16_t TRGSRC134:1;
    };
    struct {
      uint16_t TRGSRC120:1;
      uint16_t TRGSRC121:1;
      uint16_t TRGSRC122:1;
      uint16_t TRGSRC123:1;
      uint16_t TRGSRC124:1;
    };
  };
} ADTRIG3LBITS;
extern volatile ADTRIG3LBITS ADTRIG3Lbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG3H __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG3HBITS {
  union {
    struct {
      uint16_t TRGSRC14:5;
      uint16_t :3;
      uint16_t TRGSRC15:5;
    };
    struct {
      uint16_t TRIGSRC140:1;
      uint16_t TRIGSRC141:1;
      uint16_t TRIGSRC142:1;
      uint16_t TRIGSRC143:1;
      uint16_t TRIGSRC144:1;
      uint16_t :3;
      uint16_t TRGSRC150:1;
      uint16_t TRGSRC151:1;
      uint16_t TRGSRC152:1;
      uint16_t TRGSRC153:1;
      uint16_t TRGSRC154:1;
    };
    struct {
      uint16_t TRGSRC140:1;
      uint16_t TRGSRC141:1;
      uint16_t TRGSRC142:1;
      uint16_t TRGSRC143:1;
      uint16_t TRGSRC144:1;
    };
  };
} ADTRIG3HBITS;
extern volatile ADTRIG3HBITS ADTRIG3Hbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG4L __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG4LBITS {
  union {
    struct {
      uint16_t TRGSRC16:5;
      uint16_t :3;
      uint16_t TRGSRC17:5;
    };
    struct {
      uint16_t TRIGSRC160:1;
      uint16_t TRIGSRC161:1;
      uint16_t TRIGSRC162:1;
      uint16_t TRIGSRC163:1;
      uint16_t TRIGSRC164:1;
      uint16_t :3;
      uint16_t TRGSRC170:1;
      uint16_t TRGSRC171:1;
      uint16_t TRGSRC172:1;
      uint16_t TRGSRC173:1;
      uint16_t TRGSRC174:1;
    };
    struct {
      uint16_t TRGSRC160:1;
      uint16_t TRGSRC161:1;
      uint16_t TRGSRC162:1;
      uint16_t TRGSRC163:1;
      uint16_t TRGSRC164:1;
    };
  };
} ADTRIG4LBITS;
extern volatile ADTRIG4LBITS ADTRIG4Lbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG4H __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG4HBITS {
  union {
    struct {
      uint16_t TRGSRC18:5;
      uint16_t :3;
      uint16_t TRGSRC19:5;
    };
    struct {
      uint16_t TRIGSRC180:1;
      uint16_t TRIGSRC181:1;
      uint16_t TRIGSRC182:1;
      uint16_t TRIGSRC183:1;
      uint16_t TRIGSRC184:1;
      uint16_t :3;
      uint16_t TRGSRC190:1;
      uint16_t TRGSRC191:1;
      uint16_t TRGSRC192:1;
      uint16_t TRGSRC193:1;
      uint16_t TRGSRC194:1;
    };
    struct {
      uint16_t TRGSRC180:1;
      uint16_t TRGSRC181:1;
      uint16_t TRGSRC182:1;
      uint16_t TRGSRC183:1;
      uint16_t TRGSRC184:1;
    };
  };
} ADTRIG4HBITS;
extern volatile ADTRIG4HBITS ADTRIG4Hbits __attribute__((__sfr__));


extern volatile uint16_t ADTRIG5L __attribute__((__sfr__));
__extension__ typedef struct tagADTRIG5LBITS {
  union {
    struct {
      uint16_t TRGSRC20:5;
    };
    struct {
      uint16_t TRIGSRC200:1;
      uint16_t TRIGSRC201:1;
      uint16_t TRIGSRC202:1;
      uint16_t TRIGSRC203:1;
      uint16_t TRIGSRC204:1;
    };
    struct {
      uint16_t TRGSRC200:1;
      uint16_t TRGSRC201:1;
      uint16_t TRGSRC202:1;
      uint16_t TRGSRC203:1;
      uint16_t TRGSRC204:1;
    };
  };
} ADTRIG5LBITS;
extern volatile ADTRIG5LBITS ADTRIG5Lbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP0CON __attribute__((__sfr__));
__extension__ typedef struct tagADCMP0CONBITS {
  union {
    struct {
      uint16_t LOLO:1;
      uint16_t LOHI:1;
      uint16_t HILO:1;
      uint16_t HIHI:1;
      uint16_t BTWN:1;
      uint16_t STAT:1;
      uint16_t IE:1;
      uint16_t CMPEN:1;
      uint16_t CHNL:5;
    };
    struct {
      uint16_t :8;
      uint16_t CHNL0:1;
      uint16_t CHNL1:1;
      uint16_t CHNL2:1;
      uint16_t CHNL3:1;
      uint16_t CHNL4:1;
    };
  };
} ADCMP0CONBITS;
extern volatile ADCMP0CONBITS ADCMP0CONbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP1CON __attribute__((__sfr__));
__extension__ typedef struct tagADCMP1CONBITS {
  union {
    struct {
      uint16_t LOLO:1;
      uint16_t LOHI:1;
      uint16_t HILO:1;
      uint16_t HIHI:1;
      uint16_t BTWN:1;
      uint16_t STAT:1;
      uint16_t IE:1;
      uint16_t CMPEN:1;
      uint16_t CHNL:5;
    };
    struct {
      uint16_t :8;
      uint16_t CHNL0:1;
      uint16_t CHNL1:1;
      uint16_t CHNL2:1;
      uint16_t CHNL3:1;
      uint16_t CHNL4:1;
    };
  };
} ADCMP1CONBITS;
extern volatile ADCMP1CONBITS ADCMP1CONbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP2CON __attribute__((__sfr__));
__extension__ typedef struct tagADCMP2CONBITS {
  union {
    struct {
      uint16_t LOLO:1;
      uint16_t LOHI:1;
      uint16_t HILO:1;
      uint16_t HIHI:1;
      uint16_t BTWN:1;
      uint16_t STAT:1;
      uint16_t IE:1;
      uint16_t CMPEN:1;
      uint16_t CHNL:5;
    };
    struct {
      uint16_t :8;
      uint16_t CHNL0:1;
      uint16_t CHNL1:1;
      uint16_t CHNL2:1;
      uint16_t CHNL3:1;
      uint16_t CHNL4:1;
    };
  };
} ADCMP2CONBITS;
extern volatile ADCMP2CONBITS ADCMP2CONbits __attribute__((__sfr__));


extern volatile uint16_t ADCMP3CON __attribute__((__sfr__));
__extension__ typedef struct tagADCMP3CONBITS {
  union {
    struct {
      uint16_t LOLO:1;
      uint16_t LOHI:1;
      uint16_t HILO:1;
      uint16_t HIHI:1;
      uint16_t BTWN:1;
      uint16_t STAT:1;
      uint16_t IE:1;
      uint16_t CMPEN:1;
      uint16_t CHNL:5;
    };
    struct {
      uint16_t :8;
      uint16_t CHNL0:1;
      uint16_t CHNL1:1;
      uint16_t CHNL2:1;
      uint16_t CHNL3:1;
      uint16_t CHNL4:1;
    };
  };
} ADCMP3CONBITS;
extern volatile ADCMP3CONBITS ADCMP3CONbits __attribute__((__sfr__));


extern volatile uint16_t ADLVLTRGL __attribute__((__sfr__));
typedef struct tagADLVLTRGLBITS {
  uint16_t LVLEN0:1;
  uint16_t LVLEN1:1;
  uint16_t LVLEN2:1;
  uint16_t LVLEN3:1;
  uint16_t LVLEN4:1;
  uint16_t LVLEN5:1;
  uint16_t LVLEN6:1;
  uint16_t LVLEN7:1;
  uint16_t LVLEN8:1;
  uint16_t LVLEN9:1;
  uint16_t LVLEN10:1;
  uint16_t LVLEN11:1;
  uint16_t LVLEN12:1;
  uint16_t LVLEN13:1;
  uint16_t LVLEN14:1;
  uint16_t LVLEN15:1;
} ADLVLTRGLBITS;
extern volatile ADLVLTRGLBITS ADLVLTRGLbits __attribute__((__sfr__));


extern volatile uint16_t ADLVLTRGH __attribute__((__sfr__));
typedef struct tagADLVLTRGHBITS {
  uint16_t LVLEN16:1;
  uint16_t LVLEN17:1;
  uint16_t LVLEN18:1;
  uint16_t LVLEN19:1;
  uint16_t LVLEN20:1;
} ADLVLTRGHBITS;
extern volatile ADLVLTRGHBITS ADLVLTRGHbits __attribute__((__sfr__));


extern volatile uint16_t ADEIEL __attribute__((__sfr__));
typedef struct tagADEIELBITS {
  uint16_t EIEN0:1;
  uint16_t EIEN1:1;
  uint16_t EIEN2:1;
  uint16_t EIEN3:1;
  uint16_t EIEN4:1;
  uint16_t EIEN5:1;
  uint16_t EIEN6:1;
  uint16_t EIEN7:1;
  uint16_t EIEN8:1;
  uint16_t EIEN9:1;
  uint16_t EIEN10:1;
  uint16_t EIEN11:1;
  uint16_t EIEN12:1;
  uint16_t EIEN13:1;
  uint16_t EIEN14:1;
  uint16_t EIEN15:1;
} ADEIELBITS;
extern volatile ADEIELBITS ADEIELbits __attribute__((__sfr__));


extern volatile uint16_t ADEIEH __attribute__((__sfr__));
typedef struct tagADEIEHBITS {
  uint16_t EIEN16:1;
  uint16_t EIEN17:1;
  uint16_t EIEN18:1;
  uint16_t EIEN19:1;
  uint16_t EIEN20:1;
} ADEIEHBITS;
extern volatile ADEIEHBITS ADEIEHbits __attribute__((__sfr__));


extern volatile uint16_t ADEISTATL __attribute__((__sfr__));
typedef struct tagADEISTATLBITS {
  uint16_t EISTAT0:1;
  uint16_t EISTAT1:1;
  uint16_t EISTAT2:1;
  uint16_t EISTAT3:1;
  uint16_t EISTAT4:1;
  uint16_t EISTAT5:1;
  uint16_t EISTAT6:1;
  uint16_t EISTAT7:1;
  uint16_t EISTAT8:1;
  uint16_t EISTAT9:1;
  uint16_t EISTAT10:1;
  uint16_t EISTAT11:1;
  uint16_t EISTAT12:1;
  uint16_t EISTAT13:1;
  uint16_t EISTAT14:1;
  uint16_t EISTAT15:1;
} ADEISTATLBITS;
extern volatile ADEISTATLBITS ADEISTATLbits __attribute__((__sfr__));


extern volatile uint16_t ADEISTATH __attribute__((__sfr__));
typedef struct tagADEISTATHBITS {
  uint16_t EISTAT16:1;
  uint16_t EISTAT17:1;
  uint16_t EISTAT18:1;
  uint16_t EISTAT19:1;
  uint16_t EISTAT20:1;
} ADEISTATHBITS;
extern volatile ADEISTATHBITS ADEISTATHbits __attribute__((__sfr__));


extern volatile uint16_t ADCON5L __attribute__((__sfr__));
typedef struct tagADCON5LBITS {
  uint16_t :7;
  uint16_t SHRPWR:1;
  uint16_t :7;
  uint16_t SHRRDY:1;
} ADCON5LBITS;
extern volatile ADCON5LBITS ADCON5Lbits __attribute__((__sfr__));


extern volatile uint16_t ADCON5H __attribute__((__sfr__));
typedef struct tagADCON5HBITS {
  uint16_t :7;
  uint16_t SHRCIE:1;
  uint16_t WARMTIME:4;
} ADCON5HBITS;
extern volatile ADCON5HBITS ADCON5Hbits __attribute__((__sfr__));


extern volatile uint16_t ADCBUF0 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF1 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF2 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF3 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF4 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF5 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF6 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF7 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF8 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF9 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF10 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF11 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF12 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF13 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF14 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF15 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF16 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF17 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF18 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF19 __attribute__((__sfr__));

extern volatile uint16_t ADCBUF20 __attribute__((__sfr__));

extern volatile uint16_t DACCTRL1L __attribute__((__sfr__));
__extension__ typedef struct tagDACCTRL1LBITS {
  union {
    struct {
      uint16_t FCLKDIV:3;
      uint16_t :1;
      uint16_t CLKDIV:2;
      uint16_t CLKSEL:2;
      uint16_t :5;
      uint16_t DACSIDL:1;
      uint16_t :1;
      uint16_t DACON:1;
    };
    struct {
      uint16_t FCLKDIV0:1;
      uint16_t FCLKDIV1:1;
      uint16_t FCLKDIV2:1;
      uint16_t :1;
      uint16_t CLKDIV0:1;
      uint16_t CLKDIV1:1;
      uint16_t CLKSEL0:1;
      uint16_t CLKSEL1:1;
    };
  };
} DACCTRL1LBITS;
extern volatile DACCTRL1LBITS DACCTRL1Lbits __attribute__((__sfr__));


extern volatile uint16_t DACCTRL2L __attribute__((__sfr__));
__extension__ typedef struct tagDACCTRL2LBITS {
  union {
    struct {
      uint16_t TMODTIME:10;
    };
    struct {
      uint16_t TMODTIME0:1;
      uint16_t TMODTIME1:1;
      uint16_t TMODTIME2:1;
      uint16_t TMODTIME3:1;
      uint16_t TMODTIME4:1;
      uint16_t TMODTIME5:1;
      uint16_t TMODTIME6:1;
      uint16_t TMODTIME7:1;
      uint16_t TMODTIME8:1;
      uint16_t TMODTIME9:1;
    };
  };
} DACCTRL2LBITS;
extern volatile DACCTRL2LBITS DACCTRL2Lbits __attribute__((__sfr__));


extern volatile uint16_t DACCTRL2H __attribute__((__sfr__));
__extension__ typedef struct tagDACCTRL2HBITS {
  union {
    struct {
      uint16_t SSTIME:10;
    };
    struct {
      uint16_t SSTIME0:1;
      uint16_t SSTIME1:1;
      uint16_t SSTIME2:1;
      uint16_t SSTIME3:1;
      uint16_t SSTIME4:1;
      uint16_t SSTIME5:1;
      uint16_t SSTIME6:1;
      uint16_t SSTIME7:1;
      uint16_t SSTIME8:1;
      uint16_t SSTIME9:1;
    };
  };
} DACCTRL2HBITS;
extern volatile DACCTRL2HBITS DACCTRL2Hbits __attribute__((__sfr__));


extern volatile uint16_t DAC1CONL __attribute__((__sfr__));
__extension__ typedef struct tagDAC1CONLBITS {
  union {
    struct {
      uint16_t HYSSEL:2;
      uint16_t HYSPOL:1;
      uint16_t INSEL:3;
      uint16_t CMPPOL:1;
      uint16_t CMPSTAT:1;
      uint16_t FLTREN:1;
      uint16_t DACOEN:1;
      uint16_t CBE:1;
      uint16_t :2;
      uint16_t IRQM:2;
      uint16_t DACEN:1;
    };
    struct {
      uint16_t HYSSEL0:1;
      uint16_t HYSSEL1:1;
      uint16_t :11;
      uint16_t IRQM0:1;
      uint16_t IRQM1:1;
    };
  };
} DAC1CONLBITS;
extern volatile DAC1CONLBITS DAC1CONLbits __attribute__((__sfr__));


extern volatile uint16_t DAC1CONH __attribute__((__sfr__));
__extension__ typedef struct tagDAC1CONHBITS {
  union {
    struct {
      uint16_t TMCB:10;
    };
    struct {
      uint16_t TMCB0:1;
      uint16_t TMCB1:1;
      uint16_t TMCB2:1;
      uint16_t TMCB3:1;
      uint16_t TMCB4:1;
      uint16_t TMCB5:1;
      uint16_t TMCB6:1;
      uint16_t TMCB7:1;
      uint16_t TMCB8:1;
      uint16_t TMCB9:1;
    };
  };
} DAC1CONHBITS;
extern volatile DAC1CONHBITS DAC1CONHbits __attribute__((__sfr__));


extern volatile uint16_t DAC1DATL __attribute__((__sfr__));
__extension__ typedef struct tagDAC1DATLBITS {
  union {
    struct {
      uint16_t DACLOW:12;
    };
    struct {
      uint16_t DACDATL:12;
    };
    struct {
      uint16_t DACDATL0:1;
      uint16_t DACDATL1:1;
      uint16_t DACDATL2:1;
      uint16_t DACDATL3:1;
      uint16_t DACDATL4:1;
      uint16_t DACDATL5:1;
      uint16_t DACDATL6:1;
      uint16_t DACDATL7:1;
      uint16_t DACDATL8:1;
      uint16_t DACDATL9:1;
      uint16_t DACDATL10:1;
      uint16_t DACDATL11:1;
    };
  };
} DAC1DATLBITS;
extern volatile DAC1DATLBITS DAC1DATLbits __attribute__((__sfr__));


extern volatile uint16_t DAC1DATH __attribute__((__sfr__));
__extension__ typedef struct tagDAC1DATHBITS {
  union {
    struct {
      uint16_t DACDAT:12;
    };
    struct {
      uint16_t DACDATH:12;
    };
    struct {
      uint16_t DACDATH0:1;
      uint16_t DACDATH1:1;
      uint16_t DACDATH2:1;
      uint16_t DACDATH3:1;
      uint16_t DACDATH4:1;
      uint16_t DACDATH5:1;
      uint16_t DACDATH6:1;
      uint16_t DACDATH7:1;
      uint16_t DACDATH8:1;
      uint16_t DACDATH9:1;
      uint16_t DACDATH10:1;
      uint16_t DACDATH11:1;
    };
  };
} DAC1DATHBITS;
extern volatile DAC1DATHBITS DAC1DATHbits __attribute__((__sfr__));


extern volatile uint16_t SLP1CONL __attribute__((__sfr__));
__extension__ typedef struct tagSLP1CONLBITS {
  union {
    struct {
      uint16_t SLPSTRT:4;
      uint16_t SLPSTOPB:4;
      uint16_t SLPSTOPA:4;
      uint16_t HCFSEL:4;
    };
    struct {
      uint16_t SLPSTRT0:1;
      uint16_t SLPSTRT1:1;
      uint16_t SLPSTRT2:1;
      uint16_t SLPSTRT3:1;
      uint16_t SLPSTOPB0:1;
      uint16_t SLPSTOPB1:1;
      uint16_t SLPSTOPB2:1;
      uint16_t SLPSTOPB3:1;
      uint16_t SLPSTOPA0:1;
      uint16_t SLPSTOPA1:1;
      uint16_t SLPSTOPA2:1;
      uint16_t SLPSTOPA3:1;
      uint16_t HCFSEL0:1;
      uint16_t HCFSEL1:1;
      uint16_t HCFSEL2:1;
      uint16_t HCFSEL3:1;
    };
  };
} SLP1CONLBITS;
extern volatile SLP1CONLBITS SLP1CONLbits __attribute__((__sfr__));


extern volatile uint16_t SLP1CONH __attribute__((__sfr__));
typedef struct tagSLP1CONHBITS {
  uint16_t :9;
  uint16_t PSE:1;
  uint16_t TWME:1;
  uint16_t HME:1;
  uint16_t :3;
  uint16_t SLOPEN:1;
} SLP1CONHBITS;
extern volatile SLP1CONHBITS SLP1CONHbits __attribute__((__sfr__));


extern volatile uint16_t SLP1DAT __attribute__((__sfr__));
__extension__ typedef struct tagSLP1DATBITS {
  union {
    struct {
      uint16_t SLPDAT:16;
    };
    struct {
      uint16_t SLPDAT0:1;
      uint16_t SLPDAT1:1;
      uint16_t SLPDAT2:1;
      uint16_t SLPDAT3:1;
      uint16_t SLPDAT4:1;
      uint16_t SLPDAT5:1;
      uint16_t SLPDAT6:1;
      uint16_t SLPDAT7:1;
      uint16_t SLPDAT8:1;
      uint16_t SLPDAT9:1;
      uint16_t SLPDAT10:1;
      uint16_t SLPDAT11:1;
      uint16_t SLPDAT12:1;
      uint16_t SLPDAT13:1;
      uint16_t SLPDAT14:1;
      uint16_t SLPDAT15:1;
    };
  };
} SLP1DATBITS;
extern volatile SLP1DATBITS SLP1DATbits __attribute__((__sfr__));


extern volatile uint16_t VREGCON __attribute__((__sfr__));
typedef struct tagVREGCONBITS {
  uint16_t VREG1OV:2;
  uint16_t VREG2OV:2;
  uint16_t VREG3OV:2;
  uint16_t :9;
  uint16_t LPWREN:1;
} VREGCONBITS;
extern volatile VREGCONBITS VREGCONbits __attribute__((__sfr__));


extern volatile uint16_t RPCON __attribute__((__sfr__));
typedef struct tagRPCONBITS {
  uint16_t :11;
  uint16_t IOLOCK:1;
} RPCONBITS;
extern volatile RPCONBITS RPCONbits __attribute__((__sfr__));


extern volatile uint16_t RPINR0 __attribute__((__sfr__));
typedef struct tagRPINR0BITS {
  uint16_t :8;
  uint16_t INT1R:8;
} RPINR0BITS;
extern volatile RPINR0BITS RPINR0bits __attribute__((__sfr__));


extern volatile uint16_t RPINR1 __attribute__((__sfr__));
typedef struct tagRPINR1BITS {
  uint16_t INT2R:8;
  uint16_t INT3R:8;
} RPINR1BITS;
extern volatile RPINR1BITS RPINR1bits __attribute__((__sfr__));


extern volatile uint16_t RPINR2 __attribute__((__sfr__));
typedef struct tagRPINR2BITS {
  uint16_t :8;
  uint16_t T1CKR:8;
} RPINR2BITS;
extern volatile RPINR2BITS RPINR2bits __attribute__((__sfr__));


extern volatile uint16_t RPINR3 __attribute__((__sfr__));
typedef struct tagRPINR3BITS {
  uint16_t TCKI1R:8;
  uint16_t ICM1R:8;
} RPINR3BITS;
extern volatile RPINR3BITS RPINR3bits __attribute__((__sfr__));


extern volatile uint16_t RPINR4 __attribute__((__sfr__));
typedef struct tagRPINR4BITS {
  uint16_t TCKI2R:8;
  uint16_t ICM2R:8;
} RPINR4BITS;
extern volatile RPINR4BITS RPINR4bits __attribute__((__sfr__));


extern volatile uint16_t RPINR5 __attribute__((__sfr__));
typedef struct tagRPINR5BITS {
  uint16_t TCKI3R:8;
  uint16_t ICM3R:8;
} RPINR5BITS;
extern volatile RPINR5BITS RPINR5bits __attribute__((__sfr__));


extern volatile uint16_t RPINR6 __attribute__((__sfr__));
typedef struct tagRPINR6BITS {
  uint16_t TCKI4R:8;
  uint16_t ICM4R:8;
} RPINR6BITS;
extern volatile RPINR6BITS RPINR6bits __attribute__((__sfr__));


extern volatile uint16_t RPINR7 __attribute__((__sfr__));
typedef struct tagRPINR7BITS {
  uint16_t TCKI5R:8;
  uint16_t ICM5R:8;
} RPINR7BITS;
extern volatile RPINR7BITS RPINR7bits __attribute__((__sfr__));


extern volatile uint16_t RPINR8 __attribute__((__sfr__));
typedef struct tagRPINR8BITS {
  uint16_t TCKI6R:8;
  uint16_t ICM6R:8;
} RPINR8BITS;
extern volatile RPINR8BITS RPINR8bits __attribute__((__sfr__));


extern volatile uint16_t RPINR9 __attribute__((__sfr__));
typedef struct tagRPINR9BITS {
  uint16_t TCKI7R:8;
  uint16_t ICM7R:8;
} RPINR9BITS;
extern volatile RPINR9BITS RPINR9bits __attribute__((__sfr__));


extern volatile uint16_t RPINR10 __attribute__((__sfr__));
typedef struct tagRPINR10BITS {
  uint16_t TCKI8R:8;
  uint16_t ICM8R:8;
} RPINR10BITS;
extern volatile RPINR10BITS RPINR10bits __attribute__((__sfr__));


extern volatile uint16_t RPINR11 __attribute__((__sfr__));
typedef struct tagRPINR11BITS {
  uint16_t OCFAR:8;
  uint16_t OCFBR:8;
} RPINR11BITS;
extern volatile RPINR11BITS RPINR11bits __attribute__((__sfr__));


extern volatile uint16_t RPINR12 __attribute__((__sfr__));
typedef struct tagRPINR12BITS {
  uint16_t PCI8R:8;
  uint16_t PCI9R:8;
} RPINR12BITS;
extern volatile RPINR12BITS RPINR12bits __attribute__((__sfr__));


extern volatile uint16_t RPINR13 __attribute__((__sfr__));
typedef struct tagRPINR13BITS {
  uint16_t PCI10R:8;
  uint16_t PCI11R:8;
} RPINR13BITS;
extern volatile RPINR13BITS RPINR13bits __attribute__((__sfr__));


extern volatile uint16_t RPINR14 __attribute__((__sfr__));
typedef struct tagRPINR14BITS {
  uint16_t QEIA1R:8;
  uint16_t QEIB1R:8;
} RPINR14BITS;
extern volatile RPINR14BITS RPINR14bits __attribute__((__sfr__));


extern volatile uint16_t RPINR15 __attribute__((__sfr__));
typedef struct tagRPINR15BITS {
  uint16_t QEINDX1R:8;
  uint16_t QEIHOM1R:8;
} RPINR15BITS;
extern volatile RPINR15BITS RPINR15bits __attribute__((__sfr__));


extern volatile uint16_t RPINR18 __attribute__((__sfr__));
typedef struct tagRPINR18BITS {
  uint16_t U1RXR:8;
  uint16_t U1DSRR:8;
} RPINR18BITS;
extern volatile RPINR18BITS RPINR18bits __attribute__((__sfr__));


extern volatile uint16_t RPINR19 __attribute__((__sfr__));
typedef struct tagRPINR19BITS {
  uint16_t U2RXR:8;
  uint16_t U2DSRR:8;
} RPINR19BITS;
extern volatile RPINR19BITS RPINR19bits __attribute__((__sfr__));


extern volatile uint16_t RPINR20 __attribute__((__sfr__));
typedef struct tagRPINR20BITS {
  uint16_t SDI1R:8;
  uint16_t SCK1R:8;
} RPINR20BITS;
extern volatile RPINR20BITS RPINR20bits __attribute__((__sfr__));


extern volatile uint16_t RPINR21 __attribute__((__sfr__));
typedef struct tagRPINR21BITS {
  uint16_t SS1R:8;
  uint16_t REFOIR:8;
} RPINR21BITS;
extern volatile RPINR21BITS RPINR21bits __attribute__((__sfr__));


extern volatile uint16_t RPINR22 __attribute__((__sfr__));
typedef struct tagRPINR22BITS {
  uint16_t SDI2R:8;
  uint16_t SCK2R:8;
} RPINR22BITS;
extern volatile RPINR22BITS RPINR22bits __attribute__((__sfr__));


extern volatile uint16_t RPINR23 __attribute__((__sfr__));
typedef struct tagRPINR23BITS {
  uint16_t SS2R:8;
  uint16_t U1CTSR:8;
} RPINR23BITS;
extern volatile RPINR23BITS RPINR23bits __attribute__((__sfr__));


extern volatile uint16_t RPINR26 __attribute__((__sfr__));
typedef struct tagRPINR26BITS {
  uint16_t CAN1RXR:8;
  uint16_t CAN2RXR:8;
} RPINR26BITS;
extern volatile RPINR26BITS RPINR26bits __attribute__((__sfr__));


extern volatile uint16_t RPINR30 __attribute__((__sfr__));
typedef struct tagRPINR30BITS {
  uint16_t :8;
  uint16_t U2CTSR:8;
} RPINR30BITS;
extern volatile RPINR30BITS RPINR30bits __attribute__((__sfr__));


extern volatile uint16_t RPINR37 __attribute__((__sfr__));
typedef struct tagRPINR37BITS {
  uint16_t :8;
  uint16_t PCI17R:8;
} RPINR37BITS;
extern volatile RPINR37BITS RPINR37bits __attribute__((__sfr__));


extern volatile uint16_t RPINR38 __attribute__((__sfr__));
typedef struct tagRPINR38BITS {
  uint16_t PCI18R:8;
} RPINR38BITS;
extern volatile RPINR38BITS RPINR38bits __attribute__((__sfr__));


extern volatile uint16_t RPINR42 __attribute__((__sfr__));
typedef struct tagRPINR42BITS {
  uint16_t PCI12R:8;
  uint16_t PCI13R:8;
} RPINR42BITS;
extern volatile RPINR42BITS RPINR42bits __attribute__((__sfr__));


extern volatile uint16_t RPINR43 __attribute__((__sfr__));
typedef struct tagRPINR43BITS {
  uint16_t PCI14R:8;
  uint16_t PCI15R:8;
} RPINR43BITS;
extern volatile RPINR43BITS RPINR43bits __attribute__((__sfr__));


extern volatile uint16_t RPINR44 __attribute__((__sfr__));
typedef struct tagRPINR44BITS {
  uint16_t PCI16R:8;
  uint16_t SENT1R:8;
} RPINR44BITS;
extern volatile RPINR44BITS RPINR44bits __attribute__((__sfr__));


extern volatile uint16_t RPINR45 __attribute__((__sfr__));
typedef struct tagRPINR45BITS {
  uint16_t SENT2R:8;
  uint16_t CLCINAR:8;
} RPINR45BITS;
extern volatile RPINR45BITS RPINR45bits __attribute__((__sfr__));


extern volatile uint16_t RPINR46 __attribute__((__sfr__));
typedef struct tagRPINR46BITS {
  uint16_t CLCINBR:8;
  uint16_t CLCINCR:8;
} RPINR46BITS;
extern volatile RPINR46BITS RPINR46bits __attribute__((__sfr__));


extern volatile uint16_t RPINR47 __attribute__((__sfr__));
typedef struct tagRPINR47BITS {
  uint16_t CLCINDR:8;
  uint16_t ADCTRGR:8;
} RPINR47BITS;
extern volatile RPINR47BITS RPINR47bits __attribute__((__sfr__));


extern volatile uint16_t RPOR0 __attribute__((__sfr__));
typedef struct tagRPOR0BITS {
  uint16_t RP32R:6;
  uint16_t :2;
  uint16_t RP33R:6;
} RPOR0BITS;
extern volatile RPOR0BITS RPOR0bits __attribute__((__sfr__));


extern volatile uint16_t RPOR1 __attribute__((__sfr__));
typedef struct tagRPOR1BITS {
  uint16_t RP34R:6;
  uint16_t :2;
  uint16_t RP35R:6;
} RPOR1BITS;
extern volatile RPOR1BITS RPOR1bits __attribute__((__sfr__));


extern volatile uint16_t RPOR2 __attribute__((__sfr__));
typedef struct tagRPOR2BITS {
  uint16_t RP36R:6;
  uint16_t :2;
  uint16_t RP37R:6;
} RPOR2BITS;
extern volatile RPOR2BITS RPOR2bits __attribute__((__sfr__));


extern volatile uint16_t RPOR3 __attribute__((__sfr__));
typedef struct tagRPOR3BITS {
  uint16_t RP38R:6;
  uint16_t :2;
  uint16_t RP39R:6;
} RPOR3BITS;
extern volatile RPOR3BITS RPOR3bits __attribute__((__sfr__));


extern volatile uint16_t RPOR4 __attribute__((__sfr__));
typedef struct tagRPOR4BITS {
  uint16_t RP40R:6;
  uint16_t :2;
  uint16_t RP41R:6;
} RPOR4BITS;
extern volatile RPOR4BITS RPOR4bits __attribute__((__sfr__));


extern volatile uint16_t RPOR5 __attribute__((__sfr__));
typedef struct tagRPOR5BITS {
  uint16_t RP42R:6;
  uint16_t :2;
  uint16_t RP43R:6;
} RPOR5BITS;
extern volatile RPOR5BITS RPOR5bits __attribute__((__sfr__));


extern volatile uint16_t RPOR6 __attribute__((__sfr__));
typedef struct tagRPOR6BITS {
  uint16_t RP44R:6;
  uint16_t :2;
  uint16_t RP45R:6;
} RPOR6BITS;
extern volatile RPOR6BITS RPOR6bits __attribute__((__sfr__));


extern volatile uint16_t RPOR7 __attribute__((__sfr__));
typedef struct tagRPOR7BITS {
  uint16_t RP46R:6;
  uint16_t :2;
  uint16_t RP47R:6;
} RPOR7BITS;
extern volatile RPOR7BITS RPOR7bits __attribute__((__sfr__));


extern volatile uint16_t RPOR8 __attribute__((__sfr__));
typedef struct tagRPOR8BITS {
  uint16_t RP48R:6;
  uint16_t :2;
  uint16_t RP49R:6;
} RPOR8BITS;
extern volatile RPOR8BITS RPOR8bits __attribute__((__sfr__));


extern volatile uint16_t RPOR9 __attribute__((__sfr__));
typedef struct tagRPOR9BITS {
  uint16_t RP50R:6;
  uint16_t :2;
  uint16_t RP51R:6;
} RPOR9BITS;
extern volatile RPOR9BITS RPOR9bits __attribute__((__sfr__));


extern volatile uint16_t RPOR10 __attribute__((__sfr__));
typedef struct tagRPOR10BITS {
  uint16_t RP52R:6;
  uint16_t :2;
  uint16_t RP53R:6;
} RPOR10BITS;
extern volatile RPOR10BITS RPOR10bits __attribute__((__sfr__));


extern volatile uint16_t RPOR11 __attribute__((__sfr__));
typedef struct tagRPOR11BITS {
  uint16_t RP54R:6;
  uint16_t :2;
  uint16_t RP55R:6;
} RPOR11BITS;
extern volatile RPOR11BITS RPOR11bits __attribute__((__sfr__));


extern volatile uint16_t RPOR12 __attribute__((__sfr__));
typedef struct tagRPOR12BITS {
  uint16_t RP56R:6;
  uint16_t :2;
  uint16_t RP57R:6;
} RPOR12BITS;
extern volatile RPOR12BITS RPOR12bits __attribute__((__sfr__));


extern volatile uint16_t RPOR13 __attribute__((__sfr__));
typedef struct tagRPOR13BITS {
  uint16_t RP58R:6;
  uint16_t :2;
  uint16_t RP59R:6;
} RPOR13BITS;
extern volatile RPOR13BITS RPOR13bits __attribute__((__sfr__));


extern volatile uint16_t RPOR14 __attribute__((__sfr__));
typedef struct tagRPOR14BITS {
  uint16_t RP60R:6;
  uint16_t :2;
  uint16_t RP61R:6;
} RPOR14BITS;
extern volatile RPOR14BITS RPOR14bits __attribute__((__sfr__));


extern volatile uint16_t RPOR15 __attribute__((__sfr__));
typedef struct tagRPOR15BITS {
  uint16_t RP62R:6;
  uint16_t :2;
  uint16_t RP63R:6;
} RPOR15BITS;
extern volatile RPOR15BITS RPOR15bits __attribute__((__sfr__));


extern volatile uint16_t RPOR16 __attribute__((__sfr__));
typedef struct tagRPOR16BITS {
  uint16_t RP64R:6;
  uint16_t :2;
  uint16_t RP65R:6;
} RPOR16BITS;
extern volatile RPOR16BITS RPOR16bits __attribute__((__sfr__));


extern volatile uint16_t RPOR17 __attribute__((__sfr__));
typedef struct tagRPOR17BITS {
  uint16_t RP66R:6;
  uint16_t :2;
  uint16_t RP67R:6;
} RPOR17BITS;
extern volatile RPOR17BITS RPOR17bits __attribute__((__sfr__));


extern volatile uint16_t RPOR18 __attribute__((__sfr__));
typedef struct tagRPOR18BITS {
  uint16_t RP68R:6;
  uint16_t :2;
  uint16_t RP69R:6;
} RPOR18BITS;
extern volatile RPOR18BITS RPOR18bits __attribute__((__sfr__));


extern volatile uint16_t RPOR19 __attribute__((__sfr__));
typedef struct tagRPOR19BITS {
  uint16_t RP70R:6;
  uint16_t :2;
  uint16_t RP71R:6;
} RPOR19BITS;
extern volatile RPOR19BITS RPOR19bits __attribute__((__sfr__));


extern volatile uint16_t RPOR20 __attribute__((__sfr__));
typedef struct tagRPOR20BITS {
  uint16_t RP176R:6;
  uint16_t :2;
  uint16_t RP177R:6;
} RPOR20BITS;
extern volatile RPOR20BITS RPOR20bits __attribute__((__sfr__));


extern volatile uint16_t RPOR21 __attribute__((__sfr__));
typedef struct tagRPOR21BITS {
  uint16_t RP178R:6;
  uint16_t :2;
  uint16_t RP179R:6;
} RPOR21BITS;
extern volatile RPOR21BITS RPOR21bits __attribute__((__sfr__));


extern volatile uint16_t RPOR22 __attribute__((__sfr__));
typedef struct tagRPOR22BITS {
  uint16_t RP180R:6;
  uint16_t :2;
  uint16_t RP181R:6;
} RPOR22BITS;
extern volatile RPOR22BITS RPOR22bits __attribute__((__sfr__));


extern volatile uint16_t ANSELA __attribute__((__sfr__));
typedef struct tagANSELABITS {
  uint16_t ANSELA0:1;
  uint16_t ANSELA1:1;
  uint16_t ANSELA2:1;
  uint16_t ANSELA3:1;
  uint16_t ANSELA4:1;
} ANSELABITS;
extern volatile ANSELABITS ANSELAbits __attribute__((__sfr__));


extern volatile uint16_t TRISA __attribute__((__sfr__));
typedef struct tagTRISABITS {
  uint16_t TRISA0:1;
  uint16_t TRISA1:1;
  uint16_t TRISA2:1;
  uint16_t TRISA3:1;
  uint16_t TRISA4:1;
} TRISABITS;
extern volatile TRISABITS TRISAbits __attribute__((__sfr__));


extern volatile uint16_t PORTA __attribute__((__sfr__));
typedef struct tagPORTABITS {
  uint16_t RA0:1;
  uint16_t RA1:1;
  uint16_t RA2:1;
  uint16_t RA3:1;
  uint16_t RA4:1;
} PORTABITS;
extern volatile PORTABITS PORTAbits __attribute__((__sfr__));


extern volatile uint16_t LATA __attribute__((__sfr__));
typedef struct tagLATABITS {
  uint16_t LATA0:1;
  uint16_t LATA1:1;
  uint16_t LATA2:1;
  uint16_t LATA3:1;
  uint16_t LATA4:1;
} LATABITS;
extern volatile LATABITS LATAbits __attribute__((__sfr__));


extern volatile uint16_t ODCA __attribute__((__sfr__));
typedef struct tagODCABITS {
  uint16_t ODCA0:1;
  uint16_t ODCA1:1;
  uint16_t ODCA2:1;
  uint16_t ODCA3:1;
  uint16_t ODCA4:1;
} ODCABITS;
extern volatile ODCABITS ODCAbits __attribute__((__sfr__));


extern volatile uint16_t CNPUA __attribute__((__sfr__));
typedef struct tagCNPUABITS {
  uint16_t CNPUA0:1;
  uint16_t CNPUA1:1;
  uint16_t CNPUA2:1;
  uint16_t CNPUA3:1;
  uint16_t CNPUA4:1;
} CNPUABITS;
extern volatile CNPUABITS CNPUAbits __attribute__((__sfr__));


extern volatile uint16_t CNPDA __attribute__((__sfr__));
typedef struct tagCNPDABITS {
  uint16_t CNPDA0:1;
  uint16_t CNPDA1:1;
  uint16_t CNPDA2:1;
  uint16_t CNPDA3:1;
  uint16_t CNPDA4:1;
} CNPDABITS;
extern volatile CNPDABITS CNPDAbits __attribute__((__sfr__));


extern volatile uint16_t CNCONA __attribute__((__sfr__));
typedef struct tagCNCONABITS {
  uint16_t :11;
  uint16_t CNSTYLE:1;
  uint16_t :3;
  uint16_t ON:1;
} CNCONABITS;
extern volatile CNCONABITS CNCONAbits __attribute__((__sfr__));


extern volatile uint16_t CNEN0A __attribute__((__sfr__));
typedef struct tagCNEN0ABITS {
  uint16_t CNEN0A0:1;
  uint16_t CNEN0A1:1;
  uint16_t CNEN0A2:1;
  uint16_t CNEN0A3:1;
  uint16_t CNEN0A4:1;
} CNEN0ABITS;
extern volatile CNEN0ABITS CNEN0Abits __attribute__((__sfr__));


extern volatile uint16_t CNSTATA __attribute__((__sfr__));
typedef struct tagCNSTATABITS {
  uint16_t CNSTATA0:1;
  uint16_t CNSTATA1:1;
  uint16_t CNSTATA2:1;
  uint16_t CNSTATA3:1;
  uint16_t CNSTATA4:1;
} CNSTATABITS;
extern volatile CNSTATABITS CNSTATAbits __attribute__((__sfr__));


extern volatile uint16_t CNEN1A __attribute__((__sfr__));
typedef struct tagCNEN1ABITS {
  uint16_t CNEN1A0:1;
  uint16_t CNEN1A1:1;
  uint16_t CNEN1A2:1;
  uint16_t CNEN1A3:1;
  uint16_t CNEN1A4:1;
} CNEN1ABITS;
extern volatile CNEN1ABITS CNEN1Abits __attribute__((__sfr__));


extern volatile uint16_t CNFA __attribute__((__sfr__));
typedef struct tagCNFABITS {
  uint16_t CNFA0:1;
  uint16_t CNFA1:1;
  uint16_t CNFA2:1;
  uint16_t CNFA3:1;
  uint16_t CNFA4:1;
} CNFABITS;
extern volatile CNFABITS CNFAbits __attribute__((__sfr__));


extern volatile uint16_t ANSELB __attribute__((__sfr__));
typedef struct tagANSELBBITS {
  uint16_t ANSELB0:1;
  uint16_t ANSELB1:1;
  uint16_t ANSELB2:1;
  uint16_t ANSELB3:1;
  uint16_t ANSELB4:1;
  uint16_t :2;
  uint16_t ANSELB7:1;
  uint16_t ANSELB8:1;
  uint16_t ANSELB9:1;
} ANSELBBITS;
extern volatile ANSELBBITS ANSELBbits __attribute__((__sfr__));


extern volatile uint16_t TRISB __attribute__((__sfr__));
typedef struct tagTRISBBITS {
  uint16_t TRISB0:1;
  uint16_t TRISB1:1;
  uint16_t TRISB2:1;
  uint16_t TRISB3:1;
  uint16_t TRISB4:1;
  uint16_t TRISB5:1;
  uint16_t TRISB6:1;
  uint16_t TRISB7:1;
  uint16_t TRISB8:1;
  uint16_t TRISB9:1;
  uint16_t TRISB10:1;
  uint16_t TRISB11:1;
  uint16_t TRISB12:1;
  uint16_t TRISB13:1;
  uint16_t TRISB14:1;
  uint16_t TRISB15:1;
} TRISBBITS;
extern volatile TRISBBITS TRISBbits __attribute__((__sfr__));


extern volatile uint16_t PORTB __attribute__((__sfr__));
typedef struct tagPORTBBITS {
  uint16_t RB0:1;
  uint16_t RB1:1;
  uint16_t RB2:1;
  uint16_t RB3:1;
  uint16_t RB4:1;
  uint16_t RB5:1;
  uint16_t RB6:1;
  uint16_t RB7:1;
  uint16_t RB8:1;
  uint16_t RB9:1;
  uint16_t RB10:1;
  uint16_t RB11:1;
  uint16_t RB12:1;
  uint16_t RB13:1;
  uint16_t RB14:1;
  uint16_t RB15:1;
} PORTBBITS;
extern volatile PORTBBITS PORTBbits __attribute__((__sfr__));


extern volatile uint16_t LATB __attribute__((__sfr__));
typedef struct tagLATBBITS {
  uint16_t LATB0:1;
  uint16_t LATB1:1;
  uint16_t LATB2:1;
  uint16_t LATB3:1;
  uint16_t LATB4:1;
  uint16_t LATB5:1;
  uint16_t LATB6:1;
  uint16_t LATB7:1;
  uint16_t LATB8:1;
  uint16_t LATB9:1;
  uint16_t LATB10:1;
  uint16_t LATB11:1;
  uint16_t LATB12:1;
  uint16_t LATB13:1;
  uint16_t LATB14:1;
  uint16_t LATB15:1;
} LATBBITS;
extern volatile LATBBITS LATBbits __attribute__((__sfr__));


extern volatile uint16_t ODCB __attribute__((__sfr__));
typedef struct tagODCBBITS {
  uint16_t ODCB0:1;
  uint16_t ODCB1:1;
  uint16_t ODCB2:1;
  uint16_t ODCB3:1;
  uint16_t ODCB4:1;
  uint16_t ODCB5:1;
  uint16_t ODCB6:1;
  uint16_t ODCB7:1;
  uint16_t ODCB8:1;
  uint16_t ODCB9:1;
  uint16_t ODCB10:1;
  uint16_t ODCB11:1;
  uint16_t ODCB12:1;
  uint16_t ODCB13:1;
  uint16_t ODCB14:1;
  uint16_t ODCB15:1;
} ODCBBITS;
extern volatile ODCBBITS ODCBbits __attribute__((__sfr__));


extern volatile uint16_t CNPUB __attribute__((__sfr__));
typedef struct tagCNPUBBITS {
  uint16_t CNPUB0:1;
  uint16_t CNPUB1:1;
  uint16_t CNPUB2:1;
  uint16_t CNPUB3:1;
  uint16_t CNPUB4:1;
  uint16_t CNPUB5:1;
  uint16_t CNPUB6:1;
  uint16_t CNPUB7:1;
  uint16_t CNPUB8:1;
  uint16_t CNPUB9:1;
  uint16_t CNPUB10:1;
  uint16_t CNPUB11:1;
  uint16_t CNPUB12:1;
  uint16_t CNPUB13:1;
  uint16_t CNPUB14:1;
  uint16_t CNPUB15:1;
} CNPUBBITS;
extern volatile CNPUBBITS CNPUBbits __attribute__((__sfr__));


extern volatile uint16_t CNPDB __attribute__((__sfr__));
typedef struct tagCNPDBBITS {
  uint16_t CNPDB0:1;
  uint16_t CNPDB1:1;
  uint16_t CNPDB2:1;
  uint16_t CNPDB3:1;
  uint16_t CNPDB4:1;
  uint16_t CNPDB5:1;
  uint16_t CNPDB6:1;
  uint16_t CNPDB7:1;
  uint16_t CNPDB8:1;
  uint16_t CNPDB9:1;
  uint16_t CNPDB10:1;
  uint16_t CNPDB11:1;
  uint16_t CNPDB12:1;
  uint16_t CNPDB13:1;
  uint16_t CNPDB14:1;
  uint16_t CNPDB15:1;
} CNPDBBITS;
extern volatile CNPDBBITS CNPDBbits __attribute__((__sfr__));


extern volatile uint16_t CNCONB __attribute__((__sfr__));
typedef struct tagCNCONBBITS {
  uint16_t :11;
  uint16_t CNSTYLE:1;
  uint16_t :3;
  uint16_t ON:1;
} CNCONBBITS;
extern volatile CNCONBBITS CNCONBbits __attribute__((__sfr__));


extern volatile uint16_t CNEN0B __attribute__((__sfr__));
typedef struct tagCNEN0BBITS {
  uint16_t CNEN0B0:1;
  uint16_t CNEN0B1:1;
  uint16_t CNEN0B2:1;
  uint16_t CNEN0B3:1;
  uint16_t CNEN0B4:1;
  uint16_t CNEN0B5:1;
  uint16_t CNEN0B6:1;
  uint16_t CNEN0B7:1;
  uint16_t CNEN0B8:1;
  uint16_t CNEN0B9:1;
  uint16_t CNEN0B10:1;
  uint16_t CNEN0B11:1;
  uint16_t CNEN0B12:1;
  uint16_t CNEN0B13:1;
  uint16_t CNEN0B14:1;
  uint16_t CNEN0B15:1;
} CNEN0BBITS;
extern volatile CNEN0BBITS CNEN0Bbits __attribute__((__sfr__));


extern volatile uint16_t CNSTATB __attribute__((__sfr__));
typedef struct tagCNSTATBBITS {
  uint16_t CNSTATB0:1;
  uint16_t CNSTATB1:1;
  uint16_t CNSTATB2:1;
  uint16_t CNSTATB3:1;
  uint16_t CNSTATB4:1;
  uint16_t CNSTATB5:1;
  uint16_t CNSTATB6:1;
  uint16_t CNSTATB7:1;
  uint16_t CNSTATB8:1;
  uint16_t CNSTATB9:1;
  uint16_t CNSTATB10:1;
  uint16_t CNSTATB11:1;
  uint16_t CNSTATB12:1;
  uint16_t CNSTATB13:1;
  uint16_t CNSTATB14:1;
  uint16_t CNSTATB15:1;
} CNSTATBBITS;
extern volatile CNSTATBBITS CNSTATBbits __attribute__((__sfr__));


extern volatile uint16_t CNEN1B __attribute__((__sfr__));
typedef struct tagCNEN1BBITS {
  uint16_t CNEN1B0:1;
  uint16_t CNEN1B1:1;
  uint16_t CNEN1B2:1;
  uint16_t CNEN1B3:1;
  uint16_t CNEN1B4:1;
  uint16_t CNEN1B5:1;
  uint16_t CNEN1B6:1;
  uint16_t CNEN1B7:1;
  uint16_t CNEN1B8:1;
  uint16_t CNEN1B9:1;
  uint16_t CNEN1B10:1;
  uint16_t CNEN1B11:1;
  uint16_t CNEN1B12:1;
  uint16_t CNEN1B13:1;
  uint16_t CNEN1B14:1;
  uint16_t CNEN1B15:1;
} CNEN1BBITS;
extern volatile CNEN1BBITS CNEN1Bbits __attribute__((__sfr__));


extern volatile uint16_t CNFB __attribute__((__sfr__));
typedef struct tagCNFBBITS {
  uint16_t CNFB0:1;
  uint16_t CNFB1:1;
  uint16_t CNFB2:1;
  uint16_t CNFB3:1;
  uint16_t CNFB4:1;
  uint16_t CNFB5:1;
  uint16_t CNFB6:1;
  uint16_t CNFB7:1;
  uint16_t CNFB8:1;
  uint16_t CNFB9:1;
  uint16_t CNFB10:1;
  uint16_t CNFB11:1;
  uint16_t CNFB12:1;
  uint16_t CNFB13:1;
  uint16_t CNFB14:1;
  uint16_t CNFB15:1;
} CNFBBITS;
extern volatile CNFBBITS CNFBbits __attribute__((__sfr__));


extern volatile uint16_t ANSELC __attribute__((__sfr__));
typedef struct tagANSELCBITS {
  uint16_t ANSELC0:1;
  uint16_t ANSELC1:1;
  uint16_t ANSELC2:1;
  uint16_t ANSELC3:1;
  uint16_t :2;
  uint16_t ANSELC6:1;
  uint16_t ANSELC7:1;
} ANSELCBITS;
extern volatile ANSELCBITS ANSELCbits __attribute__((__sfr__));


extern volatile uint16_t TRISC __attribute__((__sfr__));
typedef struct tagTRISCBITS {
  uint16_t TRISC0:1;
  uint16_t TRISC1:1;
  uint16_t TRISC2:1;
  uint16_t TRISC3:1;
  uint16_t TRISC4:1;
  uint16_t TRISC5:1;
  uint16_t TRISC6:1;
  uint16_t TRISC7:1;
  uint16_t TRISC8:1;
  uint16_t TRISC9:1;
  uint16_t TRISC10:1;
  uint16_t TRISC11:1;
  uint16_t TRISC12:1;
  uint16_t TRISC13:1;
  uint16_t TRISC14:1;
  uint16_t TRISC15:1;
} TRISCBITS;
extern volatile TRISCBITS TRISCbits __attribute__((__sfr__));


extern volatile uint16_t PORTC __attribute__((__sfr__));
typedef struct tagPORTCBITS {
  uint16_t RC0:1;
  uint16_t RC1:1;
  uint16_t RC2:1;
  uint16_t RC3:1;
  uint16_t RC4:1;
  uint16_t RC5:1;
  uint16_t RC6:1;
  uint16_t RC7:1;
  uint16_t RC8:1;
  uint16_t RC9:1;
  uint16_t RC10:1;
  uint16_t RC11:1;
  uint16_t RC12:1;
  uint16_t RC13:1;
  uint16_t RC14:1;
  uint16_t RC15:1;
} PORTCBITS;
extern volatile PORTCBITS PORTCbits __attribute__((__sfr__));


extern volatile uint16_t LATC __attribute__((__sfr__));
typedef struct tagLATCBITS {
  uint16_t LATC0:1;
  uint16_t LATC1:1;
  uint16_t LATC2:1;
  uint16_t LATC3:1;
  uint16_t LATC4:1;
  uint16_t LATC5:1;
  uint16_t LATC6:1;
  uint16_t LATC7:1;
  uint16_t LATC8:1;
  uint16_t LATC9:1;
  uint16_t LATC10:1;
  uint16_t LATC11:1;
  uint16_t LATC12:1;
  uint16_t LATC13:1;
  uint16_t LATC14:1;
  uint16_t LATC15:1;
} LATCBITS;
extern volatile LATCBITS LATCbits __attribute__((__sfr__));


extern volatile uint16_t ODCC __attribute__((__sfr__));
typedef struct tagODCCBITS {
  uint16_t ODCC0:1;
  uint16_t ODCC1:1;
  uint16_t ODCC2:1;
  uint16_t ODCC3:1;
  uint16_t ODCC4:1;
  uint16_t ODCC5:1;
  uint16_t ODCC6:1;
  uint16_t ODCC7:1;
  uint16_t ODCC8:1;
  uint16_t ODCC9:1;
  uint16_t ODCC10:1;
  uint16_t ODCC11:1;
  uint16_t ODCC12:1;
  uint16_t ODCC13:1;
  uint16_t ODCC14:1;
  uint16_t ODCC15:1;
} ODCCBITS;
extern volatile ODCCBITS ODCCbits __attribute__((__sfr__));


extern volatile uint16_t CNPUC __attribute__((__sfr__));
typedef struct tagCNPUCBITS {
  uint16_t CNPUC0:1;
  uint16_t CNPUC1:1;
  uint16_t CNPUC2:1;
  uint16_t CNPUC3:1;
  uint16_t CNPUC4:1;
  uint16_t CNPUC5:1;
  uint16_t CNPUC6:1;
  uint16_t CNPUC7:1;
  uint16_t CNPUC8:1;
  uint16_t CNPUC9:1;
  uint16_t CNPUC10:1;
  uint16_t CNPUC11:1;
  uint16_t CNPUC12:1;
  uint16_t CNPUC13:1;
  uint16_t CNPUC14:1;
  uint16_t CNPUC15:1;
} CNPUCBITS;
extern volatile CNPUCBITS CNPUCbits __attribute__((__sfr__));


extern volatile uint16_t CNPDC __attribute__((__sfr__));
typedef struct tagCNPDCBITS {
  uint16_t CNPDC0:1;
  uint16_t CNPDC1:1;
  uint16_t CNPDC2:1;
  uint16_t CNPDC3:1;
  uint16_t CNPDC4:1;
  uint16_t CNPDC5:1;
  uint16_t CNPDC6:1;
  uint16_t CNPDC7:1;
  uint16_t CNPDC8:1;
  uint16_t CNPDC9:1;
  uint16_t CNPDC10:1;
  uint16_t CNPDC11:1;
  uint16_t CNPDC12:1;
  uint16_t CNPDC13:1;
  uint16_t CNPDC14:1;
  uint16_t CNPDC15:1;
} CNPDCBITS;
extern volatile CNPDCBITS CNPDCbits __attribute__((__sfr__));


extern volatile uint16_t CNCONC __attribute__((__sfr__));
typedef struct tagCNCONCBITS {
  uint16_t :11;
  uint16_t CNSTYLE:1;
  uint16_t :3;
  uint16_t ON:1;
} CNCONCBITS;
extern volatile CNCONCBITS CNCONCbits __attribute__((__sfr__));


extern volatile uint16_t CNEN0C __attribute__((__sfr__));
typedef struct tagCNEN0CBITS {
  uint16_t CNEN0C0:1;
  uint16_t CNEN0C1:1;
  uint16_t CNEN0C2:1;
  uint16_t CNEN0C3:1;
  uint16_t CNEN0C4:1;
  uint16_t CNEN0C5:1;
  uint16_t CNEN0C6:1;
  uint16_t CNEN0C7:1;
  uint16_t CNEN0C8:1;
  uint16_t CNEN0C9:1;
  uint16_t CNEN0C10:1;
  uint16_t CNEN0C11:1;
  uint16_t CNEN0C12:1;
  uint16_t CNEN0C13:1;
  uint16_t CNEN0C14:1;
  uint16_t CNEN0C15:1;
} CNEN0CBITS;
extern volatile CNEN0CBITS CNEN0Cbits __attribute__((__sfr__));


extern volatile uint16_t CNSTATC __attribute__((__sfr__));
typedef struct tagCNSTATCBITS {
  uint16_t CNSTATC0:1;
  uint16_t CNSTATC1:1;
  uint16_t CNSTATC2:1;
  uint16_t CNSTATC3:1;
  uint16_t CNSTATC4:1;
  uint16_t CNSTATC5:1;
  uint16_t CNSTATC6:1;
  uint16_t CNSTATC7:1;
  uint16_t CNSTATC8:1;
  uint16_t CNSTATC9:1;
  uint16_t CNSTATC10:1;
  uint16_t CNSTATC11:1;
  uint16_t CNSTATC12:1;
  uint16_t CNSTATC13:1;
  uint16_t CNSTATC14:1;
  uint16_t CNSTATC15:1;
} CNSTATCBITS;
extern volatile CNSTATCBITS CNSTATCbits __attribute__((__sfr__));


extern volatile uint16_t CNEN1C __attribute__((__sfr__));
typedef struct tagCNEN1CBITS {
  uint16_t CNEN1C0:1;
  uint16_t CNEN1C1:1;
  uint16_t CNEN1C2:1;
  uint16_t CNEN1C3:1;
  uint16_t CNEN1C4:1;
  uint16_t CNEN1C5:1;
  uint16_t CNEN1C6:1;
  uint16_t CNEN1C7:1;
  uint16_t CNEN1C8:1;
  uint16_t CNEN1C9:1;
  uint16_t CNEN1C10:1;
  uint16_t CNEN1C11:1;
  uint16_t CNEN1C12:1;
  uint16_t CNEN1C13:1;
  uint16_t CNEN1C14:1;
  uint16_t CNEN1C15:1;
} CNEN1CBITS;
extern volatile CNEN1CBITS CNEN1Cbits __attribute__((__sfr__));


extern volatile uint16_t CNFC __attribute__((__sfr__));
typedef struct tagCNFCBITS {
  uint16_t CNFC0:1;
  uint16_t CNFC1:1;
  uint16_t CNFC2:1;
  uint16_t CNFC3:1;
  uint16_t CNFC4:1;
  uint16_t CNFC5:1;
  uint16_t CNFC6:1;
  uint16_t CNFC7:1;
  uint16_t CNFC8:1;
  uint16_t CNFC9:1;
  uint16_t CNFC10:1;
  uint16_t CNFC11:1;
  uint16_t CNFC12:1;
  uint16_t CNFC13:1;
  uint16_t CNFC14:1;
  uint16_t CNFC15:1;
} CNFCBITS;
extern volatile CNFCBITS CNFCbits __attribute__((__sfr__));


extern volatile uint16_t ANSELD __attribute__((__sfr__));
typedef struct tagANSELDBITS {
  uint16_t :10;
  uint16_t ANSELD10:1;
  uint16_t ANSELD11:1;
  uint16_t ANSELD12:1;
  uint16_t ANSELD13:1;
  uint16_t ANSELD14:1;
} ANSELDBITS;
extern volatile ANSELDBITS ANSELDbits __attribute__((__sfr__));


extern volatile uint16_t TRISD __attribute__((__sfr__));
typedef struct tagTRISDBITS {
  uint16_t TRISD0:1;
  uint16_t TRISD1:1;
  uint16_t TRISD2:1;
  uint16_t TRISD3:1;
  uint16_t TRISD4:1;
  uint16_t TRISD5:1;
  uint16_t TRISD6:1;
  uint16_t TRISD7:1;
  uint16_t TRISD8:1;
  uint16_t TRISD9:1;
  uint16_t TRISD10:1;
  uint16_t TRISD11:1;
  uint16_t TRISD12:1;
  uint16_t TRISD13:1;
  uint16_t TRISD14:1;
  uint16_t TRISD15:1;
} TRISDBITS;
extern volatile TRISDBITS TRISDbits __attribute__((__sfr__));


extern volatile uint16_t PORTD __attribute__((__sfr__));
typedef struct tagPORTDBITS {
  uint16_t RD0:1;
  uint16_t RD1:1;
  uint16_t RD2:1;
  uint16_t RD3:1;
  uint16_t RD4:1;
  uint16_t RD5:1;
  uint16_t RD6:1;
  uint16_t RD7:1;
  uint16_t RD8:1;
  uint16_t RD9:1;
  uint16_t RD10:1;
  uint16_t RD11:1;
  uint16_t RD12:1;
  uint16_t RD13:1;
  uint16_t RD14:1;
  uint16_t RD15:1;
} PORTDBITS;
extern volatile PORTDBITS PORTDbits __attribute__((__sfr__));


extern volatile uint16_t LATD __attribute__((__sfr__));
typedef struct tagLATDBITS {
  uint16_t LATD0:1;
  uint16_t LATD1:1;
  uint16_t LATD2:1;
  uint16_t LATD3:1;
  uint16_t LATD4:1;
  uint16_t LATD5:1;
  uint16_t LATD6:1;
  uint16_t LATD7:1;
  uint16_t LATD8:1;
  uint16_t LATD9:1;
  uint16_t LATD10:1;
  uint16_t LATD11:1;
  uint16_t LATD12:1;
  uint16_t LATD13:1;
  uint16_t LATD14:1;
  uint16_t LATD15:1;
} LATDBITS;
extern volatile LATDBITS LATDbits __attribute__((__sfr__));


extern volatile uint16_t ODCD __attribute__((__sfr__));
typedef struct tagODCDBITS {
  uint16_t ODCD0:1;
  uint16_t ODCD1:1;
  uint16_t ODCD2:1;
  uint16_t ODCD3:1;
  uint16_t ODCD4:1;
  uint16_t ODCD5:1;
  uint16_t ODCD6:1;
  uint16_t ODCD7:1;
  uint16_t ODCD8:1;
  uint16_t ODCD9:1;
  uint16_t ODCD10:1;
  uint16_t ODCD11:1;
  uint16_t ODCD12:1;
  uint16_t ODCD13:1;
  uint16_t ODCD14:1;
  uint16_t ODCD15:1;
} ODCDBITS;
extern volatile ODCDBITS ODCDbits __attribute__((__sfr__));


extern volatile uint16_t CNPUD __attribute__((__sfr__));
typedef struct tagCNPUDBITS {
  uint16_t CNPUD0:1;
  uint16_t CNPUD1:1;
  uint16_t CNPUD2:1;
  uint16_t CNPUD3:1;
  uint16_t CNPUD4:1;
  uint16_t CNPUD5:1;
  uint16_t CNPUD6:1;
  uint16_t CNPUD7:1;
  uint16_t CNPUD8:1;
  uint16_t CNPUD9:1;
  uint16_t CNPUD10:1;
  uint16_t CNPUD11:1;
  uint16_t CNPUD12:1;
  uint16_t CNPUD13:1;
  uint16_t CNPUD14:1;
  uint16_t CNPUD15:1;
} CNPUDBITS;
extern volatile CNPUDBITS CNPUDbits __attribute__((__sfr__));


extern volatile uint16_t CNPDD __attribute__((__sfr__));
typedef struct tagCNPDDBITS {
  uint16_t CNPDD0:1;
  uint16_t CNPDD1:1;
  uint16_t CNPDD2:1;
  uint16_t CNPDD3:1;
  uint16_t CNPDD4:1;
  uint16_t CNPDD5:1;
  uint16_t CNPDD6:1;
  uint16_t CNPDD7:1;
  uint16_t CNPDD8:1;
  uint16_t CNPDD9:1;
  uint16_t CNPDD10:1;
  uint16_t CNPDD11:1;
  uint16_t CNPDD12:1;
  uint16_t CNPDD13:1;
  uint16_t CNPDD14:1;
  uint16_t CNPDD15:1;
} CNPDDBITS;
extern volatile CNPDDBITS CNPDDbits __attribute__((__sfr__));


extern volatile uint16_t CNCOND __attribute__((__sfr__));
typedef struct tagCNCONDBITS {
  uint16_t :11;
  uint16_t CNSTYLE:1;
  uint16_t :3;
  uint16_t ON:1;
} CNCONDBITS;
extern volatile CNCONDBITS CNCONDbits __attribute__((__sfr__));


extern volatile uint16_t CNEN0D __attribute__((__sfr__));
typedef struct tagCNEN0DBITS {
  uint16_t CNEN0D0:1;
  uint16_t CNEN0D1:1;
  uint16_t CNEN0D2:1;
  uint16_t CNEN0D3:1;
  uint16_t CNEN0D4:1;
  uint16_t CNEN0D5:1;
  uint16_t CNEN0D6:1;
  uint16_t CNEN0D7:1;
  uint16_t CNEN0D8:1;
  uint16_t CNEN0D9:1;
  uint16_t CNEN0D10:1;
  uint16_t CNEN0D11:1;
  uint16_t CNEN0D12:1;
  uint16_t CNEN0D13:1;
  uint16_t CNEN0D14:1;
  uint16_t CNEN0D15:1;
} CNEN0DBITS;
extern volatile CNEN0DBITS CNEN0Dbits __attribute__((__sfr__));


extern volatile uint16_t CNSTATD __attribute__((__sfr__));
typedef struct tagCNSTATDBITS {
  uint16_t CNSTATD0:1;
  uint16_t CNSTATD1:1;
  uint16_t CNSTATD2:1;
  uint16_t CNSTATD3:1;
  uint16_t CNSTATD4:1;
  uint16_t CNSTATD5:1;
  uint16_t CNSTATD6:1;
  uint16_t CNSTATD7:1;
  uint16_t CNSTATD8:1;
  uint16_t CNSTATD9:1;
  uint16_t CNSTATD10:1;
  uint16_t CNSTATD11:1;
  uint16_t CNSTATD12:1;
  uint16_t CNSTATD13:1;
  uint16_t CNSTATD14:1;
  uint16_t CNSTATD15:1;
} CNSTATDBITS;
extern volatile CNSTATDBITS CNSTATDbits __attribute__((__sfr__));


extern volatile uint16_t CNEN1D __attribute__((__sfr__));
typedef struct tagCNEN1DBITS {
  uint16_t CNEN1D0:1;
  uint16_t CNEN1D1:1;
  uint16_t CNEN1D2:1;
  uint16_t CNEN1D3:1;
  uint16_t CNEN1D4:1;
  uint16_t CNEN1D5:1;
  uint16_t CNEN1D6:1;
  uint16_t CNEN1D7:1;
  uint16_t CNEN1D8:1;
  uint16_t CNEN1D9:1;
  uint16_t CNEN1D10:1;
  uint16_t CNEN1D11:1;
  uint16_t CNEN1D12:1;
  uint16_t CNEN1D13:1;
  uint16_t CNEN1D14:1;
  uint16_t CNEN1D15:1;
} CNEN1DBITS;
extern volatile CNEN1DBITS CNEN1Dbits __attribute__((__sfr__));


extern volatile uint16_t CNFD __attribute__((__sfr__));
typedef struct tagCNFDBITS {
  uint16_t CNFD0:1;
  uint16_t CNFD1:1;
  uint16_t CNFD2:1;
  uint16_t CNFD3:1;
  uint16_t CNFD4:1;
  uint16_t CNFD5:1;
  uint16_t CNFD6:1;
  uint16_t CNFD7:1;
  uint16_t CNFD8:1;
  uint16_t CNFD9:1;
  uint16_t CNFD10:1;
  uint16_t CNFD11:1;
  uint16_t CNFD12:1;
  uint16_t CNFD13:1;
  uint16_t CNFD14:1;
  uint16_t CNFD15:1;
} CNFDBITS;
extern volatile CNFDBITS CNFDbits __attribute__((__sfr__));


extern volatile uint16_t ANSELE __attribute__((__sfr__));
typedef struct tagANSELEBITS {
  uint16_t :6;
  uint16_t ANSELE6:1;
} ANSELEBITS;
extern volatile ANSELEBITS ANSELEbits __attribute__((__sfr__));


extern volatile uint16_t TRISE __attribute__((__sfr__));
typedef struct tagTRISEBITS {
  uint16_t TRISE0:1;
  uint16_t TRISE1:1;
  uint16_t TRISE2:1;
  uint16_t TRISE3:1;
  uint16_t TRISE4:1;
  uint16_t TRISE5:1;
  uint16_t TRISE6:1;
  uint16_t TRISE7:1;
  uint16_t TRISE8:1;
  uint16_t TRISE9:1;
  uint16_t TRISE10:1;
  uint16_t TRISE11:1;
  uint16_t TRISE12:1;
  uint16_t TRISE13:1;
  uint16_t TRISE14:1;
  uint16_t TRISE15:1;
} TRISEBITS;
extern volatile TRISEBITS TRISEbits __attribute__((__sfr__));


extern volatile uint16_t PORTE __attribute__((__sfr__));
typedef struct tagPORTEBITS {
  uint16_t RE0:1;
  uint16_t RE1:1;
  uint16_t RE2:1;
  uint16_t RE3:1;
  uint16_t RE4:1;
  uint16_t RE5:1;
  uint16_t RE6:1;
  uint16_t RE7:1;
  uint16_t RE8:1;
  uint16_t RE9:1;
  uint16_t RE10:1;
  uint16_t RE11:1;
  uint16_t RE12:1;
  uint16_t RE13:1;
  uint16_t RE14:1;
  uint16_t RE15:1;
} PORTEBITS;
extern volatile PORTEBITS PORTEbits __attribute__((__sfr__));


extern volatile uint16_t LATE __attribute__((__sfr__));
typedef struct tagLATEBITS {
  uint16_t LATE0:1;
  uint16_t LATE1:1;
  uint16_t LATE2:1;
  uint16_t LATE3:1;
  uint16_t LATE4:1;
  uint16_t LATE5:1;
  uint16_t LATE6:1;
  uint16_t LATE7:1;
  uint16_t LATE8:1;
  uint16_t LATE9:1;
  uint16_t LATE10:1;
  uint16_t LATE11:1;
  uint16_t LATE12:1;
  uint16_t LATE13:1;
  uint16_t LATE14:1;
  uint16_t LATE15:1;
} LATEBITS;
extern volatile LATEBITS LATEbits __attribute__((__sfr__));


extern volatile uint16_t ODCE __attribute__((__sfr__));
typedef struct tagODCEBITS {
  uint16_t ODCE0:1;
  uint16_t ODCE1:1;
  uint16_t ODCE2:1;
  uint16_t ODCE3:1;
  uint16_t ODCE4:1;
  uint16_t ODCE5:1;
  uint16_t ODCE6:1;
  uint16_t ODCE7:1;
  uint16_t ODCE8:1;
  uint16_t ODCE9:1;
  uint16_t ODCE10:1;
  uint16_t ODCE11:1;
  uint16_t ODCE12:1;
  uint16_t ODCE13:1;
  uint16_t ODCE14:1;
  uint16_t ODCE15:1;
} ODCEBITS;
extern volatile ODCEBITS ODCEbits __attribute__((__sfr__));


extern volatile uint16_t CNPUE __attribute__((__sfr__));
typedef struct tagCNPUEBITS {
  uint16_t CNPUE0:1;
  uint16_t CNPUE1:1;
  uint16_t CNPUE2:1;
  uint16_t CNPUE3:1;
  uint16_t CNPUE4:1;
  uint16_t CNPUE5:1;
  uint16_t CNPUE6:1;
  uint16_t CNPUE7:1;
  uint16_t CNPUE8:1;
  uint16_t CNPUE9:1;
  uint16_t CNPUE10:1;
  uint16_t CNPUE11:1;
  uint16_t CNPUE12:1;
  uint16_t CNPUE13:1;
  uint16_t CNPUE14:1;
  uint16_t CNPUE15:1;
} CNPUEBITS;
extern volatile CNPUEBITS CNPUEbits __attribute__((__sfr__));


extern volatile uint16_t CNPDE __attribute__((__sfr__));
typedef struct tagCNPDEBITS {
  uint16_t CNPDE0:1;
  uint16_t CNPDE1:1;
  uint16_t CNPDE2:1;
  uint16_t CNPDE3:1;
  uint16_t CNPDE4:1;
  uint16_t CNPDE5:1;
  uint16_t CNPDE6:1;
  uint16_t CNPDE7:1;
  uint16_t CNPDE8:1;
  uint16_t CNPDE9:1;
  uint16_t CNPDE10:1;
  uint16_t CNPDE11:1;
  uint16_t CNPDE12:1;
  uint16_t CNPDE13:1;
  uint16_t CNPDE14:1;
  uint16_t CNPDE15:1;
} CNPDEBITS;
extern volatile CNPDEBITS CNPDEbits __attribute__((__sfr__));


extern volatile uint16_t CNCONE __attribute__((__sfr__));
typedef struct tagCNCONEBITS {
  uint16_t :11;
  uint16_t CNSTYLE:1;
  uint16_t :3;
  uint16_t ON:1;
} CNCONEBITS;
extern volatile CNCONEBITS CNCONEbits __attribute__((__sfr__));


extern volatile uint16_t CNEN0E __attribute__((__sfr__));
typedef struct tagCNEN0EBITS {
  uint16_t CNEN0E0:1;
  uint16_t CNEN0E1:1;
  uint16_t CNEN0E2:1;
  uint16_t CNEN0E3:1;
  uint16_t CNEN0E4:1;
  uint16_t CNEN0E5:1;
  uint16_t CNEN0E6:1;
  uint16_t CNEN0E7:1;
  uint16_t CNEN0E8:1;
  uint16_t CNEN0E9:1;
  uint16_t CNEN0E10:1;
  uint16_t CNEN0E11:1;
  uint16_t CNEN0E12:1;
  uint16_t CNEN0E13:1;
  uint16_t CNEN0E14:1;
  uint16_t CNEN0E15:1;
} CNEN0EBITS;
extern volatile CNEN0EBITS CNEN0Ebits __attribute__((__sfr__));


extern volatile uint16_t CNSTATE __attribute__((__sfr__));
typedef struct tagCNSTATEBITS {
  uint16_t CNSTATE0:1;
  uint16_t CNSTATE1:1;
  uint16_t CNSTATE2:1;
  uint16_t CNSTATE3:1;
  uint16_t CNSTATE4:1;
  uint16_t CNSTATE5:1;
  uint16_t CNSTATE6:1;
  uint16_t CNSTATE7:1;
  uint16_t CNSTATE8:1;
  uint16_t CNSTATE9:1;
  uint16_t CNSTATE10:1;
  uint16_t CNSTATE11:1;
  uint16_t CNSTATE12:1;
  uint16_t CNSTATE13:1;
  uint16_t CNSTATE14:1;
  uint16_t CNSTATE15:1;
} CNSTATEBITS;
extern volatile CNSTATEBITS CNSTATEbits __attribute__((__sfr__));


extern volatile uint16_t CNEN1E __attribute__((__sfr__));
typedef struct tagCNEN1EBITS {
  uint16_t CNEN1E0:1;
  uint16_t CNEN1E1:1;
  uint16_t CNEN1E2:1;
  uint16_t CNEN1E3:1;
  uint16_t CNEN1E4:1;
  uint16_t CNEN1E5:1;
  uint16_t CNEN1E6:1;
  uint16_t CNEN1E7:1;
  uint16_t CNEN1E8:1;
  uint16_t CNEN1E9:1;
  uint16_t CNEN1E10:1;
  uint16_t CNEN1E11:1;
  uint16_t CNEN1E12:1;
  uint16_t CNEN1E13:1;
  uint16_t CNEN1E14:1;
  uint16_t CNEN1E15:1;
} CNEN1EBITS;
extern volatile CNEN1EBITS CNEN1Ebits __attribute__((__sfr__));


extern volatile uint16_t CNFE __attribute__((__sfr__));
typedef struct tagCNFEBITS {
  uint16_t CNFE0:1;
  uint16_t CNFE1:1;
  uint16_t CNFE2:1;
  uint16_t CNFE3:1;
  uint16_t CNFE4:1;
  uint16_t CNFE5:1;
  uint16_t CNFE6:1;
  uint16_t CNFE7:1;
  uint16_t CNFE8:1;
  uint16_t CNFE9:1;
  uint16_t CNFE10:1;
  uint16_t CNFE11:1;
  uint16_t CNFE12:1;
  uint16_t CNFE13:1;
  uint16_t CNFE14:1;
  uint16_t CNFE15:1;
} CNFEBITS;
extern volatile CNFEBITS CNFEbits __attribute__((__sfr__));


extern volatile uint16_t MBISTCON __attribute__((__sfr__));
typedef struct tagMBISTCONBITS {
  uint16_t MBISTEN:1;
  uint16_t :3;
  uint16_t MBISTSTAT:1;
  uint16_t :2;
  uint16_t MBISTDONE:1;
  uint16_t FLTINJ:1;
} MBISTCONBITS;
extern volatile MBISTCONBITS MBISTCONbits __attribute__((__sfr__));


extern volatile uint16_t RCON __attribute__((__sfr__));
typedef struct tagRCONBITS {
  uint16_t POR:1;
  uint16_t BOR:1;
  uint16_t IDLE:1;
  uint16_t SLEEP:1;
  uint16_t WDTO:1;
  uint16_t SWDTEN:1;
  uint16_t SWR:1;
  uint16_t EXTR:1;
  uint16_t VREGS:1;
  uint16_t CM:1;
  uint16_t :1;
  uint16_t VREGSF:1;
  uint16_t RETEN:1;
  uint16_t SBOREN:1;
  uint16_t IOPUWR:1;
  uint16_t TRAPR:1;
} RCONBITS;
extern volatile RCONBITS RCONbits __attribute__((__sfr__));


extern volatile uint16_t OSCCON __attribute__((__sfr__));
__extension__ typedef struct tagOSCCONBITS {
  union {
    struct {
      uint16_t OSWEN:1;
      uint16_t :2;
      uint16_t CF:1;
      uint16_t :1;
      uint16_t LOCK:1;
      uint16_t :1;
      uint16_t CLKLOCK:1;
      uint16_t NOSC:3;
      uint16_t :1;
      uint16_t COSC:3;
    };
    struct {
      uint16_t :8;
      uint16_t NOSC0:1;
      uint16_t NOSC1:1;
      uint16_t NOSC2:1;
      uint16_t :1;
      uint16_t COSC0:1;
      uint16_t COSC1:1;
      uint16_t COSC2:1;
    };
  };
} OSCCONBITS;
extern volatile OSCCONBITS OSCCONbits __attribute__((__sfr__));


extern volatile uint8_t OSCCONL __attribute__((__sfr__));

extern volatile uint8_t OSCCONH __attribute__((__sfr__));

extern volatile uint16_t CLKDIV __attribute__((__sfr__));
__extension__ typedef struct tagCLKDIVBITS {
  union {
    struct {
      uint16_t PLLPRE:6;
      uint16_t :2;
      uint16_t FRCDIV:3;
      uint16_t DOZEN:1;
      uint16_t DOZE:3;
      uint16_t ROI:1;
    };
    struct {
      uint16_t PLLPRE0:1;
      uint16_t PLLPRE1:1;
      uint16_t PLLPRE2:1;
      uint16_t PLLPRE3:1;
      uint16_t PLLPRE4:1;
      uint16_t PLLPRE5:1;
      uint16_t :2;
      uint16_t FRCDIV0:1;
      uint16_t FRCDIV1:1;
      uint16_t FRCDIV2:1;
      uint16_t :1;
      uint16_t DOZE0:1;
      uint16_t DOZE1:1;
      uint16_t DOZE2:1;
    };
  };
} CLKDIVBITS;
extern volatile CLKDIVBITS CLKDIVbits __attribute__((__sfr__));


extern volatile uint16_t PLLFBD __attribute__((__sfr__));
__extension__ typedef struct tagPLLFBDBITS {
  union {
    struct {
      uint16_t PLLFBDIV:12;
    };
    struct {
      uint16_t PLLFBDIV0:1;
      uint16_t PLLFBDIV1:1;
      uint16_t PLLFBDIV2:1;
      uint16_t PLLFBDIV3:1;
      uint16_t PLLFBDIV4:1;
      uint16_t PLLFBDIV5:1;
      uint16_t PLLFBDIV6:1;
      uint16_t PLLFBDIV7:1;
      uint16_t PLLFBDIV8:1;
      uint16_t PLLFBDIV9:1;
      uint16_t PLLFBDIV10:1;
      uint16_t PLLFBDIV11:1;
    };
  };
} PLLFBDBITS;
extern volatile PLLFBDBITS PLLFBDbits __attribute__((__sfr__));


extern volatile uint16_t PLLDIV __attribute__((__sfr__));
__extension__ typedef struct tagPLLDIVBITS {
  union {
    struct {
      uint16_t POST2DIV:3;
      uint16_t :1;
      uint16_t POST1DIV:3;
      uint16_t :1;
      uint16_t VCODIV:2;
    };
    struct {
      uint16_t POST2DIV0:1;
      uint16_t POST2DIV1:1;
      uint16_t POST2DIV2:1;
      uint16_t :1;
      uint16_t POST1DIV0:1;
      uint16_t POST1DIV1:1;
      uint16_t POST1DIV2:1;
      uint16_t :1;
      uint16_t VCODIV0:1;
      uint16_t VCODIV1:1;
    };
  };
} PLLDIVBITS;
extern volatile PLLDIVBITS PLLDIVbits __attribute__((__sfr__));


extern volatile uint16_t OSCTUN __attribute__((__sfr__));
__extension__ typedef struct tagOSCTUNBITS {
  union {
    struct {
      uint16_t TUN:6;
    };
    struct {
      uint16_t TUN0:1;
      uint16_t TUN1:1;
      uint16_t TUN2:1;
      uint16_t TUN3:1;
      uint16_t TUN4:1;
      uint16_t TUN5:1;
    };
  };
} OSCTUNBITS;
extern volatile OSCTUNBITS OSCTUNbits __attribute__((__sfr__));


extern volatile uint16_t ACLKCON1 __attribute__((__sfr__));
__extension__ typedef struct tagACLKCON1BITS {
  union {
    struct {
      uint16_t APLLPRE:6;
      uint16_t :2;
      uint16_t FRCSEL:1;
      uint16_t :5;
      uint16_t APLLCK:1;
      uint16_t APLLEN:1;
    };
    struct {
      uint16_t APLLPRE0:1;
      uint16_t APLLPRE1:1;
      uint16_t APLLPRE2:1;
      uint16_t APLLPRE3:1;
      uint16_t APLLPRE4:1;
      uint16_t APLLPRE5:1;
    };
  };
} ACLKCON1BITS;
extern volatile ACLKCON1BITS ACLKCON1bits __attribute__((__sfr__));


extern volatile uint16_t APLLFBD1 __attribute__((__sfr__));
__extension__ typedef struct tagAPLLFBD1BITS {
  union {
    struct {
      uint16_t APLLFBDIV:12;
    };
    struct {
      uint16_t APLLFBDIV0:1;
      uint16_t APLLFBDIV1:1;
      uint16_t APLLFBDIV2:1;
      uint16_t APLLFBDIV3:1;
      uint16_t APLLFBDIV4:1;
      uint16_t APLLFBDIV5:1;
      uint16_t APLLFBDIV6:1;
      uint16_t APLLFBDIV7:1;
      uint16_t APLLFBDIV8:1;
      uint16_t APLLFBDIV9:1;
      uint16_t APLLFBDIV10:1;
      uint16_t APLLFBDIV11:1;
    };
  };
} APLLFBD1BITS;
extern volatile APLLFBD1BITS APLLFBD1bits __attribute__((__sfr__));


extern volatile uint16_t APLLDIV1 __attribute__((__sfr__));
__extension__ typedef struct tagAPLLDIV1BITS {
  union {
    struct {
      uint16_t APOST2DIV:3;
      uint16_t :1;
      uint16_t APOST1DIV:3;
      uint16_t :1;
      uint16_t AVCODIV:2;
    };
    struct {
      uint16_t APOST2DIV0:1;
      uint16_t APOST2DIV1:1;
      uint16_t APOST2DIV2:1;
      uint16_t :1;
      uint16_t APOST1DIV0:1;
      uint16_t APOST1DIV1:1;
      uint16_t APOST1DIV2:1;
      uint16_t :1;
      uint16_t AVCODIV0:1;
      uint16_t AVCODIV1:1;
    };
  };
} APLLDIV1BITS;
extern volatile APLLDIV1BITS APLLDIV1bits __attribute__((__sfr__));


extern volatile uint16_t CANCLKCON __attribute__((__sfr__));
__extension__ typedef struct tagCANCLKCONBITS {
  union {
    struct {
      uint16_t CANCLKDIV:7;
      uint16_t :1;
      uint16_t CANCLKSEL:4;
      uint16_t :3;
      uint16_t CANCLKEN:1;
    };
    struct {
      uint16_t CANCLKDIV0:1;
      uint16_t CANCLKDIV1:1;
      uint16_t CANCLKDIV2:1;
      uint16_t CANCLKDIV3:1;
      uint16_t CANCLKDIV4:1;
      uint16_t CANCLKDIV5:1;
      uint16_t CANCLKDIV6:1;
      uint16_t :1;
      uint16_t CANCLKSEL0:1;
      uint16_t CANCLKSEL1:1;
      uint16_t CANCLKSEL2:1;
      uint16_t CANCLKSEL3:1;
    };
  };
} CANCLKCONBITS;
extern volatile CANCLKCONBITS CANCLKCONbits __attribute__((__sfr__));


extern volatile uint16_t PMD1 __attribute__((__sfr__));
typedef struct tagPMD1BITS {
  uint16_t ADC1MD:1;
  uint16_t C1MD:1;
  uint16_t C2MD:1;
  uint16_t SPI1MD:1;
  uint16_t SPI2MD:1;
  uint16_t U1MD:1;
  uint16_t U2MD:1;
  uint16_t I2C1MD:1;
  uint16_t :1;
  uint16_t PWMMD:1;
  uint16_t QEIMD:1;
  uint16_t T1MD:1;
} PMD1BITS;
extern volatile PMD1BITS PMD1bits __attribute__((__sfr__));


extern volatile uint16_t PMD2 __attribute__((__sfr__));
typedef struct tagPMD2BITS {
  uint16_t CCP1MD:1;
  uint16_t CCP2MD:1;
  uint16_t CCP3MD:1;
  uint16_t CCP4MD:1;
  uint16_t CCP5MD:1;
  uint16_t CCP6MD:1;
  uint16_t CCP7MD:1;
  uint16_t CCP8MD:1;
} PMD2BITS;
extern volatile PMD2BITS PMD2bits __attribute__((__sfr__));


extern volatile uint16_t PMD3 __attribute__((__sfr__));
typedef struct tagPMD3BITS {
  uint16_t :1;
  uint16_t I2C2MD:1;
  uint16_t :5;
  uint16_t CRCMD:1;
} PMD3BITS;
extern volatile PMD3BITS PMD3bits __attribute__((__sfr__));


extern volatile uint16_t PMD4 __attribute__((__sfr__));
typedef struct tagPMD4BITS {
  uint16_t :3;
  uint16_t REFOMD:1;
} PMD4BITS;
extern volatile PMD4BITS PMD4bits __attribute__((__sfr__));


extern volatile uint16_t PMD6 __attribute__((__sfr__));
typedef struct tagPMD6BITS {
  uint16_t :8;
  uint16_t DMA0MD:1;
  uint16_t DMA1MD:1;
  uint16_t DMA2MD:1;
  uint16_t DMA3MD:1;
  uint16_t DMA4MD:1;
  uint16_t DMA5MD:1;
} PMD6BITS;
extern volatile PMD6BITS PMD6bits __attribute__((__sfr__));


extern volatile uint16_t PMD7 __attribute__((__sfr__));
typedef struct tagPMD7BITS {
  uint16_t :3;
  uint16_t PTGMD:1;
  uint16_t :4;
  uint16_t CMP1MD:1;
} PMD7BITS;
extern volatile PMD7BITS PMD7bits __attribute__((__sfr__));


extern volatile uint16_t PMD8 __attribute__((__sfr__));
typedef struct tagPMD8BITS {
  uint16_t :1;
  uint16_t BIASMD:1;
  uint16_t CLC1MD:1;
  uint16_t CLC2MD:1;
  uint16_t CLC3MD:1;
  uint16_t CLC4MD:1;
  uint16_t :2;
  uint16_t DMTMD:1;
  uint16_t :2;
  uint16_t SENT1MD:1;
  uint16_t SENT2MD:1;
} PMD8BITS;
extern volatile PMD8BITS PMD8bits __attribute__((__sfr__));


extern volatile uint16_t WDTCONL __attribute__((__sfr__));
typedef struct tagWDTCONLBITS {
  uint16_t WDTWINEN:1;
  uint16_t SLPDIV:5;
  uint16_t CLKSEL:2;
  uint16_t RUNDIV:5;
  uint16_t :2;
  uint16_t ON:1;
} WDTCONLBITS;
extern volatile WDTCONLBITS WDTCONLbits __attribute__((__sfr__));


extern volatile uint16_t WDTCONH __attribute__((__sfr__));

extern volatile uint16_t REFOCON1 __attribute__((__sfr__));
__extension__ typedef struct tagREFOCON1BITS {
  union {
    struct {
      uint16_t ROSEL:4;
      uint16_t :4;
      uint16_t ROACTIVE:1;
      uint16_t ROSWEN:1;
      uint16_t :1;
      uint16_t ROSLP:1;
      uint16_t ROOUT:1;
      uint16_t ROSIDL:1;
      uint16_t :1;
      uint16_t ROEN:1;
    };
    struct {
      uint16_t ROSEL0:1;
      uint16_t ROSEL1:1;
      uint16_t ROSEL2:1;
      uint16_t ROSEL3:1;
    };
  };
} REFOCON1BITS;
extern volatile REFOCON1BITS REFOCON1bits __attribute__((__sfr__));


extern volatile uint16_t REFOCONL __attribute__((__sfr__));
__extension__ typedef struct tagREFOCONLBITS {
  union {
    struct {
      uint16_t ROSEL:4;
      uint16_t :4;
      uint16_t ROACTIVE:1;
      uint16_t ROSWEN:1;
      uint16_t :1;
      uint16_t ROSLP:1;
      uint16_t ROOUT:1;
      uint16_t ROSIDL:1;
      uint16_t :1;
      uint16_t ROEN:1;
    };
    struct {
      uint16_t ROSEL0:1;
      uint16_t ROSEL1:1;
      uint16_t ROSEL2:1;
      uint16_t ROSEL3:1;
    };
  };
} REFOCONLBITS;
extern volatile REFOCONLBITS REFOCONLbits __attribute__((__sfr__));


extern volatile uint16_t REFOCON2 __attribute__((__sfr__));
__extension__ typedef struct tagREFOCON2BITS {
  union {
    struct {
      uint16_t RODIV:15;
    };
    struct {
      uint16_t RODIV0:1;
      uint16_t RODIV1:1;
      uint16_t RODIV2:1;
      uint16_t RODIV3:1;
      uint16_t RODIV4:1;
      uint16_t RODIV5:1;
      uint16_t RODIV6:1;
      uint16_t RODIV7:1;
      uint16_t RODIV8:1;
      uint16_t RODIV9:1;
      uint16_t RODIV10:1;
      uint16_t RODIV11:1;
      uint16_t RODIV12:1;
      uint16_t RODIV13:1;
      uint16_t RODIV14:1;
    };
  };
} REFOCON2BITS;
extern volatile REFOCON2BITS REFOCON2bits __attribute__((__sfr__));


extern volatile uint16_t REFOCONH __attribute__((__sfr__));
__extension__ typedef struct tagREFOCONHBITS {
  union {
    struct {
      uint16_t RODIV:15;
    };
    struct {
      uint16_t RODIV0:1;
      uint16_t RODIV1:1;
      uint16_t RODIV2:1;
      uint16_t RODIV3:1;
      uint16_t RODIV4:1;
      uint16_t RODIV5:1;
      uint16_t RODIV6:1;
      uint16_t RODIV7:1;
      uint16_t RODIV8:1;
      uint16_t RODIV9:1;
      uint16_t RODIV10:1;
      uint16_t RODIV11:1;
      uint16_t RODIV12:1;
      uint16_t RODIV13:1;
      uint16_t RODIV14:1;
    };
  };
} REFOCONHBITS;
extern volatile REFOCONHBITS REFOCONHbits __attribute__((__sfr__));


extern volatile uint16_t REFOTRIMH __attribute__((__sfr__));
typedef struct tagREFOTRIMHBITS {
  uint16_t :7;
  uint16_t ROTRIM:9;
} REFOTRIMHBITS;
extern volatile REFOTRIMHBITS REFOTRIMHbits __attribute__((__sfr__));


extern volatile uint16_t PCTRAPL __attribute__((__sfr__));

extern volatile uint16_t PCTRAPH __attribute__((__sfr__));
typedef struct tagPCTRAPHBITS {
  uint16_t PCTRAPH:8;
} PCTRAPHBITS;
extern volatile PCTRAPHBITS PCTRAPHbits __attribute__((__sfr__));


extern volatile uint16_t FEXL __attribute__((__sfr__));

extern volatile uint16_t FEXH __attribute__((__sfr__));
__extension__ typedef struct tagFEXHBITS {
  union {
    struct {
      uint16_t FEXU:8;
    };
    struct {
      uint16_t FEXH:8;
    };
  };
} FEXHBITS;
extern volatile FEXHBITS FEXHbits __attribute__((__sfr__));


extern volatile uint16_t FEXU __attribute__((__sfr__));
__extension__ typedef struct tagFEXUBITS {
  union {
    struct {
      uint16_t FEXU:8;
    };
    struct {
      uint16_t FEXH:8;
    };
  };
} FEXUBITS;
extern volatile FEXUBITS FEXUbits __attribute__((__sfr__));


extern volatile uint16_t FEX2L __attribute__((__sfr__));

extern volatile uint16_t FEX2H __attribute__((__sfr__));
__extension__ typedef struct tagFEX2HBITS {
  union {
    struct {
      uint16_t FEX2U:8;
    };
    struct {
      uint16_t FEX2H:8;
    };
  };
} FEX2HBITS;
extern volatile FEX2HBITS FEX2Hbits __attribute__((__sfr__));


extern volatile uint16_t FEX2U __attribute__((__sfr__));
__extension__ typedef struct tagFEX2UBITS {
  union {
    struct {
      uint16_t FEX2U:8;
    };
    struct {
      uint16_t FEX2H:8;
    };
  };
} FEX2UBITS;
extern volatile FEX2UBITS FEX2Ubits __attribute__((__sfr__));


extern volatile uint16_t VISI __attribute__((__sfr__));

extern volatile uint16_t DPCL __attribute__((__sfr__));

extern volatile uint16_t DPCH __attribute__((__sfr__));
typedef struct tagDPCHBITS {
  uint16_t DPCH:8;
} DPCHBITS;
extern volatile DPCHBITS DPCHbits __attribute__((__sfr__));


extern volatile uint16_t APPO __attribute__((__sfr__));

extern volatile uint16_t APPI __attribute__((__sfr__));

extern volatile uint16_t APPS __attribute__((__sfr__));
typedef struct tagAPPSBITS {
  uint16_t APIFUL:1;
  uint16_t APIOV:1;
  uint16_t APOFUL:1;
  uint16_t APOOV:1;
  uint16_t STRFUL:1;
} APPSBITS;
extern volatile APPSBITS APPSbits __attribute__((__sfr__));


extern volatile uint16_t STROUTL __attribute__((__sfr__));

extern volatile uint16_t STROUTH __attribute__((__sfr__));

extern volatile uint16_t STROVCNT __attribute__((__sfr__));

extern volatile uint16_t JDATAH __attribute__((__sfr__));

extern volatile uint16_t JDATAL __attribute__((__sfr__));
# 74885 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FBOOT;
# 74915 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FSEC;
# 74995 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FBSLIM;
# 75016 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FSIGN;
# 75032 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FOSCSEL;
# 75072 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FOSC;
# 75140 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FWDT;
# 75280 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FPOR;
# 75303 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FICD;
# 75344 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FDMTIVTL;
# 75365 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FDMTIVTH;
# 75386 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FDMTCNTL;
# 75407 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FDMTCNTH;
# 75428 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FDMT;
# 75451 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FDEVOPT;
# 75495 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FALTREG;
# 75587 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FMBXM;
# 75715 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FMBXHS1;
# 75871 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FMBXHS2;
# 76027 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FMBXHSEN;
# 76099 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FCFGPRA0;
# 76150 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FCFGPRB0;
# 76278 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FCFGPRC0;
# 76406 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FCFGPRD0;
# 76534 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FCFGPRE0;
# 76662 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1OSCSEL;
# 76702 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1OSC;
# 76741 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1WDT;
# 76881 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1POR;
# 76904 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1ICD;
# 76945 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1DEVOPT;
# 76989 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1ALTREG;
# 77081 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1DMTIVTL;
# 77102 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1DMTIVTH;
# 77123 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1DMTCNTL;
# 77144 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1DMTCNTH;
# 77165 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FS1DMT;
# 77188 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\dsPIC33C\\h/p33CH512MP508.h" 3 4
extern __attribute__((space(prog))) __prog__ uint16_t _FBTSEQ;
# 225 "C:/Program Files/Microchip/MPLABX/v5.45/packs/Microchip/dsPIC33CH-MP_DFP/1.4.161/xc16/bin/..\\support\\generic\\h/xc.h" 2 3 4
# 31 "../system.h" 2
# 41 "../system.h"
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 1 3 4
# 12 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/subordinate_errors.h" 1 3 4
# 13 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 2 3 4
# 1 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stddef.h" 1 3 4







# 23 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stddef.h" 3 4
typedef _Ptrdifft ptrdiff_t;
# 39 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\include\\lega-c/stddef.h" 3 4

# 14 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 2 3 4
# 25 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern int __attach_input_file(const char *f);
void __close_input_file(void);
# 36 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern int __C30_UART;
# 46 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern void __delay32(unsigned long cycles);
# 84 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern __attribute__((space(prog))) int _PROGRAM_END;
# 97 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern void _dump_heap_info(void);
# 116 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
typedef unsigned long _prog_addressT;

extern _prog_addressT _memcpy_helper(_prog_addressT src, void *dst,
                                     unsigned int len, int flags);
# 129 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern void *_memcpy_df(__pack_upper_byte void *src,void *dst,unsigned int len);
# 148 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
_prog_addressT _memcpy_p2d16(void *dest, _prog_addressT src,
                             unsigned int len);
# 160 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
_prog_addressT _memcpy_p2d24(void *dest, _prog_addressT src,
                             unsigned int len);
# 173 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
_prog_addressT _strncpy_p2d16(char *dest, _prog_addressT src,
                              unsigned int len);
# 186 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
_prog_addressT _strncpy_p2d24(char *dest, _prog_addressT src,
                              unsigned int len);







void *_memcpy_packed(char *dest, const __pack_upper_byte void *src,
                     unsigned int len);



extern char *_strcpy_packed(char *dest, const __pack_upper_byte void *src);
extern char *_strncpy_packed(char *dest, const __pack_upper_byte void *src,
                             unsigned int len);






extern __eds__ void *_memcpy_eds_3(const __eds__ void *src, __eds__ void *dst,
                                   int len);
# 224 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern __eds__ char *_strcpy_eds(const __eds__ void *src, __eds__ void *dst);
extern __eds__ char *_strncpy_eds(const __eds__ void *src, __eds__ void *dst,
                                  int len);
# 235 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern __eds__ void *_memchr_eds(__eds__ void *s, int c, size_t n);
# 371 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern void _eedata_helper1 (_prog_addressT dst, int len);
extern void _eedata_helper2 (void);
extern void _eedata_helper3 (_prog_addressT dst, int dat);
extern void _eedata_helper4 (_prog_addressT dst, int *src);
extern void _eedata_helper5 (_prog_addressT dst, int len);
extern void _eedata_helper6 (void);
extern void _eedata_helper7 (_prog_addressT dst, int dat);
# 393 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern void _flash_helper1 (_prog_addressT dst, int code)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
extern void _flash_helper2 (_prog_addressT dst, int *src, int len)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
extern void _flash_helper3 (_prog_addressT dst, long *src, int len)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
extern void _flash_helper4 (_prog_addressT dst, int dat)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
extern void _flash_helper5 (_prog_addressT dst, long dat)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
extern void _flash_helper6 (int code)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
extern void _flash_helper7 (_prog_addressT dst, int len)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
extern void _flash_helper8 (_prog_addressT dst, int *src, int len)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
extern void _flash_helper9 (_prog_addressT dst, long *src, int len)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
extern void _flash_helper10 (_prog_addressT dst, int dat1, int empty, int dat2)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
extern void _flash_helper11 (_prog_addressT dst, long dat1, long dat2)
            __attribute__((deprecated("consider migrating to Microchip Code Configurator https://www.microchip.com/mcc")));
# 704 "c:\\program files\\microchip\\xc16\\v1.61\\bin\\bin\\../..\\support\\generic\\h/libpic30.h" 3 4
extern int _program_slave(int slave_number, int verify,
                           __eds__ unsigned char *image);

extern int _program_inactive_slave(int slave_number, int verify,
                                    __eds__ unsigned char *image);

extern void _start_slave(void);
extern void _stop_slave(void);
# 42 "../system.h" 2
# 59 "../system.h"
void Init_Clock( void );
void Init_GI( void );
void Soft_Reset( void );

void Init_U1( void );
void Add_Printf_udec8( uint8_t WordIn );
void Add_Printf_udec16( uint16_t WordIn );
void Add_Printf_udec32( uint32_t WordIn );
void Add_Printf_str( const char * Str, uint16_t Len );
void Start_Printf( void );

void Config_CCT8( void );
uint32_t Get_CCT8( void );

void Init_ADC( void );
void Disable_SELF_TEST( void );
void Init_DAC( void );
# 22 "../error.h" 2







void Set_ErrFlag( uint16_t ErrId );
_Bool Get_ErrFlag( uint16_t ErrId );
uint8_t Get_ErrPage( uint16_t ErrId );
void Clear_ErrFlag( uint16_t ErrId );
void Reset_ErrRegs( void );
# 17 "../gpio.c" 2
# 1 "../gpio.h" 1
# 28 "../gpio.h"
typedef struct {
    uint8_t AnaDig;
    uint8_t InOut;
    uint8_t PullUp;
    uint8_t PullDw;
    uint8_t OpenDr;
    uint8_t CnEn0;
    uint8_t CnEn1;
} gpio_t;
# 183 "../gpio.h"
void Config_GPIO( uint8_t *PinId, gpio_t Param );
void Unlock_GPIOs( void );
void Lock_GPIOs( void );
void Config_GPIO( uint8_t *PinId, gpio_t Param );
void Set_GPIO( uint8_t *PinId, uint8_t State );
void Toggle_GPIO( uint8_t *PinId );
uint8_t Get_GPIO( uint8_t *PinId );
# 18 "../gpio.c" 2
# 30 "../gpio.c"
void Config_GPIO( uint8_t *PinId, gpio_t Param ){
    uint8_t Sect = PinId[0];
    uint8_t Numb = PinId[1];
    uint16_t Mask = (0x0001u)<<Numb;
    if( (Numb < (uint8_t) 16) && (Sect < (uint8_t) 5) ){

        if( Param.AnaDig == (uint8_t) 1 ){
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E00, 0x0E1C, 0x0E38, 0x0E54, 0x0E70 }[Sect]))) |= Mask;
        } else if( Param.AnaDig == (uint8_t) 0 ){
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E00, 0x0E1C, 0x0E38, 0x0E54, 0x0E70 }[Sect]))) &= ~Mask;
        } else {
            Set_ErrFlag((uint16_t) 0x0002);
        }

        if( Param.InOut == (uint8_t) 1 ){
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E02, 0x0E1E, 0x0E3A, 0x0E56, 0x0E72 }[Sect]))) |= Mask;
        } else if( Param.InOut == (uint8_t) 0 ){
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E02, 0x0E1E, 0x0E3A, 0x0E56, 0x0E72 }[Sect]))) &= ~Mask;
        } else {
            Set_ErrFlag((uint16_t) 0x0004);
        }
        if( (Param.AnaDig == (uint8_t) 0) && (Param.InOut == (uint8_t) 1) ){

            if( Param.PullDw == (uint8_t) 1 ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E0C, 0x0E28, 0x0E44, 0x0E60, 0x0E7C }[Sect]))) |= Mask;
            } else if( Param.PullDw == (uint8_t) 0 ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E0C, 0x0E28, 0x0E44, 0x0E60, 0x0E7C }[Sect]))) &= ~Mask;
            } else {
                Set_ErrFlag((uint16_t) 0x0008);
            }

            if( (Param.PullUp == (uint8_t) 1) && (Param.PullDw == (uint8_t) 0) ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E0A, 0x0E26, 0x0E42, 0x0E5E, 0x0E7A }[Sect]))) |= Mask;
            } else if( Param.PullUp == (uint8_t) 0 ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E0A, 0x0E26, 0x0E42, 0x0E5E, 0x0E7A }[Sect]))) &= ~Mask;
            } else {
                Set_ErrFlag((uint16_t) 0x0010);
            }


            if( Param.CnEn0 == (uint8_t) 1 ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E10, 0x0E2C, 0x0E48, 0x0E64, 0x0E80 }[Sect]))) |= Mask;
            } else if( Param.CnEn0 == (uint8_t) 0 ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E10, 0x0E2C, 0x0E48, 0x0E64, 0x0E80 }[Sect]))) &= ~Mask;
            } else {
                Set_ErrFlag((uint16_t) 0x0020);
            }

            if( Param.CnEn1 == (uint8_t) 1 ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E14, 0x0E30, 0x0E4C, 0x0E68, 0x0E84 }[Sect]))) |= Mask;
            } else if( Param.CnEn1 == (uint8_t) 0 ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E14, 0x0E30, 0x0E4C, 0x0E68, 0x0E84 }[Sect]))) &= ~Mask;
            } else {
                Set_ErrFlag((uint16_t) 0x0020);
            }
        } else {
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E0C, 0x0E28, 0x0E44, 0x0E60, 0x0E7C }[Sect]))) &= ~Mask;
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E0A, 0x0E26, 0x0E42, 0x0E5E, 0x0E7A }[Sect]))) &= ~Mask;
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E10, 0x0E2C, 0x0E48, 0x0E64, 0x0E80 }[Sect]))) &= ~Mask;
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E14, 0x0E30, 0x0E4C, 0x0E68, 0x0E84 }[Sect]))) &= ~Mask;
        }

        if( Param.InOut == (uint8_t) 0 ){
            if( Param.OpenDr == (uint8_t) 1 ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E08, 0x0E24, 0x0E40, 0x0E5C, 0x0E78 }[Sect]))) |= Mask;
            } else if( Param.OpenDr == (uint8_t) 0 ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E08, 0x0E24, 0x0E40, 0x0E5C, 0x0E78 }[Sect]))) &= ~Mask;
            } else {
                Set_ErrFlag((uint16_t) 0x0040);
            }
        } else {
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E08, 0x0E24, 0x0E40, 0x0E5C, 0x0E78 }[Sect]))) &= ~Mask;
        }
    } else {
        Set_ErrFlag((uint16_t) 0x0001);
    }

}







uint8_t Get_GPIO( uint8_t *PinId ){
    uint8_t Sect = PinId[0];
    uint8_t Numb = PinId[1];
    uint16_t Mask = 0x0001;
    uint8_t Val = 0xFF;
    if( (Numb < (uint8_t) 16) && (Sect < (uint8_t) 5) ){
        Val = (uint8_t)(((*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E04, 0x0E20, 0x0E3C, 0x0E58, 0x0E74 }[Sect])))>>Numb)&Mask);
    } else {
        Set_ErrFlag((uint16_t) 0x0001);
    }
    return Val;
}







void Set_GPIO( uint8_t *PinId, uint8_t State ){
    uint8_t Sect = PinId[0];
    uint8_t Numb = PinId[1];
    uint16_t Mask = (0x0001u)<<Numb;
    if( (State == (uint8_t) 0) || (State == (uint8_t) 1) ){
        if( (Numb < (uint8_t) 16) && (Sect < (uint8_t) 5) ){
            if( State == (uint8_t) 1 ){
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E06, 0x0E22, 0x0E3E, 0x0E5A, 0x0E76 }[Sect]))) |= Mask;
            } else {
                (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E06, 0x0E22, 0x0E3E, 0x0E5A, 0x0E76 }[Sect]))) &= ~Mask;
            }
        } else {
            Set_ErrFlag((uint16_t) 0x0001);
        }
    } else {
        Set_ErrFlag((uint16_t) 0x0080);
    }
}






void Toggle_GPIO( uint8_t *PinId ){
    uint8_t Sect = PinId[0];
    uint8_t Numb = PinId[1];
    uint16_t Mask = (0x0001u)<<Numb;
    if( (Numb < (uint8_t) 16) && (Sect < (uint8_t) 5) ){
        if( Get_GPIO(PinId) == (uint8_t) 0 ){
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E06, 0x0E22, 0x0E3E, 0x0E5A, 0x0E76 }[Sect]))) |= Mask;
        } else {
            (*((volatile uint16_t *)((uint16_t [(uint8_t) 5]){ 0x0E06, 0x0E22, 0x0E3E, 0x0E5A, 0x0E76 }[Sect]))) &= ~Mask;
        }
    } else {
        Set_ErrFlag((uint16_t) 0x0001);
    }

}





void Unlock_GPIOs( void ){
    __builtin_write_OSCCONL(OSCCON&(~0x40));
}





void Lock_GPIOs( void ){
    __builtin_write_OSCCONL(OSCCON|0x40);
}
