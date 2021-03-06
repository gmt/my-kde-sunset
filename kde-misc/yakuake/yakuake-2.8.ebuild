# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/yakuake/yakuake-2.8.ebuild,v 1.6 2008/02/18 23:08:03 ingmar Exp $

USE_KEG_PACKAGING=1

LANGS="de el es it ja nl pa pt pt_BR sv tr et"

inherit kde

DESCRIPTION="A quake-style terminal emulator based on KDE konsole technology"
HOMEPAGE="http://yakuake.kde.org/"
SRC_URI="mirror://berlios/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd"
IUSE=""

DEPEND="=kde-base/konsole-3.5*"
RDEPEND=""

RDEPEND="${DEPEND}"

need-kde 3.4
