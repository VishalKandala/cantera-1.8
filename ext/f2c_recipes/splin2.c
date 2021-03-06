/* splin2.f -- translated by f2c (version 20031025).
   You must link the resulting object file with libf2c:
	on Microsoft Windows system, link with libf2c.lib;
	on Linux or Unix systems, link with .../path/to/libf2c.a -lm
	or, if you install libf2c.a in a standard place, with -lf2c -lm
	-- in that order, at the end of the command line, as in
		cc *.o -lf2c -lm
	Source for libf2c is in /netlib/f2c/libf2c.zip, e.g.,

		http://www.netlib.org/f2c/libf2c.zip
*/

#ifdef __cplusplus
extern "C" {
#endif
#include "f2c.h"

/* Table of constant values */

static doublereal c_b4 = 1e30;

/* Subroutine */ int splin2_(doublereal *x1a, doublereal *x2a, doublereal *ya,
	 doublereal *y2a, integer *m, integer *n, doublereal *x1, doublereal *
	x2, doublereal *y)
{
    /* System generated locals */
    integer ya_dim1, ya_offset, y2a_dim1, y2a_offset, i__1, i__2;

    /* Local variables */
    static integer j, k;
    static doublereal ytmp[100], y2tmp[100], yytmp[100];
    extern /* Subroutine */ int spline_(doublereal *, doublereal *, integer *,
	     doublereal *, doublereal *, doublereal *), splint_(doublereal *, 
	    doublereal *, doublereal *, integer *, doublereal *, doublereal *)
	    ;

    /* Parameter adjustments */
    --x1a;
    y2a_dim1 = *m;
    y2a_offset = 1 + y2a_dim1;
    y2a -= y2a_offset;
    ya_dim1 = *m;
    ya_offset = 1 + ya_dim1;
    ya -= ya_offset;
    --x2a;

    /* Function Body */
    i__1 = *m;
    for (j = 1; j <= i__1; ++j) {
	i__2 = *n;
	for (k = 1; k <= i__2; ++k) {
	    ytmp[k - 1] = ya[j + k * ya_dim1];
	    y2tmp[k - 1] = y2a[j + k * y2a_dim1];
/* L11: */
	}
	splint_(&x2a[1], ytmp, y2tmp, n, x2, &yytmp[j - 1]);
/* L12: */
    }
    spline_(&x1a[1], yytmp, m, &c_b4, &c_b4, y2tmp);
    splint_(&x1a[1], yytmp, y2tmp, m, x1, y);
    return 0;
} /* splin2_ */

#ifdef __cplusplus
	}
#endif
