#version 330 core

out vec4 FragColor;

in vec3 FragPos;
in vec3 Normal;

uniform vec3 lightDir;  // Directional light direction (towards light)
uniform vec3 viewPos;
uniform vec4 uColor;

void main()
{
    // Ambient
    vec3 ambient = 1.2 * uColor.rgb;

    // Diffuse
    vec3 norm = normalize(Normal);
    float diff = max(dot(norm, -lightDir), 0.0);
    vec3 diffuse = diff * uColor.rgb;

    // Specular
    vec3 viewDir = normalize(viewPos - FragPos);
    vec3 reflectDir = reflect(lightDir, norm);  // here lightDir, not -lightDir
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32.0);
    vec3 specular = vec3(0.5) * spec;

    vec3 result = ambient + diffuse + specular;
    FragColor = vec4(result, uColor.a);
}
