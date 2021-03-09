%%problem 2 greedy scheduling: 4 users
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

[d_0 d_1 d_2 d_3 d_4] = distance(D,user1,user2,user3,user4);    %calculate the dist to BS

for i=1:time_slot
    [slot_rate(i),flag(i)] = greedyScheduling(mu,sigma,alpha,W,d_0,d_1,d_2,d_3,d_4);
end;

throughput_user1 = sum(slot_rate(flag==1))/time_slot;
throughput_user2 = sum(slot_rate(flag==2))/time_slot;
throughput_user3 = sum(slot_rate(flag==3))/time_slot;
throughput_user4 = sum(slot_rate(flag==4))/time_slot;

fprintf("The throughput of user1 is:%.4f The time fraction is:%.3f\n", throughput_user1,sum(flag==1)/10^4);
fprintf("The throughput of user2 is:%.4f The time fraction is:%.3f\n", throughput_user2,sum(flag==2)/10^4);
fprintf("The throughput of user3 is:%.4f The time fraction is:%.3f\n", throughput_user3,sum(flag==3)/10^4);
fprintf("The throughput of user4 is:%.4f The time fraction is:%.3f\n", throughput_user4,sum(flag==4)/10^4);