import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

def zhukko(insideRoom, initialRate):

    positions = np.array([[-insideRoom/2, -insideRoom/2],
                          [insideRoom/2, -insideRoom/2],
                          [insideRoom/2, insideRoom/2],
                          [-insideRoom/2, insideRoom/2]])


    def directionMovement(position, positionSecond):

        direction = positionSecond - position
        distance = np.linalg.norm(direction)

        if distance > 0:
            return direction / distance
        else:
            return np.zeros_like(direction)

    def derivatives(t, y):

        distancesCovered = np.zeros(4)
        position = y.reshape((4, 2))
        tmp = np.zeros((4, 2))

        for i in range(4):
            direction = directionMovement(position[i], position[(i + 1) % 4])

            tmp[i] = direction * initialRate

            distancesCovered[i] += np.linalg.norm(tmp[i] * t)

            for j in range(i + 1, 4):
                if np.linalg.norm(position[i] - position[j]) < 1e-4:

                    tmp[i] = np.zeros_like(tmp[i])
                    tmp[j] = np.zeros_like(tmp[j])

        return tmp.flatten()

    solution = solve_ivp(derivatives, (0, insideRoom/initialRate), positions.flatten(), method='RK45', max_step = 1e-2, atol=1e-6, rtol=1e-3)


    colors = ['c', 'm', 'y', 'k']

    for i in range(4):
        plt.plot(solution.y[i*2], solution.y[i*2+1], color=colors[i], label=f'Cockroach {i+1}')

    plt.xlim(-insideRoom/2 - 1, insideRoom/2 + 1)
    plt.ylim(-insideRoom/2 - 1, insideRoom/2 + 1)
    plt.gca().set_aspect('equal')
    plt.legend()
    plt.show()

zhukko(10, 1)