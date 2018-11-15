load('Pendulum_Osc.mat');

%% Experimental

figure(1)
plot(time,pos)

pos_tau = 0.02*max(pos); %--> position 896
ts = time(1113);
tau = ts/4;

sigma = 1/tau;

t = 1.12-0.38;
wd = 2*pi/t;
delta = 1 - 4*(sigma*wd)^2;

zeta = 1/sqrt(1 + (2*pi/log(0.1047/0.0956))^2);

wn = sqrt(1-zeta^2)/wd;

G = tf(wn^2,[1 2*zeta*wn wn^2]);

figure(2)
impulse(G);

%% SPA running

Ts = 0.02;
omega = 0.002:0.002:40;

pos_id = iddata(pos,[],Ts);

G = spa(pos_id,40,omega);

freq_rad = G.Frequency;
amp = zeros(length(freq_rad),1);
amp(:,1) = G.SpectrumData(1,1,:);

figure(2)
plot(freq_rad,amp)

[~,ind] = max(amp);
wd = freq_rad(ind);

wn = wd*()