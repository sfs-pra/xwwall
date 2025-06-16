PREFIX?=/usr/local
BINDIR=$(PREFIX)/bin
DATADIR=$(PREFIX)/share
MANDIR=$(DATADIR)/man

.PHONY: install

install:
	install -d -m 0755 $(DESTDIR)$(BINDIR)
	install -d -m 0755 $(DESTDIR)$(DATADIR)/applications
	install -d -m 0755 $(DESTDIR)$(MANDIR)/man1
	install -d -m 0755 $(DESTDIR)$(DATADIR)/icons/hicolor/scalable/apps
	install -m 0644 data/xwwall.desktop $(DESTDIR)$(DATADIR)/applications
	install -m 0755 bin/xwwall $(DESTDIR)$(BINDIR)
	install -m 0644 man/xwwall.1 $(DESTDIR)$(MANDIR)/man1
	install -m 0644 data/xwwall.svg $(DESTDIR)$(DATADIR)/icons/hicolor/scalable/apps
	msgfmt data/xwwall.po -o $(DESTDIR)$(DATADIR)/locale/ru/LS_MESSAGES/xwwall.mo

uninstall:
	-rm -f $(DESTDIR)$(DATADIR)/applications/xwwall
	-rm -f $(DESTDIR)$(BINDIR)/xwwall
	-rm -f $(DESTDIR)$(MANDIR)/man1/xwwall.1
	-rm -f $(DESTDIR)$(DATADIR)/icons/hicolor/scalable/apps/xwwall.svg
	-rm -f $(DESTDIR)$(DATADIR)/applications/xwwall.desktop
	-rm -f $(DESTDIR)$(DATADIR)/locale/ru/LC_MESSAGES/xwwall.mo
