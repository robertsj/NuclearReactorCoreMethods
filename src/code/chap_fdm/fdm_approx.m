% Simple Approximation of First Order Derivative

% Function
f = @(x) x.^4;

% Analytical Derivative of Function
df_exact = @(x) 4*x.^3;

% Create a log space of h (width between x values)
h = logspace(-3,1,1000);

% Perform approximation with forward finite difference
df_for = (f(100+h) - f(100))./h;

% Perform approximation with backward finite difference
df_bac = (f(100) - f(100-h))./h;

% Perform approximation with central finite difference
df_cen = (f(100+h) - f(100-h))./(2*h);

% Compute Error
err_for = abs(df_for - df_exact(100));
err_bac = abs(df_bac - df_exact(100));
err_cen = abs(df_cen - df_exact(100));

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