function ub = calcUB(n, m, p)
% calculate the upper bound of post-FEC BER of a binary codeword with n
% bits and (m-1)-bit error correction capability. p is the transition
% probability.
% Ref: B. Sklar, Digital communications: fundamentals and applications. 
% Eq.6-46
% http://math.stackexchange.com/questions/132625/n-choose-k-leq-left-fracen-k-rightk
x = sym(p);
e = vpa(exp(1));
q = e*n*x/(m*(1-x));
ub = m*(1-x)^n*(q^m-q^(n+1))/(1-q)/n;
ub = double(ub);