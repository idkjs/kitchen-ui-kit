%%raw(`import './../../dependencies.css'`)

open Cn

let useDropdown = () => {
    let (isDropdownOpened, setIsDropdownOpened) = React.useState(_ => false)
    let (isAnimationFinished, setIsAnimationFinished) = React.useState(_ => true)
    let startAnimation = _ => {
        setIsAnimationFinished(_ => {
            let _ = Js.Global.setTimeout(
                _ => setIsAnimationFinished(_ => true),
                DropdownStyles.Body.Animation._animationDuration
            )    
            false
        })
    }

    let toggleDropdown = () => { 
        startAnimation() 
        setIsDropdownOpened(isDropdownOpened => !isDropdownOpened)
    }
    let openDropdown = () => {
        startAnimation()
        setIsDropdownOpened(_ => true)
    }
    let closeDropdown = () => {
        startAnimation()
        setIsDropdownOpened(_ => false)
    }

    (isDropdownOpened, isAnimationFinished, toggleDropdown, openDropdown, closeDropdown)
}

@react.component
let make = (
    ~background: Colors.Background.t,
    // Passing true on the initial render
    // will not open the dropdown
    ~opened: bool,
    ~distanceFromHost: DropdownProps.distanceFromHost,
    ~direction: DropdownProps.direction,
    ~children
) => {

    let (from, _to) = DropdownStyles.Body.Animation.make(
        ~distanceFromHost,
        ~direction
    )
    let animationClass = Animated.useToggleAnimation(
        ~toggle = opened,
        ~from,
        ~_to 
    )

    <div
        className={fromList(list{
            DropdownStyles.Container.make(
                ~opened
            ),
            "dropdown"
        })}
    >
        <div
            className={fromList(list{
                animationClass,
                DropdownStyles.Body.make(
                    ~background
                ),
                "dropdown-body"
            })}
        >
            {children}
        </div>
    </div>
}