import math

def factorial(n):
    sol = 1
    for i in range(n):
        sol *= n
        n = n - 1
    return sol

def partial_permutation(n, k):
    sol = 1
    for i in range(k):
        sol *= n
        n = n - 1
    return sol        

def combinatorial(n, k):
    return int(partial_permutation(n,k)/factorial(k))

while(True):
    print("Factorial [1]")
    print("Partial permutation [2]")
    print("Combinatorial number [3]")

    iOption = input("Choose option: ")

    sol = 0
    
    if iOption == "1":
        n = int(input("Enter n: "))
        print("Solution:", factorial(n))
    elif iOption == "2":
        sol = 1
        print("V(k,n)")
        n = int(input("Enter n: "))
        k = int(input("Enter k: "))
        print("Solution:", partial_permutation(n,k))
    elif iOption == "3":
        n = int(input("Enter n: "))
        k = int(input("Enter k: "))
        print("Solution:", combinatorial(n,k))         

    print("\n")
