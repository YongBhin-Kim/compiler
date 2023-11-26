# factorial.py 

def factorial(theNumber):
    result = 1
    while theNumber > 0: 
       result = result * theNumber
       theNumber = theNumber-1
    return result

print('4! =', factorial(4))
print('5! =', factorial(5))
