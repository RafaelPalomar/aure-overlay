EAPI=8

PYTHON_COMPAT=( python3_{8,9,10,11} )

inherit distutils-r1

DEPEND="
	dev-python/future
"

SRC_URI="https://github.com/ralphbean/bugwarrior/archive/refs/tags/1.8.0.tar.gz"

SLOT=0
