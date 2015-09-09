CHAPTERS = 	title.md \
			01-introduction/chapter.md \

BOOK := $(addprefix en/, $(CHAPTERS))

OBJDIR := build
PANDOC := pandoc
.PHONY: pdf docx html

all: $(OBJDIR) pdf docx html

$(OBJDIR):
	@mkdir -p $@

pdf: $(OBJDIR)
	$(PANDOC) $(BOOK) -o $(OBJDIR)/book.pdf \
	--smart --toc
	
docx: $(OBJDIR)
	$(PANDOC) $(BOOK) -o $(OBJDIR)/book.docx --smart

html: $(OBJDIR)
	$(PANDOC) $(BOOK) -o $(OBJDIR)/book.html --smart --standalone

clean:
		@rm -rf $(OBJDIR)
