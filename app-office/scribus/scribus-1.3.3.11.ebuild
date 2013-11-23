# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-office/scribus/scribus-1.3.3.11.ebuild,v 1.7 2008/07/27 19:54:02 carlo Exp $

EAPI=5

inherit qt3 eutils

DESCRIPTION="Desktop Publishing (DTP) and Layout program for Linux."
HOMEPAGE="http://www.scribus.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 hppa ppc ppc64 sparc x86"
IUSE="cairo"

DEPEND="dev-qt/qt-meta:3
	>=media-libs/freetype-2.1
	>=media-libs/lcms-1.09
	media-libs/tiff
	>=media-libs/libart_lgpl-2.3.8
	>=sys-devel/gcc-3.0.0
	>=dev-libs/libxml2-2.6.0
	cairo? ( >=x11-libs/cairo-1.0[-X] )"

RDEPEND="${DEPEND}
	app-text/ghostscript-gpl"

DOCS=( AUTHORS ChangeLog README TODO )

src_configure() {
	econf $(use_enable cairo)
}

src_install() {
	default
	domenu scribus.desktop
	doicon scribus/icons/scribusicon.png
}
