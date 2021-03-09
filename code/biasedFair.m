%opportunistic scheduling with sum(r_i)<1

function vector = biasedFair(r,mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4)

delta = 0.1;    %three parameter from paper to iterate
w = 0.1;
increment = 0.4;

estimate_U = @greedyScheduling;
threshold = 0.001;  %difference tolerence
v_1=zeros();
v_2=zeros();
v_3=zeros();
v_4=zeros();
k = 1;
[U(k), indicator(k)] = estimate_U(mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4);

p_1(1)=double(indicator(1)== 1);
p_2(1)=double(indicator(1)== 2);
p_3(1)=double(indicator(1)== 3);
p_4(1)=double(indicator(1)== 4);


while true
    if k~=1
        p_1(k) = (1-w)*p_1(k-1)+w*(indicator(k) == 1);
        p_2(k) = (1-w)*p_2(k-1)+w*(indicator(k) == 2);
        p_3(k) = (1-w)*p_3(k-1)+w*(indicator(k) == 3);
        p_4(k) = (1-w)*p_4(k-1)+w*(indicator(k) == 4);
    end

    if p_1(k)<r && v_1(k)==min([v_2(k),v_3(k),v_4(k)])
        v_1(k+1)=v_1(k)+increment;
    else
        g_1(k) = (v_1(k)-min([v_2(k),v_3(k),v_4(k)]))*((indicator(k) == 1 )-r);
        v_1(k+1) = v_1(k)-delta*g_1(k);
    end

    if p_2(k)<r && v_2(k)==min([v_1(k),v_3(k),v_4(k)])
        v_2(k+1)=v_2(k)+increment;
    else
        g_2(k) = (v_2(k)-min([v_1(k),v_3(k),v_4(k)]))*((indicator(k) == 2)-r);
        v_2(k+1) = v_2(k)-delta*g_2(k);
    end

    if p_3(k)<r && v_3(k)==min([v_1(k),v_2(k),v_4(k)])
        v_3(k+1)=v_3(k)+increment;
    else
        g_3(k) = (v_3(k)-min([v_1(k),v_2(k),v_4(k)]))*((indicator(k) == 3)-r);
        v_3(k+1) = v_3(k)-delta*g_3(k);
    end

    if p_4(k)<r && v_4(k)==min([v_1(k),v_2(k),v_3(k)])
        v_4(k+1)=v_4(k)+increment;
    else
        g_4(k) = (v_4(k)-min([v_1(k),v_2(k),v_3(k)]))*((indicator(k) == 4)-r);
        v_4(k+1) = v_4(k)-delta*g_4(k);
    end


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
