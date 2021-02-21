type status =
| Loading
| Success
| Error

module Styles = {
    open! Cn
    open Emotion
    open Style

    let scoped = "loading-notification"->scope
    let className = ""->scoped

    let rotate = keyframes(list{
        (0, list{
            transform(rotate(#deg(0.)))
        }),
        (100, list{
            transform(rotate(#deg(360.)))
        })
    })

    let shared = css(list{
        select("div."++Icon.Styles.className, list{
           animationName(rotate),
           animationDuration(#ms(1500)),
           animationTimingFunction(#linear),
           animationIterationCount(#infinite)
        })
    })

    let make = () => fromList(list{
        shared
    })
}

@react.component
let make = (~status) => {

    let text = switch status {
        | Loading => "Loading..."
        | Success => "You're up to date!"
        | Error => "Uh oh, something went wrong."
    }

    let icon = switch status {
        | Loading => #refresh
        | Success => #check
        | Error => #x
    }

    <div
        className={Cn.fromList(list{
            Styles.make()
        })}
    >
        <TextNotification
            icon
            text
        />
    </div>
}