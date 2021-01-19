module Primary = {
    let default = #hex("F87A34")
    let darker = #hex("E96A23")
    let darkest = #hex("DE6420")
}

let white = #hex("FFFFFF")
let transparent = #transparent

module Gray = {
    module Light = {
        let lighter = #hex("F9F9F9")
        let default = #hex("F2F2F2")
        let darker = #hex("EDEDED")
        let darkest = #hex("E2E2E2")
    }

    module Dark = {
        let default = #hex("9A9A9A")
        let darker = #hex("858383")
        let darkest = #hex("707070")
    }
}

module Secondary = {
    let default = #hex("171F2D")
    let darker = #hex("090A0C")
    let darkest = #hex("030405")
}

module Background = {
    type t =
    | Light
    | Dark
}