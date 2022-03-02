# Pure Data Komposition, Lighthouse und Audiolab
Dieses Projekt entstand innerhalb des Wintersemesters 2021/2022 im interdisziplinären Modul Creative Coding. Ursprünglich wurde die Arbeit als flexible Sound Design-Umgebung skizziert.
Im Semesterverlauf wurde das Vorhaben ergänzt um: die gleichzeitig stattfindende Verbindung von Sound Design, der Steuerung einer 3D-Audioanlage und der Bespielung des Lighthouse-Projekts der Fachhochschule Kiel. 
Durch Verknüpfung der einzelnen Elemente entsteht ein 3D-Audio-Visual-Performance-Tool. Hierbei steht die einfache Bedienung aller drei Komponenten auf verdichtetem (Bildschirm-)Raum und und innerhalb des Tools *Pure Data* im Vordergrund.

## Pure Data
Die Programmiersprache *Pure Data* zeichnet sich durch ihre grafische Programmieroberfläche aus: einzelne Objekte werden mittels virtueller Kabel verknüpft und es entstehen sogenannte *Patches*. *Pure Data* ist für Linux, macOS als auch Windows verfügbar und steht dem kommerziellen Produkt *Max* als Open-Source-Variante gegenüber.

##### Externals
*Pure Data* bietet durch sogenannte *Externals* die Möglichkeit des Funktionsausbaus.
Um diese Arbeit nutzen zu können werden folgende Externals benötigt:
* mrpeach
* cyclone
* ggee (nur für **fx/shelf-eq~.pd**)

## Umsetzung
### Audio
Inspiriert von klassischen Konzepten der Klangsynthese wurden diverse Instrumente programmiert. Im Gegensatz zu bereits existierenden Sammlungen zur Sounderstellung und -bearbeitung beansprucht die vorliegende Arbeit keine Vollständigkeit; stattdessen wurden Teilaspekte der Klangsynthese, mit dem Ziel der persönlichen Nachvollziehbarkeit und der Erweiterung des eigenen Verständnisses dieser, umgesetzt.

Das Produkt ist eine Zusammenstellung (nicht nur konventioneller) Instrumente und Effekte wie Kick Drum, Snare Drum, Hi-Hats und Syntesizern in Kombination mit Effekten wie Chorus, Flanger, Delay, Hall und Compressor. Die Synthesizer sind teils polyphon spielbar und setzen erweiterte Konzepte wie FM- oder Wavetable-Synthese um.

Der Großteil der Instrumente und Effekte wurde als sogenannte *Abstraction*, als wiederverwendbares Objekt, programmiert und verfügt über Eingänge (*Inlets*) zur gezielten Parametersteuerung. Die, durch einzelne *Inlets* kontrollierten, Parameter sind in der jeweiligen *Abstraction* dokumentiert.
Es existiert die Möglichkeit, die Parameter eines Instruments innerhalb eines *Patches* in Listen einzutragen, was einem Preset-System gleich kommt. Auch nach einem Neustart *Pure Datas* sind die Listen samt aller Eintragungen abrufbar.

Wo die Umsetzung eine nicht zu leistende Komplexität verlangte, etwa das Umsetzen von Hall-Algorithmen oder der exakten Emulation von Hardware, wurde auf bereits existierende Lösungen zurückgegriffen (LIRA-8, Dattorro-Reverb von Tom Erbe; siehe Linksammlung) und diese gegebenenfalls modifiziert.

### Visual Concept
Das Lighthouse wird mit denselben Methoden, die auch die Instrumente steuern, bespielt. Die Trigger der Sequencer (zum Beispiel von Kick Drum, Snare oder Synth) werden in das Steuerungsobjekt des Lighthouse geleitet und dort verarbeitet. Bei einigen Auslösern kann sich die Art der Ansteuerung ändern. Das betrifft unter anderem Farbverläufe oder Anzahl und Position der Lichter. 

