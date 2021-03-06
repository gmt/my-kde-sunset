# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdepim-kioslaves/kdepim-kioslaves-3.5.10.ebuild,v 1.7 2009/07/12 11:33:17 armin76 Exp $

EAPI="1"
KMNAME=kdepim
KMMODULE=kioslaves

inherit kde-meta eutils

SRC_URI="${SRC_URI}
	mirror://gentoo/kdepim-3.5-patchset-04.tar.bz2"

DESCRIPTION="kioslaves from kdepim package"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="sasl"
DEPEND="sasl? ( >=dev-libs/cyrus-sasl-2 )
	>=kde-base/libkmime-${PV}:${SLOT}"

KMCOPYLIB="libkmime libkmime/"
KMEXTRACTONLY="libkmime/"
KMCOMPILEONLY="libemailfunctions"

PATCHES=( "${FILESDIR}/${P}-kio_imap4_fix_infinite_loop.patch" )

src_compile() {
	myconf="$myconf $(use_with sasl)"
	kde-meta_src_compile
}
