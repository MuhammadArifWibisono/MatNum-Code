% Contoh Soal
a = 0; % Batas bawah t
b = 1; % Batas atas t
n = 10;% Banyaknya partisi
% x(t) = t^2
p = @(t) t;
q = @(t) -2;
r = @(t) 2;
xa = 0; % Nilai x(a)
xb = 1; % Nilai x(b)
% Metode Beda Hingga
X = finitediff(a,b,n,p,q,r,xa,xb);% Disini nilai x(i_t) berada di X(i+1)
T = linspace(a,b,n+1);
plot(T,X)
title('Visualisasi Hasil Metode Beda Hingga')
xlabel('t')
ylabel('x')
