AUTOMAKE_OPTIONS = foreign
ACLOCAL_AMFLAGS = -I m4

SUBDIRS = nauty

pkginclude_HEADERS = \
	nauty.h \
	nautinv.h \
	naurng.h \
	nausparse.h \
	naututil.h \
	naugroup.h \
	naugstrings.h \
	nautaux.h \
	nautycliquer.h \
	planarity.h \
	schreier.h \
	traces.h \
	gtools.h \
	gutils.h

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA= nauty.pc

bin_PROGRAMS = \
	dreadnaut \
	\
	addedgeg \
	amtog \
	assembleg \
	biplabg \
	catg \
	complg \
	converseg \
	copyg \
	countg \
	cubhamg \
	deledgeg \
	delptg \
	directg \
	dretodot \
	dretog \
	edgetransg \
	genbg \
	genbgL \
	geng \
	genquarticg \
	genrang \
	genspecialg \
	gentourng \
	gentreeg \
	hamheuristic \
	labelg \
	linegraphg \
	listg \
	multig \
	newedgeg \
	NRswitchg \
	pickg \
	planarg \
	ranlabg \
	shortg \
	showg \
	subdivideg \
	twohamg \
	underlyingg \
	vcolg \
	watercluster2 \
	\
	blisstog \
	checks6 \
	sumlines

man_MANS =

if HAVE_HELP2MAN
man_MANS += \
	dreadnaut.1 \
	\
	addedgeg.1 \
	amtog.1 \
	assembleg.1 \
	biplabg.1 \
	catg.1 \
	complg.1 \
	converseg.1 \
	copyg.1 \
	countg.1 \
	cubhamg.1 \
	deledgeg.1 \
	delptg.1 \
	directg.1 \
	dretodot.1 \
	dretog.1 \
	edgetransg.1 \
	genbg.1 \
	genbgL.1 \
	geng.1 \
	genquarticg.1 \
	genrang.1 \
	genspecialg.1 \
	gentourng.1 \
	gentreeg.1 \
	hamheuristic.1 \
	labelg.1 \
	linegraphg.1 \
	listg.1 \
	multig.1 \
	newedgeg.1 \
	NRswitchg.1 \
	pickg.1 \
	planarg.1 \
	ranlabg.1 \
	shortg.1 \
	showg.1 \
	subdivideg.1 \
	twohamg.1 \
	underlyingg.1 \
	vcolg.1 \
	watercluster2.1 \
	\
	blisstog.1 \
	checks6.1 \
	sumlines.1
endif

lib_LTLIBRARIES = \
	libnauty.la \
	libnautyA1.la \
	libnautyS0.la \
	libnautyW0.la \
	libnautyL0.la \
	libnautyS1.la \
	libnautyW1.la \
	libnautyL1.la

check_PROGRAMS = \
	dreadtest \
	dreadtest1 \
	dreadtestS \
	dreadtestW \
	dreadtestL \
	dreadtestS1 \
	dreadtestW1 \
	dreadtestL1 \
	dreadtest4K \
	nautestS \
	nautestW \
	nautestL \
	naucompare

TESTS = runalltests

AM_CPPFLAGS =
AM_CFLAGS =
AM_LDFLAGS =
LDADD =

NAUTY_LDADD =   $(top_builddir)/libnauty.la $(threadlib)
NAUTYW1_LDADD = $(top_builddir)/libnautyW1.la $(threadlib)
NAUTYL1_LDADD = $(top_builddir)/libnautyL1.la $(threadlib)

AM_H2MFLAGS = \
	--manual="Nauty Manual" \
	--version-string="$(PACKAGE_VERSION)" \
	--source="nauty $(PACKAGE_VERSION)" \
	--no-info

%.1: %
	LD_LIBRARY_PATH=$(top_builddir)/.libs $(HELP2MAN) \
			-s 1 \
			$(AM_H2MFLAGS) \
			-I $(top_srcdir)/man/$*.h2m \
			-n $(if $($*_DESCRIPTION), $($*_DESCRIPTION), "manual page for $*") \
			-o $@ \
		$(top_builddir)/$<

%.map: $(top_srcdir)/nauty.map
	$(SED) -e 's#LIBNAUTY_#LIBNAUTY'$(subst nauty,,$*)'_#' $< > $@

