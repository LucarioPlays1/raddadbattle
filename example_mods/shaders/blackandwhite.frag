//SHADERTOY PORT FIX (thx bb)
#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main
//SHADERTOY PORT FIX


void main(void){
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord.xy / iResolution.xy;

    vec4 tex = texture(iChannel0, uv);
    vec3 greyScale = vec3(.5, .5, .5);
    fragColor = vec4( vec3(dot( tex.rgb, greyScale)), tex.a);

}