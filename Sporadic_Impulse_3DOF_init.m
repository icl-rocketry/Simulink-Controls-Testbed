

% define constants
g = 9.81;

% define non-dimensionalizations
S_ref = pi*(0.15/2).^2; % for drag

% define initial conditions
V_0 = 0.1; % initial velocity
gamma_0 = pi/2-deg2rad(6); % initial attitude (measured from horizontal)
alpha_0 = 0;
m_0 = 40; %initial loaded mass
m_dry = m_0 - 7; % dry mass




I_dry = 1;
I_0 = 5;


