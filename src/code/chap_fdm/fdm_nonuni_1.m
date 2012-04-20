% Simple Approximation of First Order Derivative - Nonuniform Spacing

% Function
f = @(x) x.^4;

% Analytical Derivative of Function
df_exact = @(x) 4*x.^3;

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
    df_cen = (f(100+hr) - f(100-hl))./(hl + hr);
    
    % Compute Error
    err_cen(:,i) = abs(df_cen - df_exact(100));
    
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