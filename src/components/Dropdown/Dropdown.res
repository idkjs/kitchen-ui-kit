%%raw(`import './../../dependencies.css'`)

open Cn
@react.component
let make = (
    ~background: Colors.Background.t,
    ~opened: bool,
    ~distanceFromHost: DropdownProps.distanceFromHost,
    ~direction: DropdownProps.direction,
    ~children
) => {
    let (from, _to) = DropdownStyles.Wrapper.Animation.make(
        ~distanceFromHost,
        ~direction
    )
    let animationClass = Animated.useToggleAnimation(
        ~toggle = opened,
        ~from,
        ~_to 
    )

    <div
        className={
            DropdownStyles.Container.make()
        }
    >
        <div
            className={fromList(list{
                DropdownStyles.Wrapper.make(
                    ~background
                ),
                animationClass
            })}
        >
            {children}
        </div>
    </div>
}