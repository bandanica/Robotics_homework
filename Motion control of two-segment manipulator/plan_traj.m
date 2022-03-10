global m I l l1 l2 g Fint Tau

q_A = [0;0];
q_B = [pi/4;7*pi/18];   %u radijanima

dqB_max = 1.5;
ddqB_max = 2;

%Trapezni profil brzine
Ta1 = dqB_max/ddqB_max;
T1 = (q_B(1)-q_A(1))/dqB_max+Ta1;
% Ta>Tf/2 za trapezni profil, pa je Tf=2*Ta;

Ta1 = sqrt((q_B(1)-q_A(1))/ddqB_max);
T1 = 2*Ta1;

T = [T1;T1];
lengthT = T(1)/dt;

ddqB_max = ((q_B(1)-q_A(1))/(Ta*(T(1)-Ta)));
dqB_max = ddqB_max*Ta;

