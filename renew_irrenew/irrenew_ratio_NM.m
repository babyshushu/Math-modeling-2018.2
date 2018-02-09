clear all;
clc;

format short g;
[num,txt]=xlsread('C:\Users\Bobo\Desktop\ProblemCData.xlsx',1);
msn = txt(:,1);
state = txt(:,2);
[r1 c1] = size(state);
time = num(:,1);
data = num(:,2);

NGMPB = zeros(1,50);
PAPRB = zeros(1,50);
CLPRB = zeros(1,50);
irrenew_sum = zeros(1,50);
supply_sum = zeros(1,50);

for i = 1960:2009
    for j = 1:r1
        if (strcmp(state(j),'NM') && (time(j-1)==i) && strcmp(msn(j),'NGMPB'))
            NGMPB(i-1959)=data(j-1);
        end
    end
end

for i = 1960:2009
    for j = 1:r1
        if (strcmp(state(j),'NM') && (time(j-1)==i) && strcmp(msn(j),'PAPRB'))
            PAPRB(i-1959)=data(j-1);
        end
    end
end

for i = 1960:2009
    for j = 1:r1
        if (strcmp(state(j),'NM') && (time(j-1)==i) && strcmp(msn(j),'CLPRB'))
            CLPRB(i-1959)=data(j-1);
        end
    end
end

for i = 1960:2009
    for j = 1:r1
        if (strcmp(state(j),'NM') && (time(j-1)==i) && strcmp(msn(j),'TEPRB'))
            supply_sum(i-1959)=data(j-1);
        end
    end
end

for i = 1:50
    irrenew_sum(i) = NGMPB(i) + PAPRB(i) + CLPRB(i);
    ratio(i) = irrenew_sum(i)/supply_sum(i);
end

x = 1960:2009;

plot(x,ratio,'Color','r')