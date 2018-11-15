load('Motor_data.mat')

%% Insert data

R = 14.5;

v(1) = 1.3; v(2) = 1.75; v(3) = 2.2; 
v(4) = 3.0; v(5) = 3.3; v(6) = 3.8; v(7) = 4.1;

i(1) = 1e-03; i(2) = 1.1e-03; i(3) = 1.3e-03; 
i(4) = 1.5e-03; i(5) = 1.7e-03; i(6) = 1.9e-03; i(7) = 2e-03;

dPhi_m(1) = mean(dPhi(1026:3752)); dPhi_m(2) = mean(dPhi(3978:5549)); 
dPhi_m(3) = mean(dPhi(5901:7000)); dPhi_m(4) = mean(dPhi(7295:8177));
dPhi_m(5) = mean(dPhi(8327:9162)); dPhi_m(6) = mean(dPhi(9393:10110));
dPhi_m(7) = mean(dPhi(10230:11020));

for j = 1 : 7
   
    k(j) = (v(j) - R*i(j))/dPhi_m(j); 
    b(j) = k(j)*i(j)/dPhi_m(j);
    
end

K_m = mean(k); b_m = mean(b);