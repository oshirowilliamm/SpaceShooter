//tamanho do tiro volta ao normal
image_xscale = lerp(image_xscale, 1, .1);
image_yscale = lerp(image_yscale, 1, .1);

//aumenta velocidade
vspeed = lerp(vspeed, -10, .1);