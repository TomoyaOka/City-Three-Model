precision mediump float;
#include <common>
#include <lights_pars_begin>

varying float vNoise;
varying vec2 vUv;
uniform sampler2D uTexture;
uniform float uImageAspect;
uniform float uPlaneAspect;
uniform vec3 uColor;
uniform float uPercent;
varying vec3 vNormal;

void main() {
  //ライトの定義
  float NdotL = dot(vNormal, directionalLights[0].direction);
  float NdotL02 = dot(vNormal, directionalLights[1].direction);

  float lightIntensity = smoothstep(0.0, 0.1, NdotL);
  float lightIntensity02 = smoothstep(0.0, 0.1, NdotL02);

  vec3 directionalLight = directionalLights[0].color * lightIntensity;
  vec3 directionalLight02 = directionalLights[1].color * lightIntensity02;
     
  //本体カラーの定義
  vec3 color1 = vec3(0.3,0.5,0.5);
  vec3 color2 = vec3(0.5,0.45,0.2); 
  vec3 finalColor = mix(color1,color2,0.2*(vNoise * 10.0));

  //最終的な定義
  gl_FragColor = vec4(uColor * (ambientLightColor + directionalLight + directionalLight02), 1.0) * vec4(finalColor, 1.0);
}

