% Exercise 2
piano.harmonics = [.6 .2];
piano.envelope = @(t) min(40*t,1).*exp(-4*t);

fs = 2^13;
T = 0.5;
mary2

w = tone2(fs, script(1),piano);
tic
sound(w,fs)

for i = 2:length(script)
    w = tone2(fs, script(i),piano);
    while toc < script(i-1).duration
    end
    tic
    
    sound(w,fs)
end