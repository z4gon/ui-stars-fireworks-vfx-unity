Shader "UI/Rainbow"
{
    Properties
    {
        _MainTex ("Sprite Texture", 2D) = "white" {}
        _RainbowTexture("Rainbow Texture", 2D) = "white" {}
        _RainbowVelocity("Rainbow Velocity", Float) = 1
        _RainbowIntensity("Rainbow Intensity", Float) = 3
    }
    SubShader
    {
        Tags {
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }

        Cull Off
        ZWrite Off
        ZTest [unity_GUIZTestMode]
        Lighting Off

        Blend One One

        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float2 uv_Rainbow : TEXCOORD1;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST; // ST means scale and transform
            sampler2D _RainbowTexture;
            float4 _RainbowTexture_ST;

            float _RainbowVelocity;
            float _RainbowIntensity;

            v2f vert (appdata IN)
            {
                v2f OUT;
                OUT.vertex = UnityObjectToClipPos(IN.vertex);
                OUT.uv = TRANSFORM_TEX(IN.uv, _MainTex);
                OUT.uv_Rainbow = TRANSFORM_TEX(IN.uv, _RainbowTexture);
                return OUT;
            }

            fixed4 frag (v2f IN) : SV_Target
            {
                // animate uvs for rainbow
                float2 rainbowUV = frac(IN.uv_Rainbow + (_Time.y * _RainbowVelocity));

                // sample the texture
                fixed4 spriteColor = tex2D(_MainTex, IN.uv);
                fixed4 rainbowColor = tex2D(_RainbowTexture, rainbowUV);

                fixed4 multipliedColor = spriteColor + (rainbowColor * _RainbowIntensity); // multiply
                multipliedColor *= spriteColor.a; // so that the blendind one one works ok

                return multipliedColor;
            }

            ENDCG
        }
    }
}
