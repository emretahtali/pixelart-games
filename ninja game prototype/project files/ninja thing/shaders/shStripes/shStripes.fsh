//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_resolution;

vec3 hsv2rgb(vec3 c) 
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

void main()
{
	vec2 uv = gl_FragCoord.xy / u_resolution;
	
	float stripe = mod(floor(uv.y * 250.0), 2.0) / 30.0;
	
	vec4 base_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	//vec4 color = vec4(max(base_color.xyz - stripe, 0.0), base_color.w);
	vec3 color_hsv = rgb2hsv(base_color.xyz);
	vec3 color_rgb = hsv2rgb(vec3(max(color_hsv.x + stripe * 10.0, 0.0), color_hsv.y, color_hsv.z/*max(color_hsv.z - stripe, 0.0)*/));
	
	vec4 color = vec4(color_rgb, base_color.w);
	
    gl_FragColor = color;
}