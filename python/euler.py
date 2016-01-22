def fibonacci(max_value=100000000, a=0, b=1):
    while a < max_value:
        yield a
        a, b = b, a + b

def isPalindrome(n):
		return str(n) == str(n)[::-1]
