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
	//stripes
	vec2 uv = gl_FragCoord.xy / u_resolution;
	
	float stripe = mod(floor(uv.y * 250.0), 2.0) / 20.0;
	
	vec4 color = vec4(max(v_vColour.xyz - stripe, 0.0), v_vColour.w);
	
	//bulge
	uv.x -= ((u_winResolution.x - u_resolution.x) / 2.0) / u_resolution.x;
	uv.y -= ((u_winResolution.y - u_resolution.y) / 2.0) / u_resolution.y;
	vec2 v = (uv - vec2(.5));
	
	float amount = u_bulge;
	
    uv = uv + distort(v, amount);
	gl_FragColor = color * texture2D(u_texture, uv);
}