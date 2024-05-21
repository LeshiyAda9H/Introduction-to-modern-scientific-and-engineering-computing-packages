def f1(x):
    return x * 2 - 3


def f2(x):
    return x ** 2


def distance(x):
    return f2(x) - f1(x)


def bridgy(f1, f2):
    minx = min([[distance(x), x] for x in range(-1000, 1001)])
    return minx[1], f1(minx[1]), minx[1], f2(minx[1])


result = bridgy(f1, f2)

print(f"Точки соединения: ({result[0]}, {result[1]}) и ({result[2]}, {result[3]})")
