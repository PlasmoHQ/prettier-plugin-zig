const std = @import("std");

const CrossTarget = std.zig.CrossTarget;
const Target = std.Target;
const Builder = std.build.Builder;
const LibExeObjStep = std.build.LibExeObjStep;

pub fn build(b: *Builder) !void {
    b.setPreferredReleaseMode(.ReleaseFast);
    const mode = b.standardReleaseOptions();

    const lib = b.addSharedLibrary(
        "parser",
        "src/lib/parser.zig",
        LibExeObjStep.SharedLibKind.unversioned,
    );

    lib.setTarget(CrossTarget{
        .cpu_arch = std.Target.Cpu.Arch.wasm32,
        .os_tag = Target.Os.Tag.freestanding,
    });

    lib.setBuildMode(mode);
    lib.install();
}
