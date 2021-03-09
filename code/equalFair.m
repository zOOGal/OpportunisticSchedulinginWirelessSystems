%opportunistic scheduling with sum(r_i)=1

function vector = equalFair(r,mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4)

estimate_U = @greedyScheduling;
threshold = 0.04;        %difference tolerence
v_1=zeros();
v_2=zeros();
v_3=zeros();
v_4=zeros();
k = 1;
[U(k), indicator(k)] = estimate_U(mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4);

while true
    a = 0.25;  
    v_1(k+1) = v_1(k)-a*((indicator(k) == 1)-r);
    v_2(k+1) = v_2(k)-a*((indicator(k) == 2)-r);
    v_3(k+1) = v_3(k)-a*((indicator(k) == 3)-r);
    v_4(k+1) = v_4(k)-a*((indicator(k) == 4)-r);

    if (abs(v_1(k+1)-sum(v_1)/(k+1)) <= threshold && abs(v_2(k+1)-sum(v_2)/(k+1)) <= threshold...
            && abs(v_3(k+1)-sum(v_3)/(k+1)) <= threshold && abs(v_4(k+1)-sum(v_4)/(k+1)) <= threshold)
        vector = [v_1(k+1),v_2(k+1),v_3(k+1),v_4(k+1)];
        break;
    end
    k = k+1;
    [U(k), indicator(k)] = estimate_U(mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4,v_1(k),v_2(k),v_3(k),v_4(k));
   
end
fprintf("step = %d\n",k+1); 
end
