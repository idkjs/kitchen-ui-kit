module Kind = {
    type t =
    | Default
    | Primary
    | Secondary
}
module IconPosition = {
    type t =
    | Left
    | Right
}

module Style = {
    open! Cn
    open Style
    open Emotion

    let scoped = "text-button"->scope

    let onPrimary = (className, kind) => switch kind {
        | Kind.Primary => className
        | _ => ""
    }


    let onSecondary = (className, kind) => switch kind {
        | Kind.Secondary => className
        | _ => ""
    }

    let onRight = (className, iconPosition) => switch iconPosition {
        | IconPosition.Right => className
        | _ => ""
    }

    module Body = {
        let className = "body"->scoped

        let _boxShadow = (color) => (
            boxShadow(
                ~y = #px(1), 
                ~x = #px(0), 
                ~blur = #px(3), 
                ~spread = #px(0), 
                ~inset = false, 
                color
            )
        )

        let _transition = Animated.Transitions.faster

        let shared = css(list{
            userSelect(#none),
            textTransform(#uppercase),
            textAlign(#center),
            color(Colors.white),
            fontWeight(700),
            _boxShadow(Colors.Gray.Light.darkest),
            _transition,

            display(#flex),
            justifyContent(#spaceBetween)
        })
        
        module Kind = {
            let default = css(list{
                backgroundColor(Colors.Gray.Dark.default),
                borderRadius(px2rem(8)),

                hover(list{
                    backgroundColor(Colors.Gray.Dark.darker)
                }),

                active(list{
                    backgroundColor(Colors.Gray.Dark.darkest)
                })
            })

            let primary = css(list{
                backgroundColor(Colors.Primary.default),

                hover(list{
                    backgroundColor(Colors.Primary.darker)
                }),

                active(list{
                    backgroundColor(Colors.Primary.darkest)
                })
            })

            let secondary = css(list{
                backgroundColor(Colors.Secondary.default),

                hover(list{
                    backgroundColor(Colors.Secondary.darker)
                }),

                active(list{
                    backgroundColor(Colors.Secondary.darkest)
                })
            })
        }

        module Size = {
            let large = {
                let paddingY = px2rem(12)
                let paddingX = px2rem(16)
                css(list{
                    fontSize(px2rem(20)),
                    lineHeight(px2rem(24)),
                    padding2(paddingY, paddingX)
                })
            }

            let medium = {
                let _padding = px2rem(10)
                css(list{
                    fontSize(px2rem(14)),
                    lineHeight(px2rem(16)),
                    paddingTop(_padding),
                    paddingBottom(_padding),
                })
            }
        }

        module IconPosition = {
            let left = css(list{
                flexDirection(#row)
            })

            let right = css(list{
                flexDirection(#rowReverse)
            })
        }

        let make = (
            ~kind,
            ~size,
            ~iconPosition
        ) => fromList(list{
            shared,
            
            Kind.default,
            Kind.primary->onPrimary(kind),
            Kind.secondary->onSecondary(kind),

            Size.large,
            Size.medium->ContentButton.Styles.onMedium(size),

            IconPosition.left,
            IconPosition.right->onRight(iconPosition)
        })
    }

    module Icon = {
        let className = "icon"->scoped

        let shared = css(list{
            width(px2rem(24))
        })

        let make = () => fromList(list{
            shared
        })
    }

    module Text = {
        let className = "text"->scoped

        let shared = css(list{
            width(#pct(100.))
        })

        let make = () => fromList(list{
            shared
        })
    }
}

@react.component
let make = (
    ~text,
    ~kind,
    ~onClick,
    ~background = Colors.Background.Light,
    ~size = ContentButton.Size.Large,
    ~description,
    ~icon: option<Icon.kind> =?,
    ~iconPosition
) => {

    let icon = switch icon {
        | Some(kind) => (
            <div 
                className={Cn.fromList(list{
                    Style.Icon.className,
                    Style.Icon.make()
                })}
            >
                <Icon kind/>
            </div>
        )
        | None => <></>
    }

    let text = (
        <div
            className={Cn.fromList(list{
                Style.Text.className,
                Style.Text.make()
            })}
        >
            {React.string(text)}
        </div>
    )

    <ContentButton
        onClick
        background
        description
        size
    >
        <div
            className={Cn.fromList(list{
                Style.Body.className,
                Style.Body.make(
                    ~kind,
                    ~size,
                    ~iconPosition
                )
            })}
        >
            {icon}
            {text}
        </div>
    </ContentButton>
}