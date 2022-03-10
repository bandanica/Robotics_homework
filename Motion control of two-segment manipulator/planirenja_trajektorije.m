global m I l l1 l2 g Fint Tau

q_i = [0;0];
q_f = [pi/4;7*pi/18];   %u radijanima

dq1_max = 1.5;
ddq1_max = 2;

dq2_max = 2;
ddq2_max= 4;

%% racunanje Ta i Tf za trapezni profil
%Trapezni profil brzine
Ta1 = dq1_max/ddq1_max;
T1 = (q_f(1)-q_i(1))/dq1_max+Ta1;
% Ta>Tf/2 za trapezni profil, pa je Tf=2*Ta;

Ta1 = sqrt((q_f(1)-q_i(1))/ddq1_max);
T1 = 2*Ta1;
%% racunanje Tf za polinom petog stepena

dp_max = 1.875;
ddp_max = 5.773;

Tv = (q_f(2)-q_i(2))/dq2_max*dp_max;
Ta2 = sqrt((q_f(2)-q_i(2))*ddp_max/ddq2_max);
T2 = max(Tv,Ta2);

%% racunanje ukupnog vremena kretanja

Tf = max(T1,T2);
T = [Tf;Tf];
lengthT = T(1)/dt;
%% racunanje maksimalne brzine i ubrzanja za trapezni profil
Ta = T(1)/2;
ddq1_max = ((q_f(1)-q_i(1))/(Ta*(T(1)-Ta)));
dq1_max = ddq1_max*Ta;

time = linspace(0,T(1),lengthT);

%putanje
q1_ref = 0.*heaviside(time);
dq1_ref = 0.*heaviside(time);
ddq1_ref = 0.*heaviside(time);

q2_ref = 0.*heaviside(time);
dq2_ref = 0.*heaviside(time);
ddq2_ref = 0.*heaviside(time);

% prvi zglob
q1_ref(time<=Ta) = q_i(1)+0.5*ddq1_max.*time(time<=Ta).^2;
q1_ref(time>Ta) = q_f(1)-0.5*ddq1_max.*(T(1)-time(time>Ta)).^2;


%q1_ref(time<=Ta) = q_i(1)+0.5.*ddq1_max.*time(time<=Ta).^2;
%q1_ref(Ta<time & time<=T(1)-Ta) = q_i(1)+ddq1_max*Ta.*(time(Ta<time & time<=T(1)-Ta)-Ta/2);
%q1_ref(T(1)-Ta<time) = q_f(1)-0.5*ddq1_max*(T(1)-time(T(1)-Ta<time)).^2;

%brzina prvog zgloba
dq1_ref(time<=Ta) = ddq1_max*time(time<=Ta);
dq1_ref(time>Ta & time<=T(1)-Ta) = ddq1_max*Ta;
dq1_ref(time>(T(1)-Ta)) = ddq1_max*(T(1)-time(time>(T(1)-Ta)));

%ubrzanje prvog zgloba
ddq1_ref(time<=Ta) = ddq1_max;
ddq1_ref(time>Ta & time<=T(1)-Ta) = 0;
ddq1_ref(time>(T(1)-Ta)) = -ddq1_max;

%drugi zglob
g2_ref = q_i(2)+(q_f(2)-q_i(2))*(6*(time/T(2)).^5-15*(time/T(2)).^4+10*(time/T(2)).^3);
dq2_ref = (q_f(2)-q_i(2))/T(2)*(30*(time/T(2)).^4-60*(time/T(2)).^3+30*(time/T(2)).^2);
ddq2_ref = (q_f(2)-q_i(2))/T(2).^2*(120*(time/T(2)).^3-180*(time/T(2)).^2+60*(time/T(2)));




