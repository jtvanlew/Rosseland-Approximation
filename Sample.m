clear all; close all; hold on

color=['g','r','k','m','c','y','b'];
i=1;
for j=-3:1:3
    N    = 10^j;
    Ti   = 0;
    TL   = 5;
    tau0 = 0;
    tauL = 5;
    
    [tau,theta] = rosseland(Ti,TL,tau0,tauL,N);
    
    plot(tau,theta,color(i))
    i=i+1;
end

% Format Plots
legend('N = 0.001','N=0.01','N=0.1','N=1','N=10','N=100','N=1,000','Location','SouthEast');
axis([tau0 tauL Ti TL])
xlabel('Optical Depth \tau');
ylabel('Dimensionless Temperature \theta');