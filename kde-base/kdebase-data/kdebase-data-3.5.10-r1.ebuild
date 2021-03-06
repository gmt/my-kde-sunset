# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdebase-data/kdebase-data-3.5.10.ebuild,v 1.7 2009/07/12 09:24:14 armin76 Exp $

EAPI="1"
RESTRICT="binchecks strip"

KMNAME=kdebase
KMNOMODULE=true
inherit kde-meta

DESCRIPTION="Icons, localization data and .desktop files from kdebase. Includes l10n, pics and applnk subdirs."
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="
!kde-base/kdebase-l10n !kde-base/kdebase-applnk !kde-base/kdebase-pics" # replaced these three ebuilds

KMEXTRA="l10n pics applnk"

PATCHES=( "${FILESDIR}/${KMNAME}_l10n-r904512.patch" )
