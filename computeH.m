% part (b)
function H = computeH(t1, t2)
n = size(t1, 2);
if n < 4
    msg = 'Too few points. Need at least 4.';
    error(msg)
end
A = zeros(2 * n, 9);
for i = 1:n
    x = t1(1,i);
    y = t1(2,i);
    xx = t2(1,i);
    yy = t2(2,i);
    A(2 * i - 1,:) = [x y 1 0 0 0 -xx*x -xx*y -xx];
    A(2 * i,:) = [0 0 0 x y 1 -yy*x -yy*y -yy];
end
[V,D] = eig(A'*A);
[~,m] = min(diag(D));
H = reshape(V(:,m),3,3)';
end
