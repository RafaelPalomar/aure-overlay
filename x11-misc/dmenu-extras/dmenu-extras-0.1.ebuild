# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A set of dmenu-based utilities"
HOMEPAGE="https://www.gentoo.org/proj/en/eselect/"
SRC_URI="https://github.com/RafaelPalomar/dmenu-extras/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~mips ppc ppc64 ~riscv s390 sparc x86 ~ppc-aix ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND=">=x11-misc/dmenu-4.9"


src_install() {
	default
	insinto /usr/bin
	newins dmenu-really dmenu-really
	fperms a+x /usr/bin/dmenu-really
}
