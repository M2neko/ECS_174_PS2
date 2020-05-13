% part (b)
function H = computeH(t1, t2)
%Find out arrangement
%t1 = t1';
%t2 = t2';
n = size(t1, 1);
if n < 4
    msg = 'Too few points. Need at least 4.';
    error(msg)
end
A = zeros(2 * n, 9);
for i = 1:n
    x = t1(i,1);
    y = t1(i,2);
    xx = t2(i,1);
    yy = t2(i,2);
    A(2 * n - 1,:) = [x y 1 0 0 0 -xx*x -xx*y -xx];
    A(2 * n,:) = [0 0 0 x y 1 -yy*x -yy*y -yy];
end

h = eigs(A*A', 1, 'smallestabs');
H = reshape(h,3,3);
%H = H';
end