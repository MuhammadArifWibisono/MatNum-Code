function X = finitediff(a,b,n,p,q,r,xa,xb)
    % Pendefinisian variabel
    h = (b-a)/n;
    A = zeros(n-1,n-1);
    B = zeros(n-1,1);
    X = zeros(n-1,1);
    % Membuat sistem (n-1) persamaan (sesuai slide ke-5 di edunex)
    A(1,1) = 2 + (h^2)*q(a+h);
    A(1,2) = (h/2)*p(a+h) - 1;
    B(1) = -(h^2)*r(a+h) + ((h/2)*p(a+h) + 1)*xa;
    A(n-1,n-2) = -(h/2)*p(b-h) - 1;
    A(n-1,n-1) = 2 + (h^2)*q(b-h);
    B(n-1) = -(h^2)*r(b-h) - ((h/2)*p(b-h) - 1)*xb;
    for j = 2:1:(n-2)
        A(j,j-1) = -(h/2)*p(a+h*j) - 1;
        A(j,j) = 2 + (h^2)*q(a+h*j);
        A(j,j+1) = (h/2)*p(a+h*j) - 1;
        B(j) = -(h^2)*r(a+h*j);
    end
    % Mencari solusi dari SPL dengan melaksanakan eliminasi gauss untuk SPL tridiagonal
    for j = 1:1:(n-2)
        p = A(j+1,j)/A(j,j);
        A(j+1,j+1) = A(j+1,j+1) - p*A(j,j+1);
        B(j+1) = B(j+1) - p*B(j);
        A(j+1,j) = 0;
    end
    X(n-1) = B(n-1)/A(n-1,n-1);
    for j = (n-2):-1:1
        X(j) = (B(j) -  A(j,j+1)*X(j+1))/A(j,j);
    end
    % Memasukkan x(a) dan x(b) ke dalam vektor solusi
    X1 = zeros(n+1,1);
    X1(1) = xa;
    X1(n+1) = xb;
    for j = 1:1:(n-1)
        X1(j+1) = X(j);
    end
    X = X1;
end