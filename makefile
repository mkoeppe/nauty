# makefile for nauty 2.2, including gtools 1.1
# Generated automatically from makefile.in by configure.

SHELL = /bin/sh
CC=gcc
CFLAGS= -O4 -march=i686 
SAFECFLAGS= -O4 -march=i686
LDFLAGS=
LOK=1         # 0 if no 64-bit integers
TESTPROGS=dreadtest dreadtestB dreadtestS dreadtestS1 dreadtest4K dreadtest1 dreadtestW1 dreadtestL1 dreadtestL
BIGTEST=1         # set to 0 if less than 512MB is available

SMALL=-DMAXN=WORDSIZE
BIG=-DBIGNAUTY
L1=-DMAXN=WORDSIZE -DWORDSIZE=64
W1=-DMAXN=WORDSIZE -DWORDSIZE=32
S1=-DMAXN=WORDSIZE -DWORDSIZE=16
S=-DWORDSIZE=16
L=-DWORDSIZE=64
FOURK=-DMAXN=4096

all : nauty gtools ;

nauty : dreadnaut dreadnautB ;

gtools : copyg listg labelg dretog amtog geng complg shortg showg NRswitchg \
  biplabg addedgeg deledgeg countg pickg genrang newedgeg catg genbg directg \
  multig ;

rng.o: rng.c
	${CC} -c ${CFLAGS} rng.c

dreadnaut: dreadnaut.c naututil.o nauty.o nautil.o nautinv.o naugraph.o rng.o
	${CC} -o dreadnaut ${SAFECFLAGS} dreadnaut.c \
	    naututil.o nauty.o nautil.o nautinv.o naugraph.o rng.o ${LDFLAGS}
naututil.o: nauty.h naututil.h naututil.c
	${CC} -c ${CFLAGS} naututil.c
nautil.o: nauty.h nautil.c
	${CC} -c ${CFLAGS} nautil.c
nauty.o: nauty.h nauty.c
	${CC} -c ${CFLAGS} nauty.c
nautinv.o: nauty.h naututil.h nautinv.c
	${CC} -c ${CFLAGS} nautinv.c
nautaux.o: nautaux.h nauty.h naututil.h nautaux.c
	${CC} -c ${CFLAGS} nautaux.c
naugraph.o: nauty.h naugraph.c
	${CC} -c ${CFLAGS} naugraph.c

dreadnaut1: dreadnaut.c naututil1.o nauty1.o nautil1.o \
            nautinv1.o naugraph1.o rng.o
	${CC} -o dreadnaut1 ${SAFECFLAGS} ${SMALL} dreadnaut.c naututil1.o \
	    nauty1.o nautil1.o nautinv1.o naugraph1.o rng.o ${LDFLAGS}
naututil1.o: nauty.h naututil.h naututil.c
	${CC} -c ${CFLAGS} ${SMALL} -o naututil1.o naututil.c
nautil1.o: nauty.h nautil.c
	${CC} -c ${CFLAGS} ${SMALL} -o nautil1.o nautil.c
nauty1.o: nauty.h nauty.c
	${CC} -c ${CFLAGS} ${SMALL} -o nauty1.o nauty.c
nautinv1.o: nauty.h naututil.h nautinv.c
	${CC} -c ${CFLAGS} ${SMALL} -o nautinv1.o nautinv.c
nautaux1.o: nautaux.h nauty.h naututil.h nautaux.c
	${CC} -c ${CFLAGS} ${SMALL} -o nautaux1.o nautaux.c
naugraph1.o: nauty.h naugraph.c
	${CC} -c ${CFLAGS} ${SMALL} -o naugraph1.o naugraph.c

dreadnautB: dreadnaut.c naututilB.o nautyB.o nautilB.o \
	    nautinvB.o naugraphB.o rng.o
	${CC} -o dreadnautB ${SAFECFLAGS} ${BIG} dreadnaut.c naututilB.o \
	    nautyB.o nautilB.o nautinvB.o naugraphB.o rng.o ${LDFLAGS}
naututilB.o: nauty.h naututil.h naututil.c
	${CC} -c ${CFLAGS} ${BIG} -o naututilB.o naututil.c
nautilB.o: nauty.h nautil.c
	${CC} -c ${CFLAGS} ${BIG} -o nautilB.o nautil.c