##
#nauty_flavour_CPPFLAGS =
nautyA1_flavour_CPPFLAGS = -DMAXN=WORDSIZE
nautyS0_flavour_CPPFLAGS = -DWORDSIZE=16
nautyS1_flavour_CPPFLAGS = $(nautyA1_flavour_CPPFLAGS) $(nautyS0_flavour_CPPFLAGS)
nautyW0_flavour_CPPFLAGS = -DWORDSIZE=32
nautyW1_flavour_CPPFLAGS = $(nautyA1_flavour_CPPFLAGS) $(nautyW0_flavour_CPPFLAGS)
nautyL0_flavour_CPPFLAGS = -DWORDSIZE=64
nautyL1_flavour_CPPFLAGS = $(nautyA1_flavour_CPPFLAGS) $(nautyL0_flavour_CPPFLAGS)


## short descriptions inspired from the basic functions of the programs as described
## in section `Utilities' (15) of the `Nauty and Traces User's Guide' (version 2.6)
dreadnaut_DESCRIPTION =     "command line interface to nauty graph isomorphism library"
addedgeg_DESCRIPTION =      "add an edge in each possible way"
amtog_DESCRIPTION =         "read graphs in matrix format"
assembleg_DESCRIPTION =     "assemble input graphs as components of output graphs"
biplabg_DESCRIPTION =       "label bipartite graphs so the colour classes are contiguous"
catg_DESCRIPTION =          "concatenate files of graphs"
complg_DESCRIPTION =        "complement graphs"
converseg_DESCRIPTION =     "converse digraphs"
copyg_DESCRIPTION =         "convert format and select subset"
countg_DESCRIPTION =        "count graphs according to a variety of properties"
cubhamg_DESCRIPTION =       "find hamiltonian cycles in subcubic graphs"
deledgeg_DESCRIPTION =      "delete an edge in each possible way"
delptg_DESCRIPTION =        "delete vertices"
directg_DESCRIPTION =       "generate small digraphs with given underlying graph"
dretodot_DESCRIPTION =      "read graphs and initial coloring in dreadnaut format and write in dot format"
dretog_DESCRIPTION =        "read graphs in dreadnaut format"
edgetransg_DESCRIPTION =    "select undirected graphs according to group action on vertices, edges and arcs"
genbg_DESCRIPTION =         "generate small bicoloured graphs"
genbgL_DESCRIPTION =        "$(shell printf "%s %s" $(genbg_DESCRIPTION) "(L1 flavour)")"
geng_DESCRIPTION =          "generate small graphs"
genquarticg_DESCRIPTION =   "generate quartic graphs"
genrang_DESCRIPTION =       "generate random graphs"
genspecialg_DESCRIPTION =   "generate special graphs"
gentourng_DESCRIPTION =     "generate small tournaments"
gentreeg_DESCRIPTION =      "generate trees"
hamheuristic_DESCRIPTION =  "try to find hamiltonian cycles in any graphs"
labelg_DESCRIPTION =        "canonically label graphs"
linegraphg_DESCRIPTION =    "compute the linegraphs of a file of graphs"
listg_DESCRIPTION =         "display graphs in a variety of forms"
multig_DESCRIPTION =        "generate small multigraphs with given underlying graph"
newedgeg_DESCRIPTION =      "create new edges from pairs of non-adjacent edges in each possible way"
NRswitchg_DESCRIPTION =     "complement vertex edges"
pickg_DESCRIPTION =         "select graphs according to a variety of properties"
planarg_DESCRIPTION =       "test graphs for planarity and find embeddings or obstructions"
ranlabg_DESCRIPTION =       "randomly relabel graphs"
shortg_DESCRIPTION =        "remove isomorphs from a file of graphs"
showg_DESCRIPTION =         "$(shell printf "%s %s" $(listg_DESCRIPTION) "(stand-alone subset of listg)")"
subdivideg_DESCRIPTION =    "compute the subdivision graphs of a file of graphs"
twohamg_DESCRIPTION =       "split quartic graphs into two hamiltonian cycles"
underlyingg_DESCRIPTION =   "take the underlying undirected graphs of a file of graphs"
vcolg_DESCRIPTION =         "colour the vertices of graphs in all distinct ways"
watercluster2_DESCRIPTION = "$(shell printf "%s %s" $(directg_DESCRIPTION) "(faster alternative to directg)")"
blisstog_DESCRIPTION =      "convert files of graphs in bliss format to stdout in sparse6 format"
checks6_DESCRIPTION =       "check a file of graphs and optionally perform corrections"
sumlines_DESCRIPTION =      "sum lines matching specified graph formats"

