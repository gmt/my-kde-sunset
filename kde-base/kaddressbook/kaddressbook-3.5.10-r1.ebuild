# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kaddressbook/kaddressbook-3.5.10.ebuild,v 1.8 2009/07/12 13:17:24 armin76 Exp $

EAPI="2"
KMNAME=kdepim
inherit kde-meta eutils

SRC_URI="${SRC_URI}
	mirror://gentoo/kdepim-3.5-patchset-05.tar.bz2"

DESCRIPTION="The KDE Address Book"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="gnokii"
DEPEND=">=kde-base/libkdepim-${PV}:${SLOT}
>=kde-base/libkcal-${PV}:${SLOT}
>=kde-base/certmanager-${PV}:${SLOT}
>=kde-base/libkdenetwork-${PV}:${SLOT}
>=kde-base/kontact-${PV}:${SLOT}
gnokii? ( app-mobilephone/gnokii )"

RDEPEND="${DEPEND}"

KMCOPYLIB="
	libkdepim libkdepim
	libkcal libkcal
	libkleopatra certmanager/lib/
	libqgpgme libkdenetwork/qgpgme/
	libkpinterfaces kontact/interfaces/"
KMEXTRACTONLY="
	libkdepim/
	libkdenetwork/
	libkcal/
	libemailfunctions/
	certmanager/
	kontact/interfaces/
	akregator
	kmail/kmailIface.h"
KMCOMPILEONLY="
	libkcal/libical/src/libical/
	libkcal/libical/src/libicalss/
	akregator/src/librss"
	# We add them here because they are standard plugins and programs related to kaddressbook but not a dep of any other kdepim program, so they will be lost if noone install them
KMEXTRA="
	kabc/
	kfile-plugins/vcf
	kontact/plugins/kaddressbook"

PATCHES=( "${FILESDIR}/kaddressbook-3.5-gnokii.patch"
	"${FILESDIR}/${KMNAME}_${PN}-r893152.patch" )

src_prepare() {
	# Have to patch this one ourselves in order to avoid clash with patchset
	kde-meta_src_prepare
	epatch "${FILESDIR}/${KMNAME}_kabc-p05-r886802.patch"
}

src_compile() {
	myconf="$(use_with gnokii) --enable-newdistrlists"
	export DO_NOT_COMPILE="libical" && kde-meta_src_compile myconf configure
	# generate "ical.h"
	cd "${S}/libkcal/libical/src/libical" && make ical.h
	# generate "icalss.h"
	cd "${S}/libkcal/libical/src/libicalss" && make icalss.h

	kde-meta_src_compile "make"
}
