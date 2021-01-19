open Emotion

module AnimateCss = {
    let animated = "animated"

    let fast = "fast"
    let faster = "faster"
    let fastest = css(list{
        animationDuration(#ms(220))
    })
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