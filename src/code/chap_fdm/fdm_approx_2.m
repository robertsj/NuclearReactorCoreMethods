% Simple Approximation of First Order Derivative

% Function
f = @(x) 6*x.^6 + 4*x.^3 + 8*x + 2;

% Analytical Derivative of Function
df_exact = @(x) 36*x.^5 + 12*x.^2 + 8;
dff_exact = @(x) 180*x.^4 + 24*x;

% Create a log space of h (width between x values)
h = logspace(-3,1,1000);

% Perform approximation with forward finite difference
dff_for = (f(20+2*h) - 2*f(20+h) + f(20))./(h.^2);

% Perform approximation with backward finite difference
dff_bac = (f(20) - 2*f(20-h) + f(20-2*h))./(h.^2);

% Perform approximation with central finite difference
dff_cen = (f(20+h) -2*f(20) + f(20-h))./(h.^2);

% Compute Error
err_for = abs(dff_for - dff_exact(20));
err_bac = abs(dff_bac - dff_exact(20));
err_cen = abs(dff_cen - dff_exact(20));

% Plot Results
loglog(h,err_for,'k--','LineWidth',2);
hold on
loglog(h,err_bac,'k-.','LineWidth',2);
loglog(h,err_cen,'k-','LineWidth',2);
grid 
grid minor
xlabel('x spacing [-]','LineWidth',2);
ylabel('Error from true derivative [-]');
legend('Forward','Backward','Central','Location','NorthWest');