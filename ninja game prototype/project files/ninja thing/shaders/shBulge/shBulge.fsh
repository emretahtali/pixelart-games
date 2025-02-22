//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_winResolution;
uniform vec2 u_resolution;
uniform sampler2D u_texture;
uniform float u_bulge;
uniform float u_bulge_dir;

vec2 distort(vec2 _r, float alpha)
{
	return _r * -alpha * abs((1.0 + u_bulge_dir) - dot(_r, _r));
}

void main()
{
	vec2 uv = gl_FragCoord.xy / u_resolution.xy;
	uv.x -= ((u_winResolution.x - u_resolution.x) / 2.0) / u_resolution.x;
	uv.y -= ((u_winResolution.y - u_resolution.y) / 2.0) / u_resolution.y;
	vec2 v = (uv - vec2(.5));
	
	float amount = u_bulge;
	
    uv = uv + distort(v, amount);
	gl_FragColor = texture2D(u_texture, uv);
}

/*
vec2 distort(vec2 r, float alpha)
{
    return r * -alpha * (1.0 - dot(r, r));
   
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    uv.x *= (1920.0/1080.0);
    vec2 v = (uv - vec2(.5 * 1920.0/1080.0, .5));
    vec4 m = iMouse / iResolution.xxxx;
    
    float bulge = 1.5;
    
    //float amount = m.x;
    float amount = (sin(bulge) * .5 ) ;
        
    uv = uv + distort(v, amount);
	fragColor = texture(iChannel0, uv);
}*/