dreadnaut_CPPFLAGS =
addedgeg_CPPFLAGS =
amtog_CPPFLAGS =
assembleg_CPPFLAGS =
biplabg_CPPFLAGS =
catg_CPPFLAGS =
complg_CPPFLAGS =
converseg_CPPFLAGS =
copyg_CPPFLAGS =
countg_CPPFLAGS =
cubhamg_CPPFLAGS =
deledgeg_CPPFLAGS =
delptg_CPPFLAGS =
directg_CPPFLAGS =
dretodot_CPPFLAGS =
dretog_CPPFLAGS =
edgetransg_CPPFLAGS =
genbg_CPPFLAGS =         $(nautyW1_flavour_CPPFLAGS)
genbgL_CPPFLAGS =        $(nautyL1_flavour_CPPFLAGS) -DMAXN1=30
geng_CPPFLAGS =          $(nautyW1_flavour_CPPFLAGS)
genquarticg_CPPFLAGS =   $(nautyL1_flavour_CPPFLAGS)
genrang_CPPFLAGS =
genspecialg_CPPFLAGS =
gentourng_CPPFLAGS =     -DMAXN=24
gentreeg_CPPFLAGS =
hamheuristic_CPPFLAGS =
labelg_CPPFLAGS =
linegraphg_CPPFLAGS =
listg_CPPFLAGS =
multig_CPPFLAGS =
newedgeg_CPPFLAGS =
NRswitchg_CPPFLAGS =
pickg_CPPFLAGS =
planarg_CPPFLAGS =
ranlabg_CPPFLAGS =
shortg_CPPFLAGS =
showg_CPPFLAGS =
subdivideg_CPPFLAGS =
twohamg_CPPFLAGS =
underlyingg_CPPFLAGS =
vcolg_CPPFLAGS =
watercluster2_CPPFLAGS = -DMAXN=32
blisstog_CPPFLAGS =      $(ZLIB_CFLAGS)
checks6_CPPFLAGS =
sumlines_CPPFLAGS =      $(GMP_CFLAGS)

dreadnaut_SOURCES = dreadnaut.c
addedgeg_SOURCES = addedgeg.c
amtog_SOURCES = amtog.c
assembleg_SOURCES = assembleg.c
biplabg_SOURCES = biplabg.c
catg_SOURCES = catg.c
complg_SOURCES = complg.c
converseg_SOURCES = converseg.c
copyg_SOURCES = copyg.c
countg_SOURCES = testg.c
cubhamg_SOURCES = cubhamg.c
deledgeg_SOURCES = deledgeg.c
delptg_SOURCES = delptg.c
directg_SOURCES = directg.c
dretodot_SOURCES = dretodot.c
dretog_SOURCES = dretog.c
edgetransg_SOURCES = edgetransg.c
genbg_SOURCES = genbg.c
genbgL_SOURCES = genbg.c
geng_SOURCES = geng.c
genquarticg_SOURCES = genquarticg.c
genrang_SOURCES = genrang.c
genspecialg_SOURCES = genspecialg.c
gentourng_SOURCES = gentourng.c
gentreeg_SOURCES = gentreeg.c
hamheuristic_SOURCES = hamheuristic.c
labelg_SOURCES = labelg.c
linegraphg_SOURCES = linegraphg.c
listg_SOURCES = listg.c
multig_SOURCES = multig.c
newedgeg_SOURCES = newedgeg.c
NRswitchg_SOURCES = NRswitchg.c
pickg_SOURCES = testg.c
planarg_SOURCES = planarg.c planarity.c
ranlabg_SOURCES = ranlabg.c
shortg_SOURCES = shortg.c
showg_SOURCES = showg.c
subdivideg_SOURCES = subdivideg.c
twohamg_SOURCES = twohamg.c
underlyingg_SOURCES = underlyingg.c
vcolg_SOURCES = vcolg.c
watercluster2_SOURCES = watercluster2.c
blisstog_SOURCES = blisstog.c
checks6_SOURCES = checks6.c
sumlines_SOURCES = sumlines.c

