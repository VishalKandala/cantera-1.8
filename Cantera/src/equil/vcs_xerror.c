/* xerror.f -- translated by f2c (version 20031025).
   You must link the resulting object file with libf2c:
	on Microsoft Windows system, link with libf2c.lib;
	on Linux or Unix systems, link with .../path/to/libf2c.a -lm
	or, if you install libf2c.a in a standard place, with -lf2c -lm
	-- in that order, at the end of the command line, as in
		cc *.o -lf2c -lm
	Source for libf2c is in /netlib/f2c/libf2c.zip, e.g.,

		http://www.netlib.org/f2c/libf2c.zip
*/

#include "f2c.h"

/* Table of constant values */

static integer c__2 = 2;
static integer c__1 = 1;

/* ======================================================================= */
/* -------------------------------------------------- */
/* | CVS Head Information                           | */
/* -------------------------------------------------- */
/* $Author: hkmoffa $ */
/* $Date: 2008/01/03 21:38:25 $ */
/* $Revision: 1.1 $ */
/* ======================================================================= */

/* Subroutine */ int s88fmt_(integer *n, integer *ivalue, integer *ifmt)
{
    /* Initialized data */

    static struct {
	char e_1[40];
	integer e_2;
	} equiv_5 = { "0   1   2   3   4   5   6   7   8   9   ", 0 };

#define idigit ((integer *)&equiv_5)


    static integer it, nt, index;

/* ----------------------------------------------------------------------- */
/*     S88FMT replaces ifmt(1), ... ,ifmt(n) with the */
/*     characters corresponding to the n least significant */
/*     digits of ivalue. */
/*     Taken from the Bell laboratories port library error handler */
/*     latest revision ---  7 June 1978. */

/*     Jones R.E., *SLATEC common mathematical library error handling */
/*     package*, SAND78-1189, Sandia Laboratories, 1978. */
/* ----------------------------------------------------------------------- */
    /* Parameter adjustments */
    --ifmt;

    /* Function Body */
    nt = *n;
    it = *ivalue;
L10:
    if (nt == 0) {
	return 0;
    }
    index = it % 10;
    ifmt[nt] = idigit[index];
    it /= 10;
    --nt;
    goto L10;
} /* s88fmt_ */

#undef idigit



/* ----------------------------------------------------------------------- */

