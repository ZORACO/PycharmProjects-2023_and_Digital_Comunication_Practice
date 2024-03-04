%%%%% Matlab program to plot pdf of Exponential distributed random variables
clear all; close all; clc;

N = 100000; %%% Number of samples

norm_mean = 0; norm_variance = 1/2;

x_1 = norm_mean + sqrt(norm_variance).*randn(1,N); % normally distributed random variables

x_2 = norm_mean + sqrt(norm_variance).*randn(1,N); % normally distributed random variables

h = x_1 + x_2*i; % Complex Gaussian

z = abs(h).^2;

nob = 100; % Number of bins used in histogram

a = min(z);

b = max(z);

aa = linspace(a,b,nob); % Initialize the Counters

count(size(aa)) = 0;

for ii = 1:length(aa) - 1
    for jj = 1:length(z)
        if z(jj) >= aa(ii) && z(jj) < aa(ii+1)
            count(ii) = count(ii) + 1;
        end
    end
    y(ii) = (aa(ii) + aa(ii+1))/2;
end
subplot(211)
bar(y, count(1:end-1)/length(z));

[bin, val] = hist(z,y);
subplot(212)
bar(y, bin/length(z));



