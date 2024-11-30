% Contoh Soal
a = 0;
b = 1;
n = 10;
% x(t) = t^2
p = @(t) t;
q = @(t) -2;
r = @(t) 2;
xa = 0;
xb = 1;
% Metode Beda Hingga
X1 = finitediff(a,b,n,p,q,r,xa,xb); % Disini nilai x(i_t) berada di X1(i+1)
T = linspace(a,b,n+1);
plot(T,X1)
title('Visualisasi Hasil Metode Beda Hingga')
xlabel('t')
ylabel('x')
% Metode Shooting linier
X2 = linshoot(a,b,n,p,q,r,xa,xb); % Disini nilai x(i_t) berada di X2(i+1)
T = linspace(a,b,n+1);
plot(T,X2)
title('Visualisasi Hasil Metode Shooting Linier')
xlabel('t')
ylabel('x')
