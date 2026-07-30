//aumentando escala
image_xscale = 1.2;
image_yscale = image_xscale;

tempo_perder = game_get_speed(gamespeed_fps) * 5;
timer_perder = tempo_perder;

morrendo = function()
{
    //morrendo se o escudo voltar
    if (image_index <= 1 && image_speed < 0)
    {
        instance_destroy();
    }
}

perdendo_escudo = function()
{
    timer_perder--;
    
    if (timer_perder <= 0)
    {
        //perdendo escudo
        image_speed = -0.5;
        
        //som de escudo abaixando
        som(snd_escudo_down);
        
        timer_perder = tempo_perder;
    }
}