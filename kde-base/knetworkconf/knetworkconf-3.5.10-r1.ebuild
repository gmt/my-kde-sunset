# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/knetworkconf/knetworkconf-3.5.10.ebuild,v 1.7 2009/07/12 10:44:13 armin76 Exp $

EAPI="1"
KMNAME=kdeadmin

inherit kde-meta eutils

DESCRIPTION="KDE network configuration manager"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="kdehiddenvisibility"
DEPEND=""

PATCHES=( "${FILESDIR}/${KMNAME}_${PN}-r884099.patch"
	"${FILESDIR}/${KMNAME}_${PN}-taking-address-of-temporary.patch" )
