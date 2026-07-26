//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    //desenhando a sprite branca
    vec4 cor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    cor.rgb = vec3(1.0, 1.0, 1.0);
    
    //desenha sprite normalmente
    gl_FragColor = cor;
}
