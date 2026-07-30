if (global.hitstop) exit;

//desaparecendo
image_alpha -= .1;

//diminuindo tamanho
image_xscale -= .05;
image_xscale = clamp(image_xscale, 0, image_xscale);

//destruindo
if (image_alpha <= 0)
{
    instance_destroy();
}