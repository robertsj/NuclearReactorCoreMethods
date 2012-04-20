% Simple Approximation of Second Order Derivative - Nonuniform Spacing

% Function
f = @(x) 6*x.^6 + 4*x.^3 + 8*x + 2;

% Analytical Derivative of Function
df_exact = @(x) 36*x.^5 + 12*x.^2 + 8;
dff_exact = @(x) 180*x.^4 + 24*x;

% vector non-uniform grid multiplier
r = [1,1.001,1.01,1.05,1.1];

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
figure1 = figure;
axes1 = axes('Parent',figure1,'ZMinorGrid','on','YScale','log',...
    'YMinorTick','on','XScale','log','XMinorTick','on');
box(axes1,'on');
grid(axes1,'on');
grid minor
hold(axes1,'all');
loglog1 = loglog(hl,err_cen,'Parent',axes1,'LineWidth',2,'Color',[0 0 0]);
set(loglog1(1),'DisplayName','r = 1');
set(loglog1(2),'MarkerSize',2,'Marker','.','LineStyle','none',...
    'DisplayName','r = 1.001');
set(loglog1(3),'LineStyle','-.','DisplayName','r = 1.01');
set(loglog1(4),'LineStyle',':','DisplayName','r = 1.05');
set(loglog1(5),'LineStyle','--','DisplayName','r = 1.1');
xlabel('x spacing [-]','LineWidth',2);
ylabel('Error from true derivative [-]');
legend1 = legend(axes1,'show');
set(legend1,'Location','NorthWest');