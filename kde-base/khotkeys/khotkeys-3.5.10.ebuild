# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/khotkeys/khotkeys-3.5.10.ebuild,v 1.8 2009/07/12 09:40:10 armin76 Exp $

EAPI="1"
KMNAME=kdebase
inherit kde-meta eutils

DESCRIPTION="KDE: hotkey daemon"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="kdehiddenvisibility"

DEPEND="x11-libs/libXtst"
