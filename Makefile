
default: document

document:
	cd share_thingscript/; \
	sh rootlike/bin/gen_doc.sh main/help/ main/doc/html/;  \
	cd main/doc/html; \
	pwd; \
	mv main/help/* .; \
	rmdir main/help main; \
	echo ----;

clean:
	cd share_thingscript/main/doc/; rm -r html/;

top: #Goes to the top page.
	xdg-open share_thingscript/main/doc/html/index.html
