Shader "HoToon/HalfToon_Outline"
{
    Properties
    {
        [Header(Base)]
        [NoScaleOffset] _MainTex ("主贴图", 2D) = "white" {}
        _Cutoff ("Alpha 裁剪", Range(0,1)) = 0.5
        _Color ("基础颜色", Color) = (1,1,1,1)
        [NoScaleOffset]_NormalMap ("法线贴图", 2D) = "bump" {}
        _NormalStength ("法线强度", Range(-1,1)) = 0.2

        [Space][Space][Space][Space][Space]

        [Header(PixelSettings)]
        [Header(WARNING_Set_Texture_Compression_To_None)]
        [Header(WARNING_Check_Texture_Filter_Mode)]
        [NoScaleOffset]_HalftoneTex ("网点图案", 2D) = "gray" {}
        _HalftoneScale ("网点缩放", Range(0.1,100)) = 0.1
        [Space]
        [Header(Halftone_Camera_Scaling)]
        [Toggle] _HalftoneCameraScale ("启用相机缩放", Float) = 0
        _HalftoneCameraRefDistance ("参考距离", Range(0.01,50)) = 2
        _HalftoneCameraScaleStrength ("距离缩放强度", Range(0,1)) = 1
        _HalftoneCameraScaleMin ("缩放下限", Range(0.05,1)) = 0.25
        _HalftoneCameraScaleMax ("缩放上限", Range(1,8)) = 4
        [Space]
        [Enum(Screen,0,ObjSpaceTriplanar,1,UVLightMap,2,UV0,3,UV1,4)] _PixelSpace ("像素空间", Float) = 1
        _GlobalPixelSize ("全局像素尺寸", Range(1,8192)) = 8192
        _HalftoneStrength ("网点强度", Range(0,1)) = 0.3

        [Space][Space][Space][Space][Space]

        [Header(Base_Lighting)]
        _ColorLevels ("色阶数量",Float) = 5
        _ShadowColor ("阴影颜色", Color) = (0.3,0.3,0.35,1)
        _MidColor ("中间色", Color) = (0.7,0.7,0.75,1)
        _LightColor ("亮部颜色", Color) = (1,1,1,1)
        _threshold1 ("光照阈值 1", Range(0,1)) = 0.3
        _threshold2 ("光照阈值 2", Range(0,1)) = 1
        _ShadowCasting ("阴影影响强度", Range(0,1)) = 1

        [Space][Space][Space][Space][Space]
        
        [Header(Highlights)]
        _Highlight ("高光强度", Range(0,1)) = 1
        _HighlightColor ("高光颜色", Color) = (1,1,1,1)
        _HightlightThreshold ("高光阈值", Range(0,1)) = 0.9
        _HighlightSoft("高光柔和",Range(0,1)) = 0.3

        [Space][Space][Space][Space][Space]

        [Header(Rim)]
        _Rim ("边缘光强度", Range(0,1)) = 0
        _RimThreshold ("边缘光阈值", Range(0,1)) = 0.8
        _RimSoft("边缘光柔和",Range(0,1)) = 0.2
        _RimColorInner ("边缘光内侧颜色", Color) = (1,1,1,1)
        _RimColorOuter ("边缘光外侧颜色", Color) = (1,1,1,1)
        [Toggle] _RimInvert ("反转边缘光", Float) = 0

        [Space][Space][Space][Space][Space]

        [Header(Matcap)]
        _Matcap("Matcap 强度",Range(0,1)) = 0
        _MatcapExposure("Matcap 曝光",range(0,100)) = 1
        _MatcapPow("Matcap 幂次",range(0,3)) = 1
        _MatcapColor ("Matcap 颜色", Color) = (1,1,1,1)
        [NoScaleOffset] _MatcapTex ("Matcap 贴图", 2D) = "black" {}

        [Space][Space][Space][Space][Space]

        [Header(Outline)]
        _OutlineWidth ("描边宽度", Range(0,0.05)) = 0.005
        _OutlineColor ("描边颜色", Color) = (0,0,0,1)
        [NoScaleOffset]_OutlineMask ("描边遮罩", 2D) = "white" {}

        [Space][Space][Space][Space][Space]

        [Header(Effects)]
        _ExtraLight("额外光强度",Range(0,1)) = 0
        _ExtraLightRotation ("额外光旋转", Vector) = (0,0,0,0)
        _ExtraLight_ShadowColor ("额外光阴影颜色", Color) = (0,1,0,0)
        _ExtraLight_MidColor ("额外光中间色", Color) = (0.7,0.7,0.75,1)
        _ExtraLight_LightColor ("额外光亮部颜色", Color) = (1,1,1,1)
        _ExtraLight_Threshold1 ("额外光阈值 1", Range(0,1)) = 0.4
        _ExtraLight_Threshold2 ("额外光阈值 2", Range(0,1)) = 0.75

        [Space][Space][Space][Space][Space]

        [Header(MainPass)]
        [Enum(UnityEngine.Rendering.BlendOp)]  _BlendOp  ("BlendOp", Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("SrcBlend", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("DstBlend", Float) = 0
        [Enum(Off, 0, On, 1)]_ZWriteMode ("ZWriteMode", float) = 1
        [Enum(UnityEngine.Rendering.CullMode)]_CullMode ("CullMode", float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)]_ZTestMode ("ZTestMode", Float) = 4
        [Enum(UnityEngine.Rendering.ColorWriteMask)]_ColorMask ("ColorMask", Float) = 15
        [Header(Stencil)]
        [Enum(UnityEngine.Rendering.CompareFunction)]_StencilComp ("Comp", Float) = 8
        [IntRange]_StencilWriteMask ("WriteMask", Range(0,255)) = 255
        [IntRange]_StencilReadMask ("ReadMask", Range(0,255)) = 255
        [IntRange]_Stencil ("ref", Range(0,255)) = 0
        [Enum(UnityEngine.Rendering.StencilOp)]_StencilPass ("Pass", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)]_StencilFail ("Fail", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)]_StencilZFail ("ZFail", Float) = 0

        [Space][Space][Space][Space][Space]

        [Header(OutLinePass)]
        [Enum(UnityEngine.Rendering.BlendOp)]  _OutlineBlendOp  ("BlendOp", Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] _OutlineSrcBlend ("SrcBlend", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _OutlineDstBlend ("DstBlend", Float) = 0
        [Enum(Off, 0, On, 1)]_OutlineZWriteMode ("ZWriteMode", float) = 1
        [Enum(UnityEngine.Rendering.CullMode)]_OutlineCull ("CullMode", float) = 1
        [Enum(UnityEngine.Rendering.CompareFunction)]_OutlineZTestMode ("ZTestMode", Float) = 4
        [Enum(UnityEngine.Rendering.ColorWriteMask)]_OutlineColorMask ("ColorMask", Float) = 15
        [Header(Stencil)]
        [Enum(UnityEngine.Rendering.CompareFunction)]_OutlineStencilComp ("Comp", Float) = 8
        [IntRange]_OutlineStencilWriteMask ("WriteMask", Range(0,255)) = 255
        [IntRange]_OutlineStencilReadMask ("ReadMask", Range(0,255)) = 255
        [IntRange]_OutlineStencil ("ref", Range(0,255)) = 0
        [Enum(UnityEngine.Rendering.StencilOp)]_OutlineStencilPass ("Pass", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)]_OutlineStencilFail ("Fail", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)]_OutlineStencilZFail ("ZFail", Float) = 0

    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        // =====================================================
        // OUTLINE PASS
        // =====================================================
        Pass
        {
            Name "OUTLINE"
            Tags { "LightMode"="Always" }

            Cull [_OutlineCull]
            Offset 1,1//防止zfighting
            BlendOp [_OutlineBlendOp]
            Blend [_OutlineSrcBlend] [_OutlineDstBlend]
            ZWrite [_OutlineZWriteMode]
            ZTest [_OutlineZTestMode]
            ColorMask [_OutlineColorMask]

            Stencil
            {
                Ref [_OutlineStencil]
                Comp [_OutlineStencilComp]
                ReadMask [_OutlineStencilReadMask]
                WriteMask [_OutlineStencilWriteMask]
                Pass [_OutlineStencilPass]
                Fail [_OutlineStencilFail]
                ZFail [_OutlineStencilZFail]
            }

            CGPROGRAM
            #pragma vertex vertOutline
            #pragma fragment fragOutline
            #include "UnityCG.cginc"

            sampler2D _OutlineMask;
            float4 _OutlineMask_ST;

            float _OutlineWidth;
            float4 _OutlineColor;

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vertOutline(appdata v)
            {
                v2f o;

                // 转到 View Space,视图空间防止扩背面
                float4 viewPos = mul(UNITY_MATRIX_MV, v.vertex);
                float3 viewNormal = normalize(mul((float3x3)UNITY_MATRIX_IT_MV, v.normal));

                // 只在轮廓区域扩张
                // viewNormal.z ≈ 0 → 轮廓面
                float outlineFactor = saturate(1.0 - abs(viewNormal.z));

                // 只沿屏幕XY方向偏移
                float2 offsetDir = normalize(viewNormal.xy + 1e-6);

                viewPos.xy += offsetDir * _OutlineWidth * outlineFactor;

                o.pos = mul(UNITY_MATRIX_P, viewPos);
                o.uv = TRANSFORM_TEX(v.uv, _OutlineMask);

                return o;
            }

            fixed4 fragOutline(v2f i) : SV_Target
            {
                clip(_OutlineWidth - 0.0001);// fix 0 width
                float mask = tex2D(_OutlineMask, i.uv).r;

                return float4(_OutlineColor.rgb, _OutlineColor.a * mask);
            }

            ENDCG
        }

        //=====================================================
        // TOON
        //=====================================================

        Pass
        {
            Tags { "LightMode"="ForwardBase" }

            Cull [_CullMode]
            BlendOp [_BlendOp]
            Blend [_SrcBlend] [_DstBlend]
            ZWrite [_ZWriteMode]
            ZTest [_ZTestMode]
            ColorMask [_ColorMask]

            Stencil
            {
                Ref [_Stencil]
                Comp [_StencilComp]
                ReadMask [_StencilReadMask]
                WriteMask [_StencilWriteMask]
                Pass [_StencilPass]
                Fail [_StencilFail]
                ZFail [_StencilZFail]
            }

            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdbase

            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "AutoLight.cginc"

            sampler2D _MainTex;
            float4 _MainTex_ST;

            sampler2D _NormalMap;
            float _NormalStength;

            float _Cutoff;

            float _GlobalPixelSize;
            float _PixelSpace;
            float _HalftoneStrength;
            sampler2D _HalftoneTex;
            float4 _HalftoneTex_ST;
            float _HalftoneScale;
            float _HalftoneCameraScale;
            float _HalftoneCameraRefDistance;
            float _HalftoneCameraScaleStrength;
            float _HalftoneCameraScaleMin;
            float _HalftoneCameraScaleMax;

            float4 _Color;
            float _ColorLevels;
            float4 _ShadowColor;
            float4 _MidColor;
            float4 _LightColor;
            float _threshold1;
            float _threshold2;


            float _ShadowCasting;

            float _Highlight;
            float4 _HighlightColor;
            float _HightlightThreshold;
            float _HighlightSoft;

            float _Rim;
            float4 _RimColor;
            float _RimThreshold;
            float _RimSoft;
            float4 _RimColorInner;
            float4 _RimColorOuter;
            float _RimInvert;

            sampler2D _MatcapTex;
            float4 _MatcapColor;
            float _MatcapExposure;
            float _MatcapPow;
            float _Matcap;

            float _ExtraLight;
            float3 _ExtraLightRotation;
            float3 _ExtraLightDirection;
            float4 _ExtraLight_ShadowColor;
            float4 _ExtraLight_MidColor;
            float4 _ExtraLight_LightColor;
            float _ExtraLight_Threshold1;
            float _ExtraLight_Threshold2;

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float4 pos : SV_POSITION;
                float3 worldNormal : TEXCOORD2;
                float4 screenPos : TEXCOORD3;
                float3 worldPos : TEXCOORD4;
                float3 objectPos : TEXCOORD5;
                float3 objectNormal : TEXCOORD6; 
                SHADOW_COORDS(7)
            };

            v2f vert(appdata v)
            {
                v2f o;

                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv,_MainTex);
                o.uv1 = TRANSFORM_TEX(v.uv1,_MainTex);

                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldPos = mul(unity_ObjectToWorld,v.vertex).xyz;

                o.screenPos = ComputeScreenPos(o.pos);

                o.objectPos = v.vertex.xyz;
                o.objectNormal = v.normal;

                TRANSFER_SHADOW(o);

                return o;
            }

            
            float GetHalftoneCameraScale(float3 worldPos, float screenSpaceMode)
            {
                float cameraDistance = max(distance(_WorldSpaceCameraPos, worldPos), 1e-4);
                float referenceDistance = max(_HalftoneCameraRefDistance, 1e-4);
                float keepScreenSizeScale = referenceDistance / cameraDistance;
                float mimicSurfaceScale = cameraDistance / referenceDistance;
                float rawScale = lerp(keepScreenSizeScale, mimicSurfaceScale, screenSpaceMode);
                float minScale = min(_HalftoneCameraScaleMin, _HalftoneCameraScaleMax);
                float maxScale = max(_HalftoneCameraScaleMin, _HalftoneCameraScaleMax);
                float clampedScale = clamp(rawScale, minScale, maxScale);

                return lerp(1.0, clampedScale, saturate(_HalftoneCameraScale) * saturate(_HalftoneCameraScaleStrength));
            }

            float SampleHalftone(float2 pixelPos, float cameraScale)
            {
                float2 uv = pixelPos / _GlobalPixelSize;
                uv *= _HalftoneScale * cameraScale;

                return tex2D(_HalftoneTex, uv).r;
            }

            float3 RotateEuler(float3 v, float3 r)
            {
                r = radians(r);

                float3x3 rx = float3x3(
                    1,0,0,
                    0,cos(r.x),-sin(r.x),
                    0,sin(r.x),cos(r.x)
                );

                float3x3 ry = float3x3(
                    cos(r.y),0,sin(r.y),
                    0,1,0,
                    -sin(r.y),0,cos(r.y)
                );

                float3x3 rz = float3x3(
                    cos(r.z),-sin(r.z),0,
                    sin(r.z),cos(r.z),0,
                    0,0,1
                );

                return mul(rx, mul(ry, mul(rz, v)));
            }

            float4 ToonRamp(float t, float4 shadow, float4 mid, float4 light)
            {
                return lerp(
                    lerp(shadow, mid, t * 2),
                    light,
                    saturate(t * 2 - 1)
                );
            }

            float4 SampleMatcap(float3 normal, float Halftone,float exposure,float matcappow)
            {
                float3 viewNormal = mul((float3x3)UNITY_MATRIX_V, normal);
                float2 uv = viewNormal.xy * 0.5 + 0.5;

                float4 mat = tex2D(_MatcapTex, uv);

                // Halftone modulation
                // float lum = dot(mat, float4(0.299,0.587,0.114,1.0));
                float lum = mat.r;
                lum *= exposure;
                lum = pow(lum,matcappow);
                lum += (Halftone - 0.5) * _HalftoneStrength;

                float levels = max(1, floor(_ColorLevels));
                lum = floor(lum * levels) / levels;
                lum = saturate(lum);

                // mat *= lum;

                return _MatcapColor * lum * _Matcap;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                // base

                float4 tex = tex2D(_MainTex,i.uv) * _Color;

                float3 normal = normalize(i.worldNormal);
                float3 normalTex = UnpackNormal(tex2D(_NormalMap,i.uv))*_NormalStength;
                normal = normalize(normal + normalTex);

                float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);
                float3 viewDir = normalize(_WorldSpaceCameraPos - i.worldPos);


                // pixel & Halftone
                float2 pixelPos;
                if (_PixelSpace < 0.5){
                    // Screen
                    float2 screenUV = i.screenPos.xy / i.screenPos.w;
                    float pixelScale = _ScreenParams.x / _GlobalPixelSize;
                    pixelPos = floor(screenUV * _ScreenParams.xy / pixelScale + 0.5);
                }

                else if (_PixelSpace < 1.5){
                    // Object Space Triplanar
                    float pixelSize = 1.0 / _GlobalPixelSize;
                    pixelSize *= 2;

                    float3 p = i.objectPos;
                    float3 n = abs(i.objectNormal);
                    n *= n;
                    n *= n;

                    if (n.z > n.x && n.z > n.y)
                        pixelPos = p.xy;
                    else if (n.x > n.y)
                        pixelPos = p.yz;
                    else
                        pixelPos = p.xz;

                    pixelPos = floor(pixelPos / pixelSize + 0.5);
                }
                else if (_PixelSpace < 2.5){
                    // Lightmap UV
                    float2 lightmapUV = i.uv1 * unity_LightmapST.xy + unity_LightmapST.zw;
                    pixelPos = floor(lightmapUV * _GlobalPixelSize + 0.5);
                }
                else if (_PixelSpace < 3.5){
                    // UV0
                    pixelPos = floor(i.uv * _GlobalPixelSize + 0.5);
                }
                else{
                    // UV1
                    pixelPos = floor(i.uv1 * _GlobalPixelSize + 0.5);
                }

                float halftoneCameraScale = GetHalftoneCameraScale(i.worldPos, (_PixelSpace < 0.5) ? 1.0 : 0.0);
                float Halftone = SampleHalftone(pixelPos, halftoneCameraScale);

                // shadow
                float atten = SHADOW_ATTENUATION(i);
                atten = smoothstep(0.0,1.0,atten);
                
                // mainLight
                float NdotL = dot(normal, lightDir);
                float lambert = NdotL * 0.5 + 0.5;
                lambert = smoothstep(_threshold1, _threshold2, lambert);
                lambert = saturate(lambert);

                lambert = lambert * lerp(1, atten, _ShadowCasting);

                lambert += (Halftone - 0.5) * _HalftoneStrength;
                // lambert *= lerp(1, Halftone, _HalftoneStrength);
                // lambert = lerp(lambert,(Halftone - 0.5),_HalftoneStrength);
                // lambert = lambert * Halftone;

                float color_levels = floor(_ColorLevels);
                float luminance = saturate(lambert);
                float clampedLight = floor(luminance * color_levels) / color_levels;
                float nextLight = ceil(luminance * color_levels) / color_levels;
                float lerpVal = frac(luminance * color_levels);
                float stepper = step(Halftone, lerpVal);
                float finalLuminance = clampedLight * (1 - stepper) + nextLight * stepper;

                float4 mainLight = ToonRamp(finalLuminance,_ShadowColor,_MidColor,_LightColor);

                // Extra Light
                float3 extraDir = normalize(lightDir + normalize(_ExtraLightRotation));
                // extraDir = normalize(extraDir);

                float extraNdotL = dot(normal, extraDir);
                float extraLambert = extraNdotL * 0.5 + 0.5;
                extraLambert = saturate(extraLambert);
                extraLambert = smoothstep(_ExtraLight_Threshold1, _ExtraLight_Threshold2, extraLambert);

                // extraLambert *= lerp(1, Halftone, _HalftoneStrength);
                extraLambert += (Halftone - 0.5) * _HalftoneStrength;

                float extra_luminance = saturate(extraLambert);
                float extra_clampedLight = floor(extra_luminance * color_levels) / color_levels;
                float extra_nextLight = ceil(extra_luminance * color_levels) / color_levels;
                float extra_lerpVal = frac(extra_luminance * color_levels);
                float extra_stepper = step(Halftone, extra_lerpVal);
                float extra_finalLuminance = extra_clampedLight * (1 - extra_stepper) + extra_nextLight * extra_stepper;

                float4 extraLight = ToonRamp(extra_finalLuminance,
                             _ExtraLight_ShadowColor,
                             _ExtraLight_MidColor,
                             _ExtraLight_LightColor);
                             
                extraLight *= _ExtraLight;

                // highlight

                float3 halfDir = normalize(lightDir + viewDir);

                float spec = pow(saturate(dot(normal,halfDir)),32);

                spec = spec * lerp(1, atten, _ShadowCasting);// shadow 遮挡

                float highlightThreshold = _HightlightThreshold + (Halftone - 0.5) * _HalftoneStrength * _HighlightSoft;// 边缘Halftone
                float highlightMask = step(highlightThreshold, spec) * _Highlight;
                float4 highlight = highlightMask * _HighlightColor;

                // rim
                float rimDot = 1 - saturate(dot(viewDir, normal));
                float rimCoord = lerp(rimDot, 1 - rimDot, _RimInvert);

                float rimThreshold = _RimThreshold + (Halftone - 0.5) * _HalftoneStrength * _RimSoft;

                float rimMask = step(rimThreshold, rimCoord) * _Rim;

                float rimGradient = saturate((rimCoord - rimThreshold) / max(_RimSoft, 1e-5));

                float4 rim = rimMask * lerp(_RimColorInner, _RimColorOuter, rimGradient);

                //matcap
                float4 matcap = SampleMatcap(normal, Halftone,_MatcapExposure,_MatcapPow);

                // alpha
                float alpha = tex.a;
                alpha += (Halftone - 0.5) * _HalftoneStrength;
                clip(alpha * _Color.a - _Cutoff);

                // final
                float3 color = tex.rgb * lerp(mainLight.rgb,float3(1.0,1.0,1.0),1 - mainLight.a)  + extraLight.rgb * extraLight.a;
                color += highlight.rgb * highlight.a;
                color += rim.rgb * rim.a;
                color += matcap.rgb * matcap.a;

                return float4(color,1);
                // return float4(extraLight,1);
                // return float4(matcap.rgb,1);
                // return float4(Halftone,Halftone,Halftone,1);

            }
            
            ENDCG
        }

        //SHADOW PASS
        UsePass "Legacy Shaders/VertexLit/SHADOWCASTER"
    }
}
