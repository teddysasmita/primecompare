const std = @import("std");
const ArrayList = std.ArrayList;

pub fn main() !void {
    var limit: u32 = 100000;
    var is_prime: bool = true;

    const allocator = std.heap.c_allocator;
    var primes = ArrayList(u32).init(allocator);
    defer primes.deinit();

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);
    std.debug.print("{s}", .{args[1]});

    limit = try std.fmt.parseInt(u32, args[1], 10);

    var i: u32 = 2;
    var j: u32 = 0;
    while (i < limit) : (i += 1) {
        is_prime = true;
        j = 2;
        while (j < i) : (j += 1) {
            if (i % j == 0) {
                is_prime = false;
                break;
            }
        }
        if (is_prime) {
            try primes.append(i);
        }
    }
    i = 0;
    while (i <= primes.items.len) : (i += 1) {
        if (i < primes.items.len) {
            std.debug.print("{d}, ", .{primes.items[i]});
        }
    }
}
