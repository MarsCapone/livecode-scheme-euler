import euler
from fractions import gcd

# ----- Problem 1 ----- #
def pe1():
    return sum([x for x in range(1000) if x % 3 == 0 or x % 5 == 0])


# ----- Problem 2 ----- #
def pe2():
    return sum([i for i in euler.fibonacci(4000000) if i % 2 == 0])


# ----- Problem 4 ----- #
def pe4(): 
    


# ----- Problem 33 ----- #
def pe33():
    denproduct = 1
    nomproduct = 1
    for i in range(10):
        for den in range(i):
            for nom in range(den):
                if (nom * 10 + i) * den == nom * (i * 10 + den):
                    denproduct *= den
                    nomproduct *= nom
    return denproduct / gcd(nomproduct, denproduct)
