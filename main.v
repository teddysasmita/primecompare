import os

fn main() {
    params := os.args_after('test')
    println(params)
    limit := params[1].int() // change this to set the limit
	mut primes := []int{}
    for i in 2..limit {
        mut is_prime := true
        for j in 2..i {
            if i % j == 0 {
                is_prime = false
                break
            }
        }
        if is_prime {
            primes << i
        }
    }
    println('Prime numbers up to ${limit} is ${primes.len}: ${primes}')
}
