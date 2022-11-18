# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

EGIT_REPO_URI="https://github.com/harishkrupo/oauth2ms.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-python/pyxdg
	dev-python/msal
	>=dev-python/python-gnupg-0.4.6
"
src_install()
{
	install -Dm755 "oauth2ms" "${D}/usr/bin/oauth2ms"
	install -Dm644 "LICENSE" "${D}/usr/share/licenses/oaut2ms/LICENSE"
	install -Dm644 "README.org" "${D}/usr/share/doc/oauth2ms/README.md"
	install -Dm644 "${FILESDIR}/config.json" "${D}/usr/share/oauth2ms/config.json"
}
