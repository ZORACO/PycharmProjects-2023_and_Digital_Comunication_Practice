%%% Delta Modulator Transmitter
% Input Sinusoidal Signal
clear all; close all; clc;
fm = 1; % Message Frequency
fs = 20*fm; % Sampling Frequency
am = 1; % Amplitude
t = 0:1/fs:1; % Time
x = am*cos(2*pi*fm*t); % Input Sinusoidal Signal


% Step Size
delta = (2*pi*am*fm)/fs; 
%%%%%%%%%%%%%%%%


figure(1);
plot(x,'r-') ;
hold on
xlabel('Time')
ylabel('Amplitude')
%title('Input Sinusoidal Signal')

%%Transmitter 
for n = 1:length(x)
    if n ==1
        e(n) = x(n);
        eq(n) = delta*sign(e(n));
        xq(n) = eq(n);
    else
        e(n) = x(n) - xq(n - 1);
        eq(n) = delta*sign(e(n));
        xq(n) = eq(n) + xq(n - 1);
    end
end

stairs(xq,'black');

% Transmitted  DM Sequence
for n = 1:length(x)
    if e(n) > 0
        dm(n) = 1;
    else
        dm(n) = 0;
    end
end
