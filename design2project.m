%variables storage centre%
workpieceradius = 20 ;
vc = 75 ;%in mm per min%
ap = 1 ;%cutting depth (mm)%
f = 0.05; %feedratw (mm/rev)%
Dext = 1;
Dint = 1;
x = 1;
a = 2;
b = 3;
L = 4;

pc = 6;
E = 7;
I = 8;

%equation for finding RPM%
RPM = (1000*vc)/(2*pi*workpieceradius);

%equation for roughing forces%
ff= 120*(ap^(1.2006))*(f^(0.3108));
fr= 177*(ap^(0.3965))*(f^(0.4930));
fc= 519*(ap^(0.8676))*(f^(0.6943));

%force on the spindle%
pc= ((fr^2)+(fc^2))^(1/2); 

%deflection due to spindle bending%
Dbending = ((pc)/(6*E*I))*(((-(a+b)/L)*(x^3))+(1+((a+b)/L))*((x-L)^3)+((a+b)*L*x))
I  = (pi*((Dext)^4) - ((Dint^4)))/64;



