# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdeartwork-kscreensaver/kdeartwork-kscreensaver-3.5.10.ebuild,v 1.7 2009/07/12 11:45:53 armin76 Exp $

EAPI="1"
KMMODULE=kscreensaver
KMNAME=kdeartwork
inherit kde-meta

DESCRIPTION="Extra screensavers for kde"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="opengl xscreensaver"
DEPEND="|| ( >=kde-base/kscreensaver-${PV}:${SLOT} >=kde-base/kdebase-${PV}:${SLOT} )
	media-libs/libart_lgpl
	opengl? ( virtual/opengl )
	xscreensaver? ( x11-misc/xscreensaver )"

src_compile() {
	local myconf="$myconf --with-dpms --with-libart
				$(use_with opengl gl) $(use_with xscreensaver)"

	kde-meta_src_compile
}
