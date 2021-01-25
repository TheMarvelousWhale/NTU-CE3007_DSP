# -*- coding: utf-8 -*-
"""
Created on Tue Jan 19 10:35:41 2021

@author: hoang
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(-10,10,100)

y = np.cos(x)

plt.plot(x,y)
plt.show()
plt.stem(x,y,use_line_collection=True,basefmt="b")
plt.show()