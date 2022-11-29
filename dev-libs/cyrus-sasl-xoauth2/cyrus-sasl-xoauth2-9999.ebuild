# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 autotools

DESCRIPTION="SASL plugin for client-side OAuth 2.0, e.g. Gmail/Outlook/Office/Postfix SMTP"
HOMEPAGE="https://github.com/tarickb/sasl-xoauth2"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

EGIT_REPO_URI="https://github.com/moriyoshi/cyrus-sasl-xoauth2.git"

DEPEND="dev-libs/cyrus-sasl"
RDEPEND="${DEPEND}"

src_prepare() {
   default

	sed -i '/^pkglibdir =/s:=.*:= $(libdir)/sasl2:' \
		"${S}"/Makefile.am || die "sed failed"

   eautoreconf
}

src_configure() {

	local myeconfargs=(
		--libdir=/usr/$(get_libdir)
	)

	ECONF_SOURCE="${S}" econf "${myeconfargs[@]}"
}
