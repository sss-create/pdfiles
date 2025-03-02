(
  include("SuperDirt");

  SuperDirt.start;

  // activate this to get list of midi devices
  MIDIClient.init(1,1,false);
  MIDIClient.destinations;

  ~midiOut = MIDIOut.newByName("Pure Data", "Pure Data Midi-In 1");
  // ~midiOut = MIDIOut.newByName("midit", "Midi Through");

  // test out
  // ~midiOut.noteOn(0, 60, 127); // (channel, note, velocity);
)

~dirt.soundLibrary.addMIDI(\mydevice, ~midiOut);
