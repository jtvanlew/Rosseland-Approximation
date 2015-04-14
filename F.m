% Jon Van Lew 2010%
%#############################################################
% M-File F.m
% 
% This M-File defines the function F used by the ODE 
% implementation in huen.m
%#############################################################
%
function yOut = F(yIn,N)

yOut(1)   =     yIn(2);
yOut(2)   =     -4*yIn(1)^2*yIn(2)^2/(N+4*yIn(1)^3/3);
yOut(3)   =     1;

end