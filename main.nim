import os, strutils

proc main() =
    var
        limit: int
        primes = newSeq[int]()

    if paramCount() < 1:
        limit = 100
    else:
        limit = parseInt(paramStr(1))

    for i in 2..<limit:
        var is_prime = true
        for j in 2..<i:
            if i mod j == 0:
                is_prime = false
                break

        if is_prime:
            primes.add(i)

    # println('Prime numbers up to ${limit} is ${primes.len}: ${primes}')
    echo "Prime numbers up to ", $limit, " is ", $primes.len, " :", $primes

when isMainModule:
    main()