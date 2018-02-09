clear all;
clc;

format short g;
[num,txt]=xlsread('C:\Users\Bobo\Desktop\ProblemCData.xlsx',1);
msn = txt(:,1);
state = txt(:,2);
[r1 c1] = size(state);
time = num(:,1);
data = num(:,2);

demand_msn = textread('C:\Users\Bobo\Desktop\msn.txt','%s');
[r2 c2] = size(demand_msn);

demand_sum = zeros(1,200);
supply_sum = zeros(1,200);

for i = 1960:2009
    for j = 1:r1
        for k = 1:r2
            if (strcmp(state(j),'AZ') && (time(j-1)==i) && strcmp(demand_msn(k),msn(j)))
                demand_sum(i-1959)=demand_sum(i-1959)+data(j-1);
            end
        end
    end
end

for i = 1:50
    demand_sum(i)
end
