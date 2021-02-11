module Styles = {
    open! Cn
    open Emotion


    module Label = {
        let shared = css(list{
            fontFamily(Typography.fontFamily),
            color(Colors.Secondary.default),
            fontSize(#px(14)),
            lineHeight(#px(16)),
            marginBottom(#px(4)),
            marginLeft(#px(2)), // borderWidth
            marginTop(#px(16))
        })

        let make = () => fromList(list{
            shared
        })
    }
    
    module Error_ = {
        let shared = css(list{
            fontFamily(Typography.fontFamily),
            color(Colors.red),
            fontSize(#px(12)),
            lineHeight(#px(14)),
            marginTop(#px(6)),
            paddingLeft(#px(16))
        })

        let make = () => fromList(list{
            shared
        })
    }
}

module Props = {
    type label = string
    type error = string
}

@react.component
let make = (
    ~label: Props.label,
    ~error: option<Props.error> =?,
    ~children
) => {

    let error = switch error {
        | Some(error) => (
            <p
                className={Styles.Error_.make()}
            >
                {React.string(error)}
            </p>
        )
        | None => <></>
    }

    let label = (
        <p
            className={Styles.Label.make()}
        >
            {React.string(label)}
        </p>
    )

    <div>

        {label}
        {children}
        {error}

    </div>
}