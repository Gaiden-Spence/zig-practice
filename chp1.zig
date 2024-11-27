const std = @import("std"); // importing the standard library
const User = @import("models/users.zig").User; //importing User "class" from the models folder

pub fn main() !void {
    std.debug.print("Hello World\n", .{});
    //{s}{s} is telling us the data type that we need to specify from the parameters and the second set of {}
    //we still need to send parameter places even if do not have any parameters in place the second set of {} should be empty

    const user = User{ //calling the struct from models.users
        .power = 9001,
        .name = "Goku", //"Goku" takes on the example of {'G', 'o','k','u',0} and its type is *const[4:0] u8
        //if a function or structure has a []const u8 string literals can be used because null terminated strings are arrays and arrays have known length
    };
    std.debug.print("{s}'s power is {d}\n", .{ user.name, user.power });

    const sum = add(8999, 2);
    std.debug.print("8999 + 2 = {d}\n", .{sum}); //doing some basic cacluclations and calling the constant sum and calling the function add

    user.diagnose();

    //Arrays and slicing
    var a = [_]i32{ 1, 2, 3, 4, 5 }; // declaring the length of the array and the identifier will figure the length for us
    var end: usize = 3; //create variable with "usize" which allows us to make sure that we have a non-negative integer
    end += 1;
    const b = a[1..end]; //where we are indexing the array
    std.debug.print("{d}\n", .{a});
    std.debug.print("{d}\n", .{b});
    std.debug.print("{any}\n", .{@TypeOf(b)});

    //weird example
    const c = [3:false]bool{ false, true, false }; //the [] follows the order of 'length' and 'sentinel' which is a special way of ending the array
    //so const c is making an array of length 3 that contains the values of [false, true, false]
    std.debug.print("{any}\n", .{std.mem.asBytes(&c).*}); //we print the values of as bytes for binary values notice that 0 at he end

    std.debug.print("{any}\n", .{@TypeOf(.{ .year = 2023, .month = 8 })});
    //the reason this code is able to work is that zig

    const super = if (user.power > 9000) true else false;
    std.debug.print("{any}\n", .{super});
}

fn add(a: i64, b: i64) i64 {
    return a + b;
}
