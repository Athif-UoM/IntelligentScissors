function[out] = costf(a,b)
global lapm
global sobelmag
global sobeldir


mag2 = sobelmag(b);
dir1 = sobeldir(a);
dir2 = sobeldir(b);
lap2 = lapm(b);
wz = 0.43;
wd = 0.43;
wg = 0.14;

%% fz %%

if lap2 == 0
    fz = 0;
else
    fz = 1;
end                  
%% fg %%

maxg = max(max(sobelmag));
fg = 1-(mag2)/maxg;

%% fd %%

theta = abs(dir2-dir1);
if theta > 180;
    theta = 360-theta;
end
fd = theta/360;

out  = wz*fz +wd*fd + wg*fg;
