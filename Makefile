LIBDIR = $(HOME)/.config/direnv/lib

all:
	@echo "Run 'make install' to install the library"
	@echo
	@echo "Alternatively, to install manually:"
	@echo "  mkdir -p $(LIBDIR)"
	@echo "  cp credentials.sh $(LIBDIR)"

install: $(LIBDIR) $(LIBDIR)/credentials.sh

clean:
	$(RM) $(LIBDIR)/credentials.sh

$(LIBDIR):
	mkdir -p $@

$(LIBDIR)/credentials.sh: credentials.sh
	cp $< $@
