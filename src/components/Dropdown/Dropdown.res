%%raw(`import './../../dependencies.css'`)

open Emotion
open Cn

include BigNumber

let useDropdown = () => React.useState(_ => false)

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
        className={fromList(list{
            DropdownStyles.Container.make(),
            css(list{
                paddingBottom(#px(distanceFromHost))
            }),
            "dropdown"
        })}
    >
        <div
            className={fromList(list{
                DropdownStyles.Wrapper.make(
                    ~background
                ),
                animationClass,
                "dropdown-wrapper"
            })}
        >
            {children}
        </div>
    </div>
}