Die Farben basieren auf den Grundfarben des RGB-Farbschemas und einfachen Mischfarben, die einen sterilen, digitalen Look erzeugen und zur Ästhetik des Projekts passen.

Das oben angeführte Preset-System lässt sich bei der potentiellen Verwaltung weiterer Farbpaletten nutzen.

### Control
Zur Steuerung der auditiven Instrumente und Effekte (aber auch zur Kontrolle von Soundposition innerhalb der 3D-Audioanlage des Audiolabors oder der LEDs des Lighthouses) wurden Sequencer und Modulatoren, unter anderem auf Basis von Wahrscheinlichkeit, Markov-Chains oder dem Euklidschen Algorithmus, umgesetzt. Die teils generativen Modulatoren sind essentiell für die Komposition algorithmischer Musik. Der Einsatz unkonventioneller Modulatoren lädt zur musikalischen Exploration ein. 

Ein Beispiel: Die Idee der *Abstraction* **function-generator.pd** basiert auf dem Buchla 281e Quad Function Generator, einem komplexen Hüllkurvengenerator, der über herkömmliche ADSR-Envelops hinausgeht, indem er etwa eine Verkettung der einzelnen Hüllkurven bietet.

Das Lighthouse und die 3D-Audioanlage werden mithilfe des Netzwerkprotokolls *OSC* (Open Sound Control) angesteuert. Die Infrastruktur innerhalb des Audiolabors erlaubt nach Verbindung der Applikation mit dem Labor-Server die einfache Vearbeitung der Nachrichtenpakete.

### Ergebnis/Fazit
Der *Patch* **main.pd** stellt beispielhaft die Verwendung und Verknüpfung der einzelner (aber nicht aller im Rahmen des Projekts entstandenen) Instrumente/Effekte/Modulatoren mit zusätzlichen Kontrollerweiterungen dar.

Im oberen Bereich sind die einzelnen Drumstimmen und Synthesizer zu sehen. Unten link befindet sich der Audiomischer. Rechts daneben sind die Textdateien zur Preset-Verwaltung und die, für die Ansteuerung der 3D-Audioanlage und das Lighthouse zuständigen Objekte. 

Das 3D-Audio-Visual-Performance-Tool ist einsatzbereit. Der prominent-grüne Toggle startet die Musik. Um eine OSC-Verbindung herzustellen muss diese in den dafür vorgesehen Objekten manuell gesetzt werden. Damit wird das Spammen von Fehlermeldungen in die Konsole bei nicht vorhandener Konnektivität unterbunden. 

Die Möglichkeit der Interaktion mittels Controller oder ähnlichem wurde zugunsten einer generativ-algorithmischen Komposition nicht implementiert. Allerdings ist diese Komposition noch immer auf Interaktion angewiesen, worauf in Zukunft aufgebaut werden könnte. 

### Ausblick
Ideen zur Weiterentwicklung erfolgen hier stichpunktartig:
* Rein generativer Modus
* Erweiterung der Audio- und Farbpalettenpresets
* Optimierung zur universellen Bespielung herkömmlicher(er) Audioanlagen (Dolby, Quadrophon u.ä.)
* Interaktion mit Controllern, MIDI-Keyboards, OSC-Applikationen, Leap Motion
* mikrotonale skalen 
* lokales (statt globales) Preset-Systems
* Erweiterung der Visuals (mehr Formen, Wörter)


***
##### Bekannte "Bugs":
* modulation/lfo.pd: Dreick-Wellenform wird mittels *sinesum* erstellt. Die $0-Notation ist nicht ohne Weiteres anwendbar.
* main/pd glitch: Audio I/O Error bei randomisieren der Obertöne (ebenfalls mit *sinesum*)

##### Linksammlung
https://puredata.info/
https://puredata.info/downloads/mrpeach
https://puredata.info/downloads/cyclone
https://buchla.com/product/281e/
https://opensoundcontrol.stanford.edu/
https://cycling74.com/products/max
http://tre.ucsd.edu/wordpress/?p=625
https://mikemorenodsp.gumroad.com/l/lira-8


