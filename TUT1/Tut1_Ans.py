""" This is answer to DSP Tut 1 Signals
Author: Chng Eng Siong
Date: 1st Dec 2018
"""


import numpy as np
from scipy.ndimage.interpolation import shift
import matplotlib.pyplot as plt
import time




def Tut1_Q1d():

    n = np.arange(-20,20)
    K=3
    y = np.zeros((K,len(n)),dtype=np.float)
    y[0,:] = 3*np.cos(np.pi/6*n+np.pi/3)
    y[1,:] = 1*np.sin(1.8*np.pi*n)
    y[2,:] = 1*np.cos(0.5*n)

    fig, axs = plt.subplots(K, 1)
    opStr = 'Q1d solution'
    axs[0].set_title(opStr)
    for i in [0,1,2]:
        axs[i].stem(n, y[i,:],'r-+')
        axs[i].grid()

    plt.show()

def Tut1_Q1e():

    # to understand 1.8\pi rad per second,
    # lets plot it with CT , i.e, time can be in floating point
    t = np.arange(-10,10,1/1000.0)
    yCT = 1*np.sin(1.8*np.pi*t)
    fig, axs = plt.subplots(1, 1)
    axs.plot(t, yCT, 'g-')

    n = np.arange(-10,10)
    yDT = 1*np.sin(1.8*np.pi*n)
    axs.plot(n, yDT, 'r-+')

    axs.grid()
    opStr = 'Q1e solution'
    axs.set_title(opStr)
    axs.set_xlabel('sample n (integer) vs t(seconds) ')
    axs.set_ylabel('y[n] vs y(t)')
    plt.show()
    #


def Tut1_Q1g():

    n = np.arange(-20,50)
    K=2
    y = np.zeros((K,len(n)),dtype=np.float)
    C = 3
    phaseShift = np.pi/3
    y[0,:] = C*np.cos(np.pi/6*n+phaseShift)
    A = C*np.cos(phaseShift)
    B = C*np.sin(phaseShift)
    y[1,:] = A*np.cos(np.pi/6*n)+ (-1)*B*np.sin(np.pi/6*n)

    fig, axs = plt.subplots(1, 1)
    axs.plot(n, y[0,:], 'r-+')
    axs.plot(n, y[1,:], 'go')
    axs.grid()
    opStr = 'Q1g solution'
    axs.set_title(opStr)
    axs.set_xlabel('sample n')
    axs.set_ylabel('y[n]')
    plt.show()


def Tut1_Q8():
#  y[n] = 2x[n]+x[n-1] - x[n-3]
# first method, use scale * delayed impulse create by identity matrix
    xEye =  np.identity(10)
    print(xEye)
    y1 = 2*xEye[0,:] + 1*xEye[1,:] - 1*xEye[3,:]
    print('The impulse response = ',y1)

    h = [2,1,0,-1]  # the impulse is by inspection of the equation, the coefficients at each delay
    y2 = np.convolve(h,xEye[0,:])
    print('Using convolution y2 = ',y2)


def Tut1_Q10():
    N  = 50
    n= np.arange(-N,N+1)
    print(n)

    leftN = np.arange(-N,+1)
    print(leftN)
    hleft = np.zeros(N)
    hleft = (4/7)*np.power(2.0, leftN)
    print(hleft)

    rightN = np.arange(1,N+1)
    print(rightN)
    hright = np.zeros(len(rightN))
    hright = (11/7)*np.power(0.25, rightN-1)
    print(hright)

    h = np.zeros(len(n))
    h[0:len(hleft)] = hleft
    h[len(hleft):len(h)] = hright
    fig, axs = plt.subplots(1, 1)
    axs.stem(n, h, 'g-')
    plt.grid()
    plt.show()


def main():
    print("python main function")

    Tut1_Q1d()
    Tut1_Q1e()
    Tut1_Q1g()
    Tut1_Q8()
    Tut1_Q10()

if __name__ == '__main__':
    main()