nautyB.o: nauty.h nauty.c
	${CC} -c ${CFLAGS} ${BIG} -o nautyB.o nauty.c
nautinvB.o: nauty.h naututil.h nautinv.c
	${CC} -c ${CFLAGS} ${BIG} -o nautinvB.o nautinv.c
nautauxB.o: nautaux.h nauty.h naututil.h nautaux.c
	${CC} -c ${CFLAGS} ${BIG} -o nautauxB.o nautaux.c
naugraphB.o: nauty.h naugraph.c
	${CC} -c ${CFLAGS} ${BIG} -o naugraphB.o naugraph.c

dreadnaut4K: dreadnaut.c naututil4K.o nauty4K.o nautil4K.o \
             nautinv4K.o naugraph4K.o rng.o
	${CC} -o dreadnaut4K ${SAFECFLAGS} ${FOURK} dreadnaut.c naututil4K.o \
	     nauty4K.o nautil4K.o nautinv4K.o naugraph4K.o rng.o ${LDFLAGS}
naututil4K.o: nauty.h naututil.h naututil.c
	${CC} -c ${CFLAGS} ${FOURK} -o naututil4K.o naututil.c
nautil4K.o: nauty.h nautil.c
	${CC} -c ${CFLAGS} ${FOURK} -o nautil4K.o nautil.c
nauty4K.o: nauty.h nauty.c
	${CC} -c ${CFLAGS} ${FOURK} -o nauty4K.o nauty.c
nautinv4K.o: nauty.h naututil.h nautinv.c
	${CC} -c ${CFLAGS} ${FOURK} -o nautinv4K.o nautinv.c
nautaux4K.o: nautaux.h nauty.h naututil.h nautaux.c
	${CC} -c ${CFLAGS} ${FOURK} -o nautaux4K.o nautaux.c
naugraph4K.o: nauty.h naugraph.c
	${CC} -c ${CFLAGS} ${FOURK} -o naugraph4K.o naugraph.c

dreadnautL1: dreadnaut.c naututilL1.o nautyL1.o nautilL1.o nautinvL1.o \
	     naugraphL1.o rng.o
	${CC} -o dreadnautL1 ${SAFECFLAGS} ${L1} dreadnaut.c naututilL1.o \
	     nautyL1.o nautilL1.o nautinvL1.o naugraphL1.o rng.o ${LDFLAGS}
naututilL1.o: nauty.h naututil.h naututil.c
	${CC} -c ${CFLAGS} ${L1} -o naututilL1.o naututil.c
nautilL1.o: nauty.h nautil.c
	${CC} -c ${CFLAGS} ${L1} -o nautilL1.o nautil.c
nautyL1.o: nauty.h nauty.c
	${CC} -c ${CFLAGS} ${L1} -o nautyL1.o nauty.c
nautinvL1.o: nauty.h naututil.h nautinv.c
	${CC} -c ${CFLAGS} ${L1} -o nautinvL1.o nautinv.c
nautauxL1.o: nautaux.h nauty.h naututil.h nautaux.c
	${CC} -c ${CFLAGS} ${L1} -o nautauxL1.o nautaux.c
naugraphL1.o: nauty.h naugraph.c
	${CC} -c ${CFLAGS} ${L1} -o naugraphL1.o naugraph.c

dreadnautW1: dreadnaut.c naututilW1.o nautyW1.o nautilW1.o nautinvW1.o \
	     naugraphW1.o rng.o
	${CC} -o dreadnautW1 ${SAFECFLAGS} ${W1} dreadnaut.c naututilW1.o \
	     nautyW1.o nautilW1.o nautinvW1.o naugraphW1.o rng.o ${LDFLAGS}
naututilW1.o: nauty.h naututil.h naututil.c
	${CC} -c ${CFLAGS} ${W1} -o naututilW1.o naututil.c
nautilW1.o: nauty.h nautil.c
	${CC} -c ${CFLAGS} ${W1} -o nautilW1.o nautil.c
nautyW1.o: nauty.h nauty.c
	${CC} -c ${CFLAGS} ${W1} -o nautyW1.o nauty.c
nautinvW1.o: nauty.h naututil.h nautinv.c
	${CC} -c ${CFLAGS} ${W1} -o nautinvW1.o nautinv.c
nautauxW1.o: nautaux.h nauty.h naututil.h nautaux.c
	${CC} -c ${CFLAGS} ${W1} -o nautauxW1.o nautaux.c
