#Answer of Q1.
print("Answer of Q1(a)")
a = 10

print("Answer of Q1(b)")
bb=float(2.5)
bbb=10e22
b=bb*bbb

print("Answer of Q1(c)")
c=complex(2,3)
print(c.real , "+" , c.imag, "i")

import cmath
print("Answer of Q1(d)")
d = cmath.exp(2j * cmath.pi / 3)
print(d)
#another method to do same
j=cmath.sqrt(-1)
dd= cmath.e**(j*2*cmath.pi/3)
print(dd)



#Answer of Q2.

import numpy as np
print("Answer of Q2(a)")
avec= np.array([3.14, 15, 9, 26])
print(avec)


print("Answer of Q2(b)")
bvec= np.array([
               [2.17],
               [8],
               [28],
               [182]
])
print(bvec)


print("Answer of Q2(c)")
gh = []
value = 5
while value >= -5:
    gh.append(value)
    value -= 0.2
cvec = np.array([gh])
print(cvec)

#another way to do it using linpace is
cvecc=np.linspace(5,-5,101)
print(cvecc)


print("Answer of Q2(d)")
dvec=np.logspace(0,1,101)
print(dvec)

print("Answer of Q2(e)")
evec = np.array(['HELLO'])
print(evec)



#Answer of Q3.

import numpy as np
print("Answer of Q3(a)")
aMat= np.full((9, 9), 2)
print(aMat)

print("Answer of Q3(b)")
diag = [1, 2, 3, 4, 5, 4, 3, 2, 1]
bMat = np.diag(diag)
print(bMat)

print("Answer of Q3(c)")
cMat = np.arange(1, 101).reshape(10, 10)
print(cMat)

print("Answer of Q3(d)")
dMat = np.random.randint(-3, 4, size=(5, 3))
print(dMat)

print("Answer of Q3(e)")
eMat= np.array([[13, -1, 5],
               [-22, 10, -87]
               ])
print(eMat)


#Answer of Q4.


import cmath
import math
a=10

print("Answer of Q4(a)")
x=1/(1+cmath.exp(-(a-15)/16))
print(x)

bb=float(2.5)
bbb=10e22
b=bb*bbb
print("Answer of Q4(b)")
y=(math.sqrt(a)+b**(1/21))**cmath.pi
print(y)


print("Answer of Q4(c)")
c=complex(2,3)
d = cmath.exp(2j * cmath.pi / 3)
z=cmath.log((c.real + d.real)*(c.real-d.real)*cmath.sin(a*cmath.pi/3))/c*c.conjugate()
print(z)


#Answer of Q5.


print("Answer of Q5(a)")
dot_product = np.dot(avec, bvec)
xMat = dot_product * aMat**2

print(xMat)


print("Answer of Q5(b)")
yMat=dot_product
print(yMat)


print("Answer of Q5(c)")
fgf= np.linalg.det(cMat)
gfg= np.dot(aMat, bMat)
fgfg=np.transpose(gfg)
zMat=fgf*fgfg
print(zMat)



#Answer of Q6
import numpy as np

cMat = np.arange(1, 101).reshape(10, 10)


print("Answer of Q6(a)")
cMat = np.arange(1, 101).reshape(10, 10)
cSum = np.sum(cMat, axis=0)
print(cSum)


eMat= np.array([[13, -1, 5],
               [-22, 10, -87]
               ])

print("Answer of Q6(b)")
eMean = np.mean(eMat, axis=1)
print(eMean)


print("Answer of Q6(c)")
eMat[0]=[1, 1, 1]
print(eMat)


print("Answer of Q6(d)")
cSub = cMat[1:9, 1:9]
print(cSub)


print("Answer of Q6(e)")
lin = np.arange(1, 21)
lin[lin % 2 == 0] *= -1
print(lin)


print("Answer of Q6(f)")
ran = np.random.rand(1, 5)
ran[ran < 0.5] = 0
print(ran)



#Answer of Q7
import numpy as np
import matplotlib.pyplot as plt
import cmath
x = np.linspace(0 , 2*cmath.pi, 500)
y_sin=np.sin(x)
y_cos=np.cos(x)
plt.plot(x,y_sin, color='blue')
plt.plot(x,y_cos, color='red', linestyle='--')
plt.xlabel('x-axis')
plt.ylabel('y-axis')
plt.title('2-D Graph of Sine and Cosine wave')
plt.legend()
plt.xlim(0, 2*np.pi)
plt.ylim(-1.4, 1.4)
plt.show()


