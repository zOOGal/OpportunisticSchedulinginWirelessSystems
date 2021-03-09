% problem 4: minimum assignment r_i = 1/4,1/8 for ymmetric scenario

clc;clear all;

mu = 0;
sigma = 8;  %log-normal distribution with 0 mean, variance 8^2dB
time_slot = 10^4;
D = 1000;
user1 = [D/3 0];    %the coordinate of users
user2 = [0 D/3];
user3 = [-D/3 0];
user4 = [0 -D/3];
alpha = 4;
W = 1;

r_1 = 1/4;
r_2 = 1/8;

[d_0 d_1 d_2 d_3 d_4] = distance(D,user1,user2,user3,user4);    %calculate the dist to BS

v(1:4) = equalFair(r_1,mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4);
u(1:4) = biasedFair(r_2,mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4);


for i=1:time_slot
    [slotRate_v(i),flag_v(i)] = greedyScheduling(mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4,v(1),v(2),v(3),v(4));
end;

throughput_user1_v = sum(slotRate_v(flag_v==1))/time_slot;
throughput_user2_v = sum(slotRate_v(flag_v==2))/time_slot;
throughput_user3_v = sum(slotRate_v(flag_v==3))/time_slot;
throughput_user4_v = sum(slotRate_v(flag_v==4))/time_slot;

for i=1:time_slot
    [slotRate_u(i),flag_u(i)] = greedyScheduling(mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4,u(1),u(2),u(3),u(4));
end;

throughput_user1_u = sum(slotRate_u(flag_u==1))/time_slot;
throughput_user2_u = sum(slotRate_u(flag_u==2))/time_slot;
throughput_user3_u = sum(slotRate_u(flag_u==3))/time_slot;
throughput_user4_u = sum(slotRate_u(flag_u==4))/time_slot;

fprintf(" v_1=%.4f\n v_2=%.4f\n v_3=%.4f\n v_4=%.4f\n",v(1),v(2),v(3),v(4));
fprintf("The throughput of user1 is:%.4f The time fraction is:%.2f\n", throughput_user1_v,sum(flag_v==1)/10^4);
fprintf("The throughput of user2 is:%.4f The time fraction is:%.2f\n", throughput_user2_v,sum(flag_v==2)/10^4);
fprintf("The throughput of user3 is:%.4f The time fraction is:%.2f\n", throughput_user3_v,sum(flag_v==3)/10^4);
fprintf("The throughput of user4 is:%.4f The time fraction is:%.2f\n", throughput_user4_v,sum(flag_v==4)/10^4);

fprintf("when r=1/8 \n v_1=%.4f\n v_2=%.4f\n v_3=%.4f\n v_4=%.4f\n",u(1),u(2),u(3),u(4));
fprintf("The throughput of user1 is:%.4f The time fraction is:%.2f\n", throughput_user1_u,sum(flag_u==1)/10^4);
fprintf("The throughput of user2 is:%.4f The time fraction is:%.2f\n", throughput_user2_u,sum(flag_u==2)/10^4);
fprintf("The throughput of user3 is:%.4f The time fraction is:%.2f\n", throughput_user3_u,sum(flag_u==3)/10^4);
fprintf("The throughput of user4 is:%.4f The time fraction is:%.2f\n", throughput_user4_u,sum(flag_u==4)/10^4);
