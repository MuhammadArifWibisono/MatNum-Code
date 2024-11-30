function X = linshoot(a,b,n,p,q,r,xa,xb)
    % Pendefinisian variabel
    h = (b-a)/n;
    X = zeros(n+1,1);
    U = zeros(n+1,1);
    U(1) = xa;
    U1 = zeros(n+1,1);
    U1(1) = 0;
    U2 = zeros(n+1,1);
    V = zeros(n+1,1);
    V(1) = 0;
    V1 = zeros(n+1,1);
    V1(1) = 1;
    V2 = zeros(n+1,1);
    % Mencari solusi dari u(t)  
    U2(1) = p(a)*U1(1) + q(a)*U(1) + r(a);
    for j = 2:1:(n+1)
        U(j) = U(j-1) + h*U1(j-1);
        U1(j) = U1(j-1) + h*U2(j-1);
        U2(j) = p(a+h*(j-1))*U1(1) + q(a+h*(j-1))*U(1) + r(a+h*(j-1));
    end
    % Mencari solusi dari v(t)
    V2(1) = p(a)*V1(1) + q(a)*V(1) + r(a);
    for j = 2:1:(n+1)
        V(j) = V(j-1) + h*V1(j-1);
        V1(j) = V1(j-1) + h*V2(j-1);
        V2(j) = p(a+h*(j-1))*V1(1) + q(a+h*(j-1))*V(1) + r(a+h*(j-1));
    end
    % Mencari solusi dari x(t)
    for j = 1:1:(n+1)
        X(j) = U(j) + ((xb - U(n+1))*V(j))/V(n+1);
    end
end