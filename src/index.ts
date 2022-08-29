import parser from "./parser"
import printer from "./printer"

const plugin = {
  languages: [
    {
      name: "Zig",
      parsers: ["zig"],
      extensions: [".zig"]
    }
  ],
  parsers: {
    zig: parser
  },
  printers: {
    zig: printer
  },
  defaultOptions: {
    printWidth: 80,
    tabWidth: 2
  }
}

export = plugin
