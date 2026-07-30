timer_hitstop = 0;

//pegando os backgrounds
lista_bgs = pega_backgrounds();

bgs_hspeed = [];
bgs_vspeed = [];

desfaz_hitstop = function()
{
    //se n ta tendo hitstop
    if (!global.hitstop) return;
    
    timer_hitstop--;
    
    //parando animação
    with (all) 
    {
    	image_speed = 0;
    }
    
    //resetando timer
    if (timer_hitstop <= 0)
    {
        global.hitstop = false;
        
        //destravando o background
        destrava_backgrounds(lista_bgs, bgs_hspeed, bgs_vspeed);
        
        //parando as animações
        with (all)
        {
            image_speed = 1;
        }
    }
}