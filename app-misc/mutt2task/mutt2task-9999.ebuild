EAPI=8

inherit git-r3

EGIT_REPO_URI="https://github.com/RafaelPalomar/mutt2task.git"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-misc/taskopen
	www-client/elinks
"
src_install()
{
	dobin mutt2task.py
}
