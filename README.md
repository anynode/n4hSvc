# net4home Home Assistant Add-ons

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fanynode%2Fn4hSvc)

## Add-ons

This repository contains the following add-ons:

### [net4home Server](./net4home)

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]

Ein Server für die Kommunikation mit net4home Geräten über serielle Schnittstelle.

## Installation

1. Klicken Sie auf den Button oben oder fügen Sie dieses Repository manuell hinzu:
   - Gehen Sie zu **Einstellungen** → **Add-ons** → **Add-on Store**
   - Klicken Sie auf die drei Punkte (⋮) oben rechts → **Repositories**
   - Fügen Sie diese URL hinzu: `https://github.com/anynode/n4hSvc`
2. Suchen Sie nach "net4home Server" und installieren Sie es
3. Konfigurieren Sie den seriellen Port
4. Starten Sie das Add-on

## Konfiguration

| Option | Beschreibung | Standard |
|--------|-------------|----------|
| `loglevel` | Log-Level: Only Errors / Errors and Buspackets / All | `0 - Only Errors` |
| `port` | TCP/IP Port | `3478` |
| `comport` | Serieller Port | `/dev/ttyUSB0` |
| `noPasswords` | Passwort-Logging deaktivieren | `true` |
| `ipv6` | IPv6 aktivieren | `false` |
| `passwords` | Liste von codierten Passwörtern | `[]` |

## Support

Bei Fragen oder Problemen erstellen Sie bitte ein [Issue](https://github.com/anynode/n4hSvc/issues).

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
