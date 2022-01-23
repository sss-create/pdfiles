
# Pure Data Komposition, Lighthouse und Audiolab
Dieser Beitrag entstand innerhalb des Wintersemesters 2021/2022 im interdisziplinären Modul Creative Coding. Dem Projekt zugrunde liegt die dreigeteilte, die zusammengenommen eine audiovisuelle Bespielung der vorhandenen 3D-Audioanlage als  ...

Ursprünglich wurde die Arbeit als persönliche Implementation eines modularen Synthesizers skizziert. Im Verlauf des Semesters kristallisierte sich jedoch ein neues Ziel heraus: die Verkettung der einzelnen Teile zu einem 3D-Audio-Video Performance-Tool.
Hierbei steht die einfache Bedienung aller drei Komponenten auf verdichtetem (Bildschirm-)Raum im Vordergrund.

## Pure Data
Die Programmiersprache *Pure Data* zeichnet sich durch ihre grafische Programmieroberfläche aus: einzelne Objekte werden mittels virtueller Kabel verknüpft und es entstehen sogenannte *Patches*. *Pure Data* ist für Linux, macOS als auch Windows verfügbar und steht dem kommerziellen Produkt *Max*  als Open-Source-Variante gegenüber.

##### Externals
*Pure Data* bietet durch sogenannte *Externals* die Möglichkeit des Funktionsausbaus.
Um diese Arbeit nutzen zu können werden folgende Externals benötigt:
* mrpeach
* cyclone

## Umsetzung

### Audio
Inspiriert von klassischen Konzepten der Klangsynthese wurden diverse Instrumente programmiert. Im Gegensatz zu bereits existierenden Sammlungen zur Sounderstellung und -bearbeitung beansprucht die vorliegende Arbeit keine Vollständigkeit; stattdessen wurden Teilaspekte der Klangsynthese, mit dem Ziel der persönlichen Nachvollziehbarkeit und der Erweiterung des eigenen Verständnisses dieser, umgesetzt.

Das Produkt ist eine Zusammenstellung konventioneller Instrumente und Effekte wie Kick Drums, Claps, Hi-Hats und Syntesizern in Kombination mit Effekten wie Chorus, Flanger, Delay, Hall und Compressor. Die Syntesizer sind teils polyphon spielbar und setzen erweiterte Konzepte wie FM- oder Wavetable-Synthese um.

Der Großteil der Instrumente und Effekte wurden als sogenannte *Abstraction*, als wiederverwendbares Objekt, programmiert und verfügt über Eingänge (*Inlets*) zur gezielten Parametersteuerung. Die durch einzelne *Inlets* kontrollierten Parameter sind in der jeweiligen *Abstraction* dokumentiert. 
Es gibt die Möglichkeit, die Parameter eines Instruments innerhalb eines *Patches* in eine Liste einzutragen, was einem Preset-System gleich kommt. Mithilfe der Modulatoren kann dann, beispielsweise durch die verschiedenen Presets gewechselt werden. Auch nach dem Neustart ist die Liste samt aller Eintragungen abrufbar.

Der *Patch* **main.pd** stellt beispielhaft die Verwendung und Verknüpfung der einzelner (aber nicht aller im Rahmen des Projekts entstandenen) Instrumente/Effekte/Modulatoren mit zusätzlichen Kontrollerweiterungen dar.

Wo die Umsetzung eine nicht zu leistende Komplexität verlangte, etwa das Umsetzen von Hall-Algorithmen oder der exakten Emulation von Hardware, wurde auf bereits existierende Lösungen zurückgegriffen (LIRA-8, Dattorro-Reverb) und diese gegebenenfalls modifiziert. 

#### Visual Concept

Das Lighthouse verfügt über insgesamt x ansteuerbare LEDs. 

Das in der Beispielarbeit vorliegende Konzept basiert auf geometrischen Formen und den Grundfarben Rot, Grün und Blau. 

Die programmierten Sequencer sorgen für (zur Musik synchronisiertes) "Durchlaufen" der Lichter. Die Synchronisation erfolgt dabei durch eine globale und simultan startende Taktgebung. Bei bestimmten Auslösern wechselt der verwendete Sequencer, werden alle Lichter in derselben Farbe aktiviert oder ausgeschaltet.

Das oben angeführte Preset-System lässt sich bei der potentiellen Verwaltung von Farbpaletten nutzen.

### Control
Zur Steuerung der auditiven Instrumente und Effekte (aber auch zur Kontrolle von Soundposition innerhalb der 3D-Audioanlage des Audiolabors oder der LEDs des Lighthouses) wurden Sequencer und Modulatoren, unter anderem auf Basis von Wahrscheinlichkeit, Markov-Chains oder dem Euklidschen Algorithmus, umgesetzt. Die teils generativen Modulatoren sind essentiell für die Komposition algorithmischer Musik.

Ein Beispiel: Die Idee der *Abstraction* **function-generator.pd** basiert auf dem Buchla 281e Quad Function Generator, eines komplexen Hüllkurvengenerators, der über traditionelle ADSR-Envelops hinausgeht, indem er etwa eine Verkettung der einzelnen Hüllkurven bietet.

Das Lighthouse und die 3D-Audioanlage werden mithilfe des Netzwerkprotokolls *OSC* (Open Sound Control) angesteuert. Die Infrastruktur innerhalb des Audiolabors erlaubt nach Verbindung der Applikation mit dem Labor-Server die einfache Vearbeitung der Nachrichtenpakete. Zum Einsatz kommen auch hier die oben genannten Modulatoren.

### Fazit/Ausblick
Das Resultat des Wintersemesters 2021/2022 ist ein

Ideen zur Weiterentwicklung erfolgen hier stichpunktartig:
* lokales (statt globales) Preset-Systems
* Erweiterung der Audio- und Farbpalettenpresets
* Optimierung zur universellen Bespielung herkömmlicher(er) Audioanlagen (Dolby, Quadrophon u.ä.)
* Interaktion mit Controllern, MIDI-Keyboards, OSC-Applikationen, Leap Motion
* Rein generativer Modus
* mikrotonale skalen

Bekannte Bugs:
* modulation/lfo.pd: Dreick-Wellenform wird mittels *sinesum* erstellt. Die $0-Notation ist nicht ohne Weiteres anwendbar.
* main/pd glitch: Audio I/O Error bei randomisieren der Obertöne (ebenfalls mit *sinesum*)

Neben der Nutzung als 3D-Audio-Video Performance-Tool (3DAV-PT?) ist auch der Einsatz nur der Instrumente und Effekte als Sounddesign-Umgebung oder die reine St

##### Links
https://puredata.info/
https://puredata.info/downloads/mrpeach
https://puredata.info/downloads/cyclone
https://buchla.com/product/281e/
https://opensoundcontrol.stanford.edu/
https://cycling74.com/products/max
http://tre.ucsd.edu/wordpress/?p=625
https://mikemorenodsp.gumroad.com/l/lira-8