/* Subroutine */ int xerrwv_(char *msg, integer *nmes, integer *nerr, integer 
	*iert, integer *ni, integer *i1, integer *i2, integer *nr, real *r1, 
	real *r2, ftnlen msg_len)
{
    /* Initialized data */

    static struct {
	char e_1[16];
	integer fill_2[2];
	char e_3[4];
	integer fill_4[2];
	char e_5[8];
	integer fill_6[1];
	char e_7[4];
	} equiv_20 = { "(   1   X   ,   ", {0}, "A   ", {0}, ",   A   ", {0}, 
		")   " };

#define nform ((integer *)&equiv_20)

    static integer ncpw = 4;
    static integer mesflg = 1;
    static integer lunit = 6;

    /* Format strings */
    static char fmt_20[] = "(6x,\002IN ABOVE MESSAGE,  I1 =\002,i10)";
    static char fmt_30[] = "(6x,\002IN ABOVE MESSAGE,  I1 =\002,i10,3x,\002I"
	    "2 =\002,i10)";
    static char fmt_40[] = "(6x,\002IN ABOVE MESSAGE,  R1 =\002,d21.13)";
    static char fmt_50[] = "(6x,\002IN ABOVE,  R1 =\002,d21.13,3x,\002R2 "
	    "=\002,d21.13)";

    /* System generated locals */
    integer i__1;

    /* Builtin functions */
    integer s_wsfe(cilist *), do_fio(integer *, char *, ftnlen), e_wsfe(void);
    /* Subroutine */ int s_stop(char *, ftnlen);

    /* Local variables */
    static integer i__, nch, lun, nrem, nwds;
    extern /* Subroutine */ int s88fmt_(integer *, integer *, integer *);

    /* Fortran I/O blocks */
    static cilist io___14 = { 0, 0, 0, (char *)nform, 0 };
    static cilist io___16 = { 0, 0, 0, fmt_20, 0 };
    static cilist io___17 = { 0, 0, 0, fmt_30, 0 };
    static cilist io___18 = { 0, 0, 0, fmt_40, 0 };
    static cilist io___19 = { 0, 0, 0, fmt_50, 0 };


/* ----------------------------------------------------------------------- */
/* Subroutine xerrwv, as given here, constitutes */
/* a simplified version of the slatec error handling package */
/* written by A. C. Hindmarsh at LLL.  version of January 23, 1980, */
/* modified by L. R. Petzold, April 1982. */

/* All arguments are input arguments. */

/* msg    = the message (Hollerith literal or integer array). */
/* nmes   = the length of msg (number of characters). */
/* nerr   = the error number (not used). */
/* iert   = the error type.. */
/*          1 means recoverable (control returns to caller). */
/*          2 means fatal (run is aborted--see note below). */
/* ni     = number of integers (0, 1, or 2) to be printed with message. */
/* i1,i2  = integers to be printed, depending on ni. */
/* nr     = number of reals (0, 1, or 2) to be printed with message. */
/* r1,r2  = reals to be printed, depending on ni. */

/* note..  this routine is machine-dependent and specialized for use */
/* in limited context, in the following ways.. */
/* 1. the number of hollerith characters stored per word, denoted */
/*    by ncpw below, is set in a data statement below. */
/* 2. the value of nmes is assumed to be at most 60. */
/*    (multi-line messages are generated by repeated calls.) */
/* 3. if iert = 2, control passes to the statement   stop */
/*    to abort the run.  this statement may be machine-dependent. */
/* 4. r1 and r2 are assumed to be in real and are printed */
/*    in d21.13 format. */
/* 5. the data statement below contains default values of */
/*       mesflg = print control flag.. */
/*                1 means print all messages (the default). */
/*                0 means no printing. */
/*       lunit  = logical unit number for messages. */
/*                the default is 6 (machine-dependent). */
/*                to change lunit, change the data statement */
/*                below. */
/* ----------------------------------------------------------------------- */
/* The following are instructions for installing this routine */
/* in different machine environments. */

/* To change the default output unit, change the data statement */
/* below. */

/* For a different number of characters per word, change the */
/* data statement setting ncpw below. */
/* Alternatives for various computers are shown in comment */
/* cards. */

/* For a different run-abort command, change the statement following */
/* statement 100 at the end. */
/* ----------------------------------------------------------------------- */
/* The following value of ncpw is valid for the cdc-6600 and */
/* cdc-7600 computers. */
/*     data ncpw/10/ */
/* The following is valid for the cray-1 computer. */
/*     data ncpw/8/ */
/* The following is valid for the burroughs 6700 and 7800 computers. */
/*     data ncpw/6/ */
/* The following is valid for the pdp-10 computer. */
/*     data ncpw/5/ */
/* The following is valid for the vax computer with 4 bytes per integer, */
/* and for the ibm-360, ibm-303x, and ibm-43xx computers. */
/*      data ncpw/4/ */
/* The following is valid for the pdp-11, or vax with 2-byte integers. */
/*     data ncpw/2/ */
/* ---------------------------------------------------------------------- */
    /* Parameter adjustments */
    msg -= msg_len;

    /* Function Body */

/*        This may have to be modified according to the information */
/*        provided above */


    if (mesflg == 0) {
	goto L100;
    }
    lun = lunit;
    nch = min(*nmes,60);
    nwds = nch / ncpw;
    s88fmt_(&c__2, &nwds, &nform[4]);
    s88fmt_(&c__2, &ncpw, &nform[7]);
    nrem = nch - nwds * ncpw;
    if (nrem > 0) {
	++nwds;
    }
    if (nrem < 1) {
	nrem = 1;
    }
    s88fmt_(&c__1, &nrem, &nform[11]);
    io___14.ciunit = lun;
    s_wsfe(&io___14);
    i__1 = nwds;
    for (i__ = 1; i__ <= i__1; ++i__) {
	do_fio(&c__1, msg + i__ * msg_len, msg_len);
    }
    e_wsfe();
    if (*ni == 1) {
	io___16.ciunit = lun;
	s_wsfe(&io___16);
	do_fio(&c__1, (char *)&(*i1), (ftnlen)sizeof(integer));
	e_wsfe();
    }
    if (*ni == 2) {
	io___17.ciunit = lun;
	s_wsfe(&io___17);
	do_fio(&c__1, (char *)&(*i1), (ftnlen)sizeof(integer));
	do_fio(&c__1, (char *)&(*i2), (ftnlen)sizeof(integer));
	e_wsfe();
    }
    if (*nr == 1) {
	io___18.ciunit = lun;
	s_wsfe(&io___18);
	do_fio(&c__1, (char *)&(*r1), (ftnlen)sizeof(real));
	e_wsfe();
    }
    if (*nr == 2) {
	io___19.ciunit = lun;
	s_wsfe(&io___19);
	do_fio(&c__1, (char *)&(*r1), (ftnlen)sizeof(real));
	do_fio(&c__1, (char *)&(*r2), (ftnlen)sizeof(real));
	e_wsfe();
    }
L100:
    if (*iert != 2) {
	return 0;
    }
    s_stop("", (ftnlen)0);
    return 0;
} /* xerrwv_ */

#undef nform


