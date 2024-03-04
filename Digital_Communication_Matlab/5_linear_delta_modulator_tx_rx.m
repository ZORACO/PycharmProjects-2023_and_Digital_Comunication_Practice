%%% Delta Modulation Transmitter and Receiver

clear all; close all; clc;

%% Input Sinusoidal Signal
fm = 10; % Message Frequency
fs = 20*fm; % Sampling Frequency
am = 2; % Amplitude
t = 0:1/fs:1; % Time
x = am*cos(2*pi*fm*t); % Input Sinusoidal Signal

figure(1);
plot(x,'r-') ;
hold on
xlabel('Time')
ylabel('Amplitude')
%title('Input Sinusoidal Signal')
% Step Size
delta = (4*pi*am*fm)/fs; 



%% Transmitter 
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

%% Receiver
for n = 1:length(x)
    if n ==1
        xqr(n) = eq(n);
    else
        xqr(n) = eq(n) + xqr(n - 1);
    end
end
stairs(xqr,'black'); 
grid on
legend('Original Signal','Stair-Case Approximated Signal')


%% Low Pass Filtering
[num den] = butter(2,4*fm/fs); % Butterworth Filter
rec_op = filter(num, den, xqr); % Low Pass Filtering
figure(2);
plot(t,x,'r--',t,rec_op,'k-')
grid on
xlabel('Time')
ylabel('Amplitude')
%title('Smoothed Signal')
legend('Original Signal','Smoothed Signal')
