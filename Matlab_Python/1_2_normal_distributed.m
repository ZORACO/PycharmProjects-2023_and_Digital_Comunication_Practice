%%%%% Matlab program to plot pdf of uniformly distributed random variables
clear all; close all; clc;

N = 100000; %%% Number of samples

norm_mean = 0; norm_variance = 0.1;

x = norm_mean + sqrt(norm_variance).*randn(1,N); % uniformly distributed random variables

nob = 100; % Number of bins used in histogram

a = min(x);

b = max(x);

aa = linspace(a,b,nob); % Initialize the Counters

count(size(aa)) = 0;

for i = 1:length(aa) - 1
    for j = 1:N
        if x(j) >= aa(i) && x(j) < aa(i+1)
            count(i) = count(i) + 1;
        end
    end
    y(i) = (aa(i) + aa(i+1))/2;
end
subplot(211)
bar(y, count(1:end-1)/length(x));

[bin, val] = hist(x,y);
subplot(212)
bar(y, bin/length(x));



