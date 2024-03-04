import numpy as np
import matplotlib.pyplot as plt

# Parameters
a = 2  # lower limit
b = 3  # upper limit
N = 100000  # Number of samples
nob = 10  # Number of bins used in histogram

# Generate uniformly distributed random variables
x = np.random.uniform(a, b, N)

# Generate bins
bins = np.linspace(a, b, nob+1)

# Plot the PDF using the histogram
plt.figure(figsize=(10, 8))

# Subplot 1: Manual calculation of histogram
counts, edges = np.histogram(x, bins=bins)
widths = np.diff(edges)
centers = (edges[:-1] + edges[1:]) / 2
plt.subplot(211)
plt.bar(centers, counts / np.sum(counts), width=widths, align='center')
plt.title('PDF of Uniformly Distributed Variables (Manual)')

# Subplot 2: Using the hist function for automatic histogram
plt.subplot(212)
plt.hist(x, bins=bins, density=True)
plt.title('PDF of Uniformly Distributed Variables (Automatic)')

plt.tight_layout()
plt.show()
