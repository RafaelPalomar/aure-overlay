EAPI=8

inherit git-r3

EGIT_REPO_URI="https://github.com/jschlatow/taskopen.git"
EGIT_REPO_BRANCH="v1.1.5"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-misc/task
"
BDEPEND="
	dev-lang/nim
"
