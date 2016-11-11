function Eti = calcEti(i, t, n, q)
syms f(a, b)
f(a, b) = nchoosek(a, b);

syms g(c, d, e)
g(c, d, e) = nchoosek(c*d, e);

if i > q*t
    Eti = g(q, n, i);
else
    Eti = g(q, n, i);
    summationLowerBound = ceil(i/q);
    for j = summationLowerBound:t
        Eti = Eti - calcCij(i, j, n, q);
    end
end