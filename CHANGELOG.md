## [Unreleased]

## [0.1.0] - 2025-05-04

- Initial release

## [0.1.1] - 2025-05-04

- Auto cleaning rails models

## [0.1.2] - 2025-06-14

- Fixing build error

## [0.1.3] - 2026-11-10

- Only include modules defined directly in the class, ignoring inherited constants
- Clean models through a Railtie on `to_prepare` and on Zeitwerk `on_load`, so reloaded and lazily loaded models are cleaned too
- Never include `Cleanse::Cleaner` into abstract classes, so subclasses are cleaned individually
