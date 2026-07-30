//efeito de brilho
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_xscale, image_angle, cor, image_alpha);
gpu_set_blendmode(bm_normal);