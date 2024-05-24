#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    FragColor = texture(image, model_uv);

    // calculate luminance
    float luminance = 0.299 * FragColor.r + 0.587 * FragColor.g + 0.114 * FragColor.b;

    // insert luminance for r, g, b
    FragColor = vec4(vec3(luminance, luminance, luminance), 1.0);
}
