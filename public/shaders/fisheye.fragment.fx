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

    // calculate scaled model uv within range -1 to 1
    vec2 scaled_model_uv = model_uv * 2.0 - 1.0;

    // calculate theta
    float theta = atan(scaled_model_uv.y, scaled_model_uv.x);

    // radius = mag of text coord, raised to 1.5
    float radius = pow(length(scaled_model_uv), 1.5);

    // fish eye texture coordinate
    vec2 fish_eye_texture_coordinate = vec2(cos(theta) * radius, sin(theta) * radius);

    // fish eye uv
    vec2 fish_eye_uv = 0.5 * (fish_eye_texture_coordinate + 1.0);

    // set fish eye uv
    FragColor = texture(image, fish_eye_uv);

}
