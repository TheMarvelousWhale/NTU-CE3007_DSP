import numpy as np
import matplotlib.pyplot as plt
from scipy import signal
import math

def myDTFS(x):
    X = np.zeros(len(x), dtype=complex)
    Omega = np.zeros(len(x))
    N = len(x)
    for k in np.arange(0,len(x)):
        tmpVal = 0.0
        Omega[k] = (2*np.pi/N)*k
        for n in np.arange(0,len(x)):
            tmpVal = tmpVal + x[n]*np.exp(-1j*(2*np.pi/N)*k*n)
        X[k] = tmpVal/N
    return (X,Omega)



def myIDTFS(X):
    x = np.zeros(len(X), dtype=float)
    N = len(x)
    for n in np.arange(0,len(x)):
        tmpVal = 0.0
        for k in np.arange(0,len(X)):
            tmpVal = tmpVal + X[k]*np.exp(+1j*(2*np.pi/N)*k*n)
        x[n] = np.absolute(tmpVal)
    return (x)

def myDFT(x):
    X = np.zeros(len(x), dtype=complex)
    Omega = np.zeros(len(x))
    N = len(x)
    for k in np.arange(0,len(x)):
        tmpVal = 0.0
        Omega[k] = (2*np.pi/N)*k
        for n in np.arange(0,len(x)):
            tmpVal = tmpVal + x[n]*np.exp(-1j*(2*np.pi/N)*k*n)
        X[k] = tmpVal
    return (X,Omega)



def myIDFT(X):
    x = np.zeros(len(X), dtype=float)
    N = len(x)
    for n in np.arange(0,len(x)):
        tmpVal = 0.0
        for k in np.arange(0,len(X)):
            tmpVal = tmpVal + X[k]*np.exp(+1j*(2*np.pi/N)*k*n)
        x[n] = np.absolute(tmpVal)/N
    return (x)

def plotMagPhase(x,rad):
    f, axarr = plt.subplots(2, sharex=True)
    x = np.absolute(x)
    axarr[0].stem(np.arange(0,len(x)), x)
    axarr[0].set_ylabel('mag value')
    axarr[1].stem(np.arange(0,len(rad)), rad)
    axarr[1].set_ylabel('Phase (rad)')
    plt.show()

def plotK(W):
    f, axarr = plt.subplots()
    phaseW = np.angle(W)
    print(phaseW)
    axarr.stem(np.arange(0,len(phaseW)),phaseW)
    plt.show()
    print("\n\n\n")
    
def plotDTFSDTFTMag(X):
    N = len(X)
    x = np.absolute(X)
    f, axarr = plt.subplots(figsize=(18, 2.5))
    axarr.stem(np.arange(0,N), x)
    axarr.set_ylabel('DTFS mag value')
    plt.show()
    x = [element * N for element in x]
    f, axarr = plt.subplots(figsize=(18, 2.5))
    axarr.stem(np.arange(0,N), x)
    axarr.set_ylabel('DTFT mag value')
    ticks = range(N)
    ticks = [round(element * 2/N,2) for element in ticks]
#     ticks = [round(element * 2 *np.pi/N,2) for element in ticks]
    plt.xticks(np.arange(0,N), ticks)
    plt.xlabel('w*pi (rad/sample) ')
    plt.show()

    print("\n\n\n")
    