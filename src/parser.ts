import type { Parser } from "prettier"

type SimpleNode = { type: "simple"; index: number }
type LoopNode = {
  type: "loop"
  start: number
  end: number
  value: ParsedNode[]
}
type RootNode = {
  type: "root"
  start: number
  end: number
  value: ParsedNode[]
}

export type ParsedNode = SimpleNode | LoopNode | RootNode

const parser: Parser<ParsedNode> = {
  astFormat: "zig",
  parse(text) {
    return {
      type: "root",
      value: [
        {
          type: "simple",
          index: 0
        }
      ],
      start: 0,
      end: text.length
    }
  },
  locStart(node) {
    if (node.type === "root" || node.type === "loop") {
      return node.start
    }
    return node.index
  },
  locEnd(node) {
    if (node.type === "root" || node.type === "loop") {
      return node.end
    }
    return node.index
  }
}

export default parser
