### Qn1

Estimate the magnitude and phase shift given h\[n\]

We calculate H(z) from h\[n\], then sub in the omega of x\[n\] to see the magnitude and phase shift

for xn = cos(0.1pin) and hn = {0.1,0.2,0.3}
Punch in matlab:
0.1*exp(-0.1*pi*i)+0.2*exp(-0.1*pi*i)+0.3*exp(-0.1*pi*i)

\[Out\]:0.5706 - 0.1854i 
Mag times 0.576, phase shift by -0.185

### Qn2 

y(n) = 10x(n) +2x(n-1) +alpha y(n-1)

H(z) = (10+2z)/(z-alpha)

Now to make it generate a finite impulse response aka no feedback term, the A(z) has to have order 1 (or any other method that destroy the feedback term of this system)

This means alpha can be -0.2, making H(z) = 10 

System is now just opamps gain 10. 

### Qn3

Echo due to the output being a system of delayed input*gain

See [here](http://personal.ee.surrey.ac.uk/Personal/P.Jackson/ee1.lab/D3_echo/D3_EchoAndReverberationExpt.pdf) for more details

Q3c fast convolution: 

Assuming have the smaller array sliding on top of the big array, like this

Smol array                 \[5 0 4 3\]

Big array       \[1 0 2 3 4 5 6 7 8 1 2 3 4 5 6 7\]

At each step we take the dot product of the smol array and the overlapped region of the big array. 

We can optimize this in 2 ways
If smol array is sparse, only multiply in the non-zero value 

Smol array                  \[0 0 4 0\]

Big array       \[1 0 2 3 4 5 6 7 8 1 2 3 4 5 6 7\]

Do 4\*8 instead of 0\*6+0\*0+4\*8+0\*1

Another is to only start the dot product when the big array is non zero 

Smol array                  \[5 0 4 3\]

Big array       \[0 0 0 0 0 0 6 7 8 1 2 3 4 5 6 7\]

Both methods rely heavily on determining the sparsity of the matrices. How efficient is that? idk. Might as well just write in C++ and use BLAS. 

### Qn 4

a) Attenuate signal strength at frequency 3000Hz

b) 

h1n has LP cut off at fH = 0.18 (normalized over pi) aka 0.182pi rad/sample 
h2n has HP cutoff at fL = 0.29

combining h1n and h2n fL>fH

This toolbox uses the convention that unit frequency is the Nyquist frequency, defined as half the sampling frequency. The normalized frequency, therefore, is always in the interval 0  f  1. For a system with a 1000 Hz sampling frequency, 300 Hz is 300/500 = 0.6. To convert normalized frequency to angular frequency around the unit circle, multiply by . To convert normalized frequency back to hertz, multiply by half the sample frequency.


 
A spectrogram is a visual representation of the spectrum of frequencies of a signal as it varies with time. When applied to an audio signal, spectrograms are sometimes called sonographs, voiceprints, or voicegrams. When the data are represented in a 3D plot they may be called waterfalls. 

A common format is a graph with two geometric dimensions: one axis represents time, and the other axis represents frequency; a third dimension indicating the amplitude of a particular frequency at a particular time is represented by the intensity or color of each point in the image.  

### Qn 5

put B and A into fvtool, click on impulse response, record value
see the cutoff frequency from magnitude response, take that value *Fs/2 to yield band reject fRJ in Hz 

See if ur signal contain anot

### Qn 6
arrange to some y = some x
Coefficients of x will form B
Coefficients of y will form A 

Use fvtool, click on filter info

c) fvtool, impulse response

