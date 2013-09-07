PACKAGE_VERSION="2.8.7"
PACKAGE_SOURCES="http://lynx.isc.org/lynx$PACKAGE_VERSION/lynx$PACKAGE_VERSION.tar.bz2"

lynx_build() {
	version=$(echo $PACKAGE_VERSION | sed s/\\./-/g)
	[ -d lynx$version ] && rm -rf lynx$version
	tar -xjvf lynx$PACKAGE_VERSION.tar.bz2
	cd lynx$version
	./configure --host=$HOST \
	            --prefix= \
	            --mandir=/usr/share/man \
	            --disable-nls \
	            --enable-ipv6 \
	            --with-zlib
	make
}

lynx_package() {
	make DESTDIR="$1" install
	install -D -m 644 README "$1/usr/share/doc/lynx/README"
	install -D -m 644 CHANGES "$1/usr/share/doc/lynx/CHANGES"
	install -D -m 644 AUTHORS "$1/usr/share/doc/lynx/AUTHORS"
	install -D -m 644 COPYHEADER "$1/usr/share/doc/lynx/COPYHEADER"
	install -D -m 644 COPYING "$1/usr/share/doc/lynx/COPYING"
}