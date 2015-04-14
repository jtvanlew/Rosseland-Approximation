% Jon Van Lew 2010

function [v] = huen(v1,h,N)

    v = v1 + h/2.*F(v1,N) + h/2.*F(v1 + h.*F(v1,N),N);

end