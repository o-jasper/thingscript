
default: document

document:
	cd share_thingscript/; \
	sh rootlike/bin/gen_doc.sh main/help/ rootlike/share/doc/html/;  \
	cd rootlike/share/doc/html; \
	pwd; \
	mv main/help/* .; \
	rmdir main/help main; \
	echo ----;
