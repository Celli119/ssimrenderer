#version 330

noperspective out vec2 vTextureCoord;

uniform vec2 uLeftBottomCorner;
uniform vec2 uRightTopCorner;

void main()
{
    if (gl_VertexID == 0) {
        vTextureCoord = vec2(uLeftBottomCorner.x, uLeftBottomCorner.y);
        gl_Position = vec4(-1, -1, 0, 1);
    }
    if (gl_VertexID == 1) {
        vTextureCoord = vec2(uRightTopCorner.x, uLeftBottomCorner.y);
        gl_Position = vec4(1, -1, 0, 1);
    }
    if (gl_VertexID == 2) {
        vTextureCoord = vec2(uRightTopCorner.x, uRightTopCorner.y);
        gl_Position = vec4(1, 1, 0, 1);
    }
    if (gl_VertexID == 3) {
        vTextureCoord = vec2(uRightTopCorner.x, uRightTopCorner.y);
        gl_Position = vec4(1, 1, 0, 1);
    }
    if (gl_VertexID == 4) {
        vTextureCoord = vec2(uLeftBottomCorner.x, uRightTopCorner.y);
        gl_Position = vec4(-1, 1, 0, 1);
    }
    if (gl_VertexID == 5) {
        vTextureCoord = vec2(uLeftBottomCorner.x, uLeftBottomCorner.y);
        gl_Position = vec4(-1, -1, 0, 1);
    }
}
