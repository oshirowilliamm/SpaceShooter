controles();
usa_escudo();

//escudo me segue
if (instance_exists(meu_escudo))
{
    meu_escudo.x = x;
    meu_escudo.y = y;
}
//se n tem escudo, volta a ser noone
else
{
    meu_escudo = noone
}


//perdendo vida com enter
if (keyboard_check_pressed(vk_enter))
{
    perde_vida();
}



//mudando level do tiro
if (keyboard_check_pressed(ord("O")))
{
    if (level_tiro > 1) level_tiro--;
}
if (keyboard_check_pressed(ord("L")))
{
    if (level_tiro < 3) level_tiro++;
}

//ativando debug
if (keyboard_check_pressed(vk_tab))
{
    global.debug = !global.debug;
}