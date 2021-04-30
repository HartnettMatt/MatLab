% Exercise 1
T = 0.5;
mary;
fs = 2^13;
w = [];
for i = 1:length(script)
    w = [w tone(fs,script(i))];
end
sound(w,fs)

