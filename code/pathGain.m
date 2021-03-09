function G = pathGain(mu,sigma,d,alpha)
    G = 10^(normrnd(mu,sigma)/10)/(d^alpha);
 end