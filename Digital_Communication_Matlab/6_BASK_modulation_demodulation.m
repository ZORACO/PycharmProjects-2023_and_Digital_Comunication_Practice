% BASK Modulation and demodulation 
% Input bits generation
close all; clear all; clc
N = 10; % Input Size
n = randi([0,1], 1,N);
% Bit to Symbol Mapping - Unipolar Line Coding
for ii = 1:N
    if n(ii) == 0
        nn(ii) = 0;
    else 
        nn(ii) = 1;
    end
end
% Unipolar NRZ Signal
S = 100; %Samples per bit
kk = 1; % Index of input bit
t = 0:1/S:N; % Time and bit duration, T_b = 1
for jj = 1:length(t)
    if t(jj) <= kk
        m(jj) = nn(kk);
    else
        m(jj) = nn(kk + 1);
        kk = kk + 1;
    end
end

subplot(411)
plot(t,m,'b')
xlabel('time')
ylabel('Amplitude')
title('NRZ Unipolar Line Coded Signal')

% Carrier Signal generation
c = cos(2*pi*2*t);
subplot(412)
plot(t,c,'r')
xlabel('time')
ylabel('Amplitude')
title('Carrier Signal')

% BASK Signal Generation
x = m.*c;
subplot(413)
plot(t,x,'k')
xlabel('time')
title('BASK Signal')
ylabel('Amplitude')


%% Coherent detection
y = x; %No Noise i.e received signal is transmitted signal
% Product Modulator
y1 = y.*c;
subplot(414)
plot(t,y1,'k')
xlabel('time')
title('Product Modulator Output')
ylabel('Amplitude')

int_op =[];
% Integrator
for ii = 0:S:length(y1) - S
    int_o = (1/S)*trapz(y1(ii + 1:ii+S));
    int_op = [int_op int_o];
end

% Decision Device
Th = 0.5; % Threshold for BASK
disp('Detected bits:')
det = (round(int_op,1) >= Th)
%det = (int_op >= Th)
% BER Computation
ber = sum(n ~= det)/N;
