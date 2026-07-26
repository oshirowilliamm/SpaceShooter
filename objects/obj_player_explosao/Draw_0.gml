draw_self();

gpu_set_blendmode(bm_add);

var _escala = 1.2;
draw_sprite_ext(sprite_index, image_index, x, y, _escala, _escala, image_angle, c_fuchsia, .4);

gpu_set_blendmode(bm_normal);