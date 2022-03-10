global m I l l1 l2 g Fint Struja Cm Irot N mi D F

t = 0;      %inicijalizacija vremena
dt = 0.001; %korak simulacije
%T = 5;      %vreme simulacije
%lengthT = T/dt; %broj tacaka simulacije
i = 1;     %brojac
g = 9.81 ;
Fint = [-2;-4];%spoljasnja sila[N]

%% parametri segmenata
l1 = 0.5;  %[m]
l2 = 0.5;
m1 = 2;  %[kg]
m2 = 2;
I1 = 1/3*m1*l1^2;  %moment [kgm^2]
I2 = 1/3*m2*l2^2;
l=l1; m=m1; I=I1;

%% pocetno stanje
q=[0;0];  %pozicija
dq =[0;0];%brzina
ddq = [0;0];%ubrzanje



