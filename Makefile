# dmenu - dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dmenu.c stest.c util.c
OBJ = $(SRC:.c=.o)

all: options dmenu stest

options:
	@echo dmenu build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	$(CC) -c $(CFLAGS) $<

config.h:
	cp config.def.h $@

$(OBJ): arg.h config.h config.mk drw.h

dmenu: dmenu.o drw.o util.o
	$(CC) -o $@ dmenu.o drw.o util.o $(LDFLAGS)

stest: stest.o
	$(CC) -o $@ stest.o $(LDFLAGS)

clean:
	rm -f dmenu stest $(OBJ) dmenu-$(VERSION).tar.gz

dist: clean
	mkdir -p dmenu-$(VERSION)
	cp LICENSE Makefile README arg.h config.def.h config.mk dmenu.1\
		drw.h util.h dmenu_path dmenu_run drun dout dterm dssh sshmount/sshmount dsmount dfwd dibus dgred dls dappo dcurl dsout dsearch networkmanager-dmenu/networkmanager_dmenu stest.1 $(SRC)\
		dmenu-$(VERSION)
	tar -cf dmenu-$(VERSION).tar dmenu-$(VERSION)
	gzip dmenu-$(VERSION).tar
	rm -rf dmenu-$(VERSION)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dmenu dmenu_path dmenu_run drun dout dterm dssh sshmount/sshmount dsmount dfwd dibus dgred dls dappo dcurl dsout dsearch stest $(DESTDIR)$(PREFIX)/bin
	cp -f networkmanager-dmenu/networkmanager_dmenu $(DESTDIR)$(PREFIX)/bin/dnetwork
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_path
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dmenu_run
	chmod 755 $(DESTDIR)$(PREFIX)/bin/drun
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dterm
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dout
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dssh
	chmod 755 $(DESTDIR)$(PREFIX)/bin/sshmount
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dsmount
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dfwd
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dibus
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dgred
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dls
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dappo
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dcurl
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dsout
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dsearch
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dnetwork
	chmod 755 $(DESTDIR)$(PREFIX)/bin/stest
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < dmenu.1 > $(DESTDIR)$(MANPREFIX)/man1/dmenu.1
	sed "s/VERSION/$(VERSION)/g" < stest.1 > $(DESTDIR)$(MANPREFIX)/man1/stest.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/dmenu.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/stest.1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dmenu\
		$(DESTDIR)$(PREFIX)/bin/dmenu_path\
		$(DESTDIR)$(PREFIX)/bin/dmenu_run\
		$(DESTDIR)$(PREFIX)/bin/drun\
		$(DESTDIR)$(PREFIX)/bin/dterm\
		$(DESTDIR)$(PREFIX)/bin/dout\
		$(DESTDIR)$(PREFIX)/bin/dssh\
		$(DESTDIR)$(PREFIX)/bin/sshmount\
		$(DESTDIR)$(PREFIX)/bin/dsmount\
		$(DESTDIR)$(PREFIX)/bin/dfwd\
		$(DESTDIR)$(PREFIX)/bin/dibus\
		$(DESTDIR)$(PREFIX)/bin/dgred\
		$(DESTDIR)$(PREFIX)/bin/dls\
		$(DESTDIR)$(PREFIX)/bin/dappo\
		$(DESTDIR)$(PREFIX)/bin/dcurl\
		$(DESTDIR)$(PREFIX)/bin/dsout\
		$(DESTDIR)$(PREFIX)/bin/dsearch\
		$(DESTDIR)$(PREFIX)/bin/dnetwork\
		$(DESTDIR)$(PREFIX)/bin/stest\
		$(DESTDIR)$(MANPREFIX)/man1/dmenu.1\
		$(DESTDIR)$(MANPREFIX)/man1/stest.1

.PHONY: all options clean dist install uninstall
