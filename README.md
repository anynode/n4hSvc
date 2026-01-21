# net4home Server - Home Assistant Add-on

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fanynode%2Fn4hSvc)

## Über dieses Projekt

Dieses Add-on stellt den **net4home Server** für Home Assistant bereit. Es ist der Server für die [net4home Home Assistant Integration](https://github.com/anynode/net4home).

### Alternative zum HS-Gateway

Der net4home Server ist eine **Alternative zum bestehenden net4home HS-Gateway**. Anstatt ein separates HS-Gateway zu verwenden, können Sie mit diesem Add-on Ihren Home Assistant direkt als Bus-Connector nutzen.

**Vorteile:**
- Kein zusätzliches HS-Gateway erforderlich
- Direkter Anschluss über USB-Seriell-Adapter
- Läuft als Home Assistant Add-on

## Add-ons

This repository contains the following add-ons:

### [net4home Server](./net4home)

Ein Server für die Kommunikation mit net4home Geräten über serielle Schnittstelle. Benötigt wird ein UP-PC-Connect Adapter und ein USB-Seriell Adapter, wenn das Add-on auf einem Home Assistant Green oder einem Raspberry Pi betrieben wird.



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
| `loglevel` | Log-Level (0-10): 0 = Only Errors, 9 = Errors and Buspackets, 10 = All | `0` |
| `port` | TCP/IP Port | `3478` |
| `comport` | Serieller Port | `/dev/ttyUSB0` |
| `noPasswords` | Passwort-Logging deaktivieren | `true` |
| `ipv6` | IPv6 aktivieren | `false` |
| `passwords` | Liste von codierten Passwörtern | `[]` |
| `enableHSTime` | Zeitmodul (HS-Time) aktivieren | `false` |

> ⚠️ **Wichtig:** Der `loglevel` sollte im Normalbetrieb auf **0** (Only Errors) stehen. Höhere Log-Level erzeugen große Mengen an Protokolldaten, die den Speicher füllen und den Systembetrieb beeinträchtigen können. Verwenden Sie höhere Log-Level nur zur Fehlerdiagnose und setzen Sie den Wert danach zurück.

### 💡 Tipp: Serielle Schnittstellen finden

Nach dem Start des Add-ons werden im **Protokoll** alle verfügbaren seriellen Schnittstellen angezeigt:

- USB Serielle Geräte (`/dev/ttyUSB*`, `/dev/ttyACM*`)
- Eingebaute Serielle Geräte (`/dev/ttyAMA*`, `/dev/ttyS*`)
- Geräte nach ID (`/dev/serial/by-id/...`) - **empfohlen für stabile Konfiguration**

Gehen Sie zu **Add-on → Protokoll**, um die Liste der erkannten Schnittstellen zu sehen und den richtigen `comport` zu konfigurieren.

## Verwandte Projekte

- **[net4home Home Assistant Integration](https://github.com/anynode/net4home)** - Die Custom Component für Home Assistant zur Integration von net4home Geräten

## Support

Bei Fragen oder Problemen erstellen Sie bitte ein [Issue](https://github.com/anynode/n4hSvc/issues).
