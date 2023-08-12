import os, strutils

proc main() =
    var
        limit: int32 = 100
        primes = newSeq[int32]()

    if paramCount() >= 1:
        limit = int32(parseInt(paramStr(1)))

    for i in 2..<limit:
        var is_prime = true
        for j in 2..<i:
            if i mod j == 0:
                is_prime = false
                break

        if is_prime:
            primes.add(i)

    echo "Prime numbers up to ", $limit, " is ", $primes.len, " :", $primes

main()