List myaverage := method(
    if(isEmpty,
        nil,
        sum := 0
        foreach(n,
            if(n type == "Number",
            sum = sum + n,
            Exception raise("not a number") / size))))

list(1, 2) myaverage println
list() myaverage println
list(1, "a") myaverage println