dreadnaut_LDADD =     $(NAUTY_LDADD)
addedgeg_LDADD =      $(NAUTY_LDADD)
amtog_LDADD =         $(NAUTY_LDADD)
assembleg_LDADD =     $(NAUTY_LDADD)
biplabg_LDADD =       $(NAUTY_LDADD)
catg_LDADD =          $(NAUTY_LDADD)
complg_LDADD =        $(NAUTY_LDADD)
converseg_LDADD =     $(NAUTY_LDADD)
copyg_LDADD =         $(NAUTY_LDADD)
countg_LDADD =        $(NAUTY_LDADD)
cubhamg_LDADD =       $(NAUTY_LDADD)
deledgeg_LDADD =      $(NAUTY_LDADD)
delptg_LDADD =        $(NAUTY_LDADD)
directg_LDADD =       $(NAUTY_LDADD)
dretodot_LDADD =      $(NAUTY_LDADD) $(LIBM)
dretog_LDADD =        $(NAUTY_LDADD)
edgetransg_LDADD =    $(NAUTY_LDADD)
genbg_LDADD =         $(NAUTYW1_LDADD)
genbgL_LDADD =        $(NAUTYL1_LDADD)
geng_LDADD =          $(NAUTYW1_LDADD)
genquarticg_LDADD =   $(NAUTYL1_LDADD)
genrang_LDADD =       $(NAUTY_LDADD)
genspecialg_LDADD =   $(NAUTY_LDADD)
gentourng_LDADD =     $(NAUTY_LDADD)
gentreeg_LDADD =      $(NAUTY_LDADD)
hamheuristic_LDADD =  $(NAUTY_LDADD)
labelg_LDADD =        $(NAUTY_LDADD)
linegraphg_LDADD =    $(NAUTY_LDADD)
listg_LDADD =         $(NAUTY_LDADD)
multig_LDADD =        $(NAUTY_LDADD)
newedgeg_LDADD =      $(NAUTY_LDADD)
NRswitchg_LDADD =     $(NAUTY_LDADD)
pickg_LDADD =         $(NAUTY_LDADD)
planarg_LDADD =       $(NAUTY_LDADD)
ranlabg_LDADD =       $(NAUTY_LDADD)
shortg_LDADD =        $(NAUTY_LDADD)
showg_LDADD =
subdivideg_LDADD =    $(NAUTY_LDADD)
twohamg_LDADD =       $(NAUTY_LDADD)
underlyingg_LDADD =   $(NAUTY_LDADD)
vcolg_LDADD =         $(NAUTY_LDADD)
watercluster2_LDADD = $(NAUTY_LDADD)
blisstog_LDADD =      $(NAUTY_LDADD) $(ZLIB_LIBS)
checks6_LDADD =       $(NAUTY_LDADD)
sumlines_LDADD =      $(GMP_LIBS)

libnauty_la_LD_VERSION_SCRIPT =
libnautyA1_la_MAP =
libnautyA1_la_LD_VERSION_SCRIPT =
libnautyS0_la_MAP =
libnautyS0_la_LD_VERSION_SCRIPT =
libnautyS1_la_MAP =
libnautyS1_la_LD_VERSION_SCRIPT =
libnautyW0_la_MAP =
libnautyW0_la_LD_VERSION_SCRIPT =
libnautyW1_la_MAP =
libnautyW1_la_LD_VERSION_SCRIPT =
libnautyL0_la_MAP =
libnautyL0_la_LD_VERSION_SCRIPT =
libnautyL1_la_MAP =
libnautyL1_la_LD_VERSION_SCRIPT =
if HAVE_LD_VERSION_SCRIPT
libnauty_la_LD_VERSION_SCRIPT += -Wl,--version-script=$(top_srcdir)/nauty.map
libnautyA1_la_MAP += nautyA1.map
libnautyA1_la_LD_VERSION_SCRIPT += -Wl,--version-script=$(top_builddir)/$(libnautyA1_la_MAP)
libnautyS0_la_MAP += nautyS0.map
libnautyS0_la_LD_VERSION_SCRIPT += -Wl,--version-script=$(top_builddir)/$(libnautyS0_la_MAP)
libnautyS1_la_MAP += nautyS1.map
libnautyS1_la_LD_VERSION_SCRIPT += -Wl,--version-script=$(top_builddir)/$(libnautyS1_la_MAP)
libnautyW0_la_MAP += nautyW0.map
libnautyW0_la_LD_VERSION_SCRIPT += -Wl,--version-script=$(top_builddir)/$(libnautyW0_la_MAP)
libnautyW1_la_MAP += nautyW1.map
libnautyW1_la_LD_VERSION_SCRIPT += -Wl,--version-script=$(top_builddir)/$(libnautyW1_la_MAP)
libnautyL0_la_MAP += nautyL0.map
libnautyL0_la_LD_VERSION_SCRIPT += -Wl,--version-script=$(top_builddir)/$(libnautyL0_la_MAP)
libnautyL1_la_MAP += nautyL1.map
libnautyL1_la_LD_VERSION_SCRIPT += -Wl,--version-script=$(top_builddir)/$(libnautyL1_la_MAP)
endif

