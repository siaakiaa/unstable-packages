TERMUX_PKG_HOMEPAGE=https://github.com/PojavLauncherTeam/mobile
TERMUX_PKG_DESCRIPTION="OpenJDK"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=17
TERMUX_PKG_SRCURL=https://github.com/PojavLauncherTeam/mobile/archive/ec285598849a27f681ea6269342cf03cf382eb56.tar.gz
TERMUX_PKG_SHA256=cbf1c3ccf3eef613d0b98691e42a555099452fe5def5cf318821aabaa1843d19
TERMUX_PKG_DEPENDS="cups, fontconfig, freetype, libpng, libx11, libxtst, zlib"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	export JDK_DEBUG_LEVEL=release

	if [ "$TERMUX_ARCH" = "aarch64" ]; then
		export JDK_ARCH=arm64
	elif [ "$TERMUX_ARCH" = "i686" ]; then
		export JDK_ARCH=x86
	else
		export JDK_ARCH=$TERMUX_ARCH
	fi

	if [ "$JDK_ARCH" = "arm" ]; then
		export JVM_VARIANTS="client"
	else
		export JVM_VARIANTS="server"
	fi

	export TERMUX_HOST_PLATFORM
	export thecc=$TERMUX_STANDALONE_TOOLCHAIN/bin/$TERMUX_HOST_PLATFORM-gcc
	export thecxx=$TERMUX_STANDALONE_TOOLCHAIN/bin/$TERMUX_HOST_PLATFORM-g++
	export PATH=$TERMUX_PKG_BUILDER_DIR/wrappers:$PATH
	CC=android-wrapped-clang
	CXX=android-wrapped-clang++

	cat <<- EOF > $TERMUX_STANDALONE_TOOLCHAIN/devkit.info
	DEVKIT_NAME="Android"
	DEVKIT_TOOLCHAIN_PATH="\$DEVKIT_ROOT"
	DEVKIT_SYSROOT="\$DEVKIT_ROOT/sysroot"
	EOF
}

termux_step_configure() {
	bash ./configure \
		--openjdk-target=$TERMUX_HOST_PLATFORM \
		--with-extra-cflags=" -DLE_STANDALONE -DANDROID" \
		--with-extra-cxxflags=" -DLE_STANDALONE -DANDROID" \
		--with-extra-ldflags="-L$TERMUX_PREFIX/lib" \
		--disable-precompiled-headers \
		--disable-warnings-as-errors \
		--enable-option-checking=fatal \
		--enable-headless-only=yes \
		--with-toolchain-type=gcc \
		--with-jvm-variants=server \
		--with-cups-include="$TERMUX_PREFIX/include" \
		--with-devkit="$TERMUX_STANDALONE_TOOLCHAIN" \
		--with-debug-level=release \
		--with-fontconfig-include="$TERMUX_PREFIX/include" \
		--with-freetype-lib="$TERMUX_PREFIX/lib" \
		--with-freetype-include="$TERMUX_PREFIX/include/freetype2" \
		--with-libpng=system \
		--with-zlib=system \
		--x-includes="$TERMUX_PREFIX/include/X11" \
		--x-libraries="$TERMUX_PREFIX/lib"
}

termux_step_make() {
	cd build/linux-${TERMUX_ARCH}-${JVM_VARIANTS}-${JDK_DEBUG_LEVEL}
	make JOBS=$TERMUX_MAKE_PROCESSES images
}
