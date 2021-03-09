function [d_0 d_1 d_2 d_3 d_4] = distance(D,user1,user2,user3,user4)

BS_0 = [0 0];   %the coordinate of the center cell
BS_1 = [D*sqrt(3)/2 D/2];   %the coordinate of the interference BSs
BS_2 = [0 D];
BS_3 = [-D*sqrt(3)/2 D/2];
BS_4 = [-D*sqrt(3)/2 -D/2];
BS_5 = [0 -D];
BS_6 = [D*sqrt(3)/2 -D/2];

BS = cell(1,6);
BS{1} = BS_1;
BS{2} = BS_2;
BS{3} = BS_3;
BS{4} = BS_4;
BS{5} = BS_5;
BS{6} = BS_6;


d_0(1) = dist(user1, BS_0');
d_0(2) = dist(user2, BS_0');
d_0(3) = dist(user3, BS_0');
d_0(4) = dist(user4, BS_0');

for i = 1:6
    d_1(i) = dist(user1,BS{i}');
    d_2(i) = dist(user2,BS{i}');
    d_3(i) = dist(user3,BS{i}');
    d_4(i) = dist(user4,BS{i}');
end;

end