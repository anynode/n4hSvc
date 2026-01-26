# Changelog

## [1.0.6] - 2026-01-25

### Changed
- AppArmor temporär deaktiviert zur Fehlerdiagnose des Segmentation Faults

## [1.0.5] - 2026-01-25

### Fixed
- Behebt Segmentation Fault durch Entfernung inkompatibler ports-Konfiguration bei host_network: true

## [1.0.4] - 2026-01-25

### Changed
- Aktualisierte Binaries für n4hSvc, HSTime und HSpr

## [1.0.3] - 2026-01-25

### Changed
- Optimiert für Home Assistant Add-on Standards
- Repository-Konfiguration von JSON auf YAML umgestellt
- Dockerfile Labels aktualisiert (Version und Architektur)
- Port-Beschreibungen in Translations hinzugefügt

### Added
- AppArmor-Profil für verbesserte Security
- Watchdog-Konfiguration für Health-Monitoring
- Port-Mapping und Port-Beschreibungen in config.yaml
- URL-Feld in config.yaml für bessere Dokumentation

## [1.0.2] - 2026-01-25

### Added
- Initial release
- net4home Server (n4hSvc) integration
- Serial port communication
- TCP/IP server on configurable port
- Configuration via Home Assistant UI
- Automatic serial port detection

### Features
- **Informationen**: Add-on metadata and status
- **Dokumentation**: German documentation
- **Konfiguration**: UI-based configuration
- **Protokoll**: Real-time logging with serial port detection
