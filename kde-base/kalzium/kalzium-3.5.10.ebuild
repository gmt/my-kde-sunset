# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kalzium/kalzium-3.5.10.ebuild,v 1.9 2009/07/12 11:39:35 armin76 Exp $
EAPI="1"
KMNAME=kdeedu
inherit flag-o-matic kde-meta eutils

DESCRIPTION="KDE: periodic table of the elements"
KEYWORDS="alpha amd64 hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="solver"
HOMEPAGE="http://edu.kde.org/kalzium/"

DEPEND=">=kde-base/libkdeedu-${PV}:${SLOT}
		solver? ( >=dev-ml/facile-1.1 )"
RDEPEND="${DEPEND}"

KMEXTRACTONLY="libkdeedu/kdeeduplot
	libkdeedu/kdeeduui"
KMCOPYLIB="libkdeeduplot libkdeedu/kdeeduplot
	libkdeeduui libkdeedu/kdeeduui"

PATCHES=( "${FILESDIR}/${PN}-3.5.7-copy_string.patch" )

pkg_setup() {
	if use solver && ! built_with_use --missing true dev-lang/ocaml ocamlopt; then
		eerror "In order to build the solver for ${PN}, you first need"
		eerror "to have dev-lang/ocaml built with the ocamlopt useflag"
		eerror "in order to get a native code ocaml compiler"
		die "Please install dev-lang/ocaml with ocamlopt support"
	fi
	if use solver && ! built_with_use --missing true dev-ml/facile ocamlopt; then
		eerror "In order to build the solver for ${PN}, you first need"
		eerror "to have dev-ml/facile built with the ocamlopt useflag"
		eerror "in order to get the native code library"
		die "Please install dev-ml/facile with ocamlopt support"
	fi
	kde_pkg_setup
}

src_compile() {
	append-ldflags -Wl,-z,noexecstack

	local myconf="$(use_enable solver ocamlsolver)"

	if use solver ; then
		cd "${S}/${PN}/src/solver"
		emake || die "compiling the ocaml resolver failed"
	fi

	kde-meta_src_compile
}
