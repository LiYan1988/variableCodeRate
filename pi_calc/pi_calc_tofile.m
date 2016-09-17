function pi_calc_tofile(N)

[pi_approx, N_hits] = pi_calc(N);

data = struct('N', N, 'N_hits', N_hits, 'pi_approx', pi_approx);
store_data(data, 'PI_CALC');