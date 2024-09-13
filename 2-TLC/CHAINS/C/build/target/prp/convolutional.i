# 1 "src\\convolutional.c"
# 1 "H:\\SCIENCE\\2-TLC\\CHAINS\\C//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src\\convolutional.c"
# 15 "src\\convolutional.c"
# 1 "src\\convolutional.h" 1
# 18 "src\\convolutional.h"
# 1 "src\\error.h" 1
# 18 "src\\error.h"
# 1 "src\\system.h" 1
# 20 "src\\system.h"
# 1 "c:\\mingw\\include\\stdio.h" 1 3
# 38 "c:\\mingw\\include\\stdio.h" 3
       
# 39 "c:\\mingw\\include\\stdio.h" 3
# 56 "c:\\mingw\\include\\stdio.h" 3
# 1 "c:\\mingw\\include\\_mingw.h" 1 3
# 55 "c:\\mingw\\include\\_mingw.h" 3
       
# 56 "c:\\mingw\\include\\_mingw.h" 3
# 66 "c:\\mingw\\include\\_mingw.h" 3
# 1 "c:\\mingw\\include\\msvcrtver.h" 1 3
# 35 "c:\\mingw\\include\\msvcrtver.h" 3
       
# 36 "c:\\mingw\\include\\msvcrtver.h" 3
# 67 "c:\\mingw\\include\\_mingw.h" 2 3






# 1 "c:\\mingw\\include\\w32api.h" 1 3
# 35 "c:\\mingw\\include\\w32api.h" 3
       
# 36 "c:\\mingw\\include\\w32api.h" 3
# 59 "c:\\mingw\\include\\w32api.h" 3
# 1 "c:\\mingw\\include\\sdkddkver.h" 1 3
# 35 "c:\\mingw\\include\\sdkddkver.h" 3
       
# 36 "c:\\mingw\\include\\sdkddkver.h" 3
# 60 "c:\\mingw\\include\\w32api.h" 2 3
# 74 "c:\\mingw\\include\\_mingw.h" 2 3
# 57 "c:\\mingw\\include\\stdio.h" 2 3
# 69 "c:\\mingw\\include\\stdio.h" 3
# 1 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stddef.h" 1 3 4
# 216 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stddef.h" 3 4

# 216 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stddef.h" 3 4
typedef unsigned int size_t;
# 328 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stddef.h" 3 4
typedef short unsigned int wchar_t;
# 357 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stddef.h" 3 4
typedef short unsigned int wint_t;
# 70 "c:\\mingw\\include\\stdio.h" 2 3
# 94 "c:\\mingw\\include\\stdio.h" 3
# 1 "c:\\mingw\\include\\sys/types.h" 1 3
# 34 "c:\\mingw\\include\\sys/types.h" 3
       
# 35 "c:\\mingw\\include\\sys/types.h" 3
# 62 "c:\\mingw\\include\\sys/types.h" 3
  typedef long __off32_t;




  typedef __off32_t _off_t;







  typedef _off_t off_t;
# 91 "c:\\mingw\\include\\sys/types.h" 3
  typedef long long __off64_t;






  typedef __off64_t off64_t;
# 115 "c:\\mingw\\include\\sys/types.h" 3
  typedef int _ssize_t;







  typedef _ssize_t ssize_t;
# 95 "c:\\mingw\\include\\stdio.h" 2 3







# 1 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stdarg.h" 1 3 4
# 40 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 103 "c:\\mingw\\include\\stdio.h" 2 3
# 210 "c:\\mingw\\include\\stdio.h" 3
typedef struct _iobuf
{
  char *_ptr;
  int _cnt;
  char *_base;
  int _flag;
  int _file;
  int _charbuf;
  int _bufsiz;
  char *_tmpfname;
} FILE;
# 239 "c:\\mingw\\include\\stdio.h" 3
extern __attribute__((__dllimport__)) FILE _iob[];
# 252 "c:\\mingw\\include\\stdio.h" 3








 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * fopen (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * freopen (const char *, const char *, FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fflush (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fclose (FILE *);






 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int remove (const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int rename (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * tmpfile (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char * tmpnam (char *);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_tempnam (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _rmtmp (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _unlink (const char *);
# 289 "c:\\mingw\\include\\stdio.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char * tempnam (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int rmtmp (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int unlink (const char *);



 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int setvbuf (FILE *, char *, int, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void setbuf (FILE *, char *);
# 342 "c:\\mingw\\include\\stdio.h" 3
extern int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__mingw_printf__,2,3))) __mingw_fprintf(FILE*, const char*, ...);
extern int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__mingw_printf__,1,2))) __mingw_printf(const char*, ...);
extern int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__mingw_printf__,2,3))) __mingw_sprintf(char*, const char*, ...);
extern int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__mingw_printf__,3,4))) __mingw_snprintf(char*, size_t, const char*, ...);
extern int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__mingw_printf__,2,0))) __mingw_vfprintf(FILE*, const char*, __builtin_va_list);
extern int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__mingw_printf__,1,0))) __mingw_vprintf(const char*, __builtin_va_list);
extern int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__mingw_printf__,2,0))) __mingw_vsprintf(char*, const char*, __builtin_va_list);
extern int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__mingw_printf__,3,0))) __mingw_vsnprintf(char*, size_t, const char*, __builtin_va_list);
# 376 "c:\\mingw\\include\\stdio.h" 3
extern unsigned int _mingw_output_format_control( unsigned int, unsigned int );
# 453 "c:\\mingw\\include\\stdio.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fprintf (FILE *, const char *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int printf (const char *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int sprintf (char *, const char *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int vfprintf (FILE *, const char *, __builtin_va_list);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int vprintf (const char *, __builtin_va_list);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int vsprintf (char *, const char *, __builtin_va_list);
# 478 "c:\\mingw\\include\\stdio.h" 3
 int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__ms_printf__,2,3))) __msvcrt_fprintf(FILE *, const char *, ...);
 int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__ms_printf__,1,2))) __msvcrt_printf(const char *, ...);
 int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__ms_printf__,2,3))) __msvcrt_sprintf(char *, const char *, ...);
 int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__ms_printf__,2,0))) __msvcrt_vfprintf(FILE *, const char *, __builtin_va_list);
 int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__ms_printf__,1,0))) __msvcrt_vprintf(const char *, __builtin_va_list);
 int __attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__ms_printf__,2,0))) __msvcrt_vsprintf(char *, const char *, __builtin_va_list);






 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _snprintf (char *, size_t, const char *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _vsnprintf (char *, size_t, const char *, __builtin_va_list);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _vscprintf (const char *, __builtin_va_list);
# 501 "c:\\mingw\\include\\stdio.h" 3
__attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__mingw_printf__,3,4)))
int snprintf (char *, size_t, const char *, ...);

__attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__format__(__mingw_printf__,3,0)))
int vsnprintf (char *, size_t, const char *, __builtin_va_list);

__attribute__((__cdecl__)) __attribute__((__nothrow__))
int vscanf (const char * __restrict__, __builtin_va_list);

__attribute__((__cdecl__)) __attribute__((__nothrow__))
int vfscanf (FILE * __restrict__, const char * __restrict__, __builtin_va_list);

__attribute__((__cdecl__)) __attribute__((__nothrow__))
int vsscanf (const char * __restrict__, const char * __restrict__, __builtin_va_list);
# 646 "c:\\mingw\\include\\stdio.h" 3
__attribute__((__cdecl__)) __attribute__((__nothrow__)) ssize_t
getdelim (char ** __restrict__, size_t * __restrict__, int, FILE * __restrict__);

