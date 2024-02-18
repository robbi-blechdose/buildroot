################################################################################
#
# fakeroot
#
################################################################################

FAKEROOT_VERSION = 1.26
FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
#FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20201008T205817Z/pool/main/f/fakeroot
FAKEROOT_SITE = https://src.fedoraproject.org/repo/pkgs/fakeroot/fakeroot_1.26.orig.tar.gz/sha512/dad193b283b48a25806c5bcd06d1f5bbd183ccd40a3fc25f3e7bb88fd6579024f958321f8336654348a1d0a547d4ad19ed11aab5ec9441d6ef493ee6e4c78081/

HOST_FAKEROOT_DEPENDENCIES = host-acl
# Force capabilities detection off
# For now these are process capabilities (faked) rather than file
# so they're of no real use
HOST_FAKEROOT_CONF_ENV = \
	ac_cv_header_sys_capability_h=no \
	ac_cv_func_capset=no
# upstream does not ship with configure script anymore
HOST_FAKEROOT_AUTORECONF = YES
FAKEROOT_LICENSE = GPL-3.0+
FAKEROOT_LICENSE_FILES = COPYING

define HOST_FAKEROOT_BUILD_AUX
	mkdir -p $(@D)/build-aux
endef
HOST_FAKEROOT_POST_PATCH_HOOKS += HOST_FAKEROOT_BUILD_AUX

$(eval $(host-autotools-package))
