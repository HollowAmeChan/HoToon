# Changelog

## 0.1.0

- Converted the repository into the HoToon Unity package.
- Moved the existing Built-in Render Pipeline shader into `Shaders/BuiltIn/`.
- Added halftone pattern textures with point sampling and linear import settings.
- Added a URP 17 shader variant at `Shaders/URP/HalfToonURP.shader` without forcing a URP package dependency.
- Added `Assets > HoToon > [Shader] Refresh shaders` for manual shader reimport.
- Localized the URP shader property display names to match the Built-in shader.
- Added `Assets > HoToon > [Texture] Select textures folder` and explicitly marked the package visible in the Unity editor.
- Added an asset postprocessor and menu command to enforce HoToon halftone texture import settings.
- Aligned halftone texture importer settings with the reference Bayer texture import preset.
- Moved halftone pattern textures into `Textures/Halftone/` so import rules are based on folder purpose instead of filename patterns.
- Updated halftone import rules for shader data usage: single-channel red, point sampling, no mipmaps, no NPOT scaling, 8192 max size, and uncompressed platform settings.
