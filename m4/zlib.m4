dnl Configure paths for zlib
dnl Jerome Benoit <calculus@rezozer.net> 2013/11/26

AC_DEFUN([AM_PATH_ZLIB],
[dnl
	AC_REQUIRE([PKG_PROG_PKG_CONFIG])dnl
dnl	AC_REQUIRE([PKG_CHECK_MODULES])dnl

	AC_ARG_WITH([zlib],
		[AS_HELP_STRING([--without-zlib],[disable support for ZLIB])],
		[],[with_zlib=yes])

	AC_MSG_CHECKING([whether ZLIB is disabled])
	AS_IF([test x"$with_zlib" != "xno"],[dnl then
		AC_MSG_RESULT(no)
		PKG_CHECK_MODULES(ZLIB,zlib >= $1,[$2],[$3])
		],[dnl else
		AC_MSG_RESULT(yes)
		AC_DEFINE([WITHOUT_ZLIB],[1],[ZLIB is disabled])
		ZLIB_CFLAGS=""
		ZLIB_LIBS=""
		AC_SUBST(ZLIB_CFLAGS)
		AC_SUBST(ZLIB_LIBS)
		])

	AM_CONDITIONAL([WITH_ZLIB_IS_YES],[test x"$with_zlib" != xno])

])
