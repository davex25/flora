# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils git-2

DESCRIPTION="Windows Manager From Scratch"
HOMEPAGE="https://www.wmfs.info"
EGIT_REPO_URI="git://github.com/golodhrim/wmfs.git"
EGIT_PROJECT="wmfs"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xinerama xrandr imlib2"

DEPEND="
	x11-libs/libX11
	x11-libs/libSM
	x11-libs/libXft
	imlib2? ( media-libs/imlib2 )
	xrandr? ( x11-libs/libXrandr )
	xinerama? ( x11-libs/libXinerama )
	"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_configure() {
	econf \
			$(use_with imlib2) \
			$(use_with xrandr) \
			$(use_with xinerama)
}

src_install() {
	dobin  "${S}/${PN}" || die
	doman  "${S}/${PN}.1" || die
}
