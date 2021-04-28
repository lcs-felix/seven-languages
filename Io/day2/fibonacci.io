// fibonacci

fib := method(n, if(n <= 1 , n, fib(n - 1) + fib(n - 2)))

for(i, 1, 8, fib(i) println)

fibiter := method(n, a := 0; b := 1; for(i, 2, n, b = a + b; a = b - a); b)

for(i, 1, 8, fibiter(i) println)
