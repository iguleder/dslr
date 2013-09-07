PACKAGE_VERSION="4.0.3"
PACKAGE_SOURCES="http://ftp.gnu.org/gnu/screen/screen-$PACKAGE_VERSION.tar.gz"

screen_build() {
	[ -d screen-$PACKAGE_VERSION ] && rm -rf screen-$PACKAGE_VERSION
	tar -xzvf screen-$PACKAGE_VERSION.tar.gz
	cd screen-$PACKAGE_VERSION

	./configure --host=$HOST \
	            --prefix= \
	            --datadir=/usr/share \
	            --infodir=/usr/share/info \
	            --mandir=/usr/share/man \
	            --disable-socket-dir \
	            --disable-pam \
	            --disable-locale \
	            --disable-telnet \
	            --disable-colors256 \
	            --disable-rxvt_osc \
	            --with-sys-screenrc=/etc/screenrc
	make
}

screen_package() {
	make DESTDIR="$1" install
	rm -f "$1/bin/screen"
	mv "$1/bin/screen-$PACKAGE_VERSION" "$1/bin/screen"
	install -D -m 644 etc/etcscreenrc "$1/etc/screenrc"
	install -D -m 644 README "$1/usr/share/doc/screen/README"
	install -D -m 644 NEWS "$1/usr/share/doc/screen/NEWS"
	install -D -m 644 ChangeLog "$1/usr/share/doc/screen/ChangeLog"
	install -D -m 644 COPYING "$1/usr/share/doc/screen/COPYING"
}