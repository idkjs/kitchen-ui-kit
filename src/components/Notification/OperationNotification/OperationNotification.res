module Styles = {
    open! Cn
    open Style
    open Emotion

    let scoped = "operation-notification"->scope
    let className = ""->scoped

    let shared = css(list{
        // fontWeight(700)
        // select("a", list{
        //     color(Colors.white),
        //     fontWeight(700)
        // })
    })

    let make = () => fromList(list{
        shared
    })
}

type status = 
| Injected
| Confirmed
| Rejected

@react.component
let make = (~hash, ~status, ~onClose) => {

    let explorerLink = "https://edo2net.tzkt.io/"

    let content = {

        let href = explorerLink ++ hash
        let hash = hash->Misc.truncateInMiddle(18)

        let status = switch status {
            | Injected => "injected"
            | Confirmed => "confirmed"
            | Rejected => "rejected"
        }

        <div
            className={Cn.fromList(list{
                Styles.className,
                Styles.make()
            })}
        >
            <span>
                {React.string("Operation")}
                {React.string(" ")}
            </span>
            <Link
                href
                text={hash}
            />
            <span>
                {React.string(" ")}
                {React.string(status)}
            </span>
        </div>
    }

    let icon = switch status {
        | Injected => #chevronDoubleRight
        | Confirmed => #check
        | Rejected => #x
    }

    // {content}

    <ContentNotification
        icon
        onClose
    >
        {content}
    </ContentNotification>
}