# HoToon

HoToon 是 Hollow 的轻量级 Unity toon shader 包。它被刻意保持成一个小而独立的包，可以和更大的 lilToon/lilPBR 系统一起使用，也可以单独用于只需要半调、描边和基础风格化光照的项目。

## 在整套系统里的定位

HoToon 是根目录这组仓库里的轻量半调 toon shader 包。适合在项目里快速使用屏幕空间网点、风格化光照、MatCap、高光、边缘光、描边和透明裁剪，而不需要引入 lilToon 的完整 shader 生成体系。

相关仓库：

- `HoUrp17.3.0`：URP 17 本地包，供 URP shader 变体使用。
- `lilToon-URP-Extensions`：更完整的 URP RendererFeature 功能层。
- `lilToon` / `lilPBR`：生产级角色/NPR 与场景/PBR shader 家族。

## 主要内容

- `Shaders/BuiltIn/HalfToon.shader`：Built-in Render Pipeline 版本。
- `Shaders/URP/HalfToonURP.shader`：URP 17 版本，shader 名称为 `HoToon/URP/HalfToon_Outline`。
- `Textures/Halftone/`：点采样、单通道的半调图案贴图。
- `Editor/HoToonTextureImportSettings.cs`：统一半调贴图的导入设置。
- `Editor/HoToonEditorUtils.cs`：刷新 shader、选择贴图目录等菜单工具。

## Shader 功能

- 半调图案采样，并支持按相机距离缩放网点。
- Toon 明暗分段、阴影阈值、高光、边缘光和 MatCap。
- 描边 pass，支持宽度、遮罩贴图、颜色、Stencil、深度、混合和剔除控制。
- URP `UniversalForward`、`ShadowCaster`、`DepthOnly` pass。
- Built-in Render Pipeline 对应版本。

## 安装

在 Unity 项目的 `Packages/manifest.json` 中加入本地包：

```json
{
  "dependencies": {
    "com.hollow.hotoon": "file:D:/Unity_Fork/HoToon"
  }
}
```

这个包不会强制声明 URP 依赖。Built-in 项目可以直接导入；URP 项目则使用 `Shaders/URP/` 下的 shader。

## 编辑器工具

Unity 菜单：

- `Assets > HoToon > [Shader] Refresh shaders`
- `Assets > HoToon > [Texture] Apply import settings`
- `Assets > HoToon > [Texture] Select textures folder`

半调贴图应保持为线性、点采样、单通道数据贴图，不使用 mipmap，并使用 repeat wrap。导入后处理和菜单命令会把这些贴图恢复到包内预设。
