# 1 "src\\reed_solomon.c"
# 1 "H:\\SCIENCE\\2-TLC\\CHAINS\\C//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src\\reed_solomon.c"
# 15 "src\\reed_solomon.c"
# 1 "src\\reed_solomon.h" 1
# 18 "src\\reed_solomon.h"
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
# 58 "src\\system.h"

# 58 "src\\system.h"
typedef struct _complex_t
{
  float re;
  float im;
} complex_t;
# 19 "src\\error.h" 2







typedef enum
{
  ERR_NONE = 0,
  ERR_INV_NULL_POINTER = 1,
  ERR_INV_ORIG_LEN = 2,
  ERR_INV_PRINTID = 3,
  ERR_INV_CNVCOD_RATE = 4,
  ERR_INV_CNVCOD_KLEN = 5,
  ERR_INV_CNVCOD_DECMET = 6,
  ERR_INV_BUFFER_SIZE = 7,
  ERR_INV_DYNAMIC_ALLOC = 8,
  ERR_INV_STREAM_TYPE = 9,
  ERR_INV_MODULATION_TYPE = 10,
  ERR_INV_MODULATION_BPS = 11,
  ERR_INV_CHANNEL_TYPE = 12,
  ERR_INV_SCRAMBLING_TYPE = 13,
  ERR_INV_CRC_DEGREE = 14,
  ERR_INV_RS_GF_DEGREE = 15,
  ERR_INV_RS_MSG_CW_LEN = 16,
  ERR_INV_WATERMARK_LEV = 17,
  ERR_INV_INTERLEAVING_TYPE = 18,
  ERR_INV_STREAM = 19,

  ERR_NUM
} error_t;


typedef enum
{
  ALARM_NONE = 0,
  ALARM_PRINT,
  ALARM_STOP,

  ALARM_NUM
} alarm_t;
# 76 "src\\error.h"
error_t Error_HandleErr( error_t inErr );
# 19 "src\\reed_solomon.h" 2
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

# 67 "src\\memory.h" 3 4
_Bool 
# 67 "src\\memory.h"
    Memory_IsStreamValid( const void * inStream, memory_type_t type );
# 20 "src\\reed_solomon.h" 2
# 28 "src\\reed_solomon.h"
typedef enum
{
  RS_GF_DEGREE_4 = 4,
  RS_GF_DEGREE_8 = 8
} rs_gf_degree_t;
# 50 "src\\reed_solomon.h"
typedef struct _rs_par_t
{
  rs_gf_degree_t m;
  uint8_t kSh;
  uint8_t nSh;
  uint8_t t;
  uint16_t kUn;
  uint16_t nUn;
  uint16_t dimGF;
} rs_par_t;







error_t RsCod_ListParameters( rs_par_t * ioParams );
error_t RcCod_Encoder( const byte_stream_t * inStream, byte_stream_t * outStream, const rs_par_t * pParams );
error_t RcCod_Decoder( const byte_stream_t * inStream, byte_stream_t * outStream, const rs_par_t * pParams );
# 16 "src\\reed_solomon.c" 2







static const uint8_t PrimPolyGF4[] = {0,1};
static const uint8_t PrimPolyGF8[] = {0,2,3,4};







typedef enum
{
  RS_TABLE_IDX_BIT = 0,
  RS_TABLE_IDX_SYM,
  RS_TABLE_IDX_NUM
} rs_table_idx_t;

typedef struct _rs_encoder_info_t
{
  const uint8_t * pPrimPoly;
  uint8_t lenPrimPoly;
} rs_encoder_info_t;







