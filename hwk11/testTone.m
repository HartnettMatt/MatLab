n.octave = 0;
n.duration = 1;
n.semitone = 'A';
fs = 2^(13);
w = tone(fs, n);
sound(w, fs)