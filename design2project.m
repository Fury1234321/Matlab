%variables storage centre%
workpieceradius = 20 ;
vc = 75 ;%in mm per min%
ap = 1 ;%cutting depth (mm)%
f = 0.05; %feedratw (mm/rev)%
Kb = 190; %N/M%
Dext = linspace(0,52e-3,1000);
Dint = Dext*(0.4);

a = 62.5*(10^-3); %(M)%
b = 106.5*(10^-3) ;%(M)%
L = linspace(100e-3,250e-3,1000);

E = 200*(10^9);


%equation for finding RPM%
RPM = (1000*vc)/(2*pi*workpieceradius);

%equation for roughing forces%
ff= 120*(ap^(1.2006))*(f^(0.3108));
fr= 177*(ap^(0.3965))*(f^(0.4930));
fc= 519*(ap^(0.8676))*(f^(0.6943));

%force on the spindle%
pc= ((fr^2)+(fc^2))^(1/2); 

%deflection due to spindle bending%
%Dbending = ((pc)/(6*E*I))*(((-(a+b)/L)*(x^3))+(1+((a+b)/L))*((x-L)^3)+((a+b)*L*x));%
x = L + a + b;
I = (pi*((Dext).^4) - ((Dint.^4)))/64;
Dbending = ((pc)./(6*E.*I)).*(((-(a+b)./L).*(x.^3))+(1+((a+b)./L)).*((x-L).^3)+((a+b).*L.*x));


%I  = (pi*((Dext)^4) - ((Dint^4)))/64;%



%reaction force at bearing B%
Rb = pc*((a+b))./L ; %all units in meters%
%Ra = ((Pc).*(L+a+b))./L; %all units in meters%

Dbb = Rb./Kb; %all units in meters%
Dtotal = Dbending + Dbb;



I_graph=plot3(L,I,Dtotal);
xlabel('Length between bearings (m)');
ylabel('Moment of Inertia');
zlabel('Total Deflection ');
disp(I_graph)



