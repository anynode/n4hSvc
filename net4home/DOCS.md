# net4home Server Dokumentation

## Übersicht

Dieses Add-on stellt den **net4home Server (n4hSvc)** als Home Assistant Add-on zur Verfügung. Der net4home Server ermöglicht die Kommunikation mit net4home Geräten über eine serielle Schnittstelle.

Zusätzlich besteht die Option ein HS-Time und einen HS-Packetrouter als Softwaremodul zu starten. Diese Module verhalten sich genau wie Hardware Module und können zur Synchronisation der Zeit mit anderen Modulen wie HS-Jal oder HS-Safety verwendet werden.

## Funktionen

- Kommunikation mit net4home Geräten über serielle Schnittstelle
- TCP/IP Server für den Zugriff auf net4home Geräte
- Unterstützung von Auto-Discover im Netzwerk
- Konfigurierbare Logging-Ebenen
- Unterstützung für IPv4 und IPv6

## Konfiguration

### Log Level (loglevel)

Steuert die Ausführlichkeit der Protokollierung:

- **0 - Only Errors**: Normal, nur Fehler werden protokolliert (empfohlen für Produktion)
- **9 - Errors and Buspackets**: Zusätzlich Buspakete werden protokolliert (Debug)
- **10 - All**: Alle Informationen werden protokolliert

**Standardwert**: 0 - Only Errors

### Port

Der TCP/IP Port, auf dem der Server lauscht.

**Standardwert**: 3478

### Serial Port (comport)

Das serielle Gerät, über das die Kommunikation mit den net4home Geräten erfolgt.

**Standardwert**: `/dev/ttyS0`

**Hinweis**: Stellen Sie sicher, dass das serielle Gerät im Container verfügbar ist. Möglicherweise müssen Sie das Gerät im Add-on konfigurieren.

### IPv6 (ipv6)

Aktiviert die Unterstützung für IPv6.

**Standardwert**: Deaktiviert (false)

### Zeitmodul (HS-Time) aktivieren

Installiert und startet den HSTime Service. HS-Time startet automatisch nach n4hSvc wenn aktiviert.

**Standardwert**: Deaktiviert (false)

**Hinweis**: 
- HS-Time erstellt seine Konfigurationsdateien im persistenten `/data` Verzeichnis
- Die Konfigurationsdateien bleiben bei Neustarts und Updates erhalten
- Alle Ausgaben von HS-Time werden im Protokoll angezeigt

### Packetrouter (HS-PacketRouter) aktivieren

Installiert und startet den HS-PacketRouter Service. HS-PacketRouter startet automatisch nach n4hSvc wenn aktiviert.

**Standardwert**: Deaktiviert (false)

**Hinweis**: 
- HSpr erstellt seine Konfigurationsdateien im persistenten `/data` Verzeichnis
- Die Konfigurationsdateien bleiben bei Neustarts und Updates erhalten
- Alle Ausgaben von HS-PacketRouter werden im Protokoll angezeigt

## Installation

1. Kopieren Sie dieses Add-on in Ihr Home Assistant Add-ons Verzeichnis
2. Gehen Sie zu **Einstellungen** > **Add-ons** > **Add-on Store**
3. Klicken Sie auf die drei Punkte (oben rechts) und wählen Sie **Nach Updates suchen**
4. Das "net4home Server" Add-on erscheint unter **Lokale Add-ons**
5. Klicken Sie darauf, konfigurieren Sie Ihre Einstellungen und klicken Sie auf **Starten**

## Verwendung

Nach dem Start des Add-ons können Sie über den konfigurierten TCP/IP Port auf den net4home Server zugreifen. Der Server kommuniziert dann über die konfigurierte serielle Schnittstelle mit den net4home Geräten.

## Protokoll

Die Protokolle des Add-ons können im **Protokoll** Tab eingesehen werden. Die Ausgabe des n4hSvc Prozesses wird hier in Echtzeit angezeigt.

## Fehlerbehebung

### Service startet nicht

- Überprüfen Sie die Konfiguration im **Konfiguration** Tab
- Prüfen Sie die Protokolle im **Protokoll** Tab auf Fehlermeldungen
- Stellen Sie sicher, dass das serielle Gerät korrekt konfiguriert ist

### Keine Verbindung möglich

- Überprüfen Sie, ob der Port nicht bereits von einem anderen Service verwendet wird
- Prüfen Sie die Firewall-Einstellungen
- Stellen Sie sicher, dass das serielle Gerät korrekt verbunden ist

### Serielles Gerät nicht gefunden

- Überprüfen Sie, ob das Gerät im Container verfügbar ist
- Möglicherweise müssen Sie das Gerät im Add-on konfigurieren oder als Device-Mapping hinzufügen

## Weitere Informationen

Für weitere Informationen zum net4home System besuchen Sie die offizielle Dokumentation.

**GitHub Repository**: [https://github.com/anynode/n4hSvc](https://github.com/anynode/n4hSvc)

## Version

**Version**: 1.0.7

## Lizenz

(c) net4home GmbH, 2026
