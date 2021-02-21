module Styles = {
    open! Cn
    open Emotion
    open Style

    let scoped = "animated-notification-wrapper"->scope
    let className = ""->scoped
    
    let _animationDuration = 500

    let expand = keyframes(list{
        (0, list{}),
        (100, list{
            maxHeight(px2rem(44)),
            marginBottom(px2rem(8)),
        })
    })
    let slideInFromRight = keyframes(list{
        (0, list{}),
        (100, list{
            transform(translateX(#pct(0.))),
        })
    })

    let collapse = keyframes(list{
        (0, list{}),
        (100, list{
            maxHeight(px2rem(0)),
            marginBottom(px2rem(0))
        })
    })

    let slideOutToRight = keyframes(list{
        (0, list{}),
        (100, list{
            transform(translateX(#pct(110.))),
        })
    })

    let shared = css(list{      
        animationFillMode(#both),
        animationTimingFunction(#easeInOut),
        
        // initial state for the animation
        maxHeight(px2rem(0)),
        marginBottom(px2rem(0)),
        transform(translateX(#pct(110.))),

        animationNames(list{
            expand,
            slideInFromRight
        }),
        animationDurations(list{
            #ms(500),
            #ms(500)
        }),
        animationDelays(list{
            #ms(0),
            #ms(500)
        })
        
    })

    let hidden = css(list{
        // its important to carry over the final animation state here as well
        // animation fill made is not sufficient when the animation name changes
        maxHeight(px2rem(44)),
        marginBottom(px2rem(8)),
        transform(translateX(#pct(0.))),

        animationNames(list{
            slideOutToRight,
            collapse
        }),
        animationDurations(list{
            #ms(500),
            #ms(500)
        }),
        animationDelays(list{
            #ms(0),
            #ms(500)
        })
    })

    let make = (
        ~hide
    ) => fromList(list{
        shared,
        hidden->on(hide),
    })
}

@react.component
let make = (~children, ~hide) => {
    <div
        className={Cn.fromList(list{
            Styles.className,
            Styles.make(~hide)
        })}
    >   
        {children}
    </div>
}
