# named portage image
FROM gentoo/portage:latest as portage
FROM gentoo/stage3:latest

# copy the entire portage volume
COPY --chown=portage:portage --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

# configure portage and crossdev overlay
COPY files/ /

# configure portage
RUN \
# install crossdev, qemu and distcc
# install layman for wuodan profiles
# install vim cause nano sucks hard
	emerge --quiet	app-emulation/qemu \
					app-editors/vim \
					sys-devel/crossdev \
	&& \
	rm -rf /usr/portage/distfiles/*
