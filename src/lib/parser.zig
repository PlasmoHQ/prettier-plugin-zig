// Learning from these 2s:
// https://github.com/shritesh/zigfmt-web/blob/gh-pages/fmt.zig
// https://github.com/williamstein/zig-wasm-json-bridge

const std = @import("std");

const FBA = std.heap.FixedBufferAllocator;
const ArrayList = std.ArrayList;

const JSON = std.json;

extern fn returnString(ptr: [*]const u8, len: usize) void;
extern fn returnObject(ptr: [*]const u8, len: usize) void;

extern fn print(i: usize) void;

fn sendString(s: [*]const u8) void {
    var i: usize = 0;
    while (s[i] != 0) : (i += 1) {}
    returnString(s, i);
}

fn sendObject(x: anytype) void {
    var buf: [8427]u8 = undefined;
    var fba = FBA.init(&buf);
    var string = ArrayList(u8).init(fba.allocator());

    JSON.stringify(x, .{}, string.writer()) catch {
        sendString("error");
    };

    const len = string.items.len;

    returnObject(&buf, len);
}

export fn parse(
    code: [*]const u8,
    len: usize,
) void {
    const data = code[0..len :0];

    const ast = std.zig.parse(std.heap.page_allocator, data);
    defer ast.deinit();

    sendObject(.{
        .x = data,
        .y = "foo",
        .t = 9399392308408234082308,
        .z = ast,
    });
}

export fn prepare(len: usize) u32 {
    const buf = std.heap.page_allocator.alloc(u8, len) catch return 0;
    return @ptrToInt(buf.ptr);
}

export fn cleanup(ptr: [*]const u8, len: usize) void {
    std.heap.page_allocator.free(ptr[0..len]);
}
