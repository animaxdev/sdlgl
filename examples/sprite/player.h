#ifndef PLAYER_H
#define PLAYER_H

#include "../../game/entity.h"
#include "../../game/scene.h"
#include "../../graphics/sprite.h"
#include "../../graphics/texture.h"

class Player : public Entity {

	int x, y;
	enum { UP, DOWN, LEFT, RIGHT, STANDING } dir;
	Sprite sprites[4];
	Texture standing_texture;

public:

	Player(Scene *scene, int x, int y);
	void update();
	void render();

};

#endif