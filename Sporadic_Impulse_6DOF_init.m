%% Inputs

% define constants
g = 9.81;

% define non-dimensionalizations
S_ref = pi*(0.15/2).^2; % for drag

% define initial conditions
V_0 = 0.1; % initial velocity
gamma_0 = pi/2-deg2rad(6); % initial attitude (measured from horizontal)
alpha_0 = 0;
beta_0  = 0;
m_0 = 40; %initial loaded mass with boosters
m_prop = 6; %kg (of just main engine)
I_sp = 185; %s

% moments of inertia (from OpenRocket 5 Dec)
% need better approximations?

I_long_0 = 53; %kg/m^2 
I_long_d = 39.5; 
I_rot_0  = 0.19; 
I_rot_d  = 0.15;


% define boosters
num_of_boosters = 2;
avg_thrust_per_booster = 548; %N
burn_time_of_thrusters = 1.16; %s
I_sp_boosters = I_sp; 


%% Extra calcs






% create matrices
I_xx_0 = I_rot_0;
I_xy_0 = 0;
I_xz_0 = 0; %BAD ASSUMPTION!
I_yy_0 = I_long_0;
I_yz_0 = 0;
I_zz_0 = I_long_0;

I_xx_d = I_rot_d;
I_xy_d = 0;
I_xz_d = 0;
I_yy_d = I_long_d;
I_yz_d = 0;
I_zz_d = I_long_d;

I_dry = [ I_xx_d, -I_xy_d, -I_xz_d;
         -I_xy_d,  I_yy_d, -I_yz_d;
         -I_xz_d, -I_yz_d,  I_zz_d];

I_0   = [ I_xx_0, -I_xy_0, -I_xz_0;
         -I_xy_0,  I_yy_0, -I_yz_0;
         -I_xz_0, -I_yz_0,  I_zz_0];


     booster_total_impulse = num_of_boosters*avg_thrust_per_booster*burn_time_of_thrusters;
     m_prop_boosters = booster_total_impulse/I_sp;
 m_dry = m_0 - m_prop - m_prop_boosters; % dry mass (will be modified 

