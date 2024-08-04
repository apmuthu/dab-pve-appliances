

BASEDIR:=$(shell dab basedir)

all: info/init_ok
	dab bootstrap
	# Bookworm defaults to PermitRootLogin prohibit-password
	sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' ${BASEDIR}/etc/ssh/sshd_config
	dab exec systemctl mask systemd-logind
	# NOTE: zstd appliances are only supported on PVE >= 7.0, take care on upload!
	# dab finalize --compressor zstd-max
	dab finalize

info/init_ok: dab.conf
	dab init
	touch $@

.PHONY: clean
clean:
	dab clean
	rm -f *~

.PHONY: dist-clean
dist-clean:
	dab dist-clean
	rm -f *~
