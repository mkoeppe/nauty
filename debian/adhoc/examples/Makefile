# /usr/share/doc/nauty-doc/examples/Makefile
#
# Ad hoc Makefile for building and playing with the sample sources
# distributed within the debian package nauty-doc.
#
# Recommended usage:
#  create a dedicated folder somewhere in your HOME directory;
#  link all the files in /usr/share/doc/nauty-doc/examples in the dedicated folder;
#  launch this Makefile in the dedicated folder:
#  $ make ;
#  for a basic cleanup, consider the clean target:
#  $ make clean ;
#  for an entire cleanup, the maintainer-clean target:
#  $ make maintainer-clean ;
#  for other targets, just read the Makefile.
#
# written for Debian by Jerome Benoit <calculus@rezozer.net>
# on behalf of the Debian Science Team
# copyright: 2016 Jerome Benoit <calculus@rezozer.net>
# distributed under the terms and conditions of Apache 2.0
#

PROGRAMS = $(patsubst %.c,%,$(wildcard *.c))

default: all

CFLAGS = $(shell pkg-config nauty --cflags)
LDLIBS = $(shell pkg-config nauty --libs)

all: build

callgeng: callgeng.c /usr/share/nauty/geng.c
	$(CC) $(CFLAGS) -DOUTPROC=myoutproc -DGENG_MAIN=geng_main \
		-Wno-implicit-function-declaration $^ $(LDLIBS) -o $@

build: $(PROGRAMS)

check: build
	@true

clean:
	$(RM) $(PROGRAMS)

maintainer-clean: clean
