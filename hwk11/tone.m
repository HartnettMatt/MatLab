function w = tone(fs,note)
    oct = note.octave;
    T = note.duration;
    switch note.semitone
        case 'A'
            smt = 0;
        case 'A#'
            smt = 1;
        case 'B'
            smt = 2;
        case 'C'
            smt = 3;
        case 'C#'
            smt = 4;
        case 'D'
            smt = 5;
        case 'D#'
            smt = 6;
        case 'E'
            smt = 7;
        case 'F'
            smt = 8;
        case 'F#'
            smt = 9;
        case 'G'
            smt = 10;
        case 'G#'
            smt = 11;
    end
    f = 440*(2^oct)*(2^(smt/12));
    t = [1/fs:1/fs:T];
    w = sin(2*pi*f*t);
end