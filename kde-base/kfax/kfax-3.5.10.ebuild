# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kfax/kfax-3.5.10.ebuild,v 1.7 2009/07/12 13:10:09 armin76 Exp $

EAPI="1"
KMNAME=kdegraphics
inherit kde-meta eutils

DESCRIPTION="KDE G3/G4 fax viewer"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

DEPEND=">=kde-base/kviewshell-${PV}:${SLOT}"

KMEXTRA="kfaxview"
KMCOPYLIB="libkmultipage kviewshell"
KMEXTRACTONLY="kviewshell/"
KMCOMPILEONLY="kviewshell"

src_unpack() {
	kde-meta_src_unpack
	epatch "${FILESDIR}"/kviewshell-3.5.10-gcc47.patch
}
