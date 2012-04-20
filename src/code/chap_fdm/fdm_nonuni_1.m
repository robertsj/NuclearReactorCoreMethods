% Simple Approximation of First Order Derivative

% Function
f = @(x) x.^4;

% Analytical Derivative of Function
df_exact = @(x) 4*x.^3;

% vector non-uniform grid multiplier from 1 - 2 in logspace
r = logspace(0,log10(2),10);

% preallocate error vector
err_cen = zeros(1000,length(r));

% begin loop around grid multipliers
for i = 1:length(r)
    
    % Create a log space of widths and a muliplier (width between x values)
    hl = logspace(-3,1,1000);
    hr = r(i)*hl;
    
    % Perform approximation with central finite difference
    df_cen = (f(100+hr) - f(100-hl))./(hl + hr);
    
    % Compute Error
    err_cen(:,i) = abs(df_cen - df_exact(100));
    
end

% Plot Results
loglog(hr,err_cen,'k-','LineWidth',2);
grid
grid minor
xlabel('x spacing [-]','LineWidth',2);
ylabel('Error from true derivative [-]');