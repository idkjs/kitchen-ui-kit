type t
@bs.module("numeral") external make: float => t = "default"
@bs.send external format: (t, string) => string = "format"