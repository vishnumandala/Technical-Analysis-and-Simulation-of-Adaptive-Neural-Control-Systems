function dx = DelayNN(t,x,xd)
lam1 = x(7); lam2 = x(8); lam3 = x(9);
lam1d = xd(7); lam2d = xd(8); lam3d = xd(9);
k1 = 2; k2 = 2; k3 = 6;
a1 = 1; a2 = 1; a3 = 1;
r1 = 1; r2 = 1; r3 = 1;
p1 = 1; p2 = 1; p3 = 1;
del1 = 1; del2 = 1; del3 = 1;
X1 = [x(1); lam1]; X2 = [x(1); x(2); lam1; lam2];
X3 = [x(1);x(2);x(3);x(4);x(5); lam1; lam2; lam3];
X1d = [xd(1); lam1d]; X2d = [xd(1);xd(2); lam1d; lam2d];
X3d = [xd(1); xd(2); xd(3); xd(4); xd(5); lam1d; lam2d; lam3d];
eta = 2;
v = 0.1;
Phi1 = [exp(-(X1-v)'*(X1-v)/eta*eta); exp(-(X1-v)'*(X1-v)/eta*eta); exp(-(X1-v)'*(X1-v)/eta*eta)];
Phi2 = [exp(-(X2-v)'*(X2-v)/eta*eta); exp(-(X2-v)'*(X2-v)/eta*eta); exp(-(X2-v)'*(X2-v)/eta*eta)];
Phi3 = [exp(-(X3-v)'*(X3-v)/eta*eta); exp(-(X3-v)'*(X3-v)/eta*eta); exp(-(X3-v)'*(X3-v)/eta*eta)];
Phi1d = [exp(-(X1d-v)'*(X1d-v)/eta*eta); exp(-(X1d-v)'*(X1d-v)/eta*eta); exp(-(X1d-v)'*(X1d-v)/eta*eta)];
Phi2d = [exp(-(X2d-v)'*(X2d-v)/eta*eta); exp(-(X2d-v)'*(X2d-v)/eta*eta); exp(-(X2d-v)'*(X2d-v)/eta*eta)];
Phi3d = [exp(-(X3d-v)'*(X3d-v)/eta*eta); exp(-(X3d-v)'*(X3d-v)/eta*eta); exp(-(X3d-v)'*(X3d-v)/eta*eta)];
z1 = x(1) - lam1;
z1d = xd(1) - lam1d;
alp1 = -k1*z1 - p1*lam1 - z1*x(4)*Phi1'*Phi1/(2*a1^2);
alp1d = -k1*z1d - p1*lam1d - z1d*xd(4)*Phi1d'*Phi1d/(2*a1^2);
z2 = x(2) - alp1 - lam2;
z2d = xd(2) - alp1d - lam2d;
alp2 = -k2*z2 - p2*lam2 - z2*x(5)*Phi2'*Phi2/(2*a2^2);
alp2d = -k2*z2d - p2*lam2d - z1d - z2d*xd(5)*Phi2d'*Phi2d/(2*a2^2);
z3 = x(3) - alp2 - lam3;
z3d = xd(3) - alp2d - lam3d;
u = -k3*z3 - p3*lam3 - z2 - z3*x(6)*Phi3'*Phi3/(2*a3^2);
if t<=0.05
    ud = 0;
else
    ud = -k3*z3d - p3*lam3d - z2d - z3d*xd(6)*Phi3d'*Phi3d/(2*a3^2);
end
dlmwrite('uDDNN.txt', u, '-append');
dlmwrite('udDDNN.txt', ud, '-append');
x1dot = x(2) + 0.5*x(2)^2*x(3)*(1+x(1)^2);
x2dot = x(3) + 0.2*x(1)*x(2)*sin(x(3)^2);
x3dot = ud + x(2)^2*x(3)^2*sin(x(1)^2);
x4dot = r1*z1^2*Phi1'*Phi1/(2*a1^2)-del1*x(4);
x5dot = r2*z2^  2*Phi2'*Phi2/(2*a2^2)-del2*x(5);
x6dot = r3*z3*2*Phi3'*Phi3/(2*a3^2)-del3*x(6);
x7dot = lam2-p1*lam1;
x8dot = lam3-p2*lam2;
x9dot = -p3*lam3+ud-u;
dx = [x1dot; x2dot; x3dot; x4dot; x5dot; x6dot; x7dot; x8dot; x9dot];
