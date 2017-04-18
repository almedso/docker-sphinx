%.pdf: %.svg
	inkscape --without-gui --export-area-drawing --file=$< --export-pdf=$@

SOURCEDIR     = .
#IMAGEDIRS can be a list of directories that contain SVG files and are relative to the SOURCEDIR
IMAGEDIRS      = requirements


PDFs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.pdf,$(wildcard $(SOURCEDIR)/$(dir)/*.svg)))

.PHONY: images
images: $(PDFs)
	echo $(PDFs)

# make sure PDFs are cleaned
clean:
	-rm $(PDFs)