libnauty_la_LIBADD = $(threadlib)
libnauty_la_LDFLAGS = -version-info $(LIBNAUTY_LT_VERSION) $(libnauty_la_LD_VERSION_SCRIPT)

libnauty_la_SOURCES = \
	nauty.c \
	nautil.c \
	nausparse.c \
	naugraph.c \
	naurng.c \
	schreier.c \
	traces.c \
	gtools.c \
	naututil.c \
	nautinv.c \
	nautycliquer.c \
	planarity.c \
	gutil1.c \
	gutil2.c \
	gtnauty.c \
	naugroup.c

libnautyA1_la_DEPENDENCIES = $(libnautyA1_la_MAP)
libnautyA1_la_CPPFLAGS = $(nautyA1_flavour_CPPFLAGS)
libnautyA1_la_LIBADD = $(threadlib)
libnautyA1_la_LDFLAGS = -version-info $(LIBNAUTY_LT_VERSION) $(libnautyA1_la_LD_VERSION_SCRIPT)
libnautyA1_la_SOURCES =$(libnauty_la_SOURCES)

libnautyS0_la_DEPENDENCIES = $(libnautyS0_la_MAP)
libnautyS0_la_CPPFLAGS = $(nautyS0_flavour_CPPFLAGS)
libnautyS0_la_LIBADD = $(threadlib)
libnautyS0_la_LDFLAGS = -version-info $(LIBNAUTY_LT_VERSION) $(libnautyS0_la_LD_VERSION_SCRIPT)
libnautyS0_la_SOURCES =$(libnauty_la_SOURCES)

libnautyS1_la_DEPENDENCIES = $(libnautyS1_la_MAP)
libnautyS1_la_CPPFLAGS = $(nautyS1_flavour_CPPFLAGS)
libnautyS1_la_LIBADD = $(threadlib)
libnautyS1_la_LDFLAGS = -version-info $(LIBNAUTY_LT_VERSION) $(libnautyS1_la_LD_VERSION_SCRIPT)
libnautyS1_la_SOURCES =$(libnauty_la_SOURCES)

libnautyW0_la_DEPENDENCIES = $(libnautyW0_la_MAP)
libnautyW0_la_CPPFLAGS = $(nautyW0_flavour_CPPFLAGS)
libnautyW0_la_LIBADD = $(threadlib)
libnautyW0_la_LDFLAGS = -version-info $(LIBNAUTY_LT_VERSION) $(libnautyW0_la_LD_VERSION_SCRIPT)
libnautyW0_la_SOURCES =$(libnauty_la_SOURCES)

libnautyW1_la_DEPENDENCIES = $(libnautyW1_la_MAP)
libnautyW1_la_CPPFLAGS = $(nautyW1_flavour_CPPFLAGS)
libnautyW1_la_LIBADD = $(threadlib)
libnautyW1_la_LDFLAGS = -version-info $(LIBNAUTY_LT_VERSION) $(libnautyW1_la_LD_VERSION_SCRIPT)
libnautyW1_la_SOURCES =$(libnauty_la_SOURCES)

libnautyL0_la_DEPENDENCIES = $(libnautyL0_la_MAP)
libnautyL0_la_CPPFLAGS = $(nautyL0_flavour_CPPFLAGS)
libnautyL0_la_LIBADD = $(threadlib)
libnautyL0_la_LDFLAGS = -version-info $(LIBNAUTY_LT_VERSION) $(libnautyL0_la_LD_VERSION_SCRIPT)
libnautyL0_la_SOURCES =$(libnauty_la_SOURCES)

