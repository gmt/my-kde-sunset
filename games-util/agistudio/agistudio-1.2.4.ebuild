# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-util/agistudio/agistudio-1.2.4.ebuild,v 1.2 2009/10/20 13:01:44 maekke Exp $

EAPI=2
inherit qt3

DESCRIPTION="QT AGI Studio allows you to view, create and edit AGI games"
HOMEPAGE="http://agistudio.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"
IUSE=""

DEPEND="dev-qt/qt-meta:3"

S=${WORKDIR}/${P}/src

src_prepare() {
	eqmake3 agistudio.pro -o Makefile || die "eqmake3 failed"
}

src_install() {
	dobin agistudio || die "dobin failed"
	cd ..
	insinto /usr/share/${PN}
	doins -r help template || die "doins failed"
	doman agistudio.1
	dodoc README relnotes
}
