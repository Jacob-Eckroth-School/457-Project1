#version 330 compatibility

out vec3  vMCposition;

out vec2 vST;

out vec3 vColor;
out vec3 vN; // normal vector
out vec3 vL; // vector from point to light
out vec3 vE; // vector from point to eye
const vec3 LIGHTPOSITION   = vec3( -2., 0., 10. );

void
main( )
{
	vST = gl_MultiTexCoord0.st;
	vColor = gl_Color.rgb;
	
	vec3 ECposition = vec3( gl_ModelViewMatrix * gl_Vertex );
	

	vN = normalize( gl_NormalMatrix * gl_Normal ); // normal vector
	vL = LIGHTPOSITION - ECposition.xyz; // vector from the point
// to the light position
	vE = vec3( 0., 0., 0. ) - ECposition.xyz; // vector from the point


	vMCposition  = gl_Vertex.xyz;
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
}