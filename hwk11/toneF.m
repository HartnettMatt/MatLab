function w = toneF(fs,note,instrument)
    T = note.duration;
    t = 1/fs:1/fs:T;
    oct = note.octave;
    w = zeros(size(t));
    for i = 1:length(oct)
        switch note.semitone{i}
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
        case '-1'
            w = 0*t;
            break
        end
        f = 440*(2^oct(i))*(2^(smt/12));
        f = round(f*T)/T;
        t = [1/fs:1/fs:T];
        w = w + sin(2*pi*f*t);
        
        if nargin == 3
            w = w - instrument.harmonics(1)*sin(2*pi*(2*f)*t);
            w = w - instrument.harmonics(2)*sin(2*pi*(3*f)*t);
        end
    end
    
    if nargin == 3
        w = w.*instrument.envelope(t);
    end
end