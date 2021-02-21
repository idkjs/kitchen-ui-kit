let px2rem = (~baseSize = 16., px) => #rem(float_of_int(px) /. baseSize)

let onDark = (dark, background: Colors.Background.t) => 
    switch background {
        | Light => ""
        | Dark => dark
    }

let onLight = (light, background: Colors.Background.t) => 
    switch background {
        | Light => light
        | Dark => ""
    }

let scope = (scope) => (className) => scope ++ "__" ++ className