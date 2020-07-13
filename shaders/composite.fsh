
uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D colortex2;
uniform sampler2D colortex3;
uniform sampler2D colortex4;
uniform sampler2D colortex5;
uniform sampler2D colortex6;
uniform sampler2D colortex7;

uniform float viewWidth;
uniform float viewHeight;
varying vec4 texCoord;
vec2 Resolution = vec2(viewWidth, viewHeight);
vec2 fragCoord = texCoord * Resolution;

void main()
{
	vec4 color = texture2D(colortex0, texCoord);
	float gray = length(color.rgb);
	gl_FragData[0] = color;
	gl_FragData[1] = vec4(pow(length(vec2(dFdx(gray), dFdy(gray))), 0.5));
	gl_FragData[2] = texelFetch(colortex4, ivec2(fragCoord), 0);
}