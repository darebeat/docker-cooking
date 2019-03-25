FROM ubuntu:14.04
MAINTAINER Darebaet <fengwei2010@126.com>

ADD ./buildroot-2015.11.tar.gz /
COPY ./sources.list /etc/apt/

# Some cross-compilation tools that buildroot needs.
ENV TERM dumb
RUN which python || ln /usr/bin/python3 /usr/bin/python \
&& apt-get update -q \
&& apt-get install -qy wget build-essential libncurses-dev rsync unzip bc \
&& mv /buildroot-* /buildroot

WORKDIR /buildroot
RUN make defconfig
RUN sed -i "s/BR2_i386=y/# BR2_i386 is not set/" .config
RUN for CFGVAR in \
    BR2_x86_64 \
    BR2_TOOLCHAIN_BUILDROOT_LARGEFILE \
    BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 \
    BR2_TOOLCHAIN_BUILDROOT_WCHAR \
    BR2_PACKAGE_BRIDGE_UTILS \
    BR2_PACKAGE_IPROUTE2 \
    BR2_PACKAGE_IPTABLES \
    ; do sed -i "s/# $CFGVAR is not set/$CFGVAR=y/" .config ; done
RUN for CFGVAR in \
    CONFIG_NC \
    CONFIG_NC_SERVER \
    CONFIG_NC_EXTRA \
    CONFIG_BRCTL \
    CONFIG_PING6 \
    CONFIG_FEATURE_IPV6 \
    CONFIG_FEATURE_IFUPDOWN_IPV6 \
# The below feature will prefer an IPv4 address over IPv6 from DNS to handle the
# original problem regarding nc using the AAAA record if it exists
    CONFIG_FEATURE_PREFER_IPV4_ADDRESS \
    CONFIG_FEATURE_BRCTL_FANCY \
    CONFIG_FEATURE_BRCTL_SHOW \
    CONFIG_FEATURE_BASH_IS_ASH \
    ; do sed -i "s/# $CFGVAR is not set/$CFGVAR=y/" package/busybox/busybox.config ; done
RUN make olddefconfig
RUN make
RUN ln -s /buildroot/output/images/rootfs.tar /rootfs.tar
