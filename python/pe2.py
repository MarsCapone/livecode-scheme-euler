import euler

def pe2():
    return sum([i for i in euler.fibonacci(4000000) if i % 2 == 0])

print(pe2())
