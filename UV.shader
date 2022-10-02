Shader "Custom/UV"
{
    Properties
    {
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _UVmove("UImove", Range(0,1)) = 0.5
        _UVSpeed("UISpeed", Range(0,5)) = 1
    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }

        CGPROGRAM

        #pragma surface surf Standard 

        sampler2D _MainTex;
        float _UVmove;
        float _UVSpeed;

        struct Input
        {
            float2 uv_MainTex;
        };


        UNITY_INSTANCING_BUFFER_START(Props)

        UNITY_INSTANCING_BUFFER_END(Props)

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D(_MainTex, float2(IN.uv_MainTex.x, IN.uv_MainTex.y+_Time.y*_UVSpeed));
            o.Emission = float3(IN.uv_MainTex.x, IN.uv_MainTex.y+_Time.y, 0);
            //o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
        FallBack "Diffuse"
}
