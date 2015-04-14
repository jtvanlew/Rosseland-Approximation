function [zt,T] = rosseland(Ti,TL,tau0,tauL,N)
% Jon Van Lew 2010
% jtvanlew@ucla.edu - email me with questions regarding the code
% Adaptive timestep with Huen's method for finding the temperature
% distribution along dimensionless z with combined conduction and radiation
% as specified by parameter N

eps = 10^-3; % specified tolerance on local truncation error
% if calcluations are taking too long, shrink eps and it will run much
% faster

ep=1;
j=1;

p   = 2;

while ep > eps;  % make the iteration as precise as the local truncation error
    
    
    % Statements necessary for secant method iteration
    if j == 1
        qi(j) = (TL-Ti)/(tauL-tau0);
    elseif j==2
        qi(j) = 2*(TL-Ti)/(tauL-tau0);
    else
        qi(j) = qi2;
    end
    % end of secant statements
    
    
    
    % Solution variables
    v      = zeros(1,3);
    v(1,:) = [Ti qi(j) tau0];
    z      = 0;
    % End of solution variables
    
    
    % Programming variables
    i=1;
    epc=0;
    h   = .5;
    % end of programming variables
    
    
    % Looping forward through z
    while z < tauL-.001;
        i        = i+1;
        vs       = huen(v(i-1,:),h,N);
        vh(1,:)  = huen(v(i-1,:),h/2,N);
        vh2(1,:) = huen(vh(1,:),h/2,N);
        z        = vh2(1,3);
        
        % Adaptive timestepping based on local error tolerance
        % specified in eta
        
        eta=.5*abs(eps-epc(i-1))/((tauL-z)/h);
        
        htilde = h*(eta/(abs(vh2(1)-vs(1))/(2^p-1)))^(1/(p+1));
        
        if h > htilde
            h = 0.9*htilde;
            i = i-1;
        elseif htilde > tauL-z
            h = tauL-z;
            v(i,:) = vh2;
            epn(i)       = (1/(2^p-1)) * abs(vs(1)-vh2(1,1));
            epc(i)=epc(i-1)+epn(i);
        else
            h      = 0.9*htilde;
            v(i,:) = vh2;
            epn(i)       = (1/(2^p-1)) * abs(vs(1)-vh2(1,1));
            epc(i)=epc(i-1)+epn(i);
        end
    end
    % End of loop through z
    
    
    
    % Secant method of root finding for the 'shooting' method requires two
    % calculations based on initial guesses.  After those first two are
    % found, a better guess emerges.
    if j>1
        Tf1=Tf2;
    end
    Tf2  = v(end,1);
    
    if j>1
        qi2 = qi(j-1)+((TL - Tf1)/(Tf2-Tf1))*(qi(j)-qi(j-1));
        ep = abs(Tf2-TL)/abs(TL);
    end
    j=j+1;
    % End of Secant method iteration section
    
    
    
    % Clear variables for next iteration
    clear epn; clear epc; clear z;
end


% Save an array of theta temperature and tau distribution
T(:,1)   = v(:,1);
zt(:,1)  = v(:,3);
end
