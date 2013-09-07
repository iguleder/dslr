PACKAGE_VERSION="1.2.8"
PACKAGE_SOURCES="http://zlib.net/zlib-$PACKAGE_VERSION.tar.gz"

zlib_build() {
	[ -d zlib-$PACKAGE_VERSION ] && rm -rf zlib-$PACKAGE_VERSION
	tar -xzvf zlib-$PACKAGE_VERSION.tar.gz
	cd zlib-$PACKAGE_VERSION
	./configure --prefix=/usr --libdir=/lib --static
	make
}

zlib_package() {
	make DESTDIR="$1" install
	install -D -m 644 README "$1/usr/share/doc/zlib/README"
	install -D -m 644 ChangeLog "$1/usr/share/doc/zlib/ChangeLog"
}