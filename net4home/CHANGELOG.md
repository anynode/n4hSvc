# Changelog

## [1.3.11] - 2026-01-22

### Added

### Changed

### Fixed

## [1.3.10] - 2026-01-21

### Added

### Changed

### Fixed

## [1.3.3] - 2026-01-21

### Added
- Neue Option "Zeitmodul (HS-Time) aktivieren" (`enableHSTime`)
- HSTime Binary wird optional als Service installiert und gestartet
- HSTime startet automatisch nach n4hSvc wenn aktiviert
- Beide Services (n4hSvc und HSTime) werden parallel überwacht
- Logs beider Services werden im Home Assistant Protokoll angezeigt

### Changed
- Service-Start-Logik angepasst: n4hSvc startet jetzt im Hintergrund
- HSTime Binary in `net4home/rootfs/usr/bin/HSTime` hinzugefügt

## [1.0.0] - 2026-01-20

### Added
- Initial release
- net4home Server (n4hSvc) integration
- Serial port communication
- TCP/IP server on configurable port
- Configuration via Home Assistant UI
- Automatic serial port detection
- Support for aarch64, amd64, armv7, armhf architectures

### Features
- **Informationen**: Add-on metadata and status
- **Dokumentation**: German documentation
- **Konfiguration**: UI-based configuration
- **Protokoll**: Real-time logging with serial port detection
