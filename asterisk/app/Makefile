build:
	apt-get upgrade -y
	apt-get install -y --no-install-recommends build-essential wget ca-certificates libjansson-dev libedit-dev uuid-dev libxml2-dev libsqlite3-dev libogg-dev libvorbis-dev libopus-dev libssl-dev libldap-dev zlib1g-dev libiksemel-dev libresample1-dev libsndfile1-dev libpq-dev libfftw3-dev libsrtp2-dev libcodec2-dev
	mkdir -p /opt/asterisk/
	wget https://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-$(ASTERISK_VERSION).tar.gz -P /opt/asterisk/
	tar zxvf /opt/asterisk/asterisk-$(ASTERISK_VERSION).tar.gz -C /opt/asterisk/
	cd /opt/asterisk/asterisk-$(ASTERISK_VERSION)/ &&  ./configure  --prefix=/app --with-ssl --with-ldap --with-ogg --with-opus --with-resample --with-z --with-iksemel --with-srtp --with-sndfile --with-fftw3 --with-postgres --with-codec2
	make menuselect.makeopts -C /opt/asterisk/asterisk-$(ASTERISK_VERSION)/
	cd /opt/asterisk/asterisk-$(ASTERISK_VERSION)/ && menuselect/menuselect \
		--disable-category MENUSELECT_ADDONS \
		--disable-category MENUSELECT_CORE_SOUNDS \
		--disable app_adsiprog --disable app_getcpeid --disable chan_unistim --disable format_vox --disable res_adsi \
		--enable CORE-SOUNDS-EN-WAV --enable CORE-SOUNDS-EN-ALAW --enable CORE-SOUNDS-FR-WAV --enable CORE-SOUNDS-FR-ALAW \
		--enable MOH-OPSOUND-WAV --enable MOH-OPSOUND-ALAW --enable EXTRA-SOUNDS-EN-WAV --enable EXTRA-SOUNDS-EN-ALAW \
		--enable EXTRA-SOUNDS-FR-WAV --enable EXTRA-SOUNDS-FR-ALAW
	make -C /opt/asterisk/asterisk-$(ASTERISK_VERSION)/
	make install -C /opt/asterisk/asterisk-$(ASTERISK_VERSION)/

setup:
	apt-get update -y
	apt-get upgrade -y
	apt-get install -y --no-install-recommends libjansson4 libedit2 libuuid1 libxml2 libsqlite3-0 libvorbis0a libvorbisenc2 libvorbisfile3 libogg0 libopus0 libssl3 libldap-2.5-0 zlib1g libiksemel3 libresample1 postgresql-client libfftw3-bin libsrtp2-1 libcodec2-1.0
	apt-get -y autoremove
	apt-get -y clean
	apt-get -y autoclean
	useradd -u 6000 -N -g 65534 asterisk
