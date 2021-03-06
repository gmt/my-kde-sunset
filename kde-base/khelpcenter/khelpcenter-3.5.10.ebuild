# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/khelpcenter/khelpcenter-3.5.10.ebuild,v 1.7 2009/07/12 12:22:43 armin76 Exp $

EAPI="1"
KMNAME=kdebase
inherit kde-meta eutils

SRC_URI="${SRC_URI}
	mirror://gentoo/kdebase-3.5-patchset-13.tar.bz2"

DESCRIPTION="The KDE help center."
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="kdehiddenvisibility"

KMEXTRA="doc/faq
	doc/glossary
	doc/quickstart
	doc/userguide
	doc/visualdict"

RDEPEND=">=kde-base/kdebase-kioslaves-${PV}:${SLOT}
		>=www-misc/htdig-3.2.0_beta6-r1"
