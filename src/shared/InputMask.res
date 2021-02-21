type t
type regexOptions = {
        alias: string,
        groupSeparator: string,
        autoGroup: bool,
        digits: int,
        autoUnmask: bool,
        unmaskAsNumber: bool,
        rightAlign: bool,
        digitsOptional: bool,
        showMaskOnHover: bool,
        showMaskOnFocus: bool
}
type selector = string

@bs.module("inputmask") external makeRegex: (regexOptions) => t = "default"
@bs.send external mask: (t, selector) => unit = "mask"