__attribute__((__cdecl__)) __attribute__((__nothrow__)) ssize_t
getline (char ** __restrict__, size_t * __restrict__, FILE * __restrict__);
# 666 "c:\\mingw\\include\\stdio.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fscanf (FILE *, const char *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int scanf (const char *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int sscanf (const char *, const char *, ...);



 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fgetc (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char * fgets (char *, int, FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fputc (int, FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fputs (const char *, FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char * gets (char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int puts (const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int ungetc (int, FILE *);
# 687 "c:\\mingw\\include\\stdio.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _filbuf (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _flsbuf (int, FILE *);



extern inline __attribute__((__gnu_inline__)) __attribute__((__cdecl__)) __attribute__((__nothrow__)) int getc (FILE *);
extern inline __attribute__((__gnu_inline__)) __attribute__((__cdecl__)) __attribute__((__nothrow__)) int getc (FILE * __F)
{
  return (--__F->_cnt >= 0)
    ? (int) (unsigned char) *__F->_ptr++
    : _filbuf (__F);
}

extern inline __attribute__((__gnu_inline__)) __attribute__((__cdecl__)) __attribute__((__nothrow__)) int putc (int, FILE *);
extern inline __attribute__((__gnu_inline__)) __attribute__((__cdecl__)) __attribute__((__nothrow__)) int putc (int __c, FILE * __F)
{
  return (--__F->_cnt >= 0)
    ? (int) (unsigned char) (*__F->_ptr++ = (char)__c)
    : _flsbuf (__c, __F);
}

extern inline __attribute__((__gnu_inline__)) __attribute__((__cdecl__)) __attribute__((__nothrow__)) int getchar (void);
extern inline __attribute__((__gnu_inline__)) __attribute__((__cdecl__)) __attribute__((__nothrow__)) int getchar (void)
{
  return (--(&_iob[0])->_cnt >= 0)
    ? (int) (unsigned char) *(&_iob[0])->_ptr++
    : _filbuf ((&_iob[0]));
}

extern inline __attribute__((__gnu_inline__)) __attribute__((__cdecl__)) __attribute__((__nothrow__)) int putchar(int);
extern inline __attribute__((__gnu_inline__)) __attribute__((__cdecl__)) __attribute__((__nothrow__)) int putchar(int __c)
{
  return (--(&_iob[1])->_cnt >= 0)
    ? (int) (unsigned char) (*(&_iob[1])->_ptr++ = (char)__c)
    : _flsbuf (__c, (&_iob[1]));}
# 734 "c:\\mingw\\include\\stdio.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t fread (void *, size_t, size_t, FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t fwrite (const void *, size_t, size_t, FILE *);



 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fseek (FILE *, long, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) long ftell (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void rewind (FILE *);
# 787 "c:\\mingw\\include\\stdio.h" 3
typedef long long fpos_t;




 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fgetpos (FILE *, fpos_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fsetpos (FILE *, const fpos_t *);



 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int feof (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int ferror (FILE *);
# 808 "c:\\mingw\\include\\stdio.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void clearerr (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void perror (const char *);






 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * _popen (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _pclose (FILE *);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * popen (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int pclose (FILE *);




 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _flushall (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _fgetchar (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _fputchar (int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * _fdopen (int, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _fileno (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _fcloseall (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * _fsopen (const char *, const char *, int);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _getmaxstdio (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _setmaxstdio (int);
# 859 "c:\\mingw\\include\\stdio.h" 3
unsigned int __attribute__((__cdecl__)) __mingw_get_output_format (void);
unsigned int __attribute__((__cdecl__)) __mingw_set_output_format (unsigned int);







int __attribute__((__cdecl__)) __mingw_get_printf_count_output (void);
int __attribute__((__cdecl__)) __mingw_set_printf_count_output (int);
# 885 "c:\\mingw\\include\\stdio.h" 3
extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__)) unsigned int __attribute__((__cdecl__)) _get_output_format (void)
{ return __mingw_get_output_format (); }

extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__)) unsigned int __attribute__((__cdecl__)) _set_output_format (unsigned int __style)
{ return __mingw_set_output_format (__style); }
# 910 "c:\\mingw\\include\\stdio.h" 3
extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__)) int __attribute__((__cdecl__)) _get_printf_count_output (void)
{ return 0 ? 1 : __mingw_get_printf_count_output (); }

extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__)) int __attribute__((__cdecl__)) _set_printf_count_output (int __mode)
{ return 0 ? 1 : __mingw_set_printf_count_output (__mode); }



 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fgetchar (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fputchar (int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * fdopen (int, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fileno (FILE *);
# 930 "c:\\mingw\\include\\stdio.h" 3
extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__)) FILE * __attribute__((__cdecl__)) __attribute__((__nothrow__)) fopen64 (const char *, const char *);
extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__))
FILE * __attribute__((__cdecl__)) __attribute__((__nothrow__)) fopen64 (const char * filename, const char * mode)
{ return fopen (filename, mode); }

int __attribute__((__cdecl__)) __attribute__((__nothrow__)) fseeko64 (FILE *, __off64_t, int);






extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__)) __off64_t __attribute__((__cdecl__)) __attribute__((__nothrow__)) ftello64 (FILE *);
extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__))
__off64_t __attribute__((__cdecl__)) __attribute__((__nothrow__)) ftello64 (FILE * stream)
{ fpos_t __pos; return (fgetpos(stream, &__pos)) ? -1LL : (__off64_t)(__pos); }
# 958 "c:\\mingw\\include\\stdio.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fwprintf (FILE *, const wchar_t *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int wprintf (const wchar_t *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int vfwprintf (FILE *, const wchar_t *, __builtin_va_list);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int vwprintf (const wchar_t *, __builtin_va_list);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _snwprintf (wchar_t *, size_t, const wchar_t *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _vscwprintf (const wchar_t *, __builtin_va_list);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _vsnwprintf (wchar_t *, size_t, const wchar_t *, __builtin_va_list);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fwscanf (FILE *, const wchar_t *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int wscanf (const wchar_t *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int swscanf (const wchar_t *, const wchar_t *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t fgetwc (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t fputwc (wchar_t, FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t ungetwc (wchar_t, FILE *);




 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int swprintf (wchar_t *, const wchar_t *, ...);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int vswprintf (wchar_t *, const wchar_t *, __builtin_va_list);



 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t * fgetws (wchar_t *, int, FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int fputws (const wchar_t *, FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t getwc (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t getwchar (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t putwc (wint_t, FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t putwchar (wint_t);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t * _getws (wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _putws (const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * _wfdopen(int, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * _wfopen (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * _wfreopen (const wchar_t *, const wchar_t *, FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * _wfsopen (const wchar_t *, const wchar_t *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t * _wtmpnam (wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t * _wtempnam (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _wrename (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _wremove (const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void _wperror (const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * _wpopen (const wchar_t *, const wchar_t *);






__attribute__((__cdecl__)) __attribute__((__nothrow__)) int snwprintf (wchar_t *, size_t, const wchar_t *, ...);
__attribute__((__cdecl__)) __attribute__((__nothrow__)) int vsnwprintf (wchar_t *, size_t, const wchar_t *, __builtin_va_list);
# 1016 "c:\\mingw\\include\\stdio.h" 3
__attribute__((__cdecl__)) __attribute__((__nothrow__)) int vwscanf (const wchar_t *__restrict__, __builtin_va_list);
__attribute__((__cdecl__)) __attribute__((__nothrow__))
int vfwscanf (FILE *__restrict__, const wchar_t *__restrict__, __builtin_va_list);
__attribute__((__cdecl__)) __attribute__((__nothrow__))
int vswscanf (const wchar_t *__restrict__, const wchar_t * __restrict__, __builtin_va_list);






 __attribute__((__cdecl__)) __attribute__((__nothrow__)) FILE * wpopen (const wchar_t *, const wchar_t *);




 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t _fgetwchar (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t _fputwchar (wint_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _getw (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _putw (int, FILE *);




 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t fgetwchar (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wint_t fputwchar (wint_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int getw (FILE *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int putw (int, FILE *);





# 21 "src\\system.h" 2
# 1 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stdbool.h" 1 3 4
# 22 "src\\system.h" 2
# 1 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stdint.h" 1 3 4
# 9 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stdint.h" 3 4
# 1 "c:\\mingw\\include\\stdint.h" 1 3 4
# 34 "c:\\mingw\\include\\stdint.h" 3 4
       
# 35 "c:\\mingw\\include\\stdint.h" 3
# 54 "c:\\mingw\\include\\stdint.h" 3
# 1 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stddef.h" 1 3 4
# 55 "c:\\mingw\\include\\stdint.h" 2 3



typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned uint32_t;
typedef long long int64_t;
typedef unsigned long long uint64_t;



typedef signed char int_least8_t;
typedef unsigned char uint_least8_t;
typedef short int_least16_t;
typedef unsigned short uint_least16_t;
typedef int int_least32_t;
typedef unsigned uint_least32_t;
typedef long long int_least64_t;
typedef unsigned long long uint_least64_t;





typedef signed char int_fast8_t;
typedef unsigned char uint_fast8_t;
typedef short int_fast16_t;
typedef unsigned short uint_fast16_t;
typedef int int_fast32_t;
typedef unsigned int uint_fast32_t;
typedef long long int_fast64_t;
typedef unsigned long long uint_fast64_t;
# 106 "c:\\mingw\\include\\stdint.h" 3
 typedef int __intptr_t;

typedef __intptr_t intptr_t;
# 118 "c:\\mingw\\include\\stdint.h" 3
 typedef unsigned int __uintptr_t;

typedef __uintptr_t uintptr_t;







typedef long long intmax_t;
typedef unsigned long long uintmax_t;
# 10 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stdint.h" 2 3 4
# 23 "src\\system.h" 2
# 1 "c:\\mingw\\include\\string.h" 1 3
# 34 "c:\\mingw\\include\\string.h" 3
       
# 35 "c:\\mingw\\include\\string.h" 3
# 53 "c:\\mingw\\include\\string.h" 3
# 1 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stddef.h" 1 3 4
# 54 "c:\\mingw\\include\\string.h" 2 3
# 62 "c:\\mingw\\include\\string.h" 3
# 1 "c:\\mingw\\include\\strings.h" 1 3
# 33 "c:\\mingw\\include\\strings.h" 3
       
# 34 "c:\\mingw\\include\\strings.h" 3
# 59 "c:\\mingw\\include\\strings.h" 3
# 1 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stddef.h" 1 3 4
# 60 "c:\\mingw\\include\\strings.h" 2 3



int __attribute__((__cdecl__)) __attribute__((__nothrow__)) strcasecmp( const char *, const char * );
int __attribute__((__cdecl__)) __attribute__((__nothrow__)) strncasecmp( const char *, const char *, size_t );
# 80 "c:\\mingw\\include\\strings.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _stricmp( const char *, const char * );
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _strnicmp( const char *, const char *, size_t );
# 100 "c:\\mingw\\include\\strings.h" 3

# 63 "c:\\mingw\\include\\string.h" 2 3







 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void *memchr (const void *, int, size_t) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int memcmp (const void *, const void *, size_t) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void *memcpy (void *, const void *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void *memmove (void *, const void *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void *memset (void *, int, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strcat (char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strchr (const char *, int) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int strcmp (const char *, const char *) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int strcoll (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strcpy (char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t strcspn (const char *, const char *) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strerror (int);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t strlen (const char *) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strncat (char *, const char *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int strncmp (const char *, const char *, size_t) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strncpy (char *, const char *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strpbrk (const char *, const char *) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strrchr (const char *, int) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t strspn (const char *, const char *) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strstr (const char *, const char *) __attribute__((__pure__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strtok (char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t strxfrm (char *, const char *, size_t);




 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_strerror (const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void *_memccpy (void *, const void *, int, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _memicmp (const void *, const void *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_strdup (const char *) __attribute__((__malloc__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _strcmpi (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _stricoll (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_strlwr (char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_strnset (char *, int, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_strrev (char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_strset (char *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_strupr (char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void _swab (const char *, char *, size_t);
# 126 "c:\\mingw\\include\\string.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _strncoll(const char *, const char *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _strnicoll(const char *, const char *, size_t);






 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void *memccpy (void *, const void *, int, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int memicmp (const void *, const void *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strdup (const char *) __attribute__((__malloc__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int strcmpi (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int stricmp (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int stricoll (const char *, const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strlwr (char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int strnicmp (const char *, const char *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strnset (char *, int, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strrev (char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strset (char *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *strupr (char *);





 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void swab (const char *, char *, size_t);
# 170 "c:\\mingw\\include\\string.h" 3
# 1 "c:\\mingw\\include\\wchar.h" 1 3
# 35 "c:\\mingw\\include\\wchar.h" 3
       
# 36 "c:\\mingw\\include\\wchar.h" 3
# 392 "c:\\mingw\\include\\wchar.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcscat (wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcschr (const wchar_t *, wchar_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int wcscmp (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int wcscoll (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcscpy (wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t wcscspn (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t wcslen (const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcsncat (wchar_t *, const wchar_t *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int wcsncmp (const wchar_t *, const wchar_t *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcsncpy (wchar_t *, const wchar_t *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcspbrk (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcsrchr (const wchar_t *, wchar_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t wcsspn (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcsstr (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcstok (wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t wcsxfrm (wchar_t *, const wchar_t *, size_t);




 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wcsdup (const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _wcsicmp (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _wcsicoll (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wcslwr (wchar_t*);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _wcsnicmp (const wchar_t *, const wchar_t *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wcsnset (wchar_t *, wchar_t, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wcsrev (wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wcsset (wchar_t *, wchar_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wcsupr (wchar_t *);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _wcsncoll (const wchar_t *, const wchar_t *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _wcsnicoll (const wchar_t *, const wchar_t *, size_t);
# 445 "c:\\mingw\\include\\wchar.h" 3
int __attribute__((__cdecl__)) __attribute__((__nothrow__)) wcscmpi (const wchar_t *, const wchar_t *);
# 457 "c:\\mingw\\include\\wchar.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcsdup (const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int wcsicmp (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int wcsicoll (const wchar_t *, const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcslwr (wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int wcsnicmp (const wchar_t *, const wchar_t *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcsnset (wchar_t *, wchar_t, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcsrev (wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcsset (wchar_t *, wchar_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *wcsupr (wchar_t *);
# 491 "c:\\mingw\\include\\wchar.h" 3
extern size_t __mingw_wcsnlen (const wchar_t *, size_t);


extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__)) size_t wcsnlen (const wchar_t *__text, size_t __maxlen)
{ return __mingw_wcsnlen (__text, __maxlen); }
# 171 "c:\\mingw\\include\\string.h" 2 3
# 193 "c:\\mingw\\include\\string.h" 3
extern size_t __mingw_strnlen (const char *, size_t);


extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__)) size_t strnlen (const char *__text, size_t __maxlen)
{ return __mingw_strnlen (__text, __maxlen); }
# 212 "c:\\mingw\\include\\string.h" 3
extern int strerror_r (int, char *, size_t);
# 227 "c:\\mingw\\include\\string.h" 3
extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__)) int strerror_s (char *__buf, size_t __len, int __err)
{ return strerror_r (__err, __buf, __len); }





# 24 "src\\system.h" 2
# 1 "c:\\mingw\\include\\stdlib.h" 1 3
# 34 "c:\\mingw\\include\\stdlib.h" 3
       
# 35 "c:\\mingw\\include\\stdlib.h" 3
# 55 "c:\\mingw\\include\\stdlib.h" 3
# 1 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stddef.h" 1 3 4
# 56 "c:\\mingw\\include\\stdlib.h" 2 3
# 90 "c:\\mingw\\include\\stdlib.h" 3

# 99 "c:\\mingw\\include\\stdlib.h" 3
extern int _argc;
extern char **_argv;




extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) int *__p___argc(void);
extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) char ***__p___argv(void);
extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t ***__p___wargv(void);
# 142 "c:\\mingw\\include\\stdlib.h" 3
   extern __attribute__((__dllimport__)) int __mb_cur_max;
# 166 "c:\\mingw\\include\\stdlib.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int *_errno(void);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int *__doserrno(void);







extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) char ***__p__environ(void);

extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t ***__p__wenviron(void);
# 202 "c:\\mingw\\include\\stdlib.h" 3
extern __attribute__((__dllimport__)) int _sys_nerr;
# 227 "c:\\mingw\\include\\stdlib.h" 3
extern __attribute__((__dllimport__)) char *_sys_errlist[];
# 238 "c:\\mingw\\include\\stdlib.h" 3
extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) unsigned int *__p__osver(void);
extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) unsigned int *__p__winver(void);
extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) unsigned int *__p__winmajor(void);
extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) unsigned int *__p__winminor(void);
# 250 "c:\\mingw\\include\\stdlib.h" 3
extern __attribute__((__dllimport__)) unsigned int _osver;
extern __attribute__((__dllimport__)) unsigned int _winver;
extern __attribute__((__dllimport__)) unsigned int _winmajor;
extern __attribute__((__dllimport__)) unsigned int _winminor;
# 289 "c:\\mingw\\include\\stdlib.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char **__p__pgmptr(void);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t **__p__wpgmptr(void);
# 325 "c:\\mingw\\include\\stdlib.h" 3
extern __attribute__((__dllimport__)) int _fmode;
# 335 "c:\\mingw\\include\\stdlib.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int atoi (const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) long atol (const char *);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) double strtod (const char *, char **);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) double atof (const char *);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) double _wtof (const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _wtoi (const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) long _wtol (const wchar_t *);
# 378 "c:\\mingw\\include\\stdlib.h" 3
__attribute__((__cdecl__)) __attribute__((__nothrow__))
float strtof (const char *__restrict__, char **__restrict__);

__attribute__((__cdecl__)) __attribute__((__nothrow__))
long double strtold (const char *__restrict__, char **__restrict__);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) long strtol (const char *, char **, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) unsigned long strtoul (const char *, char **, int);







 __attribute__((__cdecl__)) __attribute__((__nothrow__))
long wcstol (const wchar_t *, wchar_t **, int);

 __attribute__((__cdecl__)) __attribute__((__nothrow__))
unsigned long wcstoul (const wchar_t *, wchar_t **, int);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) double wcstod (const wchar_t *, wchar_t **);





__attribute__((__cdecl__)) __attribute__((__nothrow__))
float wcstof (const wchar_t *__restrict__, wchar_t **__restrict__);

__attribute__((__cdecl__)) __attribute__((__nothrow__))
long double wcstold (const wchar_t *__restrict__, wchar_t **__restrict__);
# 451 "c:\\mingw\\include\\stdlib.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wgetenv (const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _wputenv (const wchar_t *);

 __attribute__((__cdecl__)) __attribute__((__nothrow__))
void _wsearchenv (const wchar_t *, const wchar_t *, wchar_t *);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _wsystem (const wchar_t *);

 __attribute__((__cdecl__)) __attribute__((__nothrow__))
void _wmakepath (wchar_t *, const wchar_t *, const wchar_t *, const wchar_t *,
    const wchar_t *
  );

 __attribute__((__cdecl__)) __attribute__((__nothrow__))
void _wsplitpath (const wchar_t *, wchar_t *, wchar_t *, wchar_t *, wchar_t *);

 __attribute__((__cdecl__)) __attribute__((__nothrow__))
wchar_t *_wfullpath (wchar_t *, const wchar_t *, size_t);





 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t wcstombs (char *, const wchar_t *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int wctomb (char *, wchar_t);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int mblen (const char *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) size_t mbstowcs (wchar_t *, const char *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int mbtowc (wchar_t *, const char *, size_t);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int rand (void);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void srand (unsigned int);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void *calloc (size_t, size_t) __attribute__((__malloc__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void *malloc (size_t) __attribute__((__malloc__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void *realloc (void *, size_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void free (void *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void abort (void) __attribute__((__noreturn__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void exit (int) __attribute__((__noreturn__));



int __attribute__((__cdecl__)) __attribute__((__nothrow__)) atexit (void (*)(void));

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int system (const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *getenv (const char *);






 __attribute__((__cdecl__)) void *bsearch
(const void *, const void *, size_t, size_t, int (*)(const void *, const void *));

 __attribute__((__cdecl__)) void qsort
(void *, size_t, size_t, int (*)(const void *, const void *));

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int abs (int) __attribute__((__const__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) long labs (long) __attribute__((__const__));
# 519 "c:\\mingw\\include\\stdlib.h" 3
typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) div_t div (int, int) __attribute__((__const__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) ldiv_t ldiv (long, long) __attribute__((__const__));






 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void _exit (int) __attribute__((__noreturn__));





 __attribute__((__cdecl__)) __attribute__((__nothrow__)) long long _atoi64 (const char *);
# 545 "c:\\mingw\\include\\stdlib.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void _beep (unsigned int, unsigned int) __attribute__((__deprecated__));

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void _seterrormode (int) __attribute__((__deprecated__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void _sleep (unsigned long) __attribute__((__deprecated__));



typedef int (* _onexit_t)(void);
__attribute__((__cdecl__)) __attribute__((__nothrow__)) _onexit_t _onexit( _onexit_t );

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _putenv (const char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__))
void _searchenv (const char *, const char *, char *);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_ecvt (double, int, int *, int *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_fcvt (double, int, int *, int *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_gcvt (double, int, char *);

 __attribute__((__cdecl__)) __attribute__((__nothrow__))
void _makepath (char *, const char *, const char *, const char *, const char *);

 __attribute__((__cdecl__)) __attribute__((__nothrow__))
void _splitpath (const char *, char *, char *, char *, char *);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_fullpath (char*, const char*, size_t);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_itoa (int, char *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_ltoa (long, char *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_ultoa(unsigned long, char *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_itow (int, wchar_t *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_ltow (long, wchar_t *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_ultow (unsigned long, wchar_t *, int);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char* _i64toa (long long, char *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char* _ui64toa (unsigned long long, char *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) long long _wtoi64 (const wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t* _i64tow (long long, wchar_t *, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t* _ui64tow (unsigned long long, wchar_t *, int);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) unsigned int (_rotl)(unsigned int, int) __attribute__((__const__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) unsigned int (_rotr)(unsigned int, int) __attribute__((__const__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) unsigned long (_lrotl)(unsigned long, int) __attribute__((__const__));
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) unsigned long (_lrotr)(unsigned long, int) __attribute__((__const__));

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int _set_error_mode (int);
# 628 "c:\\mingw\\include\\stdlib.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) int putenv (const char*);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) void searchenv (const char*, const char*, char*);

 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char* itoa (int, char*, int);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char* ltoa (long, char*, int);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char* ecvt (double, int, int*, int*);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char* fcvt (double, int, int*, int*);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char* gcvt (double, int, char*);
# 649 "c:\\mingw\\include\\stdlib.h" 3
__attribute__((__cdecl__)) __attribute__((__nothrow__)) void _Exit(int) __attribute__((__noreturn__));






typedef struct { long long quot, rem; } lldiv_t;
__attribute__((__cdecl__)) __attribute__((__nothrow__)) lldiv_t lldiv (long long, long long) __attribute__((__const__));

__attribute__((__cdecl__)) __attribute__((__nothrow__)) long long llabs (long long);
# 670 "c:\\mingw\\include\\stdlib.h" 3
__attribute__((__cdecl__)) __attribute__((__nothrow__))
long long strtoll (const char *__restrict__, char **__restrict, int);

__attribute__((__cdecl__)) __attribute__((__nothrow__))
unsigned long long strtoull (const char *__restrict__, char **__restrict__, int);





__attribute__((__cdecl__)) __attribute__((__nothrow__)) long long atoll (const char *);
# 726 "c:\\mingw\\include\\stdlib.h" 3
__attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__deprecated__)) long long wtoll (const wchar_t *);
__attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__deprecated__)) char *lltoa (long long, char *, int);
__attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__deprecated__)) char *ulltoa (unsigned long long , char *, int);
__attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__deprecated__)) wchar_t *lltow (long long, wchar_t *, int);
__attribute__((__cdecl__)) __attribute__((__nothrow__)) __attribute__((__deprecated__)) wchar_t *ulltow (unsigned long long, wchar_t *, int);
# 766 "c:\\mingw\\include\\stdlib.h" 3
__attribute__((__cdecl__)) __attribute__((__nothrow__)) int mkstemp (char *);
__attribute__((__cdecl__)) __attribute__((__nothrow__)) int __mingw_mkstemp (int, char *);
# 808 "c:\\mingw\\include\\stdlib.h" 3
extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__))
__attribute__((__cdecl__)) __attribute__((__nothrow__)) int mkstemp (char *__filename_template)
{ return __mingw_mkstemp( 0, __filename_template ); }
# 819 "c:\\mingw\\include\\stdlib.h" 3
__attribute__((__cdecl__)) __attribute__((__nothrow__)) char *mkdtemp (char *);
__attribute__((__cdecl__)) __attribute__((__nothrow__)) char *__mingw_mkdtemp (char *);

extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__))
__attribute__((__cdecl__)) __attribute__((__nothrow__)) char *mkdtemp (char *__dirname_template)
{ return __mingw_mkdtemp( __dirname_template ); }






__attribute__((__cdecl__)) __attribute__((__nothrow__)) int setenv( const char *, const char *, int );
__attribute__((__cdecl__)) __attribute__((__nothrow__)) int unsetenv( const char * );

__attribute__((__cdecl__)) __attribute__((__nothrow__)) int __mingw_setenv( const char *, const char *, int );

extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__))
__attribute__((__cdecl__)) __attribute__((__nothrow__)) int setenv( const char *__n, const char *__v, int __f )
{ return __mingw_setenv( __n, __v, __f ); }

extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__))
__attribute__((__cdecl__)) __attribute__((__nothrow__)) int unsetenv( const char *__name )
{ return __mingw_setenv( __name, ((void *)0), 1 ); }





# 25 "src\\system.h" 2
# 1 "c:\\mingw\\include\\time.h" 1 3
# 33 "c:\\mingw\\include\\time.h" 3
       
# 34 "c:\\mingw\\include\\time.h" 3
# 45 "c:\\mingw\\include\\time.h" 3
# 1 "c:\\mingw\\include\\sys\\types.h" 1 3
# 34 "c:\\mingw\\include\\sys\\types.h" 3
       
# 35 "c:\\mingw\\include\\sys\\types.h" 3
# 139 "c:\\mingw\\include\\sys\\types.h" 3
  typedef long __time32_t;
  typedef long long __time64_t;
# 149 "c:\\mingw\\include\\sys\\types.h" 3
   typedef __time32_t time_t;
# 46 "c:\\mingw\\include\\time.h" 2 3
# 115 "c:\\mingw\\include\\time.h" 3
struct timespec
{







  __time64_t tv_sec;
  long tv_nsec;
};


struct __mingw32_expanded_timespec
{





  union
  {



    __time64_t __tv64_sec;
    __time32_t __tv32_sec;
    time_t tv_sec;
  };
  long tv_nsec;
};
# 155 "c:\\mingw\\include\\time.h" 3


extern inline __attribute__((__gnu_inline__)) __attribute__((__always_inline__))







struct __mingw32_expanded_timespec *mingw_timespec( struct timespec *__tv )
{ return (struct __mingw32_expanded_timespec *)(__tv); }


# 178 "c:\\mingw\\include\\time.h" 3
# 1 "c:\\mingw\\lib\\gcc\\mingw32\\6.3.0\\include\\stddef.h" 1 3 4
# 179 "c:\\mingw\\include\\time.h" 2 3




typedef long clock_t;

struct tm
{




  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;
};



 __attribute__((__cdecl__)) __attribute__((__nothrow__)) clock_t clock (void);
# 214 "c:\\mingw\\include\\time.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) time_t time (time_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) double difftime (time_t, time_t);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) time_t mktime (struct tm *);
# 228 "c:\\mingw\\include\\time.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *asctime (const struct tm *);





 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *ctime (const time_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) struct tm *gmtime (const time_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) struct tm *localtime (const time_t *);


 __attribute__((__cdecl__)) __attribute__((__nothrow__))
size_t strftime (char *, size_t, const char *, const struct tm *);


extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) void _tzset (void);


extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) void tzset (void);


 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_strdate (char *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_strtime (char *);






 __attribute__((__cdecl__)) __attribute__((__nothrow__)) __time64_t _time64( __time64_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) __time64_t _mktime64 (struct tm *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) char *_ctime64 (const __time64_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) struct tm *_gmtime64 (const __time64_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) struct tm *_localtime64 (const __time64_t *);
# 344 "c:\\mingw\\include\\time.h" 3
extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) int *__p__daylight (void);
extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) long *__p__timezone (void);
extern __attribute__((__cdecl__)) __attribute__((__nothrow__)) char **__p__tzname (void);

extern __attribute__((__dllimport__)) int _daylight;
extern __attribute__((__dllimport__)) long _timezone;
extern __attribute__((__dllimport__)) char *_tzname[2];
# 381 "c:\\mingw\\include\\time.h" 3
extern __attribute__((__dllimport__)) int daylight;
extern __attribute__((__dllimport__)) long timezone;
extern __attribute__((__dllimport__)) char *tzname[2];
# 407 "c:\\mingw\\include\\time.h" 3
__attribute__((__cdecl__)) __attribute__((__nothrow__))
int nanosleep( const struct timespec *, struct timespec * );
# 428 "c:\\mingw\\include\\time.h" 3

# 440 "c:\\mingw\\include\\time.h" 3



 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wasctime (const struct tm *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wstrdate (wchar_t *);
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wstrtime (wchar_t *);






 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wctime64 (const __time64_t *);
# 466 "c:\\mingw\\include\\time.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__)) wchar_t *_wctime (const time_t *);
# 495 "c:\\mingw\\include\\time.h" 3
 __attribute__((__cdecl__)) __attribute__((__nothrow__))
size_t wcsftime (wchar_t *, size_t, const wchar_t *, const struct tm *);


# 26 "src\\system.h" 2
# 1 "c:\\mingw\\include\\math.h" 1 3
# 35 "c:\\mingw\\include\\math.h" 3
       
# 36 "c:\\mingw\\include\\math.h" 3
# 111 "c:\\mingw\\include\\math.h" 3

# 151 "c:\\mingw\\include\\math.h" 3
struct _exception
{
  int type;
  char *name;
  double arg1;
  double arg2;
  double retval;
};

 double __attribute__((__cdecl__)) sin (double);
 double __attribute__((__cdecl__)) cos (double);
 double __attribute__((__cdecl__)) tan (double);
 double __attribute__((__cdecl__)) sinh (double);
 double __attribute__((__cdecl__)) cosh (double);
 double __attribute__((__cdecl__)) tanh (double);
 double __attribute__((__cdecl__)) asin (double);
 double __attribute__((__cdecl__)) acos (double);
 double __attribute__((__cdecl__)) atan (double);
 double __attribute__((__cdecl__)) atan2 (double, double);
 double __attribute__((__cdecl__)) exp (double);
 double __attribute__((__cdecl__)) log (double);
 double __attribute__((__cdecl__)) log10 (double);
 double __attribute__((__cdecl__)) pow (double, double);
 double __attribute__((__cdecl__)) sqrt (double);
 double __attribute__((__cdecl__)) ceil (double);
 double __attribute__((__cdecl__)) floor (double);
 double __attribute__((__cdecl__)) fabs (double);
 double __attribute__((__cdecl__)) ldexp (double, int);
 double __attribute__((__cdecl__)) frexp (double, int*);
 double __attribute__((__cdecl__)) modf (double, double*);
 double __attribute__((__cdecl__)) fmod (double, double);
# 225 "c:\\mingw\\include\\math.h" 3
struct _complex
{



  double x;
  double y;
};

 double __attribute__((__cdecl__)) _cabs (struct _complex);

 double __attribute__((__cdecl__)) _hypot (double, double);
 double __attribute__((__cdecl__)) _j0 (double);
 double __attribute__((__cdecl__)) _j1 (double);
 double __attribute__((__cdecl__)) _jn (int, double);
 double __attribute__((__cdecl__)) _y0 (double);
 double __attribute__((__cdecl__)) _y1 (double);
 double __attribute__((__cdecl__)) _yn (int, double);
 int __attribute__((__cdecl__)) _matherr (struct _exception *);
# 252 "c:\\mingw\\include\\math.h" 3
 double __attribute__((__cdecl__)) _chgsign (double);
 double __attribute__((__cdecl__)) _copysign (double, double);
 double __attribute__((__cdecl__)) _logb (double);
 double __attribute__((__cdecl__)) _nextafter (double, double);
 double __attribute__((__cdecl__)) _scalb (double, long);

 int __attribute__((__cdecl__)) _finite (double);
 int __attribute__((__cdecl__)) _fpclass (double);
 int __attribute__((__cdecl__)) _isnan (double);
# 269 "c:\\mingw\\include\\math.h" 3
 double __attribute__((__cdecl__)) j0 (double);
 double __attribute__((__cdecl__)) j1 (double);
 double __attribute__((__cdecl__)) jn (int, double);
 double __attribute__((__cdecl__)) y0 (double);
 double __attribute__((__cdecl__)) y1 (double);
 double __attribute__((__cdecl__)) yn (int, double);

 double __attribute__((__cdecl__)) chgsign (double);
# 285 "c:\\mingw\\include\\math.h" 3
 int __attribute__((__cdecl__)) finite (double);
 int __attribute__((__cdecl__)) fpclass (double);
# 355 "c:\\mingw\\include\\math.h" 3
  typedef long double float_t;
  typedef long double double_t;
# 391 "c:\\mingw\\include\\math.h" 3
extern int __attribute__((__cdecl__)) __fpclassifyf (float);
extern int __attribute__((__cdecl__)) __fpclassify (double);
extern int __attribute__((__cdecl__)) __fpclassifyl (long double);
# 417 "c:\\mingw\\include\\math.h" 3
extern int __attribute__((__cdecl__)) __isnan (double);
extern int __attribute__((__cdecl__)) __isnanf (float);
extern int __attribute__((__cdecl__)) __isnanl (long double);
# 457 "c:\\mingw\\include\\math.h" 3
extern int __attribute__((__cdecl__)) __signbit (double);
extern int __attribute__((__cdecl__)) __signbitf (float);
extern int __attribute__((__cdecl__)) __signbitl (long double);
# 486 "c:\\mingw\\include\\math.h" 3
extern float __attribute__((__cdecl__)) sinf (float);
extern long double __attribute__((__cdecl__)) sinl (long double);

extern float __attribute__((__cdecl__)) cosf (float);
extern long double __attribute__((__cdecl__)) cosl (long double);

extern float __attribute__((__cdecl__)) tanf (float);
extern long double __attribute__((__cdecl__)) tanl (long double);

extern float __attribute__((__cdecl__)) asinf (float);
extern long double __attribute__((__cdecl__)) asinl (long double);

extern float __attribute__((__cdecl__)) acosf (float);
extern long double __attribute__((__cdecl__)) acosl (long double);

extern float __attribute__((__cdecl__)) atanf (float);
extern long double __attribute__((__cdecl__)) atanl (long double);

extern float __attribute__((__cdecl__)) atan2f (float, float);
extern long double __attribute__((__cdecl__)) atan2l (long double, long double);



extern float __attribute__((__cdecl__)) sinhf (float);




extern long double __attribute__((__cdecl__)) sinhl (long double);

extern float __attribute__((__cdecl__)) coshf (float);




extern long double __attribute__((__cdecl__)) coshl (long double);

extern float __attribute__((__cdecl__)) tanhf (float);




extern long double __attribute__((__cdecl__)) tanhl (long double);



extern double __attribute__((__cdecl__)) acosh (double);
extern float __attribute__((__cdecl__)) acoshf (float);
extern long double __attribute__((__cdecl__)) acoshl (long double);


extern double __attribute__((__cdecl__)) asinh (double);
extern float __attribute__((__cdecl__)) asinhf (float);
extern long double __attribute__((__cdecl__)) asinhl (long double);


extern double __attribute__((__cdecl__)) atanh (double);
extern float __attribute__((__cdecl__)) atanhf (float);
extern long double __attribute__((__cdecl__)) atanhl (long double);



extern float __attribute__((__cdecl__)) expf (float);




extern long double __attribute__((__cdecl__)) expl (long double);


extern double __attribute__((__cdecl__)) exp2(double);
extern float __attribute__((__cdecl__)) exp2f(float);
extern long double __attribute__((__cdecl__)) exp2l(long double);



extern double __attribute__((__cdecl__)) expm1(double);
extern float __attribute__((__cdecl__)) expm1f(float);
extern long double __attribute__((__cdecl__)) expm1l(long double);


extern float __attribute__((__cdecl__)) frexpf (float, int*);




extern long double __attribute__((__cdecl__)) frexpl (long double, int*);




extern int __attribute__((__cdecl__)) ilogb (double);
extern int __attribute__((__cdecl__)) ilogbf (float);
extern int __attribute__((__cdecl__)) ilogbl (long double);


extern float __attribute__((__cdecl__)) ldexpf (float, int);




extern long double __attribute__((__cdecl__)) ldexpl (long double, int);


extern float __attribute__((__cdecl__)) logf (float);
extern long double __attribute__((__cdecl__)) logl (long double);


extern float __attribute__((__cdecl__)) log10f (float);
extern long double __attribute__((__cdecl__)) log10l (long double);


extern double __attribute__((__cdecl__)) log1p(double);
extern float __attribute__((__cdecl__)) log1pf(float);
extern long double __attribute__((__cdecl__)) log1pl(long double);


extern double __attribute__((__cdecl__)) log2 (double);
extern float __attribute__((__cdecl__)) log2f (float);
extern long double __attribute__((__cdecl__)) log2l (long double);


extern double __attribute__((__cdecl__)) logb (double);
extern float __attribute__((__cdecl__)) logbf (float);
extern long double __attribute__((__cdecl__)) logbl (long double);
# 644 "c:\\mingw\\include\\math.h" 3
extern float __attribute__((__cdecl__)) modff (float, float*);
extern long double __attribute__((__cdecl__)) modfl (long double, long double*);


extern double __attribute__((__cdecl__)) scalbn (double, int);
extern float __attribute__((__cdecl__)) scalbnf (float, int);
extern long double __attribute__((__cdecl__)) scalbnl (long double, int);

extern double __attribute__((__cdecl__)) scalbln (double, long);
extern float __attribute__((__cdecl__)) scalblnf (float, long);
extern long double __attribute__((__cdecl__)) scalblnl (long double, long);



extern double __attribute__((__cdecl__)) cbrt (double);
extern float __attribute__((__cdecl__)) cbrtf (float);
extern long double __attribute__((__cdecl__)) cbrtl (long double);


extern float __attribute__((__cdecl__)) fabsf (float x);
extern long double __attribute__((__cdecl__)) fabsl (long double x);


extern double __attribute__((__cdecl__)) hypot (double, double);
extern float __attribute__((__cdecl__)) hypotf (float, float);
extern long double __attribute__((__cdecl__)) hypotl (long double, long double);


extern float __attribute__((__cdecl__)) powf (float, float);
extern long double __attribute__((__cdecl__)) powl (long double, long double);


extern float __attribute__((__cdecl__)) sqrtf (float);
extern long double __attribute__((__cdecl__)) sqrtl (long double);


extern double __attribute__((__cdecl__)) erf (double);
extern float __attribute__((__cdecl__)) erff (float);
extern long double __attribute__((__cdecl__)) erfl (long double);


extern double __attribute__((__cdecl__)) erfc (double);
extern float __attribute__((__cdecl__)) erfcf (float);
extern long double __attribute__((__cdecl__)) erfcl (long double);


extern double __attribute__((__cdecl__)) lgamma (double);
extern float __attribute__((__cdecl__)) lgammaf (float);
extern long double __attribute__((__cdecl__)) lgammal (long double);


extern double __attribute__((__cdecl__)) tgamma (double);
extern float __attribute__((__cdecl__)) tgammaf (float);
extern long double __attribute__((__cdecl__)) tgammal (long double);


extern float __attribute__((__cdecl__)) ceilf (float);
extern long double __attribute__((__cdecl__)) ceill (long double);


extern float __attribute__((__cdecl__)) floorf (float);
extern long double __attribute__((__cdecl__)) floorl (long double);


extern double __attribute__((__cdecl__)) nearbyint ( double);
extern float __attribute__((__cdecl__)) nearbyintf (float);
extern long double __attribute__((__cdecl__)) nearbyintl (long double);



extern double __attribute__((__cdecl__)) rint (double);
extern float __attribute__((__cdecl__)) rintf (float);
extern long double __attribute__((__cdecl__)) rintl (long double);


extern long __attribute__((__cdecl__)) lrint (double);
extern long __attribute__((__cdecl__)) lrintf (float);
extern long __attribute__((__cdecl__)) lrintl (long double);

extern long long __attribute__((__cdecl__)) llrint (double);
extern long long __attribute__((__cdecl__)) llrintf (float);
extern long long __attribute__((__cdecl__)) llrintl (long double);
# 805 "c:\\mingw\\include\\math.h" 3
extern double __attribute__((__cdecl__)) round (double);
extern float __attribute__((__cdecl__)) roundf (float);
extern long double __attribute__((__cdecl__)) roundl (long double);


extern long __attribute__((__cdecl__)) lround (double);
extern long __attribute__((__cdecl__)) lroundf (float);
extern long __attribute__((__cdecl__)) lroundl (long double);

extern long long __attribute__((__cdecl__)) llround (double);
extern long long __attribute__((__cdecl__)) llroundf (float);
extern long long __attribute__((__cdecl__)) llroundl (long double);



extern double __attribute__((__cdecl__)) trunc (double);
extern float __attribute__((__cdecl__)) truncf (float);
extern long double __attribute__((__cdecl__)) truncl (long double);


extern float __attribute__((__cdecl__)) fmodf (float, float);
extern long double __attribute__((__cdecl__)) fmodl (long double, long double);


extern double __attribute__((__cdecl__)) remainder (double, double);
extern float __attribute__((__cdecl__)) remainderf (float, float);
extern long double __attribute__((__cdecl__)) remainderl (long double, long double);


extern double __attribute__((__cdecl__)) remquo(double, double, int *);
extern float __attribute__((__cdecl__)) remquof(float, float, int *);
extern long double __attribute__((__cdecl__)) remquol(long double, long double, int *);


extern double __attribute__((__cdecl__)) copysign (double, double);
extern float __attribute__((__cdecl__)) copysignf (float, float);
extern long double __attribute__((__cdecl__)) copysignl (long double, long double);


extern double __attribute__((__cdecl__)) nan(const char *tagp);
extern float __attribute__((__cdecl__)) nanf(const char *tagp);
extern long double __attribute__((__cdecl__)) nanl(const char *tagp);
# 855 "c:\\mingw\\include\\math.h" 3
extern double __attribute__((__cdecl__)) nextafter (double, double);
extern float __attribute__((__cdecl__)) nextafterf (float, float);
extern long double __attribute__((__cdecl__)) nextafterl (long double, long double);


extern double __attribute__((__cdecl__)) nexttoward (double, long double);
extern float __attribute__((__cdecl__)) nexttowardf (float, long double);
extern long double __attribute__((__cdecl__)) nexttowardl (long double, long double);



extern double __attribute__((__cdecl__)) fdim (double x, double y);
extern float __attribute__((__cdecl__)) fdimf (float x, float y);
extern long double __attribute__((__cdecl__)) fdiml (long double x, long double y);







extern double __attribute__((__cdecl__)) fmax (double, double);
extern float __attribute__((__cdecl__)) fmaxf (float, float);
extern long double __attribute__((__cdecl__)) fmaxl (long double, long double);


extern double __attribute__((__cdecl__)) fmin (double, double);
extern float __attribute__((__cdecl__)) fminf (float, float);
extern long double __attribute__((__cdecl__)) fminl (long double, long double);



extern double __attribute__((__cdecl__)) fma (double, double, double);
extern float __attribute__((__cdecl__)) fmaf (float, float, float);
extern long double __attribute__((__cdecl__)) fmal (long double, long double, long double);
# 931 "c:\\mingw\\include\\math.h" 3

# 27 "src\\system.h" 2
# 54 "src\\system.h"

# 54 "src\\system.h"
typedef struct _complex_t
{
  float re;
  float im;
} complex_t;
# 19 "src\\error.h" 2







typedef enum
{
  ERR_NONE = 0,
  ERR_INV_NULL_POINTER,
  ERR_INV_PRINTID,
  ERR_INV_CNVCOD_RATE,
  ERR_INV_CNVCOD_KLEN,
  ERR_INV_CNVCOD_DECMET,
  ERR_INV_BUFFER_SIZE,
  ERR_INV_DYNAMIC_ALLOC,
  ERR_INV_STREAM_TYPE,
  ERR_INV_MODULATION_TYPE,
  ERR_INV_MODULATION_BPS,
  ERR_INV_CHANNEL_TYPE,
  ERR_INV_SCRAMBLING_TYPE,

  ERR_NUM
} error_t;


typedef enum
{
  ALARM_NONE = 0,
  ALARM_PRINT,
  ALARM_STOP,

  ALARM_NUM
} alarm_t;
# 69 "src\\error.h"
error_t Error_HandleErr( error_t inErr );
# 19 "src\\convolutional.h" 2
# 1 "src\\memory.h" 1
# 28 "src\\memory.h"
typedef enum
{
  memory_type_byte = 0,
  memory_type_float,
  memory_type_complex
} memory_type_t;


typedef struct _byte_stream_t
{
  uint8_t * pBuf;
  uint32_t len;
  memory_type_t id;
} byte_stream_t;


typedef struct _float_stream_t
{
  float * pBuf;
  uint32_t len;
  memory_type_t id;
} float_stream_t;


typedef struct _complex_stream_t
{
  complex_t * pBuf;
  uint32_t len;
  memory_type_t id;
} complex_stream_t;







error_t Memory_AllocateStream( void * ioStream, uint32_t len, memory_type_t type );
error_t Memory_FreeStream( void * ioStream, memory_type_t type );
# 20 "src\\convolutional.h" 2
# 68 "src\\convolutional.h"
typedef enum
{
  CC_RATE_12 = 1, CC_RATE_23 = 2, CC_RATE_34 = 3, CC_RATE_56 = 5, CC_RATE_78 = 7
} cc_rate_t;


typedef enum
{
  CC_RATE_IDX_12, CC_RATE_IDX_23, CC_RATE_IDX_34, CC_RATE_IDX_56, CC_RATE_IDX_78,
  CC_RATE_NUM
} cc_rate_idx_t;
# 87 "src\\convolutional.h"
typedef enum
{
  CC_KLEN_3 = 3,
  CC_KLEN_4 = 4,
  CC_KLEN_5 = 5,
  CC_KLEN_6 = 6,
  CC_KLEN_7 = 7,
  CC_KLEN_8 = 8,
  CC_KLEN_MIN = CC_KLEN_3,
  CC_KLEN_MAX = CC_KLEN_8
} cc_klen_t;



typedef enum
{
  CC_VITDM_HARD = 0,
  CC_VITDM_SOFT,

  CC_VITDM_NUM
} cc_dec_method_t;


typedef struct _cc_par_t
{
  cc_rate_t cRate;
  cc_klen_t kLen;
  uint16_t memFact;
  cc_dec_method_t vitDM;
} cc_par_t;


typedef struct _cc_encoder_info_t
{
  uint8_t connVect[2u];
  uint8_t puncVect[(2u*CC_RATE_12)];
} cc_encoder_info_t;


typedef struct _cc_trcore_t
{
  uint8_t outBits[2u];
  uint8_t nextSt[2u];
} cc_trcore_t;


typedef struct _cc_trellis_t
{
  cc_trcore_t trSt[(1<<(CC_KLEN_7-1))];
} cc_trellis_t;


typedef struct _cc_hard_dec_info_t
{
  uint32_t iter[(1<<(CC_KLEN_7-1))];
  uint32_t dist[(1<<(CC_KLEN_7-1))];
  uint8_t path[(1<<(CC_KLEN_7-1))][((1<<(CC_KLEN_7-1))*10u)];
} cc_hard_dec_info_t;



typedef struct _cc_soft_dec_info_t
{
  uint32_t iter[(1<<(CC_KLEN_7-1))];
  float dist[(1<<(CC_KLEN_7-1))];
  uint8_t path[(1<<(CC_KLEN_7-1))][((1<<(CC_KLEN_7-1))*10u)];
} cc_soft_dec_info_t;







error_t CnvCod_ListParameters( cc_par_t * ioParams );
error_t CnvCod_Encoder( const byte_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams );
error_t CnvCod_HardDecoder( const byte_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams );
error_t CnvCod_SoftDecoder( const float_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams );
# 16 "src\\convolutional.c" 2







const cc_rate_t CC_RATE_ARRAY[CC_RATE_NUM] =
{
  CC_RATE_12, CC_RATE_23, CC_RATE_34, CC_RATE_56, CC_RATE_78
};







static 
# 34 "src\\convolutional.c" 3 4
      _Bool 
# 34 "src\\convolutional.c"
           IsRateValid( cc_rate_t rateVal );
static 
# 35 "src\\convolutional.c" 3 4
      _Bool 
# 35 "src\\convolutional.c"
           IsKlenValid( cc_klen_t kVal );
static error_t RetrieveConnectorPuncturationVectors( cc_encoder_info_t * ioInfo, const cc_par_t * pParams );
static uint8_t ComputeEncBit( uint8_t cState, uint8_t cvVal, cc_klen_t kLen );
static error_t ComputeTrellisDiagram( cc_trellis_t * ioTrellisDiagr, const uint8_t * conVect, const cc_par_t * pParams );
static error_t HardDepuncturer( uint8_t * ioBuffer, uint32_t inLenBi, uint32_t outLenBi, const uint8_t * punctVect, const cc_par_t * pParams );
static uint8_t CountByteOnes( uint8_t InByte );
static uint8_t FindMinSurvPathHard( const cc_hard_dec_info_t * inPaths );
static error_t SoftDepuncturer( float * ioBuffer, uint32_t inLenBi, uint32_t outLenBi, const uint8_t * punctVect, const cc_par_t * pParams );
static float EstimateEuclideanDist( const float * inBuf, uint8_t trlByte, uint8_t erasMask );
static uint8_t FindMinSurvPathSoft( const cc_soft_dec_info_t * inPaths);
# 59 "src\\convolutional.c"
error_t CnvCod_ListParameters( cc_par_t * ioParams )
{
  error_t retErr = ERR_NONE;

  if (
# 63 "src\\convolutional.c" 3 4
     ((void *)0) 
# 63 "src\\convolutional.c"
          != ioParams)
  {
    ioParams->cRate = CC_RATE_12;
    ioParams->kLen = CC_KLEN_7;
    ioParams->memFact = 10u;
    ioParams->vitDM = CC_VITDM_HARD;
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 88 "src\\convolutional.c"
error_t CnvCod_Encoder( const byte_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const uint32_t unpLenBy = 2u*inStream->len;
  const uint32_t unpLenBi = ((unpLenBy)<<3u);
  const uint32_t inLenBi = ((inStream->len)<<3u);
  const uint32_t punLenBi = inLenBi*(pParams->cRate+1)/pParams->cRate;
  const uint32_t punLenBy = ((punLenBi)>>3u);
  cc_encoder_info_t encInfo;
  byte_stream_t tmpStream = {.len = unpLenBy, .id = memory_type_byte};
  uint32_t wrIdx = 0;
  uint32_t byteIdx;
  uint32_t j;
  uint8_t encState = 0;
  uint8_t bitIdx;
  uint8_t rdBit;

  if ((
# 105 "src\\convolutional.c" 3 4
      ((void *)0) 
# 105 "src\\convolutional.c"
           != inStream) && (
# 105 "src\\convolutional.c" 3 4
                            ((void *)0) 
# 105 "src\\convolutional.c"
                                 != inStream->pBuf) && (
# 105 "src\\convolutional.c" 3 4
                                                        ((void *)0) 
# 105 "src\\convolutional.c"
                                                             != outStream) &&
      (
# 106 "src\\convolutional.c" 3 4
      ((void *)0) 
# 106 "src\\convolutional.c"
           != outStream->pBuf) && (
# 106 "src\\convolutional.c" 3 4
                                   ((void *)0) 
# 106 "src\\convolutional.c"
                                        != pParams))
  {
    RetrieveConnectorPuncturationVectors(&encInfo,pParams);
    Memory_AllocateStream(&tmpStream,unpLenBy,memory_type_byte);

    if (punLenBy == outStream->len)
    {
      for (j=0; j<inLenBi; j++)
      {
        byteIdx = ((j)>>3u) ;
        bitIdx = (uint8_t)(j&((uint32_t) 0x00000007));
        encState >>= 1;
        encState |= ((inStream->pBuf[byteIdx]>>((8u -1)-bitIdx))&((uint8_t) 0x01))
          <<(pParams->kLen-1);
        byteIdx = ((2u*j)>>3u);
        bitIdx = (2u*j)&((uint32_t) 0x00000007);
        tmpStream.pBuf[byteIdx] |= (ComputeEncBit(encState,encInfo.connVect[0],
          pParams->kLen)<<((8u -1)-bitIdx));
        tmpStream.pBuf[byteIdx] |= (ComputeEncBit(encState,encInfo.connVect[1],
          pParams->kLen)<<(((8u -1)-1)-bitIdx));
      }

      if (CC_RATE_12 != pParams->cRate)
      {
        for (j=0; j<unpLenBi; j++)
        {
          byteIdx = ((j)>>3u);
          bitIdx = j&((uint32_t) 0x00000007);
          rdBit = (tmpStream.pBuf[byteIdx]>>((8u -1)-bitIdx))&((uint8_t) 0x01);
          if (encInfo.puncVect[j%(2u*pParams->cRate)])
          {
            byteIdx = ((wrIdx)>>3u);
            bitIdx = (8u -1)-(uint8_t)(wrIdx&((uint32_t) 0x00000007));
            wrIdx++;
            if (0 == rdBit)
            {
              tmpStream.pBuf[byteIdx] &= ~(((uint8_t) 0x01)<<bitIdx);
            }
            else
            {
              tmpStream.pBuf[byteIdx] |= (((uint8_t) 0x01)<<bitIdx);
            }
          }
        }

        if (punLenBi != wrIdx)
        {
          retErr = ERR_INV_BUFFER_SIZE;
        }
      }

      if (ERR_NONE == retErr)
      {
        memcpy(outStream->pBuf,tmpStream.pBuf,outStream->len);
      }
    }
    else
    {
      retErr = ERR_INV_BUFFER_SIZE;
    }

    Memory_FreeStream(&tmpStream,memory_type_byte);
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

   return Error_HandleErr(retErr);
}
# 187 "src\\convolutional.c"
error_t CnvCod_HardDecoder( const byte_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const uint32_t outLenBi = ((outStream->len)<<3u);
  const uint32_t inLenBi = ((inStream->len)<<3u);
  const uint32_t unpLenBy = 2u*inStream->len*pParams->cRate/(pParams->cRate+1);
  const uint32_t unpLenBi = ((unpLenBy)<<3u);
  cc_encoder_info_t encInfo;
  cc_hard_dec_info_t curPaths = {.iter={0}, .dist={0}, .path={{0}}};
  cc_hard_dec_info_t prevPaths;
  cc_trellis_t trDiagr;
  uint32_t byteIdx, inIdx, wrIdx, finIdx;
  uint32_t candDist;
  uint32_t i;
  uint8_t tmpStream[unpLenBy];
  uint8_t nextSt, minDistSt, depSt, arrSt;
  uint8_t bitIdx, hypIdx;
  uint8_t cycleBits;
  uint8_t hamDist;
  uint8_t erasMask;
  uint8_t j;

  if ((
# 209 "src\\convolutional.c" 3 4
      ((void *)0) 
# 209 "src\\convolutional.c"
           != inStream) && (
# 209 "src\\convolutional.c" 3 4
                            ((void *)0) 
# 209 "src\\convolutional.c"
                                 != inStream->pBuf) && (
# 209 "src\\convolutional.c" 3 4
                                                        ((void *)0) 
# 209 "src\\convolutional.c"
                                                             != outStream) &&
      (
# 210 "src\\convolutional.c" 3 4
      ((void *)0) 
# 210 "src\\convolutional.c"
           != outStream->pBuf) && (
# 210 "src\\convolutional.c" 3 4
                                   ((void *)0) 
# 210 "src\\convolutional.c"
                                        != pParams))
  {
    if (CC_VITDM_HARD == pParams->vitDM)
    {
      RetrieveConnectorPuncturationVectors(&encInfo,pParams);
      ComputeTrellisDiagram(&trDiagr,encInfo.connVect,pParams);
      memcpy(tmpStream,inStream->pBuf,inStream->len);
      curPaths.iter[0] = 1;

      if (CC_RATE_12 == pParams->cRate)
      {
        erasMask = ((((uint8_t) 0x01)<<2u)-1);
      }
      else
      {
        HardDepuncturer(tmpStream,inLenBi,unpLenBi,encInfo.puncVect,pParams);
      }

      for (i=2u; i<outLenBi+2u; i++)
      {
        inIdx = 2u*(i-2u);
        byteIdx = ((inIdx)>>3u);
        bitIdx = (uint8_t)(inIdx&((uint32_t) 0x00000007));
        cycleBits = (tmpStream[byteIdx]>>(((8u -1)-1)-bitIdx))&((((uint8_t) 0x01)<<2u)-1);
        prevPaths = curPaths;
        if (CC_RATE_12 != pParams->cRate)
        {
          erasMask = 0;
          erasMask |= (encInfo.puncVect[inIdx%(2*pParams->cRate)]<<1);
          erasMask |= encInfo.puncVect[(inIdx+1)%(2*pParams->cRate)];
        }
        for (j=0; j<(1<<(CC_KLEN_7-1)); j++)
        {
          if (prevPaths.iter[j] == i-1)
          {
            for (hypIdx = 0; hypIdx<2u; hypIdx++)
            {
              hamDist = CountByteOnes((cycleBits^(trDiagr.trSt[j].outBits[hypIdx]))&erasMask);
              nextSt = trDiagr.trSt[j].nextSt[hypIdx];
              if (curPaths.iter[nextSt] < i)
              {
                curPaths.iter[nextSt] = i;
                curPaths.dist[nextSt] = prevPaths.dist[j]+(uint32_t)hamDist;
                if (i-1 < ((1<<(CC_KLEN_7-1))*10u))
                {
                  finIdx = i-2u;
                }
                else
                {
                  finIdx = ((1<<(CC_KLEN_7-1))*10u)-1;
                }
                for (wrIdx = 0; wrIdx < finIdx; wrIdx++)
                {
                  curPaths.path[nextSt][wrIdx] = prevPaths.path[j][wrIdx];
                }
                curPaths.path[nextSt][finIdx] = j;
              }
              else
              {
                candDist = prevPaths.dist[j]+(uint32_t)hamDist;
                if (candDist < curPaths.dist[nextSt])
                {
                  curPaths.dist[nextSt] = candDist;
                  if (i-1 < ((1<<(CC_KLEN_7-1))*10u))
                  {
                    finIdx = i-2u;
                  }
                  else
                  {
                    finIdx = ((1<<(CC_KLEN_7-1))*10u)-1;
                  }
                  for (wrIdx = 0; wrIdx < finIdx; wrIdx++)
                  {
                    curPaths.path[nextSt][wrIdx] = prevPaths.path[j][wrIdx];
                  }
                  curPaths.path[nextSt][finIdx] = j;
                }
              }
            }
          }
        }

        if (i-1 == outLenBi)
        {
          minDistSt = FindMinSurvPathHard(&curPaths);
          if (i-1 >= ((1<<(CC_KLEN_7-1))*10u))
          {
            finIdx = ((1<<(CC_KLEN_7-1))*10u);
          }
          else
          {
            finIdx = i-1;
          }
          for (wrIdx=0; wrIdx<finIdx; wrIdx++)
          {
            depSt = curPaths.path[minDistSt][wrIdx];
            if (wrIdx == finIdx-1)
            {
              arrSt = minDistSt;
            }
            else
            {
              arrSt = curPaths.path[minDistSt][wrIdx+1];
            }
            byteIdx = ((outLenBi-finIdx+wrIdx)>>3u);
            bitIdx = (uint8_t)((outLenBi-finIdx+wrIdx)&((uint32_t) 0x00000007));
            if (trDiagr.trSt[depSt].nextSt[0] == arrSt)
            {
              outStream->pBuf[byteIdx] &= ~(((uint8_t) 0x01)<<((8u -1)-bitIdx));
            }
            else
            {
              outStream->pBuf[byteIdx] |= (((uint8_t) 0x01)<<((8u -1)-bitIdx));
            }
          }
        }
        else if (i-1 >= ((1<<(CC_KLEN_7-1))*10u))
        {
          minDistSt = FindMinSurvPathHard(&curPaths);
          depSt = curPaths.path[minDistSt][0];
          arrSt = curPaths.path[minDistSt][1];
          byteIdx = ((i-((1<<(CC_KLEN_7-1))*10u)-1)>>3u);
          bitIdx = (uint8_t)((i-((1<<(CC_KLEN_7-1))*10u)-1)&((uint32_t) 0x00000007));
          if (trDiagr.trSt[depSt].nextSt[0] == arrSt)
          {
            outStream->pBuf[byteIdx] &= ~(((uint8_t) 0x01)<<((8u -1)-bitIdx));
          }
          else
          {
            outStream->pBuf[byteIdx] |= (((uint8_t) 0x01)<<((8u -1)-bitIdx));
          }
          for (j=0; j<(1<<(CC_KLEN_7-1)); j++)
          {
            for (wrIdx = 0; wrIdx<(((1<<(CC_KLEN_7-1))*10u)-1); wrIdx++)
            {
              curPaths.path[j][wrIdx] = curPaths.path[j][wrIdx+1];
            }
          }
        }
      }
    }
    else
    {
      retErr = ERR_INV_CNVCOD_DECMET;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 374 "src\\convolutional.c"
error_t CnvCod_SoftDecoder( const float_stream_t * inStream, byte_stream_t * outStream, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const uint32_t outLenBi = ((outStream->len)<<3u);
  const uint32_t unpLenBi = 2u*outLenBi;
  const uint32_t punLenBi = inStream->len;
  float tmpStream[unpLenBi];
  cc_soft_dec_info_t curPaths = {.iter={0}, .dist={0.0}, .path={{0}}};
  cc_soft_dec_info_t prevPaths;
  cc_encoder_info_t encInfo;
  cc_trellis_t trDiagr;
  float eucliDist, candDist;
  uint32_t curIdx, wrIdx, finIdx;
  uint32_t byteIdx;
  uint32_t i;
  uint8_t nextSt, minDistState;
  uint8_t stateDep, stateArr;
  uint8_t j, bitIdx, hypIdx;
  uint8_t erasMask;

  if ((
# 394 "src\\convolutional.c" 3 4
      ((void *)0) 
# 394 "src\\convolutional.c"
           != inStream) && (
# 394 "src\\convolutional.c" 3 4
                            ((void *)0) 
# 394 "src\\convolutional.c"
                                 != inStream->pBuf) && (
# 394 "src\\convolutional.c" 3 4
                                                        ((void *)0) 
# 394 "src\\convolutional.c"
                                                             != outStream) &&
      (
# 395 "src\\convolutional.c" 3 4
      ((void *)0) 
# 395 "src\\convolutional.c"
           != outStream->pBuf) && (
# 395 "src\\convolutional.c" 3 4
                                   ((void *)0) 
# 395 "src\\convolutional.c"
                                        != pParams))
  {
    if (CC_VITDM_SOFT == pParams->vitDM)
    {
      RetrieveConnectorPuncturationVectors(&encInfo,pParams);
      ComputeTrellisDiagram(&trDiagr,encInfo.connVect,pParams);
      memcpy(tmpStream,inStream->pBuf,sizeof(float)*inStream->len);
      curPaths.iter[0] = 1;

      if (CC_RATE_12 == pParams->cRate)
      {
        erasMask = ((((uint8_t) 0x01)<<2u)-1);
      }
      else
      {
        SoftDepuncturer(tmpStream,punLenBi,unpLenBi,encInfo.puncVect,pParams);
      }

      for (i=2u; i<outLenBi+2u; i++)
      {
        curIdx = 2u*(i-2u);
        prevPaths = curPaths;

        if (CC_RATE_12 != pParams->cRate)
        {
          erasMask = 0;
          erasMask |= (encInfo.puncVect[curIdx%(2u*pParams->cRate)]<<1);
          erasMask |= encInfo.puncVect[(curIdx+1)%(2u*pParams->cRate)];
        }

        for (j=0; j<(1<<(CC_KLEN_7-1)); j++)
        {
          if (prevPaths.iter[j] == i-1)
          {
            for (hypIdx = 0; hypIdx<2u; hypIdx++)
            {
              eucliDist = EstimateEuclideanDist(&tmpStream[curIdx],
                            trDiagr.trSt[j].outBits[hypIdx],erasMask);
              nextSt = trDiagr.trSt[j].nextSt[hypIdx];

              if (curPaths.iter[nextSt] < i)
              {
                curPaths.iter[nextSt] = i;
                curPaths.dist[nextSt] = prevPaths.dist[j]+eucliDist;
                if (i-1 < ((1<<(CC_KLEN_7-1))*10u))
                {
                  finIdx = i-2u;
                }
                else
                {
                  finIdx = ((1<<(CC_KLEN_7-1))*10u)-1;
                }
                for (wrIdx = 0; wrIdx < finIdx; wrIdx++)
                {
                  curPaths.path[nextSt][wrIdx] = prevPaths.path[j][wrIdx];
                }
                curPaths.path[nextSt][finIdx] = j;
              }
              else
              {
                candDist = prevPaths.dist[j]+eucliDist;
                if (candDist < curPaths.dist[nextSt])
                {
                  curPaths.dist[nextSt] = candDist;
                  if (i-1 < ((1<<(CC_KLEN_7-1))*10u))
                  {
                    finIdx = i-2u;
                  }
                  else
                  {
                    finIdx = ((1<<(CC_KLEN_7-1))*10u)-1;
                  }
                  for (wrIdx = 0; wrIdx < finIdx; wrIdx++)
                  {
                    curPaths.path[nextSt][wrIdx] = prevPaths.path[j][wrIdx];
                  }
                  curPaths.path[nextSt][finIdx] = j;
                }
              }
            }
          }
        }

        if (outLenBi == i-1)
        {
          minDistState = FindMinSurvPathSoft(&curPaths);
          if (i-1 >= ((1<<(CC_KLEN_7-1))*10u))
          {
            finIdx = ((1<<(CC_KLEN_7-1))*10u);
          }
          else
          {
            finIdx = i-1;
          }
          for (wrIdx=0; wrIdx<finIdx; wrIdx++)
          {
            stateDep = curPaths.path[minDistState][wrIdx];
            if (wrIdx == finIdx-1)
            {
              stateArr = minDistState;
            }
            else
            {
              stateArr = curPaths.path[minDistState][wrIdx+1];
            }
            byteIdx = ((outLenBi-finIdx+wrIdx)>>3u);
            bitIdx = (outLenBi-finIdx+wrIdx)&((uint32_t) 0x00000007);
            if (trDiagr.trSt[stateDep].nextSt[0] == stateArr)
            {
              outStream->pBuf[byteIdx] &= ~(((uint8_t) 0x01)<<((8u -1)-bitIdx));
            }
            else
            {
              outStream->pBuf[byteIdx] |= (((uint8_t) 0x01)<<((8u -1)-bitIdx));
            }
          }
        }
        else if (i-1 >= ((1<<(CC_KLEN_7-1))*10u))
        {
          minDistState = FindMinSurvPathSoft(&curPaths);
          stateDep = curPaths.path[minDistState][0];
          stateArr = curPaths.path[minDistState][1];
          byteIdx = ((i-((1<<(CC_KLEN_7-1))*10u)-1)>>3u);
          bitIdx = (uint8_t)((i-((1<<(CC_KLEN_7-1))*10u)-1)&((uint32_t) 0x00000007));
          if (trDiagr.trSt[stateDep].nextSt[0] == stateArr)
          {
            outStream->pBuf[byteIdx] &= ~(((uint8_t) 0x01)<<((8u -1)-bitIdx));
          }
          else
          {
            outStream->pBuf[byteIdx] |= (((uint8_t) 0x01)<<((8u -1)-bitIdx));
          }
          for (j=0; j<(1<<(CC_KLEN_7-1)); j++)
          {
            for (wrIdx = 0; wrIdx<(((1<<(CC_KLEN_7-1))*10u)-1); wrIdx++)
            {
              curPaths.path[j][wrIdx] = curPaths.path[j][wrIdx+1];
            }
          }
        }
      }
    }
    else
    {
      retErr = ERR_INV_CNVCOD_DECMET;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 564 "src\\convolutional.c"
static error_t RetrieveConnectorPuncturationVectors( cc_encoder_info_t * ioInfo, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;

  if ((
# 568 "src\\convolutional.c" 3 4
      ((void *)0) 
# 568 "src\\convolutional.c"
           != ioInfo) && (
# 568 "src\\convolutional.c" 3 4
                          ((void *)0) 
# 568 "src\\convolutional.c"
                               != pParams))
  {
    if (IsKlenValid(pParams->kLen))
    {

      memcpy(ioInfo->connVect,((uint8_t[][2u]) {{7,5},{15,11}, {23,25},{47,53},{79,109},{159,229}})[pParams->kLen-CC_KLEN_MIN],2u);
    }
    else
    {
      retErr = ERR_INV_CNVCOD_KLEN;
    }

    if (IsRateValid(pParams->cRate))
    {
      switch (pParams->cRate)
      {
        case CC_RATE_23:
          memcpy(ioInfo->puncVect,((uint8_t[]) {1,1,0,1}),(2u*CC_RATE_12));
          break;

        case CC_RATE_34:
          memcpy(ioInfo->puncVect,((uint8_t[]) {1,1,0,1,1,0}),(2u*CC_RATE_12));
          break;

        case CC_RATE_56:
          memcpy(ioInfo->puncVect,((uint8_t[]) {1,1,0,1,1,0,0,1,1,0}),(2u*CC_RATE_12));
          break;

        case CC_RATE_78:
          memcpy(ioInfo->puncVect,((uint8_t[]) {1,1,0,1,0,1,0,1,1,0,0,1,1,0}),(2u*CC_RATE_12));
          break;

        default:

          break;
      }
    }
    else
    {
      retErr = ERR_INV_CNVCOD_RATE;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 626 "src\\convolutional.c"
static 
# 626 "src\\convolutional.c" 3 4
      _Bool 
# 626 "src\\convolutional.c"
           IsRateValid( cc_rate_t rateVal )
{
  
# 628 "src\\convolutional.c" 3 4
 _Bool 
# 628 "src\\convolutional.c"
      bRet = 
# 628 "src\\convolutional.c" 3 4
             0
# 628 "src\\convolutional.c"
                  ;
  uint8_t j;

  for (j=0; j<CC_RATE_NUM; j++)
  {
    if (rateVal == CC_RATE_ARRAY[j])
    {
      bRet = 
# 635 "src\\convolutional.c" 3 4
            1
# 635 "src\\convolutional.c"
                ;
      break;
    }
  }

  return bRet;
}
# 651 "src\\convolutional.c"
static 
# 651 "src\\convolutional.c" 3 4
      _Bool 
# 651 "src\\convolutional.c"
           IsKlenValid( cc_klen_t kVal )
{
  
# 653 "src\\convolutional.c" 3 4
 _Bool 
# 653 "src\\convolutional.c"
      bRet;

  bRet = (kVal >= CC_KLEN_MIN) && (kVal <= CC_KLEN_MAX);

  return bRet;
}
# 670 "src\\convolutional.c"
static uint8_t ComputeEncBit( uint8_t cState, uint8_t cvVal, cc_klen_t kLen )
{
  uint8_t outBit = 0;
  uint8_t j;

  for (j=0; j<kLen; j++)
  {
    outBit ^= (((cState>>j)&((uint8_t) 0x01))&((cvVal>>j)&((uint8_t) 0x01)));
  }

  return outBit;
}
# 693 "src\\convolutional.c"
static error_t ComputeTrellisDiagram( cc_trellis_t * ioTrellisDiagr, const uint8_t * conVect, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  uint8_t StBin[(1<<(CC_KLEN_7-1))];
  uint8_t i, j;
  uint8_t outBit;
  uint8_t state0, state1;

  if (
# 701 "src\\convolutional.c" 3 4
     ((void *)0) 
# 701 "src\\convolutional.c"
          != ioTrellisDiagr)
  {
    for (j=0; j<(1<<(CC_KLEN_7-1)); j++)
    {
      StBin[j] = j;
    }
    for (j=0; j<(1<<(CC_KLEN_7-1)); j++)
    {
      state0 = StBin[j];
      for (i=0; i<2u; i++)
      {
        outBit = ComputeEncBit(state0,conVect[i],pParams->kLen);
        if ( 0 == i)
        {
          ioTrellisDiagr->trSt[j].outBits[0] = outBit<<1;
        }
        else
        {
          ioTrellisDiagr->trSt[j].outBits[0] += outBit;
        }
      }
      ioTrellisDiagr->trSt[j].nextSt[0] = state0>>1;
      state1 = state0|(((uint8_t) 0x01)<<(pParams->kLen-1));
      for (i=0; i<2u; i++)
      {
        outBit = ComputeEncBit(state1,conVect[i],pParams->kLen);
        if (0 == i)
        {
          ioTrellisDiagr->trSt[j].outBits[1] = outBit<<1;
        }
        else
        {
          ioTrellisDiagr->trSt[j].outBits[1] += outBit;
        }
      }
      ioTrellisDiagr->trSt[j].nextSt[1] = state1>>1;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 759 "src\\convolutional.c"
static error_t HardDepuncturer( uint8_t * ioBuffer, uint32_t inLenBi, uint32_t outLenBi, const uint8_t * punctVect, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  uint32_t rdIdx = inLenBi-1;
  uint32_t byteIdx;
  uint32_t j;
  uint8_t rdIdxPunc = 2u*pParams->cRate-1;
  uint8_t bitIdx;
  uint8_t rdBit;

  if (
# 769 "src\\convolutional.c" 3 4
     ((void *)0) 
# 769 "src\\convolutional.c"
          != ioBuffer)
  {
    for (j=outLenBi; j>0; j--)
    {
      if (1 == punctVect[rdIdxPunc])
      {
        byteIdx = ((rdIdx)>>3u);
        bitIdx = (uint8_t)((8u -1)-(rdIdx&((uint32_t) 0x00000007)));
        rdBit = ioBuffer[byteIdx]&(((uint8_t) 0x01)<<bitIdx);
        rdIdx--;
      }
      else
      {
        rdBit = 0;
      }
      if (rdIdxPunc > 0)
      {
        rdIdxPunc--;
      }
      else
      {
        rdIdxPunc = 2u*pParams->cRate-1;
      }
      byteIdx = ((j-1)>>3u);
      bitIdx = (uint8_t)((8u -1)-((j-1)&((uint32_t) 0x00000007)));
      if (0 == rdBit)
      {
        ioBuffer[byteIdx] &= ~(((uint8_t) 0x01)<<bitIdx);
      }
      else
      {
        ioBuffer[byteIdx] |= (((uint8_t) 0x01)<<bitIdx);
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 820 "src\\convolutional.c"
static uint8_t CountByteOnes( uint8_t inByte )
{
  uint8_t j;
  uint8_t cnt = 0;

  for (j=0; j<8u; j++)
  {
    if ((inByte>>j)&((uint8_t) 0x01))
    {
      cnt++;
    }
  }

  return cnt;
}
# 844 "src\\convolutional.c"
static uint8_t FindMinSurvPathHard( const cc_hard_dec_info_t * inPaths )
{
  uint32_t minDist;
  uint8_t minStateIdx;
  uint8_t j;

  if (
# 850 "src\\convolutional.c" 3 4
     ((void *)0) 
# 850 "src\\convolutional.c"
          != inPaths)
  {
    minDist = inPaths->dist[0];
    minStateIdx = 0;
    for (j=1; j<(1<<(CC_KLEN_7-1)); j++)
    {
      if ((inPaths->iter[j]>0) && (inPaths->dist[j] < minDist))
      {
        minDist = inPaths->dist[j];
        minStateIdx = j;
      }
    }
  }

  return minStateIdx;
}
# 879 "src\\convolutional.c"
static error_t SoftDepuncturer( float * ioBuffer, uint32_t inLenBi, uint32_t outLenBi, const uint8_t * punctVect, const cc_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  uint32_t i = inLenBi-1;
  uint32_t j;
  uint8_t k = 2u*pParams->cRate-1;

  if (
# 886 "src\\convolutional.c" 3 4
     ((void *)0) 
# 886 "src\\convolutional.c"
          != ioBuffer)
  {
    for (j=outLenBi; j>0; j--)
    {
      if (1 == punctVect[k])
      {
        ioBuffer[j-1] = ioBuffer[i];
        i--;
      }
      else
      {
        ioBuffer[j-1] = 0;
      }
      if (k > 0)
      {
        k--;
      }
      else
      {
        k = 2u*pParams->cRate-1;
      }
    }

  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 928 "src\\convolutional.c"
static float EstimateEuclideanDist( const float * inBuf, uint8_t trlByte, uint8_t erasMask )
{
  uint8_t j;
  float Dist = 0;

  if (
# 933 "src\\convolutional.c" 3 4
     ((void *)0) 
# 933 "src\\convolutional.c"
          != inBuf)
  {
    for (j=0; j<2u; j++)
    {
      if ((erasMask>>(1-j))&((uint8_t) 0x01))
      {
        Dist += fabs(2u*((float)((trlByte>>(1-j))&((uint8_t) 0x01)))-1-inBuf[j]);
      }
    }
  }

  return Dist;
}
# 955 "src\\convolutional.c"
static uint8_t FindMinSurvPathSoft( const cc_soft_dec_info_t * inPaths)
{
  float minDist;
  uint8_t minStIdx;
  uint8_t j;

  if (
# 961 "src\\convolutional.c" 3 4
     ((void *)0) 
# 961 "src\\convolutional.c"
          != inPaths)
  {
    minDist = inPaths->dist[0];
    minStIdx = 0;
    for (j=1; j<(1<<(CC_KLEN_7-1)); j++)
    {
      if ((inPaths->iter[j]>0) && (inPaths->dist[j]<minDist))
      {
        minDist = inPaths->dist[j];
        minStIdx = j;
      }
    }
  }

  return minStIdx;
}
