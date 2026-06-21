# Assets Directory

This directory is for storing app assets like images, icons, and other resources.

## Adding Images

1. Create an `images` folder in this directory:
   ```
   assets/images/
   ```

2. Add your splash screen image (recommended: 512x512 or larger):
   ```
   assets/images/logo.png
   ```

3. Update `pubspec.yaml` to include assets:
   ```yaml
   flutter:
     assets:
       - assets/images/
   ```

4. Use in your Dart code:
   ```dart
   Image.asset('assets/images/logo.png')
   ```

## Asset Organization

```
assets/
├── images/
│   ├── logo.png          # App logo for splash screen
│   ├── icon.png          # App icon
│   └── ...
├── fonts/                # Custom fonts
└── animations/           # Animation assets (if needed)
```

## Image Guidelines

- **Logo**: 512x512 or 1024x1024 PNG (transparent background)
- **Format**: PNG, JPG, or WebP
- **Optimization**: Compress images to reduce app size
- **Scaling**: Flutter handles @2x and @3x automatically

## Resources

- [Flutter Images Documentation](https://flutter.dev/docs/development/ui/assets-and-images)