naugraphW1.o: nauty.h naugraph.c
	${CC} -c ${CFLAGS} ${W1} -o naugraphW1.o naugraph.c

dreadnautS1: dreadnaut.c naututilS1.o nautyS1.o nautilS1.o nautinvS1.o \
	     naugraphS1.o rng.o
	${CC} -o dreadnautS1 ${SAFECFLAGS} ${S1} dreadnaut.c naututilS1.o \
	     nautyS1.o nautilS1.o nautinvS1.o naugraphS1.o rng.o ${LDFLAGS}
naututilS1.o: nauty.h naututil.h naututil.c
	${CC} -c ${CFLAGS} ${S1} -o naututilS1.o naututil.c
nautilS1.o: nauty.h nautil.c
	${CC} -c ${CFLAGS} ${S1} -o nautilS1.o nautil.c
nautyS1.o: nauty.h nauty.c
	${CC} -c ${CFLAGS} ${S1} -o nautyS1.o nauty.c
nautinvS1.o: nauty.h naututil.h nautinv.c
	${CC} -c ${CFLAGS} ${S1} -o nautinvS1.o nautinv.c
nautauxS1.o: nautaux.h nauty.h naututil.h nautaux.c
	${CC} -c ${CFLAGS} ${S1} -o nautauxS1.o nautaux.c
naugraphS1.o: nauty.h naugraph.c
	${CC} -c ${CFLAGS} ${S1} -o naugraphS1.o naugraph.c

dreadnautL: dreadnaut.c naututilL.o nautyL.o nautilL.o nautinvL.o \
	     naugraphL.o rng.o
	${CC} -o dreadnautL ${SAFECFLAGS} ${L} dreadnaut.c naututilL.o \
	     nautyL.o nautilL.o nautinvL.o naugraphL.o rng.o ${LDFLAGS}
naututilL.o: nauty.h naututil.h naututil.c
	${CC} -c ${CFLAGS} ${L} -o naututilL.o naututil.c
nautilL.o: nauty.h nautil.c
	${CC} -c ${CFLAGS} ${L} -o nautilL.o nautil.c
nautyL.o: nauty.h nauty.c
	${CC} -c ${CFLAGS} ${L} -o nautyL.o nauty.c
nautinvL.o: nauty.h naututil.h nautinv.c
	${CC} -c ${CFLAGS} ${L} -o nautinvL.o nautinv.c
nautauxL.o: nautaux.h nauty.h naututil.h nautaux.c
	${CC} -c ${CFLAGS} ${L} -o nautauxL.o nautaux.c
naugraphL.o: nauty.h naugraph.c
	${CC} -c ${CFLAGS} ${L} -o naugraphL.o naugraph.c

dreadnautS: dreadnaut.c naututilS.o nautyS.o nautilS.o nautinvS.o \
	     naugraphS.o rng.o
	${CC} -o dreadnautS ${SAFECFLAGS} ${S} dreadnaut.c naututilS.o \
	     nautyS.o nautilS.o nautinvS.o naugraphS.o rng.o ${LDFLAGS}
naututilS.o: nauty.h naututil.h naututil.c
	${CC} -c ${CFLAGS} ${S} -o naututilS.o naututil.c
nautilS.o: nauty.h nautil.c
	${CC} -c ${CFLAGS} ${S} -o nautilS.o nautil.c
nautyS.o: nauty.h nauty.c
	${CC} -c ${CFLAGS} ${S} -o nautyS.o nauty.c
nautinvS.o: nauty.h naututil.h nautinv.c
	${CC} -c ${CFLAGS} ${S} -o nautinvS.o nautinv.c
nautauxS.o: nautaux.h nauty.h naututil.h nautaux.c
	${CC} -c ${CFLAGS} ${S} -o nautauxS.o nautaux.c
naugraphS.o: nauty.h naugraph.c
	${CC} -c ${CFLAGS} ${S} -o naugraphS.o naugraph.c

clean:
	rm -f *.o config.log config.cache config.status
	rm -f dreadtest dreadtestB dreadtestL dreadtestS dreadtestS1 \
	        dreadtest4K dreadtest1 dreadtestL1 dreadtestW1

gtools.h : nauty.h naututil.h
	touch gtools.h

gtools.o : gtools.h gtools.c
	${CC} -c ${CFLAGS} gtools.c

