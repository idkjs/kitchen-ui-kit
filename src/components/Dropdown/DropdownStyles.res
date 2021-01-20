open Cn
open Emotion

module Container = {
    let shared = css(list{
        position(#relative),
        top(#px(0)),
        width(#pct(100.0)),
        userSelect(#none)
    })

    let make = () => shared
}

module Wrapper = {

    let boxShadowWrapper = (color) => (
        boxShadow(
            ~y = #px(1), 
            ~x = #px(0), 
            ~blur = #px(3), 
            ~spread = #px(0), 
            ~inset = false, 
            color
        )
    )

    module Animation = {
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

            Js.log2("direction", direction(distanceFromHost))

            let fadeIn = keyframes(list{
                (10, list{
                    opacity(0.0),
                }),

                (20, list{
                    ...direction(0)
                }),

                (100, list{
                    opacity(1.0),
                    visibility(#visible),
                    zIndex(9999),
                    ...direction(distanceFromHost),
                })
            })

            let fadeOut = keyframes(list{
                (0, list{
                    opacity(1.0),
                    ...direction(distanceFromHost)
                }),

                (90, list{
                    opacity(0.0),
                    visibility(#hidden),
                    zIndex(-9999),
                    ...direction(0),
                }),
            })

            let _opened = css(list{
                animationName(fadeIn),
                
            })

            let closed = css(list{
                animationName(fadeOut),
            })

            (closed, _opened)
        }
    }

    let shared = css(list{
        borderWidth(#px(1)),
        borderRadius(#px(8)),
        borderColor(Colors.Gray.Light.default),
        borderWidth(#px(1)),
        width(#auto),
        height(#auto),
        backgroundColor(Colors.white),
        position(#absolute),
        opacity(0.0),
        animationDuration(#ms(300)),
        animationFillMode(#forwards),
        zIndex(-9999)
    })

    let backgroundLight = css(list{
        boxShadowWrapper(Colors.Gray.Light.default)
    })

    let backgroundDark = css(list{
        boxShadowWrapper(Colors.Secondary.darker)
    })

    let make = (
        ~background
    ) => {
        fromList(list{
            shared,
            switch background {
                | Colors.Background.Light => backgroundLight
                | Colors.Background.Dark => backgroundDark
            }
        })
    }
}