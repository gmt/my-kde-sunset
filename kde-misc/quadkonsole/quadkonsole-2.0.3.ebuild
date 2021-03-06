# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-misc/quadkonsole/quadkonsole-2.0.3.ebuild,v 1.1 2009/03/29 13:56:21 patrick Exp $

inherit kde

DESCRIPTION="Quadkonsole provides a grid of Konsole terminals."
HOMEPAGE="http://nomis80.org/quadkonsole/"
SRC_URI="http://nomis80.org/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=kde-base/konsole-3.5*"
DEPEND="${RDEPEND}"

need-kde 3.3

src_install() {
	kde_src_install

	rm -rf "${D}/usr/share/applnk"
	insinto /usr/share/applications
	doins "${S}/src/${PN}.desktop"
}
