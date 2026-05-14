# HoToon

HoToon is a Unity package by Hollow for toon shaders.

## Compatibility

- Unity 2022.1 or newer
- Current shader target: Built-in Render Pipeline
- URP shader target: Universal Render Pipeline 17

## Contents

- `Shaders/BuiltIn/HalfToon.shader` - current Built-in Render Pipeline toon shader
- `Textures/Halftone/` - black-and-white halftone data textures imported as point-sampled single-channel data
- `Shaders/URP/HalfToonURP.shader` - URP 17 toon shader variant

## Installation

Add this folder as an embedded package, or add it through Unity Package Manager with a local path.

## URP 17 Variant

The URP 17 shader is included directly in `Shaders/URP/` so it is visible from the package in URP projects. The package does not declare a URP dependency, so Built-in projects are not forced to install URP.

Use `Assets > HoToon > [Shader] Refresh shaders` from the Unity menu if the package shaders do not appear or need to be reimported manually. Use `Assets > HoToon > [Texture] Apply import settings` to force the halftone textures back to the package import preset: single-channel red data, point sampling, sRGB off, no mipmaps, no NPOT scaling, repeat wrap, 8192 max size, and uncompressed platform settings. Use `Assets > HoToon > [Texture] Select textures folder` to reveal `Textures/Halftone/` in the Project window.
