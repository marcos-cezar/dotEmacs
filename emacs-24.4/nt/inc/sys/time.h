#ifndef SYS_TIME_H_INCLUDED
#define SYS_TIME_H_INCLUDED

/*
 * sys/time.h either doesn't exist on Windows, or doesn't necessarily
 * have the below stuff.
 */

/* The guards are for MinGW64, which defines these structs on its
   system headers which are included by ms-w32.h.  */
/* Allow inclusion of sys/time.h and winsock2.h in any order.  Needed
   for running the configure test, which is only relevant to MinGW.  */
#ifndef _TIMEVAL_DEFINED
#define _TIMEVAL_DEFINED
struct timeval
{
  long		tv_sec;		/* seconds */
  long		tv_usec;	/* microseconds */
};
#define timerisset(tvp)  ((tvp)->tv_sec || (tvp)->tv_usec)
#define timercmp(tvp, uvp, cmp) \
        (((tvp)->tv_sec != (uvp)->tv_sec) ? \
        ((tvp)->tv_sec cmp (uvp)->tv_sec) : \
        ((tvp)->tv_usec cmp (uvp)->tv_usec))
#define timerclear(tvp)  (tvp)->tv_sec = (tvp)->tv_usec = 0
#endif /* _TIMEVAL_DEFINED */

#ifndef _TIMEZONE_DEFINED
#define _TIMEZONE_DEFINED
struct timezone
{
  int		tz_minuteswest;	/* minutes west of Greenwich */
  int		tz_dsttime;	/* type of dst correction */
};
#endif


/* This needs to be compatible with Posix signature, in order to pass
   the configure test for the type of the second argument; see
   m4/gettimeofday.m4.  We use '__restrict' here, rather than
   'restrict', for the benefit of the old nt/configure.bat build,
   which does not force the use of -std= switch to GCC, and that
   causes compilation errors with 'restrict', which is a C99
   extension.  */
int gettimeofday (struct timeval *__restrict, struct timezone *__restrict);

#define ITIMER_REAL      0
#define ITIMER_PROF      1

struct itimerval
{
  struct  timeval it_interval;	/* timer interval */
  struct  timeval it_value;	/* current value */
};

int getitimer (int, struct itimerval *);
int setitimer (int, struct itimerval *, struct itimerval *);

#endif /* SYS_TIME_H_INCLUDED */

/* end of sys/time.h */

