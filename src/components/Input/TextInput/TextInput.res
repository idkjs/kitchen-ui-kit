module Props = {
    type value = string
    type placeholder = string
    
    // not used in the BaseInput
    type onChange = ReactEvent.Form.t => unit
    type onClick = ReactEvent.Mouse.t => unit
    type onMouseDown = ReactEvent.Mouse.t => unit
    type icon = Icon.kind
}
module Styles = {
    open! Cn
    open Emotion

    let labelHeight = 20

    module Input = {
        let value = css(list{
            borderWidth(#px(2)),
            padding(#px(14)),
            fontSize(#px(14)),
            lineHeight(#px(16)),
            fontFamily(Typography.fontFamily),
            borderColor(#transparent),
        })

        let _focus = list{
            borderColor(Colors.Secondary.default)
        }

        let _hover = list{
            borderColor(Colors.Gray.Light.darkest)
        }

        let shared = css(list{
            width(#pct(100.0)),
            outlineWidth(#px(0)),
            color(Colors.Secondary.default),
            borderRadius(#px(8)),
            borderColor(Colors.Gray.Light.default),
            
            Animated.Transitions.slower,
            
            placeholder(list{
                color(Colors.Gray.Dark.default)
            }),
            
            hover(_hover),

            focus(_focus)
        })

        let make = () => fromList(list{
            shared,
            value
        })
    }

    module Icon = {
        let _padding = 12

        let shared = css(list{
            position(#absolute),
            top(#px(Pervasives.\"+"(labelHeight, _padding))),
            right(#px(_padding)),
            color(Colors.Gray.Dark.default)
        })
        
        let make = () => fromList(list{
            shared
        })
    }
}
@react.component
let make = (
    ~label: BaseInput.Props.label,
    ~placeholder: Props.placeholder,
    ~onChange: option<Props.onChange> =?,
    ~error: option<BaseInput.Props.error> =?,
    ~value: option<Props.value> =?,
    ~onClick: option<Props.onClick> =?,
    ~onMouseDown: option<Props.onMouseDown> =?,
    ~children =?,
    ~icon: option<Props.icon> =?
) => {

    let input = (
        <input
            className={Styles.Input.make()}
            placeholder
            ?onChange
            ?onClick
            ?value
            ?onMouseDown
       />
    )

    let icon = switch icon {
        | Some(kind) => {
            <div
                className={Cn.fromList(list{
                    "icon",
                    Styles.Icon.make()
                })}
            >
                <Icon
                    kind
                />
            </div>
        }
        | None => <></>
    }

    <BaseInput
        label
        ?error
    >
        <>
            {input}
            {switch children {
                | None => <></>
                | Some(children) => children
            }}
        </>
        {icon}
    </BaseInput>
}