libnautyL1_la_DEPENDENCIES = $(libnautyL1_la_MAP)
libnautyL1_la_CPPFLAGS = $(nautyL1_flavour_CPPFLAGS)
libnautyL1_la_LIBADD = $(threadlib)
libnautyL1_la_LDFLAGS = -version-info $(LIBNAUTY_LT_VERSION) $(libnautyL1_la_LD_VERSION_SCRIPT)
libnautyL1_la_SOURCES =$(libnauty_la_SOURCES)

dreadtest_CPPFLAGS =   $(dreadnaut_CPPFLAGS) -DDREADTEST
dreadtest1_CPPFLAGS =  $(dreadtest_CPPFLAGS) $(nautyA1_flavour_CPPFLAGS)
dreadtestS_CPPFLAGS =  $(dreadtest_CPPFLAGS) $(nautyS0_flavour_CPPFLAGS)
dreadtestS1_CPPFLAGS = $(dreadtest_CPPFLAGS) $(nautyS1_flavour_CPPFLAGS)
dreadtestW_CPPFLAGS =  $(dreadtest_CPPFLAGS) $(nautyW0_flavour_CPPFLAGS)
dreadtestW1_CPPFLAGS = $(dreadtest_CPPFLAGS) $(nautyW1_flavour_CPPFLAGS)
dreadtestL_CPPFLAGS =  $(dreadtest_CPPFLAGS) $(nautyL0_flavour_CPPFLAGS)
dreadtestL1_CPPFLAGS = $(dreadtest_CPPFLAGS) $(nautyL1_flavour_CPPFLAGS)
dreadtest4K_CPPFLAGS = $(dreadtest_CPPFLAGS) -DMAXN=4096
nautestS_CPPFLAGS =    $(dreadtest_CPPFLAGS) $(nautyS0_flavour_CPPFLAGS)
nautestW_CPPFLAGS =    $(dreadtest_CPPFLAGS) $(nautyW0_flavour_CPPFLAGS)
nautestL_CPPFLAGS =    $(dreadtest_CPPFLAGS) $(nautyL0_flavour_CPPFLAGS)

dreadtest_SOURCES =   $(dreadnaut_SOURCES)
dreadtest1_SOURCES =  $(dreadnaut_SOURCES)
dreadtestS1_SOURCES = $(dreadnaut_SOURCES)
dreadtestS_SOURCES =  $(dreadnaut_SOURCES)
dreadtestW_SOURCES =  $(dreadnaut_SOURCES)
dreadtestW1_SOURCES = $(dreadnaut_SOURCES)
dreadtestL_SOURCES =  $(dreadnaut_SOURCES)
dreadtestL1_SOURCES = $(dreadnaut_SOURCES)
dreadtest4K_SOURCES = $(dreadnaut_SOURCES) $(libnauty_la_SOURCES)
nautestS_SOURCES =    nauty.h naututil.h nautest.c
nautestW_SOURCES =    nauty.h naututil.h nautest.c
nautestL_SOURCES =    nauty.h naututil.h nautest.c

dreadtest_LDADD =   $(NAUTY_LDADD)
dreadtest1_LDADD =  $(top_builddir)/libnautyA1.la $(threadlib)
dreadtestS_LDADD =  $(top_builddir)/libnautyS0.la $(threadlib)
dreadtestS1_LDADD = $(top_builddir)/libnautyS1.la $(threadlib)
dreadtestW_LDADD =  $(top_builddir)/libnautyW0.la $(threadlib)
dreadtestW1_LDADD = $(top_builddir)/libnautyW1.la $(threadlib)
dreadtestL_LDADD =  $(top_builddir)/libnautyL0.la $(threadlib)
dreadtestL1_LDADD = $(top_builddir)/libnautyL1.la $(threadlib)
dreadtest4K_LDADD = $(threadlib)
nautestS_LDADD =    $(top_builddir)/libnautyS0.la $(threadlib)
nautestW_LDADD =    $(top_builddir)/libnautyW0.la $(threadlib)
nautestL_LDADD =    $(top_builddir)/libnautyL0.la $(threadlib)

CLEANFILES = \
	$(man_MANS) \
	$(libnautyA1_la_MAP) \
	$(libnautyS0_la_MAP) \
	$(libnautyS1_la_MAP) \
	$(libnautyW0_la_MAP) \
	$(libnautyW1_la_MAP) \
	$(libnautyL0_la_MAP) \
	$(libnautyL1_la_MAP) \
	runtest-*.data \
	runtest-*.atad

EXTRA_DIST = \
	sorttemplates.c
