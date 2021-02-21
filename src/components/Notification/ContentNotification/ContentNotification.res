module Styles = {
    open! Cn
    open Style
    open Emotion

    let scoped = "notification"->scope
    let closeClassName = "close"->scoped

    module Wrapper = {
        let className = "wrapper"->scoped        
        let shared = css(list{
            backgroundColor(Colors.Secondary.default),
            padding2(px2rem(10), px2rem(12)),
            color(Colors.white),
            borderRadius(px2rem(8)),
            display(#flex),
            alignItems(#center),
            justifyContent(#spaceBetween),
            Typography.condensed,
            boxShadow(
                ~y = #px(0), 
                ~x = #px(0), 
                ~blur = #px(2), 
                ~spread = #px(0), 
                ~inset = false, 
                Colors.Gray.Dark.default
            ),
            width(px2rem(350)),

            hover(list{
                select("> ."++closeClassName, list{
                    opacity(1.),
                    transform(translateX(#pct(0.))),
                })
            })
        })

        let make = () => fromList(list{
            shared
        })
    }

    module Content = {
        let className = "content"->scoped
        let shared = css(list{
            fontSize(px2rem(14)),
            // lineHeight(px2rem(16)),
            marginLeft(px2rem(8)),
            display(#inlineBlock),
            width(#pct(100.)),
            textAlign(#left),
        })

        let make = () => fromList(list{
            shared
        })
    }

    module Close = {
        let className = closeClassName
        let shared = css(list{
            opacity(0.),
            display(#flex),
            alignItems(#center),
            marginRight(px2rem(6)),
            cursor(#pointer),
            color(Colors.Gray.Light.darker),
            transform(translateX(#pct(100.))),
            transitions(list{
                (
                    "opacity",
                    #ms(250),
                    #easeInOut,
                    #ms(100)
                ),
                (
                    "transform",
                    #ms(250),
                    #easeInOut,
                    #ms(100)
                )
            }),
            hover(list{
                color(Colors.Gray.Light.default),
            })
        })

        let make = () => fromList(list{
            shared
        })
    }
}

@react.component
let make = (
    ~icon: Icon.kind = #info,
    ~children,
    ~onClose=?
) => {

    let icon = {
        let kind = icon
        <Icon 
            kind
        />
    }

    let close = {
        let kind={#x}
        let size = 16
        let onClick = onClose

        let close = (
            <div
                className={Cn.fromList(list{
                    Styles.Close.make(),
                    Styles.Close.className,
                })}
                ?onClick
            >
                <Icon 
                    kind
                    size
                />
            </div>
        )

        switch onClose {
            | None => <></>
            | Some(_) => close
        }
    }
    <div
        className={Cn.fromList(list{
            Styles.Wrapper.className,
            Styles.Wrapper.make()
        })}
    >
        {icon}
        <div
            className={Cn.fromList(list{
                Styles.Content.className,
                Styles.Content.make()
            })}
        >
            {children}
        </div>
        {close}
    </div>
}