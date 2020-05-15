% part3 (a)
function bestH = RANSAC(t1, t2)
n = size(t1, 2);
% Calculate k using w and p with probabilities
% Available from Wikipedia:
% https://en.wikipedia.org/wiki/Random_sample_consensus
w = 0.85;
p = 0.99;
k = round(log10(1-p)/log10(1-w^n));

% e is epsilon in this algorithm
e = 20;
if n < 4
    msg = 'Too few points. Need at least 4.';
    error(msg)
end
i = 0;
bestFit = 0;
bestH = zeros(3,3);

while i < k
    fit = 0;
    select = randperm(n, 4);
    t1_s = t1(:, select);
    t2_s = t2(:, select);
    H = computeH(t1_s,t2_s);
    t_also = [];
    for j = 1:n
        if ismember(j,select)
            continue
        end
        Hp = H * [t1(1, j); t1(2, j); 1];
        SSD = sqrt((t2(1, j) - Hp(1) / Hp(3))^2 + (t2(2, j) - Hp(2) / Hp(3))^2);
        if SSD < e
            t_also = [t_also j];
            fit = fit + 1;
        end
    end
    
    if fit >= bestFit
        add = [select t_also];
        t1_n = t1(:, add);
        t2_n = t2(:, add);
        bestH = computeH(t1_n, t2_n);
        bestFit = fit;
    end
    i = i + 1;
end
end
