.DEFAULT_GOAL := lib
SHELL := /bin/bash

CC = g++
FLAGS = -c -std=c++11 -g3 -Wall
FILES = audio/sound \
		audio/track \
		game/clock \
		game/timer \
		game/scene \
		game/entity \
		game/physical_entity \
		graphics/graphics \
		graphics/resources \
		graphics/font_renderer \
		graphics/fps_counter \
		graphics/sprite \
		graphics/texture \
		input/inputs \
		ui/fps_display \
		ui/entity_count \
		collision/hitbox \
		collision/collider 

OUTPUT = $(FILES:%=build/%.o)

clean:
	rm -rf build


lib: directories lib_compile;


directories:
	mkdir -p build
	mkdir -p build/audio
	mkdir -p build/game
	mkdir -p build/graphics
	mkdir -p build/input
	mkdir -p build/ui
	mkdir -p build/collision


lib_compile: $(OUTPUT)
	ar rcs build/libsdlgl.a $(OUTPUT)

install:
	sudo cp build/libsdlgl.a /usr/lib/libsdlgl.a
	sudo rm -rf /usr/include/sdlgl
	sudo mkdir /usr/include/sdlgl
	sudo cp -r * /usr/include/sdlgl


.SECONDEXPANSION:
$(OUTPUT) : %.o : $$(subst .o,.cpp,$$(subst build/,,$$@))
	$(eval SOURCE := $@)
	$(eval SOURCE := $(SOURCE:build/%=%))
	$(eval SOURCE := $(SOURCE:%.o=%.cpp))
	$(CC) $(FLAGS) $(SOURCE) -o $@
