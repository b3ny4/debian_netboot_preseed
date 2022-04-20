ORIGINAL=netboot.tar.gz

.PHONY: all

all: netboot/debian-installer/amd64/preseed.cfg netboot/debian-installer/amd64/boot-screens/auto.cfg netboot/pxelinux.cfg/default netboot/debian-installer/amd64/boot-screens/menu.cfg

netboot/debian-installer/amd64/boot-screens/menu.cfg: netboot boot-screens/menu.cfg
	cp boot-screens/menu.cfg netboot/debian-installer/amd64/boot-screens/menu.cfg

netboot/pxelinux.cfg/default: netboot pxelinux.cfg/default
	cp pxelinux.cfg/default netboot/pxelinux.cfg/default

netboot/debian-installer/amd64/boot-screens/auto.cfg: netboot boot-screens/auto.cfg
	cp boot-screens/auto.cfg netboot/debian-installer/amd64/boot-screens/auto.cfg

netboot/debian-installer/amd64/preseed.cfg: netboot preseed.cfg
	cp preseed.cfg netboot/debian-installer/amd64/preseed.cfg

netboot:
	mkdir netboot
	cd netboot && tar -xf ../${ORIGINAL}
