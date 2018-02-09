clear all;
clc;

format short g;
[num,txt]=xlsread('C:\Users\Bobo\Desktop\ProblemCData.xlsx',1);
msn = txt(:,1);
state = txt(:,2);
[r1 c1] = size(state);
time = num(:,1);
data = num(:,2);

demand_sum = zeros(1,50);
supply_sum = zeros(1,50);

for i = 1960:2009
    for j = 1:r1
        if (strcmp(state(j),'NM') && (time(j-1)==i) && strcmp(msn(j),'TETCB'))
            demand_sum(i-1959)=demand_sum(i-1959)+data(j-1);
        end
    end
end

for i = 1960:2009
    for j = 1:r1
        if (strcmp(state(j),'NM') && (time(j-1)==i) && strcmp(msn(j),'TEPRB'))
            supply_sum(i-1959)=supply_sum(i-1959)+data(j-1);
        end
    end
end

x = 1960:2009;

demand_sum-supply_sum

plot(x,demand_sum,'Color','r');
hold on
plot(x,supply_sum,'Color','g');
hold off
