%% Semestralni prace - Systemy a modely
% Vypracovani semestralni prace - inicializace promennych

m = 10; % kg - hmostnost zavazi
M = 2; % kg - hmostnost voziku
l10 = 1; % m - klidova delka pruziny
k = 5; % tuhost pruziny
b = 0.7; % tuhost tlumice
Fe = 0; %#ok<*NASGU> % N - sila pusobici ve smeru vektoru u

u0 = 0;
du0 = 0;
y0 = l10; % y0 = 2*l10;
dy0 = 0; 

simtime = 30;

% simscape - 2nd generation
sim('model1', simtime)
data2graphs(simscape, 'simscape2')

% simulink - differential equations
sim('model2', simtime)
data2graphs(differential, 'diff')

% simscape - 1st generation
sim('model3', simtime)
data2graphs(simscape1, 'simscape1')

% linearized
[A, B, C, D] = linearize(m, M, k, b);
initcond = [0 0 y0 0]; % [0 0 y0 0] - natazena pruzina, [0 0 0 0] - n.p.p.

sim('model4', simtime)
data2graphs(linearized, 'linerized')

% frekvencni charakteristika

% !warning! This procedure can only be used in this case because the 
% linearized model is the same as the transfer function of the system!
% That means, that system itselves is already linear!

Fe = 10; % according to assignment, the there should be initial force
Cm = [0 0 0 0; 0 0 0 0; 0 0 1 0; 0 0 0 0]; % output only m position
[ta, tb] = ss2tf(A, B, Cm, D);
sys = tf(ta(3,:), tb); % output only m position
figure
h = bodeplot(sys);

% setup plot
p = getoptions(h);
p.PhaseWrapping = 'on'; % the phase is strangely positioned, this is fix
setoptions(h, p);

% pozorovatelnost

% nepozorovatelna konfigurace
O1 = rank(obsv(A, [0 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 0 1]));
disp(O1)

% pozorovatelna konfigurace
O2 = rank(obsv(A, [1 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0]));
disp(O2)
