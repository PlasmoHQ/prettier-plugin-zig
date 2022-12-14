import prettier, { Printer } from "prettier"

import type { ParsedNode } from "./parser"

const { group, hardline, indent, softline } = prettier.doc.builders

const printer: Printer<ParsedNode> = {
  print(path, _opts, print) {
    const { type } = path.getValue()

    switch (type) {
      case "loop":
        return group([
          "[",
          indent([softline, path.map(print, "value")]),
          [softline, "]"]
        ])
      case "root":
        return [path.map(print, "value"), hardline]
      default:
        throw new Error(`Unsupported node encountered: ${type}`)
    }
  }
}

export default printer
