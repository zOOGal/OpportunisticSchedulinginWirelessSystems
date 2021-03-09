function Rate = rate(n,G_user1,mu,sigma,d,alpha,W)   %n is timeslots;user2,3,4 are interference
    for i = 1:n
        for j = 1:6
            G(j) = pathGain(mu,sigma,d(j),alpha);
        end
        SINR(i) = G_user1(i)/sum(G);
        Rate(i) = W*log2(1+SINR(i));    %W is bandwidth
    end;
end