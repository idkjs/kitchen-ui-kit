%%raw(`import './../../dependencies.css'`)

open Emotion
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
        className={fromList(list{
            DropdownStyles.Container.make(),
            css(list{
                paddingBottom(#px(distanceFromHost))
            })
        })}
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