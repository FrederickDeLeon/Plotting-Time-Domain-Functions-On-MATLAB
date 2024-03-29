clear all
close all
clc
XLIM = [-8, 80]; % creates a global variable used for plot formatting
YLIM = [-80, 80]; % creates a global variable used for plot formatting
t = linspace(XLIM(1), XLIM(2), 10^3 + 1);
%% Figure 1. Plot Dirac, Heaviside, and ramp
figure
subplot(1,3,1)
plot(t, dirac(t), 'k-', 0, 0, 'ko') % Dirac-Delta Function
YL = ylabel('$\delta{\left( t \right)}$');
set(YL, 'interpreter', 'latex', 'fontsize', 12)
subplot(1,3,2)
plot(t, heaviside(t), 'b-') % Heaviside-step function 
YL = ylabel('$u(t)$');
set(YL, 'Interpreter', 'latex', 'fontsize', 12)
subplot(1,3,3)
plot(t, t .* heaviside(t), 'r-') % Unit-ramp function 
YL = ylabel('$tu(t)$');  
set(YL, 'interpreter', 'latex', 'fontsize', 12)
filename = 'SampleFigure_1';
print(filename, '-djpeg')

%% Figure 2. Plot exponential functions
ALPHA = [-3, -1, 0, 1, 3];
figure
subplot(1,2,1)
hold all
for i = 1:length(ALPHA)
alpha = ALPHA(i);
f = exp(t*alpha).*heaviside(t);
plot(t, f)
end
set(gca, 'fontsize',12)
XL = xlabel('Time, $t$');
set(XL, 'interpreter', 'latex', 'fontsize', 12)
YL = ylabel('$\exp{\left( t\,\alpha \right)}$');
set(YL, 'interpreter', 'latex', 'fontsize', 12)
L = legend(sprintf('$%s = %1.0f$', '\alpha', ALPHA(1)),...
sprintf('$%s = %1.0f$', '\alpha', ALPHA(2)),...
sprintf('$%s = %1.0f$', '\alpha', ALPHA(3)),...
sprintf('$%s = %1.0f$', '\alpha', ALPHA(4)),...
sprintf('$%s = %1.0f$', '\alpha', ALPHA(5)));
set(L, 'interpreter', 'latex', 'location', 'northoutside', 'fontsize', 12);
set(gca, 'xlim', XLIM)
set(gca, 'ylim', YLIM)
box on
grid on
set(gca, 'fontsize',12)

subplot(1,2,2)
hold all
for i = 1:length(ALPHA)
alpha = ALPHA(i);
f = t .* exp(t * alpha) .* heaviside(t);
plot(t, f)
end
set(gca, 'fontsize', 12)
XL = xlabel('Time, $t$');
set(XL, 'interpreter', 'latex', 'fontsize', 12)
YL = ylabel('$t \cdot \exp{\left( t\,\alpha \right)} \cdot u(t)$');
set(YL, 'interpreter', 'latex', 'fontsize', 12)
L = legend(sprintf('$%s = %1.0f$', '\alpha', ALPHA(1)),...
sprintf('$%s = %1.0f$', '\alpha', ALPHA(2)),...
sprintf('$%s = %1.0f$', '\alpha', ALPHA(3)),...
sprintf('$%s = %1.0f$', '\alpha', ALPHA(4)),...
sprintf('$%s = %1.0f$', '\alpha', ALPHA(5)));
set(L, 'interpreter', 'latex', 'location', 'northoutside', 'fontsize', 12);
set(gca, 'xlim', XLIM)
set(gca, 'ylim', YLIM)
box on
grid on
set(gca, 'fontsize', 12)

filename = 'SampleFigure_2';
print(filename, '-djpeg')

%% Figure 3. Plot sinosoidial functions
OMEGA = [1/2, 1, 2];
figure
subplot(1,2,1)
for i = 1:length(OMEGA)
omega = OMEGA(i);
f = sin(omega * t) .* heaviside(t);
plot(t, f)
hold on
end

L = legend(sprintf('$%s = %1.0f$', '\omega', OMEGA(1)),...
sprintf('$%s = %1.0f$', '\omega', OMEGA(2)),...
sprintf('$%s = %1.0f$', '\omega', OMEGA(3)));
set(L, 'interpreter', 'latex', 'location', 'northoutside', 'fontsize', 12);

subplot(1,2,2)
for i = 1:length(OMEGA)
omega = OMEGA(i);
f = (sin(omega * t) - omega * t .* cos(omega * t)) .* heaviside(t);
plot(t, f)
hold on
end

set(gca, 'fontsize', 12)
XL = xlabel('Time, $t$');
set(XL, 'interpreter', 'latex', 'fontsize', 12)
YL = ylabel('$[\sin(\omega t) - \omega t \cos(\omega t)] \cdot u(t)$');
set(YL, 'interpreter', 'latex', 'fontsize', 12)
L = legend(sprintf('$%s = %1.2f$', '\omega', OMEGA(1)),...
sprintf('$%s = %1.0f$', '\omega', OMEGA(2)),...
sprintf('$%s = %1.0f$', '\omega', OMEGA(3)));
set(L, 'interpreter', 'latex', 'location', 'northoutside', 'fontsize', 12);
set(gca, 'xlim', XLIM)
set(gca, 'ylim', YLIM)
box on
grid on
set(gca, 'fontsize', 12)

filename = 'SampleFigure_3';
print(filename, '-djpeg')
pwd
% go to the diretory output on the command line
% then open *.jpeg files
