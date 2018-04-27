%% Semestralni prace - Systemy a modely
% Vypracovani semestralni prace - inicializace promennych

m = 10; % kg - hmostnost zavazi
M = 2; % kg - hmostnost voziku
l10 = 1; % m - klidova delka pruziny
k = 5; % tuhost pruziny
b = 0.7; % tuhost tlumice
Fe = 0; % N - sila pusobici ve smeru vektoru u

u0 = 0; 
du0 = 0; 
y0 = 2*l10; 
dy0 = 0; 

sim('model1')
data2graphs(simscape, 'simscape')

sim('model2')
data2graphs(differential, 'diff')