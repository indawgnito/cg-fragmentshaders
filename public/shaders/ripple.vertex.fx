#version 300 es
precision highp float;

// Attributes
in vec3 position;
in vec2 uv;

// Uniforms
uniform float time;

// Output
out vec2 model_uv;

void main() {
    // Pass UV coordinate onto the fragment shader
    model_uv = uv;

    // Don't transform - expecting a fullscreen quad in 2D screen-space 
    gl_Position = vec4(position, 1.0);

    // scale texture coordinate such that it is in the range [-1.0, 1.0];
    vec2 scaled_model_uv = model_uv * 2.0 - 1.0;
 
    // calculate radius
    float radius = length(scaled_model_uv);

    // calculate a texture coordinate offset
    vec2 texture_coordinate_offset = scaled_model_uv * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;

    // calculate final texture coordinate
    model_uv = model_uv + texture_coordinate_offset;
}
