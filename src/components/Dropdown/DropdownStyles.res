open Cn
open Emotion

module Container = {
    let shared = css(list{
        position(#absolute),
        width(#pct(100.0)),
        boxSizing(#borderBox),
    })

    let hidden = css(list{
        visibility(#hidden)
    })

    let make = (~opened) => fromList(list{
        shared,
        hidden->on(!opened)
    })
}

module Body = {

    let boxShadowWrapper = (color) => (
        boxShadow(
            ~y = #px(2), 
            ~x = #px(0), 
            ~blur = #px(3), 
            ~spread = #px(1), 
            ~inset = false, 
            color
        )
    )

    module Animation = {
        // let _animationDuration = 220;
        let _animationDuration = 220
        let make = (
            ~distanceFromHost,
            ~direction
        ) => {
            let direction = switch direction {
                | DropdownProps.Down => (length) => list{
                    top(#px(length))
                }
                | DropdownProps.Up => (length) => list{
                    bottom(#px(length))
                }
            }

            let fadeIn = keyframes(list{
                (10, list{
                    opacity(0.0),
                    zIndex(9999),
                    visibility(#visible),
                    
                }),

                (20, list{
                    ...direction(0)
                }),

                (90, list{
                    ...direction(distanceFromHost),

                }),

                (100, list{
                    opacity(1.0),
                    zIndex(9999),
                    visibility(#visible),
                    pointerEvents(#auto),
                    ...direction(distanceFromHost),
                    
                })
            })

            let fadeOut = keyframes(list{
                (0, list{
                    opacity(1.0),
                    zIndex(9999),
                    visibility(#visible),
                    pointerEvents(#none),
                    ...direction(distanceFromHost),
                }),

                (60, list{
                    opacity(0.5),
                }),

                (90, list{
                    zIndex(9999),
                    opacity(0.0),
                    visibility(#visible)
                }),

                (100, list{
                    visibility(#hidden),
                    zIndex(-9999),

                    pointerEvents(#none),
                    ...direction(0),
                })
            })

            let _opened = css(list{
                animationDuration(#ms(_animationDuration)),
                animationFillMode(#forwards),
                animationTimingFunction(#linear),
                animationDelay(#ms(0)),
                animationName(fadeIn),
            })

            let closed = css(list{
                animationDuration(#ms(_animationDuration)),
                animationFillMode(#forwards),
                animationTimingFunction(#linear),
                animationDelay(#ms(0)),
                animationName(fadeOut),
            })

            (closed, _opened)
        }
    }

    let shared = css(list{
        borderWidth(#px(1)),
        borderRadius(#px(8)),
        borderColor(Colors.Gray.Light.darker),
        width(#pct(100.0)),
        height(#auto),
        backgroundColor(Colors.white),
        position(#relative),
        opacity(0.0),
        pointerEvents(#none),
        visibility(#visible),
        zIndex(0),
    })

    let _direction = (direction, length) => switch direction {
        | DropdownProps.Down => css(list{
            paddingTop(#px(length))
        })
        | DropdownProps.Up => css(list{
            paddingBottom(#px(length))
        })
    }

    let backgroundLight = css(list{
        boxShadowWrapper(Colors.Shadow.light)
    })

    let backgroundDark = css(list{
        boxShadowWrapper(Colors.Secondary.darker)
    })

    let make = (
        ~background,
    ) => {
        fromList(list{
            shared,
            // _direction(direction, distanceFromHost),
            switch background {
                | Colors.Background.Light => backgroundLight
                | Colors.Background.Dark => backgroundDark
            }
        })
    }
}