
header-links: remove-links
	HEADERLIST=" \
		$(top_builddir)/nauty.h \
		$(top_builddir)/naututil.h \
		$(top_builddir)/gtools.h \
		$(top_srcdir)/nautinv.h \
		$(top_srcdir)/naurng.h \
		$(top_srcdir)/nausparse.h \
		$(top_srcdir)/naugroup.h \
		$(top_srcdir)/schreier.h \
		$(top_srcdir)/traces.h \
		$(top_srcdir)/gutils.h \
		"; \
	for h in $$HEADERLIST; do \
		BASENAME=`basename $$h`; \
		test -e $$BASENAME || $(LN_S) $$h $$BASENAME; \
	done

remove-links:
	rm -f nauty.h nautinv.h naurng.h nausparse.h naututil.h naugroup.h schreier.h traces.h gtools.h gutils.h

all-local: header-links

clean-local: remove-links

distclean-local: remove-links
	-rm -f Makefile

