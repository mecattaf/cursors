all: clean render build

.PHONY: all

# Default
clean:
	@rm -rf bitmaps themes

render: bitmapper svg
	@make -C bitmapper

build: bitmaps
	@make -C builder setup build


# Specific platform build
unix: clean render bitmaps
	@make -C builder setup build_unix

windows: clean render bitmaps
	@make -C builder setup build_windows

# Bibata Modern
modern: clean render_modern build_modern

render_modern: bitmapper svg
	@make -C bitmapper install build render_modern

build_modern: bitmaps
	@make -C builder setup build_modern


# Bibata Original
original:clean render_original build_original

render_original: bitmapper svg
	@make -C bitmapper install build render_original

build_original: bitmaps
	@make -C builder setup build_original


# Installation
.ONESHELL:
SHELL := /bin/bash
THEME_PREFIX = Bibata

src = ./themes/$(THEME_PREFIX)-*
local := ~/.icons
local_dest := $(local)/$(THEME_PREFIX)-*

root := /usr/share/icons
root_dest := $(root)/$(THEME_PREFIX)-*

install: themes
	@if [[ $EUID -ne 0 ]]; then
		@echo "> Installing '$(THEME_PREFIX)' cursors inside $(local)/..."
		@mkdir -p $(local)
		@cp -r $(src) $(local)/ && echo "> Installed!"
	@else
		@echo "> Installing '$(THEME_PREFIX)' cursors inside $(root)/..."
		@mkdir -p $(root)
		@sudo cp -r $(src) $(root)/ && echo "> Installed!"
	@fi

uninstall:
	@if [[ $EUID -ne 0 ]]; then
		@echo "> Removing '$(THEME_PREFIX)' cursors from '$(local)'..."
		@rm -rf $(local_dest)
	@else
		@echo "> Removing '$(THEME_PREFIX)' cursors from '$(root)'..."
		@sudo rm -rf $(root_dest)
	@fi

reinstall: uninstall install


# generates binaries
THEMES = Yellow Orange Red Magenta Purple Blue Cyan Green Dark Light
BIN_DIR = ../bin

modern = $(THEME_PREFIX)-Modern
original = $(THEME_PREFIX)-Original
prepare: bitmaps themes
	# Bitmaps
	@rm -rf bin && mkdir bin
	@cd bitmaps && zip -r $(BIN_DIR)/bitmaps.zip * && cd ..
	@cd themes
	#
	# Bibata-Modern
	#
	@$(foreach theme,$(THEMES), tar -czvf $(BIN_DIR)/$(modern)-$(theme).tar.gz $(modern)-$(theme);)
	@$(foreach theme,$(THEMES), zip -r $(BIN_DIR)/$(modern)-$(theme)-Windows.zip $(modern)-$(theme)-Windows;)
	@tar -czvf $(BIN_DIR)/$(modern).tar.gz $(modern)-Yellow $(modern)-Orange $(modern)-Red $(modern)-Magenta $(modern)-Violet $(modern)-Blue $(modern)-Cyan $(modern)-Green $(modern)-Dark $(modern)-Light
	@zip -r $(BIN_DIR)/$(modern)-Windows.zip $(modern)-Yellow-Windows  $(modern)-Orange-Windows  $(modern)-Red-Windows  $(modern)-Magenta-Windows  $(modern)-Violet-Windows  $(modern)-Blue-Windows  $(modern)-Cyan-Windows  $(modern)-Green-Windows  $(modern)-Dark-Windows $(modern)-Light-Windows
	#
	# Bibata-Original
	#
	@$(foreach theme,$(THEMES), tar -czvf $(BIN_DIR)/$(original)-$(theme).tar.gz $(original)-$(theme);)
	@$(foreach theme,$(THEMES), zip -r $(BIN_DIR)/$(original)-$(theme)-Windows.zip $(original)-$(theme)-Windows;)
	@tar -czvf $(BIN_DIR)/$(original).tar.gz $(original)-Yellow $(modern)-Orange $(modern)-Red $(modern)-Magenta $(modern)-Violet $(modern)-Blue $(modern)-Cyan $(modern)-Green $(modern)-Dark $(modern)-Light
	@zip -r $(BIN_DIR)/$(original)-Windows.zip $(original)-Yellow-Windows  $(original)-Orange-Windows  $(original)-Red-Windows  $(original)-Magenta-Windows  $(original)-Violet-Windows  $(original)-Blue-Windows  $(original)-Cyan-Windows  $(original)-Green-Windows  $(original)-Dark-Windows $(original)-Light-Windows
	#
	# Bibata.tar.gz
	#
	@tar -czvf $(BIN_DIR)/Bibata.tar.gz --exclude='*-Windows' *
	@cd ..
