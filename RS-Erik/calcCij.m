function Cij = calcCij(i, j, n, q)
syms f(a, b)
f(a, b) = nchoosek(a, b);

syms g(c, d, e)
g(c, d, e) = nchoosek(c*d, e);

alpha = f(n, j);
summationUpperBound = j-ceil(i/q);
Cij = 0;
for m = 0:summationUpperBound
    Cij = Cij + ((-1)^m)*f(j, m)*g(q, j-m, i);
end
Cij = Cij*alpha;