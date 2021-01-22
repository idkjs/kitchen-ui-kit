type t
@new @module("bignumber.js") external make: (float) => t = "default"
@bs.send external toNumber: t => float = "toNumber"
@bs.send external dividedBy: (t, float) => t = "dividedBy"