gtnauty.o : gtools.h gtnauty.c
	${CC} -c ${CFLAGS} gtnauty.c

gutil1.o : gtools.h gutils.h gutil1.c
	${CC} -c ${CFLAGS} gutil1.c

gutil2.o : gtools.h gutils.h gutil2.c
	${CC} -c ${CFLAGS} gutil2.c

catg : gtools.h catg.c gtools.o
	${CC} -o catg ${CFLAGS} catg.c gtools.o ${LDFLAGS}

copyg : gtools.h copyg.c gtools.o
	${CC} -o copyg ${CFLAGS} copyg.c gtools.o ${LDFLAGS}

listg : gtools.h listg.c gtools.o nautil.o
	${CC} -o listg ${CFLAGS} listg.c gtools.o nautil.o ${LDFLAGS}

labelg : gtools.h naututil.h \
         labelg.c gtools.o gtnauty.o nauty.o nautil.o naugraph.o nautinv.o
	${CC} -o labelg ${SAFECFLAGS} labelg.c gtools.o gtnauty.o \
		nauty.o nautil.o naugraph.o nautinv.o ${LDFLAGS}

shortg : gtools.h shortg.c gtools.o gtnauty.o nauty.o nautil.o naugraph.o
	${CC} -o shortg ${CFLAGS} shortg.c \
		gtools.o gtnauty.o nauty.o nautil.o naugraph.o ${LDFLAGS}

dretog : gtools.h dretog.c gtools.o naututil.o nautil.o naugraph.o rng.o
	${CC} -o dretog ${CFLAGS} dretog.c \
		gtools.o naututil.o nautil.o rng.o naugraph.o ${LDFLAGS}

amtog : gtools.h amtog.c gtools.o
	${CC} -o amtog ${CFLAGS} amtog.c gtools.o ${LDFLAGS}

genbg : gtools.h genbg.c gtools.o nauty1.o nautil1.o naugraph1.o
	${CC} -o genbg ${CFLAGS} ${W1} genbg.c gtools.o nauty1.o \
		nautil1.o naugraph1.o ${LDFLAGS}

genbgL : gtools.h genbg.c gtoolsL1.o nautyL1.o nautilL1.o naugraphL1.o
	${CC} -o genbgL ${CFLAGS} ${L1} -DMAXN1=30 genbg.c gtoolsL1.o \
	    nautyL1.o nautilL1.o naugraphL1.o ${LDFLAGS}

geng : gtools.h geng.c gtools.o nauty1.o nautil1.o naugraph1.o
	${CC} -o geng ${CFLAGS} -DMAXN=32 geng.c gtools.o nauty1.o \
		nautil1.o naugraph1.o ${LDFLAGS}

geng16 : gtools.h geng.c gtools.o nauty1.o nautil1.o naugraph1.o
	${CC} -o geng16 ${CFLAGS} -DMAXN=16 geng.c gtools.o nauty1.o \
		nautil1.o naugraph1.o ${LDFLAGS}

geng24 : gtools.h geng.c gtools.o nauty1.o nautil1.o naugraph1.o
	${CC} -o geng24 ${CFLAGS} -DMAXN=24 geng.c gtools.o nauty1.o \
		nautil1.o naugraph1.o ${LDFLAGS}

genrang : gtools.h genrang.c gtools.o naututil.o nautil.o naugraph.o rng.o
	${CC} -o genrang ${CFLAGS} genrang.c \
		gtools.o nautil.o naututil.o naugraph.o rng.o ${LDFLAGS}

complg : gtools.h complg.c gtools.o gtnauty.o nauty.o nautil.o naugraph.o
	${CC} -o complg ${CFLAGS} complg.c \
		gtools.o gtnauty.o nauty.o nautil.o naugraph.o ${LDFLAGS}

biplabg : gtools.h biplabg.c gtools.o nautil.o naugraph.o gutil1.o
	${CC} -o biplabg ${CFLAGS} biplabg.c \
		gtools.o nautil.o naugraph.o gutil1.o ${LDFLAGS}

NRswitchg : gtools.h NRswitchg.c gtools.o gtnauty.o nauty.o nautil.o naugraph.o
	${CC} -o NRswitchg ${CFLAGS} NRswitchg.c gtools.o gtnauty.o \
		 nauty.o nautil.o naugraph.o ${LDFLAGS}

