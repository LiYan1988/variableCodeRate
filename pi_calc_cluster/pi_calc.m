function [pi_approx, N_hits] = pi_calc(N)

N_hits = 0;

for iter = 1:N
    coord = rand(1, 2);
    r2 = sum(coord .* coord, 2);
    N_hits = N_hits + sum(r2 < 1.0);
end
pi_approx = 4.0 * N_hits/N;