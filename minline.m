function[genpath] = minline(start,finish)

global m
global n

mindis = inf([m*n 1]);
parent = zeros([m*n 1]);
mindis(start) = 0;
check = zeros([m*n 1]) ;


pix = start;
count = 0;
while count<=m*n
    
    neigh = [pix+1,pix-1,pix-m,pix+m]; %[down,up,left,right]
    if pix<=m
        neigh(3) = [];
    end
    
    if pix>=m*(n-1)
        neigh(4) = [];
    end
    
    if mod(pix,m)==1
        neigh(2) = [];
    end
    
    if mod(pix,m)==0
        neigh(1) = [];
    end
    
%     neigh
    for point = neigh;
        cost = mindis(pix)+costf(pix,point);
        if cost <= mindis(point)
            mindis(point) = cost;
            parent(point) = pix;
        end
    end
    
    check(pix) = 1;
    
    minim = inf;
    minimind = pix;
    for each = 1: m*n
        if mindis(each)<= minim && check(each)==0
            minim = mindis(each);
            minimind = each;
        end
    end
    count = count +1;
    pix = minimind;
end

genpath = [finish];
index = finish;

while index ~= start
    index = parent(finish);
    genpath = [genpath,index];
    finish = index;
end


end