deledgeg : gtools.h deledgeg.c gtools.o gtnauty.o nauty.o nautil.o naugraph.o
	${CC} -o deledgeg ${CFLAGS} deledgeg.c gtools.o gtnauty.o \
		 nauty.o nautil.o naugraph.o ${LDFLAGS}

addedgeg : gtools.h addedgeg.c \
             gtools.o gtnauty.o nauty.o nautil.o naugraph.o gutil1.o
	${CC} -o addedgeg ${CFLAGS} addedgeg.c gtools.o gtnauty.o \
		 nauty.o nautil.o naugraph.o gutil1.o ${LDFLAGS}

newedgeg : gtools.h newedgeg.c \
             gtools.o gtnauty.o nauty.o nautil.o naugraph.o
	${CC} -o newedgeg ${CFLAGS} newedgeg.c gtools.o gtnauty.o \
		 nauty.o nautil.o naugraph.o ${LDFLAGS}

pickg : gtools.h testg.c splay.c \
	     gtools.o gtnauty.o nauty.o nautil.o naugraph.o gutil1.o gutil2.o
	${CC} -o pickg ${SAFECFLAGS} testg.c gtools.o gtnauty.o gutil1.o \
	        gutil2.o nauty.o nautil.o naugraph.o ${LDFLAGS}

countg : gtools.h testg.c splay.c \
	     gtools.o gtnauty.o nauty.o nautil.o naugraph.o gutil1.o gutil2.o
	${CC} -o countg ${SAFECFLAGS} testg.c gtools.o gtnauty.o gutil1.o \
	         gutil2.o nauty.o nautil.o naugraph.o ${LDFLAGS}

directg : gtools.h naugroup.h directg.c \
             gtools.o nauty.o nautil.o naugraph.o naugroup.o
	${CC} -o directg ${CFLAGS} directg.c gtools.o \
                nauty.o nautil.o naugraph.o naugroup.o ${LDFLAGS}

multig : gtools.h naugroup.h multig.c \
             gtools.o nauty.o nautil.o naugraph.o naugroup.o
	${CC} -o multig ${CFLAGS} multig.c gtools.o \
                nauty.o nautil.o naugraph.o naugroup.o ${LDFLAGS}

showg : showg.c
	${CC} -o showg ${CFLAGS} showg.c ${LDFLAGS}

readg :
	echo "*** readg is now called showg ***"
	make showg

gtoolsL1.o : gtools.h gtools.c
	${CC} -c ${CFLAGS} ${L1} -o gtoolsL1.o gtools.c

gtnautyL1.o : gtools.h gtnauty.c
	${CC} -c ${CFLAGS} ${L1} -o gtnautyL1.o gtnauty.c

sumlines : sumlines.c
	${CC} -o sumlines ${CFLAGS} sumlines.c ${LDFLAGS} -lgmp

nautyex : nauty.h nauty.o nautil.o naugraph.o nautyex.c
	${CC} -o nautyex ${CFLAGS} nautyex.c nauty.o nautil.o naugraph.o ${LDFLAGS}

nautyex2 : nauty.h nauty.o nautil.o naugraph.o nautyex2.c
	${CC} -o nautyex2 ${CFLAGS} \
		nautyex2.c nauty.o nautil.o naugraph.o ${LDFLAGS}

naugroup.o : nauty.h naugroup.h naugroup.c
	${CC} -c ${CFLAGS} naugroup.c

nautyex3 : nauty.h nauty.o nautil.o naugraph.o naugroup.o nautyex3.c
	${CC} -o nautyex3 ${CFLAGS} \
		nautyex3.c nauty.o nautil.o naugraph.o naugroup.o ${LDFLAGS}

dreadtest: dreadtest.c naututil.o nauty.o nautil.o nautinv.o naugraph.o rng.o
	${CC} -o dreadtest ${SAFECFLAGS} dreadtest.c \
	    naututil.o nauty.o nautil.o nautinv.o naugraph.o rng.o ${LDFLAGS}
	./dreadtest <testS.dre
	./dreadtest <testW.dre
	./dreadtest <testL.dre
	./dreadtest <testM.dre
	./dreadtest <testa.dre
	rm dreadtest

