#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// slider min 0, max 1
uniform float slider;

// Output
out vec4 FragColor;

void main() {
    // Color
    FragColor = texture(image, model_uv);

    // isolate color vector
    vec3 color = FragColor.rgb;

    // isolate each component and increase warm tones
    float r = color.r + slider;
    float g = color.g + 0.2 * slider;
    float b = color.b;

    // set color
    FragColor.rgb = vec3(r, g, b);
}
