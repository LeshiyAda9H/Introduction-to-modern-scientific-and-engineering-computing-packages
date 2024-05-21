from scipy.integrate import solve_ivp
import numpy as np
import matplotlib.pyplot as plt

alpha = 28
beta = 8/3
sigma = 10

def F(t, state):
    x, y, z = state
    x1 = sigma * (y - x)
    y1 = x * (alpha - z) - y
    z1 = x * y - beta*z
    return x1, y1, z1

init = [0, 1, 20]
t = [0, 100]
t_eval = np.linspace(t[0], t[1], 50000)

sol = solve_ivp(F, t, init, t_eval=t_eval)

fig = plt.figure(figsize=(8, 10))
ax = fig.add_subplot(projection="3d")
ax.plot(sol.y[0], sol.y[1], sol.y[2])
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_zlabel("z")
plt.show()