dreadtestB: dreadtest.c \
		naututilB.o nautyB.o nautilB.o nautinvB.o naugraphB.o rng.o
	${CC} -o dreadtestB ${SAFECFLAGS} ${BIG} dreadtest.c naututilB.o \
	    nautyB.o nautilB.o nautinvB.o naugraphB.o rng.o ${LDFLAGS}
	./dreadtestB < testS.dre
	./dreadtestB < testW.dre
	./dreadtestB < testL.dre
	./dreadtestB < testM.dre
	./dreadtestB < testa.dre
	test ${BIGTEST} -eq 0 || ./dreadtestB < testB.dre
	rm dreadtestB

dreadtestL: dreadtest.c \
		naututilL.o nautyL.o nautilL.o nautinvL.o naugraphL.o rng.o
	${CC} -o dreadtestL ${SAFECFLAGS} ${L} dreadtest.c naututilL.o \
	    nautyL.o nautilL.o nautinvL.o naugraphL.o rng.o ${LDFLAGS}
	./dreadtestL < testS.dre
	./dreadtestL < testW.dre
	./dreadtestL < testL.dre
	./dreadtestL < testM.dre
	./dreadtestL < testa.dre
	rm dreadtestL

dreadtestS: dreadtest.c \
		naututilS.o nautyS.o nautilS.o nautinvS.o naugraphS.o rng.o
	${CC} -o dreadtestS ${SAFECFLAGS} ${S} dreadtest.c naututilS.o \
	    nautyS.o nautilS.o nautinvS.o naugraphS.o rng.o ${LDFLAGS}
	./dreadtestS < testS.dre
	./dreadtestS < testW.dre
	./dreadtestS < testL.dre
	./dreadtestS < testM.dre
	./dreadtestS < testa.dre
	rm dreadtestS

dreadtest4K: dreadtest.c \
		naututil4K.o nauty4K.o nautil4K.o nautinv4K.o naugraph4K.o rng.o
	${CC} -o dreadtest4K ${SAFECFLAGS} ${FOURK} dreadtest.c naututil4K.o \
	    nauty4K.o nautil4K.o nautinv4K.o naugraph4K.o rng.o ${LDFLAGS}
	./dreadtest4K <testS.dre
	./dreadtest4K <testW.dre
	./dreadtest4K < testM.dre
	rm dreadtest4K

dreadtest1: dreadtest.c \
		naututil1.o nauty1.o nautil1.o nautinv1.o naugraph1.o rng.o
	${CC} -o dreadtest1 ${SAFECFLAGS} ${SMALL} dreadtest.c naututil1.o \
	    nauty1.o nautil1.o nautinv1.o naugraph1.o rng.o ${LDFLAGS}
	./dreadtest1 < testS.dre
	./dreadtest1 < testW.dre
	rm dreadtest1

dreadtestL1: dreadtest.c \
		naututilL1.o nautyL1.o nautilL1.o nautinvL1.o naugraphL1.o rng.o
	${CC} -o dreadtestL1 ${SAFECFLAGS} ${L1} dreadtest.c naututilL1.o \
	    nautyL1.o nautilL1.o nautinvL1.o naugraphL1.o rng.o ${LDFLAGS}
	./dreadtestL1 <testS.dre
	./dreadtestL1 <testW.dre
	./dreadtestL1 <testL.dre
	rm dreadtestL1

dreadtestW1: dreadtest.c \
		naututilW1.o nautyW1.o nautilW1.o nautinvW1.o naugraphW1.o rng.o
	${CC} -o dreadtestW1 ${SAFECFLAGS} ${W1} dreadtest.c naututilW1.o \
	    nautyW1.o nautilW1.o nautinvW1.o naugraphW1.o rng.o ${LDFLAGS}
	./dreadtestW1 <testS.dre
	./dreadtestW1 <testW.dre
	rm dreadtestW1

dreadtestS1: dreadtest.c \
		naututilS1.o nautyS1.o nautilS1.o nautinvS1.o naugraphS1.o rng.o
	${CC} -o dreadtestS1 ${SAFECFLAGS} ${S1} dreadtest.c naututilS1.o \
	    nautyS1.o nautilS1.o nautinvS1.o naugraphS1.o rng.o ${LDFLAGS}
	./dreadtestS1 <testS.dre

checks: ${TESTPROGS}

checks6: checks6.c gtools.h gtools.o
	${CC} -o checks6 ${CFLAGS} checks6.c gtools.o
