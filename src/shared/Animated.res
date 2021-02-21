module Transitions = {
    open Emotion

    let slower = transition(
        "all", 
        #ms(250), 
        #linear, 
        #ms(0)
    )

    let faster = transition(
        "all", 
        #ms(150), 
        #linear, 
        #ms(0)
    )

    let fastest = transition(
        "all", 
        #ms(100), 
        #linear, 
        #ms(0)
    )

    let evenFaster = transition(
        "all", 
        #ms(60), 
        #linear, 
        #ms(0)
    )
}

@bs.val 
external requestAnimationFrame : (unit => unit) => int = "requestAnimationFrame";

let useToggleAnimation = (~toggle, ~from, ~_to) => {
    let noAnimation = ""
    let (animationClass, setAnimationClass) = React.useState(_ => noAnimation)
    let lastToggle = React.useRef(toggle)

    let updateAnimationClass = React.useCallback((animationClass) => {
        lastToggle.current = toggle
        setAnimationClass(_ => "")
        let _ = requestAnimationFrame(_ => {
            setAnimationClass(_ => animationClass)
        })
        ()
    })

    let shouldAnimate = toggle != lastToggle.current
    let _ = switch shouldAnimate {
        | true => switch toggle {
            | true => updateAnimationClass(_to)
            | false => updateAnimationClass(from)
        }
        | false => ()
    }

    animationClass
}