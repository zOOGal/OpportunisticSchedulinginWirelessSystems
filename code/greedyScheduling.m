function  [decidedRate, flag] = greedyScheduling(mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4,v_1,v_2,v_3,v_4)
    
    if ~exist('v_1', 'var') || isempty(v_1)
        v_1= 0;
    end
    if ~exist('v_2', 'var') || isempty(v_2)
        v_2= 0;
    end
    if ~exist('v_3', 'var')||isempty(v_3)
        v_3= 0;
    end
    if ~exist('v_4', 'var') || isempty(v_4)
        v_4= 0;
    end
    
    Gain = @pathGain;
    G_user1 = Gain(mu,sigma,d_0(1),alpha);
    G_user2 = Gain(mu,sigma,d_0(2),alpha);
    G_user3 = Gain(mu,sigma,d_0(3),alpha);
    G_user4 = Gain(mu,sigma,d_0(4),alpha);
    
    tempRate = @rate;
    rate_1 = tempRate(1,G_user1,mu,sigma,d_1,alpha,W);
    rate_2 = tempRate(1,G_user2,mu,sigma,d_2,alpha,W);
    rate_3 = tempRate(1,G_user3,mu,sigma,d_3,alpha,W);
    rate_4 = tempRate(1,G_user4,mu,sigma,d_4,alpha,W);
    
    compare = [rate_1+v_1,rate_2+v_2,rate_3+v_3,rate_4+v_4];
    decidedRate = max(compare);
    if rate_1==rate_2==rate_3==rate_4
        flag = randi([1 4]);
    else
        flag = find(compare == decidedRate);
    end;
end
    