draw_self();

//variaveis de efeito
var _escala = 1.8;

//efeito de brilho
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, _escala, _escala, image_angle, cor, .5);
gpu_set_blendmode(bm_normal);