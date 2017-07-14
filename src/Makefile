# s(ASP) Makefile
# Version 20150810

PLC ?= swipl

PLEXE_EXE ?= sasp

# Flags for unlimited stack size
PLFLAGS = -L0 -G0 -T0

SRCS = main.pl

.PHONY: all
all: $(PLEXE_EXE)

$(PLEXE_EXE): $(SRCS)
	$(PLC) $(PLFLAGS) --goal=main --stand_alone=true -o $@ -c $(SRCS)
	cp $(PLEXE_EXE) ..

.PHONY: clean
clean:
	rm -f $(PLEXE_EXE) $(PLEXE_EXE).exe

.PHONY: distdir
distdir: *.pl
	cp Makefile README *.pl $(distdir)
	
.PHONY: distclean
distclean: clean
