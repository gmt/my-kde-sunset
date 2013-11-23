# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kate-plugins/kate-plugins-3.5.10.ebuild,v 1.7 2009/07/12 11:40:21 armin76 Exp $
EAPI="1"
KMNAME=kdeaddons
KMNOMODULE=true
KMEXTRA="kate"
inherit kde-meta eutils

DESCRIPTION="kate plugins and docs"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

DEPEND="|| ( >=kde-base/kate-${PV}:${SLOT} >=kde-base/kdebase-${PV}:${SLOT} )"
RDEPEND="${DEPEND}"

src_unpack() {
    kde-meta_src_unpack
	epatch "${FILESDIR}"/katetabbarextension-no-redundant-constructor.patch
}
