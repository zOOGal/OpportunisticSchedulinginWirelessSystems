%%problem 1 round-robin scheduling: 4 users
clc;clear all;

mu = 0;
sigma = 8;  %log-normal distribution with 0 mean, variance 8^2dB
time_slot = [1:10^4]
D = 1000;
user1 = [D/3 0];    %the coordinate of users
user2 = [0 D/3];
user3 = [-D/3 0];
user4 = [0 -D/3];
alpha = 4;
W = 1;

scheduling = mod(time_slot,4);   %round robin scheduling

[d_0 d_1 d_2 d_3 d_4] = distance(D,user1,user2,user3,user4);

scheduling = mod(time_slot,4)

time_user1 = sum(scheduling==1)
for i=1:time_user1
    G_user1(i) = pathGain(mu,sigma,d_0(1),alpha);
    rate_1(i) = rate(1,G_user1(i),mu,sigma,d_1,alpha,W);
end;

time_user2 = sum(scheduling==2)
for i=1:time_user2
    G_user2(i) = pathGain(mu,sigma,d_0(2),alpha);
    rate_2(i) = rate(1,G_user2(i),mu,sigma,d_2,alpha,W);
end;

time_user3 = sum(scheduling==3)
for i=1:time_user3
    G_user3(i) = pathGain(mu,sigma,d_0(3),alpha);
    rate_3(i) = rate(1,G_user3(i),mu,sigma,d_3,alpha,W);

end;

time_user4 = sum(scheduling==0)
for i=1:time_user4
    G_user4(i) = pathGain(mu,sigma,d_0(4),alpha);
    rate_4(i) = rate(1,G_user4(i),mu,sigma,d_4,alpha,W);
end;

throughput_user1 = sum(rate_1)/length(time_slot);
throughput_user2 = sum(rate_2)/length(time_slot);
throughput_user3 = sum(rate_3)/length(time_slot);
throughput_user4 = sum(rate_4)/length(time_slot);

fprintf("The throughput of user1 is:%.4f\n", throughput_user1);
fprintf("The throughput of user2 is:%.4f\n", throughput_user2);
fprintf("The throughput of user3 is:%.4f\n", throughput_user3);
fprintf("The throughput of user4 is:%.4f\n", throughput_user4);