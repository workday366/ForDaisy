#version 100

precision mediump float;
precision mediump int;

attribute vec4 bl_Vertex;
attribute vec3 bl_Normal;
uniform mat4 bl_ModelViewMatrix;
uniform mat4 bl_ProjectionMatrix;
uniform mat3 bl_NormalMatrix;
attribute vec2 att0;
uniform int att0_info;
varying vec2 var0;
attribute vec4 att1;
uniform int att1_info;
varying vec4 var1;



varying vec3 varposition;
varying vec3 varnormal;




/* Color, keep attribute sync with: gpu_shader_vertex_world.glsl */

float srgb_to_linearrgb(float c)
{
	if (c < 0.04045)
		return (c < 0.0) ? 0.0 : c * (1.0 / 12.92);
	else
		return pow((c + 0.055) * (1.0 / 1.055), 2.4);
}

void srgb_to_linearrgb(vec3 col_from, varying vec3 col_to)
{
	col_to.r = srgb_to_linearrgb(col_from.r);
	col_to.g = srgb_to_linearrgb(col_from.g);
	col_to.b = srgb_to_linearrgb(col_from.b);
}

void srgb_to_linearrgb(vec4 col_from, varying vec4 col_to)
{
	col_to.r = srgb_to_linearrgb(col_from.r);
	col_to.g = srgb_to_linearrgb(col_from.g);
	col_to.b = srgb_to_linearrgb(col_from.b);
	col_to.a = col_from.a;
}

bool is_srgb(int info)
{
#ifdef USE_NEW_SHADING
	return (info == 1)? true: false;
#else
	return false;
#endif
}

void set_var_from_attr(float attr, int info, varying float var)
{
	var = attr;
}

void set_var_from_attr(vec2 attr, int info, varying vec2 var)
{
	var = attr;
}

void set_var_from_attr(vec3 attr, int info, varying vec3 var)
{
	if (is_srgb(info)) {
		srgb_to_linearrgb(attr, var);
	}
	else {
		var = attr;
	}
}

void set_var_from_attr(vec4 attr, int info, varying vec4 var)
{
	if (is_srgb(info)) {
		srgb_to_linearrgb(attr, var);
	}
	else {
		var = attr;
	}
}

/* end color code */


void main()
{

	vec4 position = bl_Vertex;
	vec3 normal = bl_Normal;


	vec4 co = bl_ModelViewMatrix * position;

	varposition = co.xyz;
	varnormal = normalize(bl_NormalMatrix * normal);
	gl_Position = bl_ProjectionMatrix * co;

 


	set_var_from_attr(att0, att0_info, var0);
	var1.xyz = normalize(bl_NormalMatrix * att1.xyz);
	var1.w = att1.w;
}
