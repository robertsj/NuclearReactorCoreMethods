% Simple Approximation of First Order Derivative

% Function
f = @(x) x.^4;

% Create a log space of h (width between x values)
h = 0.01;

% Perform approximation with forward finite difference
df_for(1) = (f(100+h) - f(100))./h;
df_for(2) = (f(100+2*h) - f(100))./(2*h);
df_for(3) = (f(100+4*h) - f(100))./(4*h);

% Perform approximation with backward finite difference
df_bac(1) = (f(100) - f(100-h))./h;
df_bac(2) = (f(100) - f(100-2*h))./(2*h);
df_bac(3) = (f(100) - f(100-4*h))./(4*h);

% Perform approximation with central finite difference
df_cen(1) = (f(100+h) - f(100-h))./(2*h);
df_cen(2) = (f(100+2*h) - f(100-2*h))./(2*2*h);
df_cen(3) = (f(100+4*h) - f(100-4*h))./(2*4*h);

% calculate order of convergence
p_for = log((df_for(2) - df_for(3))/(df_for(1) - df_for(2)))/log(2);
p_bac = log((df_bac(2) - df_bac(3))/(df_bac(1) - df_bac(2)))/log(2);
p_cen = log((df_cen(2) - df_cen(3))/(df_cen(1) - df_cen(2)))/log(2);

% display results
fprintf('Order of Convergence for Forward FD: %d\n',p_for);
fprintf('Order of Convergence for Backward FD: %d\n',p_bac);
fprintf('Order of Convergence for Central FD: %d\n',p_cen);