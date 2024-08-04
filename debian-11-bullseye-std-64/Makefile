

BASEDIR:=$(shell dab basedir)

all: info/init_ok
	dab bootstrap
	# NOTE: zstd appliances are only supported on PVE >= 7.0, take care on upload!
	# Bullseye defaults to PermitRootLogin prohibit-password
	sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' ${BASEDIR}/etc/ssh/sshd_config
	install -m 0755 std_setup ${BASEDIR}/etc/init.d/
#	dab exec insserv std_setup
	dab exec update-rc.d std_setup defaults
	export LC_ALL=C
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
