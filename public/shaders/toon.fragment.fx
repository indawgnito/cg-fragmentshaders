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

    // color components
    vec3 color = FragColor.rgb;
    
    // isolate r, g, b and round them
    float r = floor(color.r * 4.0) / 4.0;
    float g = floor(color.g * 4.0) / 4.0;
    float b = floor(color.b * 4.0) / 4.0;

    // output the toon color
    FragColor.rgb = vec3(r, g, b);
}
