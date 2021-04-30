% Exercise 3
fs = 2^13;
T = 0.5;

pure.harmonics = [0.6 0.2];
pure.envelope = @(t) 1;

midA.octave = 0;
midA.semitone = {'A'};
midA.duration = T;

w = tone2(fs, midA, pure);

W = fft(w/length(w));

freq = 0:1/T:fs-1/T;
figure(1)
stem(freq, abs(W));
% It looks as expected, except for the very high frequencies, which are due
% to the sampling rate, and they should be negative, but since this is a
% harmonic system, they are show positive by the half frequency.

midE.octave = 0;
midE.semitone = {'E'};
midE.duration = T;

w = tone2(fs, midE, pure);

W = fft(w/length(w));

freq = 0:1/T:fs-1/T;
figure(2)
stem(freq, abs(W));

w = toneF(fs,midE,pure);
W = fft(w/length(w));

freq = 0:1/T:fs-1/T;
figure(3)
stem(freq, abs(W));

mary2;

w = toneF(fs, script(2),pure);
W = fft(w/length(w));

freq = 0:1/T:fs-1/T;
figure(4)
stem(freq, abs(W));