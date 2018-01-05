clear all
meros1a;

for i = 1 : 30
    f = [FT{i}{1} FT{i}{2} FT{i}{3} FT{i}{4} FT{i}{5} FT{i}{6} FT{i}{7}];
    hx = f(1,2); hy = f(1,3);
    rx = f(1,4); ry = f(1,5);
    lx = f(1,6); ly = f(1,7);
    f(:,8) = [0; diff(f(:,4))];
    f(:,9) = [0; diff(f(:,5))];
   
   
    
    J = abs(f(:,2)-hx) + abs(f(:,3)-hy) + abs(f(:,4)-rx) ...
        + abs(f(:,5)-ry)+ abs(f(:,6)-lx) + abs(f(:,7)-ly) ...
        + abs(f(:,8)) + abs(f(:,9));
    
    
    en = (J > 80);
    en = imdilate(en,ones(7,1));
    en = [0; diff(en)];
    en = find(en);
    
    IS{i}{1} = en(1:2:end);
    IS{i}{2} = en(2:2:end);
    
    clear en J hx hy rx ry lx ly 
end

save('IS_computed','IS')