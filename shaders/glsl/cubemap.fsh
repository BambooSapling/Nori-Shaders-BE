#version 310 es
#include "uniformPerFrameConstants.h"
precision highp float;
in vec3 sunc;
in vec3 moonc;
in vec3 zcol;
in vec3 cpos;
in vec3 lpos;
in vec3 tlpos;
#include "shader_settings.txt"
#include "common.glsl"
out vec4 fragcol;
void main(){
	fragcol = vec4(0.0, 0.0, 0.0, 1.0);
	vec3 ajp = normalize(vec3(cpos.x, -cpos.y + 0.128, -cpos.z));
	fragcol.rgb = csky(ajp, lpos, sunc, moonc);
	vec4 vc = ccv(ajp, tlpos, sunc, moonc, zcol, bayer8(gl_FragCoord.xy));
	fragcol.rgb = fragcol.rgb * vc.a + vc.rgb;
	fragcol.rgb = colc(fragcol.rgb);
}
