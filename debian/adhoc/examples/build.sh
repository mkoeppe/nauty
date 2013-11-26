#! /bin/sh
# /usr/share/doc/nauty-doc/examples/build.sh
#
# ad hoc script for building the example sources distributed
# within the debian package nauty-doc.
#
# Recommended usage:
#  create a dedicated folder somewhere in your HOME directory;
#  link all the files in /usr/share/doc/nauty-doc/examples in the dedicated folder;
#  launch this script in the dedicated folder;
#  to cleanup, if not yet done, create a link clean.sh to this script, and run this link.
#
# written for Debian by Jerome Benoit <calculus@rezozer.net>
# copyright: 2013 Jerome Benoit <calculus@rezozer.net>
# distributed under the terms and conditions of GPL version 3 or later
#

CC="gcc $(pkg-config nauty --cflags --libs)"

listof_zsource=$(find . -maxdepth 1 -regextype posix-egrep -regex '.*\.c(\.gz|\.bz2|\.xz)?' -printf '%f\n')

for zsource in $listof_zsource ; do
	executable=${zsource%%.*}
	for extension in gz bz2 xz ; do
		if [ -f ${zsource}.${extension} ]; then
			rm -rf ${zsource}
		fi
	done
	if [ -f ${executable}.o ]; then
		rm -f ${executable}.o
	fi
	if [ -x ${executable} ]; then
		rm -f ${executable}
	fi
done

if [ "${0##*/}" = "clean.sh" ]; then exit 0 ; fi

listof_zsource=$(find . -maxdepth 1 -regextype posix-egrep -regex '.*\.c(\.gz|\.bz2|\.xz)?' -printf '%f\n' | sort)

for zsource in $listof_zsource ; do
	zextension=${zsource##*.}
	executable=${zsource%%.*}
	printf "%-35s -> %-25s\n" ${zsource} ${executable}
	case ${zextension} in
		gz)
			source=${zsource%.*}
			zcat ${zsource} > ${source}
			;;
		bz2)
			source=${zsource%.*}
			bzcat ${zsource} > ${source}
			;;
		xz)
			source=${zsource%.*}
			xzcat ${zsource} > ${source}
			;;
		*)
			source=${zsource}
			;;
	esac
	extension=${source#*.}
	case ${extension} in
		c)
			$CC -o ${executable} ${source}
			;;
		*)
			;;
	esac
	if [ "${source}" != "${zsource}" ]; then
		rm -f ${source}
	fi
	rm -f ${executable}.o
done

exit 0
##
## eos