static error_t RetrievePrimitivePolynomial( rs_encoder_info_t * ioInfo, const rs_par_t * pParams );
static error_t RetrieveGeneratorPolynomial( uint8_t * ioBuf, uint8_t len, const uint8_t mapTable[][RS_TABLE_IDX_NUM], const rs_par_t * pParams );
static error_t RetrieveMappingTableGF( uint8_t ioTable[][RS_TABLE_IDX_NUM], const rs_par_t * pParams );
static uint16_t FindMaxDeg( const uint8_t * poly, uint16_t len );
static uint8_t GetBasis( const uint8_t * poly, const rs_par_t * pParams );
static uint8_t ConvertBi2Sy( uint8_t inBasis, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static uint8_t ConvertSy2Bi( uint8_t inSymb, const uint8_t [][RS_TABLE_IDX_NUM] );
static uint8_t AddGF( uint8_t symbA, uint8_t symbB, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static uint8_t MultiplyGF( uint8_t symbA, uint8_t symbB, const rs_par_t * pParams );
static uint8_t PowerGF( uint8_t symbBase, int16_t exp, const rs_par_t * pParams );
static 
# 61 "src\\reed_solomon.c" 3 4
      _Bool 
# 61 "src\\reed_solomon.c"
           GetSyndrome( const uint8_t * cwSymbs, uint8_t * syndrome, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static error_t BerlekampMasseyAlgorithm( uint8_t * curSigma, const uint8_t * syndrome, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static int16_t GetDiscrepancy( const uint8_t * syndrome, const uint8_t * sigma, int16_t errNum, uint8_t iter, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static error_t ChienAlgorithm( uint8_t * errLoc, const uint8_t * sigma, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static error_t KeyAlgorithm( uint8_t * omega, const uint8_t * syndrome, const uint8_t * sigma, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static error_t ForneyAlgorithm( uint8_t * errMag, const uint8_t * omega, const uint8_t * errLoc, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] );
static error_t ErrorCorrector( uint8_t * ioSymbs, const uint8_t * errLoc, const uint8_t * errMag, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM]);
# 81 "src\\reed_solomon.c"
error_t RsCod_ListParameters( rs_par_t * ioParams )
{
  error_t retErr = ERR_NONE;

  if (
# 85 "src\\reed_solomon.c" 3 4
     ((void *)0) 
# 85 "src\\reed_solomon.c"
          != ioParams)
  {
    ioParams->m = RS_GF_DEGREE_8;
    ioParams->kSh = 188u;
    ioParams->nSh = 204u;
    ioParams->t = (ioParams->nSh-ioParams->kSh)/2;
    ioParams->dimGF = 1<<ioParams->m;
    ioParams->nUn = ioParams->dimGF-1;
    ioParams->kUn = ioParams->nUn-2*ioParams->t;

    if ((ioParams->kSh <= 0) || (ioParams->nSh <= 0) ||
      ((ioParams->nSh-ioParams->kSh)%2 != 0) ||
      (ioParams->nSh > (ioParams->dimGF-1)) ||
      ((RS_GF_DEGREE_4 == ioParams->m) && ((ioParams->nSh%2) != 0)))
    {
      retErr = ERR_INV_RS_MSG_CW_LEN;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 124 "src\\reed_solomon.c"
error_t RcCod_Encoder( const byte_stream_t * inStream, byte_stream_t * outStream, const rs_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const uint8_t numMsg = ((inStream->len)<<3u)/(pParams->m*pParams->kSh);
  const uint8_t lenGenPoly = 2*pParams->t+1;
  uint8_t genPoly[lenGenPoly];
  uint8_t mapTable[pParams->dimGF][RS_TABLE_IDX_NUM];
  int16_t quotDeg;
  uint16_t quotCoef;
  uint16_t maxDeg;
  uint16_t j;
  uint8_t inSymbs[pParams->kUn];
  uint8_t tmpPoly[pParams->nUn];
  uint8_t divQuotCoef[pParams->nUn];
  uint8_t curSymb;
  uint8_t i;

  if ((
# 141 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 141 "src\\reed_solomon.c"
           != inStream) && (
# 141 "src\\reed_solomon.c" 3 4
                            ((void *)0) 
# 141 "src\\reed_solomon.c"
                                 != outStream) && (
# 141 "src\\reed_solomon.c" 3 4
                                                   ((void *)0) 
# 141 "src\\reed_solomon.c"
                                                        != pParams) &&
      (
# 142 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 142 "src\\reed_solomon.c"
           != inStream->pBuf) && (
# 142 "src\\reed_solomon.c" 3 4
                                  ((void *)0) 
# 142 "src\\reed_solomon.c"
                                       != outStream->pBuf))
  {
    RetrieveMappingTableGF(mapTable,pParams);
    RetrieveGeneratorPolynomial(genPoly,lenGenPoly,mapTable,pParams);

    for (i=0; i<numMsg; i++)
    {
      memset(inSymbs,0,pParams->kUn);

      for (j=0; j<pParams->kSh; j++)
      {
        if (RS_GF_DEGREE_4 == pParams->m)
        {
          if ((0 == ((j)%2)))
          {
            curSymb = (inStream->pBuf[(j+i*pParams->kSh)/2]>>4);
          }
          else
          {
            curSymb = (inStream->pBuf[(j-1+i*pParams->kSh)/2]&0x0F);
          }
        }
        else
        {
          curSymb = inStream->pBuf[j+i*pParams->kSh];
        }
        inSymbs[j] = ConvertBi2Sy(curSymb,mapTable);
      }

      memset(tmpPoly,0,pParams->nUn);
      memcpy(&tmpPoly[2*pParams->t],inSymbs,pParams->kUn);
      maxDeg = pParams->nUn-1;
      quotDeg = maxDeg-2*pParams->t;

      while (quotDeg >= 0)
      {
        quotCoef = tmpPoly[maxDeg];
        memset(divQuotCoef,0,pParams->nUn);

        for (j=0; j<lenGenPoly; j++)
        {
          divQuotCoef[j+quotDeg] = MultiplyGF(quotCoef,genPoly[j],pParams);
        }

        for (j=0; j<pParams->nUn; j++)
        {
          tmpPoly[j] = AddGF(tmpPoly[j],divQuotCoef[j],mapTable);
        }

        maxDeg = FindMaxDeg(tmpPoly,pParams->nUn);
        quotDeg = maxDeg-2*pParams->t;
      }

      if (RS_GF_DEGREE_4 == pParams->m)
      {
        for (j=0; j<2*pParams->t; j++)
        {
          if ((0 == ((j)%2)))
          {
            outStream->pBuf[(j+i*pParams->nSh)/2] =
              (ConvertSy2Bi(tmpPoly[j],mapTable)<<4);
          }
          else
          {
            outStream->pBuf[(j-1+i*pParams->nSh)/2] |=
              ConvertSy2Bi(tmpPoly[j],mapTable);
          }
        }

        memcpy(&outStream->pBuf[pParams->t+i*pParams->nSh/2],
               &inStream->pBuf[i*pParams->kSh/2],pParams->kSh/2);
      }
      else
      {
        for (j=0; j<2*pParams->t; j++)
        {
          outStream->pBuf[j+i*pParams->nSh] =
            ConvertSy2Bi(tmpPoly[j],mapTable);
        }

        memcpy(&outStream->pBuf[2*pParams->t+i*pParams->nSh],
               &inStream->pBuf[i*pParams->kSh],pParams->kSh);
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 248 "src\\reed_solomon.c"
error_t RcCod_Decoder( const byte_stream_t * inStream, byte_stream_t * outStream, const rs_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  const uint8_t numMsg = ((inStream->len)<<3u)/(pParams->m*pParams->nSh);
  uint8_t mapTable[pParams->dimGF][RS_TABLE_IDX_NUM];
  uint8_t tmpSymbs[pParams->nUn];
  uint8_t syndrome[2*pParams->t];
  uint8_t sigma[pParams->t+1];
  uint8_t omega[2*pParams->t+1];
  uint8_t errLocation[pParams->t];
  uint8_t errMagnitude[pParams->t];
  uint8_t curSymb;
  uint8_t i, j;
  
# 261 "src\\reed_solomon.c" 3 4
 _Bool 
# 261 "src\\reed_solomon.c"
      errFlag;

  if ((
# 263 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 263 "src\\reed_solomon.c"
           != inStream) && (
# 263 "src\\reed_solomon.c" 3 4
                            ((void *)0) 
# 263 "src\\reed_solomon.c"
                                 != outStream) && (
# 263 "src\\reed_solomon.c" 3 4
                                                   ((void *)0) 
# 263 "src\\reed_solomon.c"
                                                        != pParams) &&
      (
# 264 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 264 "src\\reed_solomon.c"
           != inStream->pBuf) && (
# 264 "src\\reed_solomon.c" 3 4
                                  ((void *)0) 
# 264 "src\\reed_solomon.c"
                                       != outStream->pBuf))
  {
    RetrieveMappingTableGF(mapTable,pParams);
    memset(tmpSymbs,0,pParams->nUn);

    for (i=0; i<numMsg; i++)
    {
      for (j=0; j<pParams->nSh; j++)
      {
        if (RS_GF_DEGREE_4 == pParams->m)
        {
          if ((0 == ((j)%2)))
          {
            curSymb = (inStream->pBuf[(j+i*pParams->nSh)/2]>>4);
          }
          else
          {
            curSymb = (inStream->pBuf[(j-1+i*pParams->nSh)/2]&0x0F);
          }
        }
        else
        {
          curSymb = inStream->pBuf[j+i*pParams->nSh];
        }
        tmpSymbs[j] = ConvertBi2Sy(curSymb,mapTable);
      }

      errFlag = GetSyndrome(tmpSymbs,syndrome,pParams,mapTable);

      if (errFlag)
      {
        BerlekampMasseyAlgorithm(sigma,syndrome,pParams,mapTable);
        ChienAlgorithm(errLocation,sigma,pParams,mapTable);
        KeyAlgorithm(omega,syndrome,sigma,pParams,mapTable);
        ForneyAlgorithm(errMagnitude,omega,errLocation,pParams,mapTable);
        ErrorCorrector(tmpSymbs,errLocation,errMagnitude,pParams,mapTable);
      }

      if (RS_GF_DEGREE_4 == pParams->m)
      {
        for (j=0; j<pParams->kSh; j++)
        {
          if ((0 == ((j)%2)))
          {
            outStream->pBuf[(j+i*pParams->kSh)/2] =
              (ConvertSy2Bi(tmpSymbs[j+2*pParams->t],mapTable)<<4);
          }
          else
          {
            outStream->pBuf[(j-1+i*pParams->kSh)/2] |=
              ConvertSy2Bi(tmpSymbs[j+2*pParams->t],mapTable);
          }
        }
      }
      else
      {
        for (j=0; j<pParams->kSh; j++)
        {
          outStream->pBuf[j+i*pParams->kSh] =
            ConvertSy2Bi(tmpSymbs[j+2*pParams->t],mapTable);
        }
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 350 "src\\reed_solomon.c"
static error_t RetrievePrimitivePolynomial( rs_encoder_info_t * ioInfo, const rs_par_t * pParams )
{
  error_t retErr = ERR_NONE;

  if ((
# 354 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 354 "src\\reed_solomon.c"
           != ioInfo) && (
# 354 "src\\reed_solomon.c" 3 4
                          ((void *)0) 
# 354 "src\\reed_solomon.c"
                               != pParams))
  {
    switch (pParams->m)
    {
      case RS_GF_DEGREE_4:
        ioInfo->pPrimPoly = PrimPolyGF4;
        ioInfo->lenPrimPoly = sizeof(PrimPolyGF4);
        break;

      case RS_GF_DEGREE_8:
        ioInfo->pPrimPoly = PrimPolyGF8;
        ioInfo->lenPrimPoly = sizeof(PrimPolyGF8);
        break;

      default:
        retErr = ERR_INV_RS_GF_DEGREE;
        break;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 391 "src\\reed_solomon.c"
static error_t RetrieveGeneratorPolynomial( uint8_t * ioBuf, uint8_t len, const uint8_t mapTable[][RS_TABLE_IDX_NUM], const rs_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  uint8_t tmpVal;
  int16_t i, j;

  if (
# 397 "src\\reed_solomon.c" 3 4
     ((void *)0) 
# 397 "src\\reed_solomon.c"
          != ioBuf)
  {
    memset(ioBuf,0,len);

    ioBuf[0] = 2;
    ioBuf[1] = 1;

    for (i=2; i<len; i++)
    {
      for (j=len-1; j>=0; j--)
      {
        tmpVal = MultiplyGF(ioBuf[j],PowerGF(2,i,pParams),pParams);
        if (j > 0)
        {
          ioBuf[j] = AddGF(tmpVal,ioBuf[j-1],mapTable);
        }
        else
        {
          ioBuf[j] = tmpVal;
        }
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 438 "src\\reed_solomon.c"
static error_t RetrieveMappingTableGF( uint8_t ioTable[][RS_TABLE_IDX_NUM], const rs_par_t * pParams )
{
  error_t retErr = ERR_NONE;
  rs_encoder_info_t encInfo;
  int16_t quotDeg;
  uint16_t maxDeg;
  uint16_t j;
  uint8_t tmpPoly[pParams->dimGF];
  uint8_t i;

  if ((
# 448 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 448 "src\\reed_solomon.c"
           != ioTable) && (
# 448 "src\\reed_solomon.c" 3 4
                           ((void *)0)
# 448 "src\\reed_solomon.c"
                               != pParams))
  {
    for (j=0;j<pParams->dimGF;j++)
    {
      memset(ioTable[j],0,RS_TABLE_IDX_NUM);
    }

    RetrievePrimitivePolynomial(&encInfo,pParams);

    for (j=1; j<pParams->dimGF; j++)
    {
      memset(tmpPoly,0,pParams->dimGF);
      maxDeg = j-1;
      tmpPoly[maxDeg] = 1;
      quotDeg = maxDeg-pParams->m;

      while (quotDeg >= 0)
      {
        tmpPoly[maxDeg] = 0;

        for (i=0; i<encInfo.lenPrimPoly; i++)
        {
          tmpPoly[quotDeg+encInfo.pPrimPoly[i]] =
            ((tmpPoly[quotDeg+encInfo.pPrimPoly[i]]+1)%2);
        }
        maxDeg = FindMaxDeg(tmpPoly,pParams->dimGF);
        quotDeg = maxDeg-pParams->m;
      }

      ioTable[j][RS_TABLE_IDX_BIT] = GetBasis(tmpPoly,pParams);
      ioTable[ioTable[j][RS_TABLE_IDX_BIT]][RS_TABLE_IDX_SYM] = j;
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 498 "src\\reed_solomon.c"
static uint16_t FindMaxDeg( const uint8_t * poly, uint16_t len )
{
  uint16_t maxDeg;
  uint16_t j;

  if (
# 503 "src\\reed_solomon.c" 3 4
     ((void *)0) 
# 503 "src\\reed_solomon.c"
          != poly)
  {
    for (j=len-1; j>=0; j--)
    {
      if (poly[j] > 0)
      {
        maxDeg = j;
        break;
      }
    }
  }

  return maxDeg;
}
# 527 "src\\reed_solomon.c"
static uint8_t GetBasis( const uint8_t * poly, const rs_par_t * pParams )
{
  uint8_t basis = 0;
  uint8_t j;

  if (
# 532 "src\\reed_solomon.c" 3 4
     ((void *)0) 
# 532 "src\\reed_solomon.c"
          != poly)
  {
    for (j=0; j<pParams->m; j++)
    {
      basis |= (poly[j]<<(pParams->m-j-1));
    }
  }

  return basis;
}
# 552 "src\\reed_solomon.c"
static uint8_t ConvertBi2Sy( uint8_t inBasis, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  return mapTable[inBasis][RS_TABLE_IDX_SYM];
}
# 566 "src\\reed_solomon.c"
static uint8_t ConvertSy2Bi( uint8_t inSymb, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  return mapTable[inSymb][RS_TABLE_IDX_BIT];
}
# 581 "src\\reed_solomon.c"
static uint8_t AddGF( uint8_t symbA, uint8_t symbB, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  uint8_t basisRes;

  basisRes = mapTable[symbA][RS_TABLE_IDX_BIT]^mapTable[symbB][RS_TABLE_IDX_BIT];

  return mapTable[basisRes][RS_TABLE_IDX_SYM];
}
# 600 "src\\reed_solomon.c"
static uint8_t MultiplyGF( uint8_t symbA, uint8_t symbB, const rs_par_t * pParams )
{
  uint8_t symbRes = 0;

  if ((symbA != 0) && (symbB != 0))
  {
    symbRes = ((symbA+symbB-2)%(pParams->dimGF-1))+1;
  }

  return symbRes;
}
# 626 "src\\reed_solomon.c"
static uint8_t PowerGF( uint8_t symbBase, int16_t exp, const rs_par_t * pParams )
{
  uint8_t symbRes;
  int16_t tmpVal;

  if ((0 == symbBase) || (1 == symbBase))
  {
    symbRes = symbBase;
  }
  else
  {
    tmpVal = ((int16_t) (((symbBase-1)*exp)%(pParams->dimGF-1)));
    if (exp < 0)
    {
      symbRes = ((uint8_t) (tmpVal+pParams->dimGF));
    }
    else
    {
      symbRes = ((uint8_t) (tmpVal+1));
    }
  }

  return symbRes;
}
# 663 "src\\reed_solomon.c"
static 
# 663 "src\\reed_solomon.c" 3 4
      _Bool 
# 663 "src\\reed_solomon.c"
           GetSyndrome( const uint8_t * cwSymbs, uint8_t * syndrome, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  uint16_t i;
  int16_t j;
  uint8_t sum;
  
# 668 "src\\reed_solomon.c" 3 4
 _Bool 
# 668 "src\\reed_solomon.c"
      errFlag = 
# 668 "src\\reed_solomon.c" 3 4
                0
# 668 "src\\reed_solomon.c"
                     ;

  if ((
# 670 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 670 "src\\reed_solomon.c"
           != cwSymbs) && (
# 670 "src\\reed_solomon.c" 3 4
                           ((void *)0) 
# 670 "src\\reed_solomon.c"
                                != syndrome) && (
# 670 "src\\reed_solomon.c" 3 4
                                                 ((void *)0) 
# 670 "src\\reed_solomon.c"
                                                      != pParams))
  {
    for (i=0; i<2*pParams->t; i++)
    {
      sum = cwSymbs[0];

      for (j=1; j<pParams->nUn; j++)
      {
        sum = AddGF(sum,MultiplyGF(cwSymbs[j],PowerGF(i+2,j,pParams),pParams),mapTable);
      }

      syndrome[i] = sum;

      if (sum != 0)
      {
        errFlag = 
# 685 "src\\reed_solomon.c" 3 4
                 1
# 685 "src\\reed_solomon.c"
                     ;
      }
    }
  }

  return errFlag;
}
# 705 "src\\reed_solomon.c"
static error_t BerlekampMasseyAlgorithm( uint8_t * sigma, const uint8_t * syndrome, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  error_t retErr = ERR_NONE;
  int16_t curErr = 0;
  int16_t nextErr;
  int16_t delta;
  int16_t h = -1;
  uint8_t tmpSigma[pParams->t+1];
  uint8_t tau[pParams->t+1];
  uint8_t i, j;

  if ((
# 716 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 716 "src\\reed_solomon.c"
           != sigma) && (
# 716 "src\\reed_solomon.c" 3 4
                         ((void *)0) 
# 716 "src\\reed_solomon.c"
                              != syndrome) && (
# 716 "src\\reed_solomon.c" 3 4
                                               ((void *)0) 
# 716 "src\\reed_solomon.c"
                                                    != pParams) && (
# 716 "src\\reed_solomon.c" 3 4
                                                                    ((void *)0) 
# 716 "src\\reed_solomon.c"
                                                                         != mapTable))
  {
    memset(tau,0,pParams->t+1);
    memset(sigma,0,pParams->t+1);
    tau[1] = 1;
    sigma[0] = 1;

    for (i=0; i<2*pParams->t; i++)
    {
      if (curErr <= pParams->t)
      {
        delta = GetDiscrepancy(syndrome,sigma,curErr,i,pParams,mapTable);

        if (delta != 0)
        {
          for (j=0; j<pParams->t+1; j++)
          {
            tmpSigma[j] = AddGF(sigma[j],MultiplyGF(delta,tau[j],pParams),mapTable);
          }

          if (curErr < (i-h))
          {
            nextErr = i-h;
            h = i-curErr;

            for (j=0; j<pParams->t+1; j++)
            {
              tau[j] = MultiplyGF(PowerGF(2,-delta+1,pParams),sigma[j],pParams);
            }

            curErr = nextErr;
          }

          memcpy(sigma,tmpSigma,pParams->t+1);
        }

        memcpy(&tau[1],tau,pParams->t);
        tau[0] = 0;
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 778 "src\\reed_solomon.c"
static int16_t GetDiscrepancy( const uint8_t * syndrome, const uint8_t * sigma, int16_t errNum, uint8_t iter, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{

  int16_t delta = 0;
  uint8_t j;

  if ((
# 784 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 784 "src\\reed_solomon.c"
           != syndrome) && (
# 784 "src\\reed_solomon.c" 3 4
                            ((void *)0) 
# 784 "src\\reed_solomon.c"
                                 != sigma) && (
# 784 "src\\reed_solomon.c" 3 4
                                               ((void *)0) 
# 784 "src\\reed_solomon.c"
                                                    != pParams) && (
# 784 "src\\reed_solomon.c" 3 4
                                                                    ((void *)0) 
# 784 "src\\reed_solomon.c"
                                                                         != mapTable))
  {
    for (j=0; j<errNum+1; j++)
    {
      delta = AddGF(delta,MultiplyGF(sigma[j],syndrome[iter-j],pParams),mapTable);
    }
  }

  return delta;
}
# 807 "src\\reed_solomon.c"
static error_t ChienAlgorithm( uint8_t * errLoc, const uint8_t * sigma, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  error_t retErr = ERR_NONE;
  uint8_t idx = 0;
  uint8_t root;
  uint8_t i, j;

  if ((
# 814 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 814 "src\\reed_solomon.c"
           != errLoc) && (
# 814 "src\\reed_solomon.c" 3 4
                          ((void *)0) 
# 814 "src\\reed_solomon.c"
                               != sigma) && (
# 814 "src\\reed_solomon.c" 3 4
                                             ((void *)0) 
# 814 "src\\reed_solomon.c"
                                                  != pParams) && (
# 814 "src\\reed_solomon.c" 3 4
                                                                  ((void *)0) 
# 814 "src\\reed_solomon.c"
                                                                       != mapTable))
  {
    memset(errLoc,0,pParams->t);

    for (i=0; i<pParams->nUn; i++)
    {
      root = sigma[0];

      for (j=1; j<pParams->t+1; j++)
      {
        root = AddGF(root,MultiplyGF(sigma[j],PowerGF(i+1,j,pParams),pParams),mapTable);
      }
      if ((0 == root) && (idx < pParams->t))
      {
        errLoc[idx] = PowerGF(i+1,-1,pParams);
        idx++;
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 854 "src\\reed_solomon.c"
static error_t KeyAlgorithm( uint8_t * omega, const uint8_t * syndrome, const uint8_t * sigma, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  error_t retErr = ERR_NONE;
  uint8_t tmpOmega[3*pParams->t+1];
  uint8_t tmpSyndr[2*pParams->t+1];
  uint8_t i, j;

  if ((
# 861 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 861 "src\\reed_solomon.c"
           != omega) && (
# 861 "src\\reed_solomon.c" 3 4
                         ((void *)0) 
# 861 "src\\reed_solomon.c"
                              != syndrome) && (
# 861 "src\\reed_solomon.c" 3 4
                                               ((void *)0) 
# 861 "src\\reed_solomon.c"
                                                    != sigma) && (
# 861 "src\\reed_solomon.c" 3 4
                                                                  ((void *)0) 
# 861 "src\\reed_solomon.c"
                                                                       != pParams) && (
# 861 "src\\reed_solomon.c" 3 4
                                                                                       ((void *)0) 
# 861 "src\\reed_solomon.c"
                                                                                            != mapTable))
  {
    memset(tmpOmega,0,sizeof(tmpOmega));
    tmpSyndr[0] = 1;
    memcpy(&tmpSyndr[1],syndrome,2*pParams->t);

    for (i=0; i<pParams->t+1; i++)
    {
      for (j=0; j<2*pParams->t+1; j++)
      {
        tmpOmega[i+j] = AddGF(tmpOmega[i+j],MultiplyGF(sigma[i],tmpSyndr[j],pParams),mapTable);
      }
    }

    memcpy(omega,tmpOmega,2*pParams->t+1);
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 898 "src\\reed_solomon.c"
static error_t ForneyAlgorithm( uint8_t * errMag, const uint8_t * omega, const uint8_t * errLoc, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM] )
{
  error_t retErr = ERR_NONE;
  uint8_t root;
  uint8_t numer, denom;
  uint8_t i, j;

  if ((
# 905 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 905 "src\\reed_solomon.c"
           != errMag) && (
# 905 "src\\reed_solomon.c" 3 4
                          ((void *)0) 
# 905 "src\\reed_solomon.c"
                               != omega) && (
# 905 "src\\reed_solomon.c" 3 4
                                             ((void *)0) 
# 905 "src\\reed_solomon.c"
                                                  != errLoc) && (
# 905 "src\\reed_solomon.c" 3 4
                                                                 ((void *)0) 
# 905 "src\\reed_solomon.c"
                                                                      != pParams) && (
# 905 "src\\reed_solomon.c" 3 4
                                                                                      ((void *)0) 
# 905 "src\\reed_solomon.c"
                                                                                           != mapTable))
  {
    memset(errMag,0,pParams->t);

    for (i=0; i<pParams->t; i++)
    {
      if (errLoc[i] != 0)
      {
        root = PowerGF(errLoc[i],-1,pParams);
        numer = omega[0];

        for (j=1; j<2*pParams->t+1; j++)
        {
          numer = AddGF(numer,MultiplyGF(omega[j],PowerGF(root,j,pParams),pParams),mapTable);
        }

        denom = 1;

        for (j=0; j<pParams->t; j++)
        {
          if (i != j)
          {
            denom = MultiplyGF(denom,AddGF(1,MultiplyGF(root,errLoc[j],pParams),mapTable),pParams);
          }
        }

        errMag[i] = MultiplyGF(numer,PowerGF(2,-denom+1,pParams),pParams);
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
# 956 "src\\reed_solomon.c"
static error_t ErrorCorrector( uint8_t * ioSymbs, const uint8_t * errLoc, const uint8_t * errMag, const rs_par_t * pParams, const uint8_t mapTable[][RS_TABLE_IDX_NUM])
{
  error_t retErr = ERR_NONE;
  uint8_t j;

  if ((
# 961 "src\\reed_solomon.c" 3 4
      ((void *)0) 
# 961 "src\\reed_solomon.c"
           != ioSymbs) && (
# 961 "src\\reed_solomon.c" 3 4
                           ((void *)0) 
# 961 "src\\reed_solomon.c"
                                != errLoc) && (
# 961 "src\\reed_solomon.c" 3 4
                                               ((void *)0) 
# 961 "src\\reed_solomon.c"
                                                    != errMag) && (
# 961 "src\\reed_solomon.c" 3 4
                                                                   ((void *)0) 
# 961 "src\\reed_solomon.c"
                                                                        != pParams) && (
# 961 "src\\reed_solomon.c" 3 4
                                                                                        ((void *)0) 
# 961 "src\\reed_solomon.c"
                                                                                             != mapTable))
  {
    for (j=0; j<pParams->t; j++)
    {
      if (errLoc[j] != 0)
      {
        ioSymbs[errLoc[j]-1] = AddGF(ioSymbs[errLoc[j]-1],errMag[j],mapTable);
      }
    }
  }
  else
  {
    retErr = ERR_INV_NULL_POINTER;
  }

  return Error_HandleErr(retErr);
}
