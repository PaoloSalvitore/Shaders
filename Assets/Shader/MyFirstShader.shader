Shader "Unlit/MyFirstShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
     //   _MyFloat ("A floating point number", float) =4

    }
    SubShader
    {
        Tags
        {
            "RenderType"="Opaque"
        }


        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
           

            #include "UnityCG.cginc"

            struct appdata //input for the vertex shader
            {               
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normal : NORMAL  ;
            };
                        //output for the vertex shader
            struct v2f //input for the frag shader
            {
                float2 uv : TEXCOORD0; //delete fog section here
                float4 vertex : SV_POSITION;
                float3 normal : TEXTCOORD1;
            };

            sampler2D _MainTex; //Image data coming through (sampler2D)
            float4 _MainTex_ST; // 

            //float = 7
            //float2 = 7,3
            //float3 = 1, 2, 3
            //float4 = 4, 2, 1, 0
            //Numbered floats are like Vectors in unity, a container of multiple floats*

            //float4x4
            
            //half
            //half2
            //half3
            //half4
            
            //fixed1 -2 to 2
            //fixed2 //normally values 0-1 (for shaders, normally use 0-1 values
            //fixed3 
            //fixed4

            
            void myFunction()
            {

                
            }
            
            
            
            
            v2f vert (appdata v) 
            {
                v2f o; // dont have to initialise it (new v2f o;)
              //v.vertex.x += sin(_Time.y * 30) *3;
             //   v.vertex.xy += v.uv*2;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }
            //you can use float4 for 4 floats, to represent the RGBA (Red, Green, Blue & Alpha(Transparency))
            //UV in here can be seen as like an X, and Y, or a 0, and 1
            //per texel
            float4 frag (v2f i) : SV_Target
            {
                // sample the texture
                float4 col = tex2D(_MainTex, i.uv); //grabs the UV and the texture sample

                col = float4(i.uv, 0.5614, 1); //Because uv is already a float(with 2 values), the first 2 slots of uv will be filled out
                /*float myVal = col.G;
                myVal = col.Y;
                myVal = col[1];
                myVal = col.v;*/
                return col;
            }
            ENDCG
        }
    }
}