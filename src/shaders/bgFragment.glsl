precision mediump float;
#include <common>
#include <lights_pars_begin>

varying float vNoise;
uniform vec3 uColor;
varying vec3 vNormal;

void main() {

  //light関係の設定
  float NdotL = dot(vNormal, directionalLights[0].direction);
  float lightIntensity = smoothstep(0.0, 0.01, NdotL);
  vec3 directionalLight = directionalLights[0].color * lightIntensity;
  //mix関数で使う色などの定義
  vec3 color1 = vec3(0.1,0.0,0.0);
  vec3 color2 = vec3(0.0,0.0,0.0); 
  vec3 finalColor = mix(color1,color2,0.12*(vNoise * 8.0));

  //最終的に反映する定義などを指定
  gl_FragColor = vec4(uColor * (ambientLightColor + directionalLight), 1.0) * vec4(finalColor, 1.0) + vec4(vNoise);
}