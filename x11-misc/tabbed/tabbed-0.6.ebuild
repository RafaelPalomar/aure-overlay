# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit savedconfig toolchain-funcs

DESCRIPTION="Simple generic tabbed fronted to xembed aware applications"
HOMEPAGE="https://tools.suckless.org/tabbed"
SRC_URI="https://dl.suckless.org/tools/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="
	x11-base/xorg-proto
	${RDEPEND}
"

PATCHES=(
	${FILESDIR}/0001-Adding-conforming-documentation-of-the-commandline-c.patch
	${FILESDIR}/0002-update-years-in-copyright-notices.patch
	${FILESDIR}/0003-Applying-the-client-sel-handling-of-quinq.patch
	${FILESDIR}/0004-The-check-for-a-minimal-new-lastsel-is-not-needed-an.patch
	${FILESDIR}/0005-Simplifying-the-lastsel-handling-a-bit.patch
	${FILESDIR}/0006-support-urgency-wm-hints.patch
	${FILESDIR}/0007-add-urgent-color-cmdline-options.patch
	${FILESDIR}/0008-Replace-emallocz-with-ecalloc.patch
	${FILESDIR}/0009-Clear-urgency-hint-on-sel-c.patch
	${FILESDIR}/0010-tabbed-UnmapNotify-patch.patch
	${FILESDIR}/0011-movetab-Move-selected-tab-instead-of-switching.patch
	${FILESDIR}/0012-revise-drawbar-and-related-mechanisms.patch
	${FILESDIR}/0013-My-libc-wants-_DEFAULT_SOURCE.patch
	${FILESDIR}/0014-fix-bug-in-unmanage-check-if-lastsel-is-initialized.patch
	${FILESDIR}/0015-add-xembed-wrapper-utility.patch
	${FILESDIR}/0016-Fixing-some-manpage-formatting-and-formatting-in-xem.patch
	${FILESDIR}/0017-focus-urgent-tabs.patch
	${FILESDIR}/0018-autofocus-urgent-tabs.patch
	${FILESDIR}/0019-Bump-year.patch
	${FILESDIR}/0020-Bumping-up-the-year.patch
	${FILESDIR}/0021-Fix-install-paths-and-default-build-flag.patch
	${FILESDIR}/0022-Style-cleanup.patch
	${FILESDIR}/0023-Arrange-diagnostic-messages.patch
	${FILESDIR}/0024-Remove-h-flag-put-usage-in-the-default-case.patch
	${FILESDIR}/0025-Add-configuration-option-for-title-truncation-string.patch
	${FILESDIR}/0026-Added-xft-support.patch
	${FILESDIR}/0027-Import-the-arg.h-from-st-with-the-fixed-oob-bug.patch
	${FILESDIR}/0028-add-k-to-close-tabbed-foreground-client-on-WMDelete.patch
	${FILESDIR}/0029-The-forgotten-half-of-the-last-patch.patch
	${FILESDIR}/0030-One-killclient-is-enough.patch
	${FILESDIR}/0031-Move-tab-selection-keybinding-from-Ctrl-t-to-Ctrl.patch
	${FILESDIR}/0032-Fix-movetab-and-focusurgent-when-there-s-no-client.patch
	${FILESDIR}/0033-Fix-minor-inconsistency-in-man-page.patch
	${FILESDIR}/0034-Embed-dmenu-in-tabbed-own-window.patch
	${FILESDIR}/0035-Add-OpenBSD-support-to-config.mk.patch
	${FILESDIR}/0036-Fixed-crash-when-window-height-was-less-or-equal-to-.patch
)


src_prepare() {
	sed config.mk \
		-e '/^CC/d' \
		-e 's|/usr/local|/usr|g' \
		-e 's|^CFLAGS.*|CFLAGS += -std=c99 -pedantic -Wall $(INCS) $(CPPFLAGS)|g' \
		-e 's|^LDFLAGS.*|LDFLAGS += $(CFLAGS) $(LIBS)|g' \
		-e 's|^LIBS.*|LIBS = -lX11|g' \
		-e 's|{|(|g;s|}|)|g' \
		-i || die

	sed Makefile \
		-e 's|{|(|g;s|}|)|g' \
		-e '/^[[:space:]]*@echo/d' \
		-e 's|^	@|	|g' \
		-i || die

	restore_config config.h
}

src_compile() {
	emake CC=$(tc-getCC)
}
src_install() {
	default
	save_config config.h
}
