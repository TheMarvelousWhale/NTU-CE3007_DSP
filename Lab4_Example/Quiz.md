# CE 3007 Digital Signal Processing Lab  
## Quiz — 1 (10 marks)

_Answer all questions in 2 hours._
### Name. 	 
### Lab Group.	

Fill in the blanks or briefly answer the questions
1.	Study how y(n) and t(n) is created in the Matlab code. y1000(n) is the sampled version of the continuous signal y(t) = 2sin(2 $\pi$ 2t + $\pi$/4) with the sampled frequency of 1000Hz. t1000(n) is the corresponding sampled time. What is the signal frequency of y(t) in Hz?

_Ans:_ 2Hz


2.	What is the possible value of the cut-off frequency of the lowpass filter. Freq_Fn? Briefly illustrate the reason.

_Ans:_ 1000Hz sampling frequency, Nyquist is 500Hz, cutoff at 0.1 so is 50Hz 

3.	When y100[n] is upsampled to 1000Hz to result in y1000[n], and y1000[n] passes through an ideal lowpass filter with a gain of 1, what is the amplitude of the resultant signal y1000[n] after the lowpass filter?

_Ans:_ y100[n] has amplitude of 2/Ts = 200. Upsampling will not change the amplitude and unity gain opamp also will not change the amplitude. 

4.	When sampling continuous signal y(t)=sin(40 $\pi$t), the minimum sampling frequency is ??	Hz to avoid aliasing.

_Ans:_ F = 20Hz so at least sample at 40
