% Simple Approximation of First Order Derivative

% Function
f = @(x) 6*x.^6 + 4*x.^3 + 8*x + 2;

% Analytical Derivative of Function
df_exact = @(x) 36*x.^5 + 12*x.^2 + 8;
dff_exact = @(x) 180*x.^4 + 24*x;

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
    dff_cen = (f(20+hr)./hr -(1./hr+1./hl).*f(20) + f(20-hl)./hl)./((hl + hr)/2);
    
    % Compute Error
    err_cen(:,i) = abs(dff_cen - dff_exact(20));
    
end

% Plot Results
loglog(hr,err_cen,'k-','LineWidth',2);
grid
grid minor
xlabel('x spacing [-]','LineWidth',2);
ylabel('Error from true derivative [-]');