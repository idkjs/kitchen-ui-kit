module Styles = {
    open Style
    open Emotion
    open! Cn

    module Wrapper = {
        let className = "wrapper"

        let _boxShadow = (color) => (
            boxShadow(
                ~y = #px(3), 
                ~x = #px(0), 
                ~blur = #px(4), 
                ~spread = #px(0), 
                ~inset = false, 
                color
            )
        )

        let _padding = px2rem(16)

        let shared = css(list{
            Typography.condensed,
            backgroundColor(Colors.white),
            borderRadius(px2rem(8)),
            _boxShadow(Colors.Gray.Light.darkest),
            overflow(#hidden)
        })

        let make = () => fromList(list{
            shared
        })
    }

    module Title = {
        let className = "title"
        
        let underline = list{
            display(#block),
            position(#relative),
            content(""),

            height(px2rem(4)),
            width(px2rem(72)),
            backgroundColor(Colors.Gray.Light.darker),
            marginTop(px2rem(2))
        }

        let shared = css(list{
            color(Colors.Primary.default),
            textTransform(#uppercase),
            fontWeight(700),
            fontSize(px2rem(18)),
            lineHeight(px2rem(21)),
            margin(px2rem(0)),
            padding(Wrapper._padding),
            paddingBottom(px2rem(0)),

            after(underline)
        })

        let make = () => fromList(list{
            shared
        })
    }

    module Content = {
        let className = "content"
        let shared = css(list{
            padding2(px2rem(0), Wrapper._padding),
            paddingTop(px2rem(16)),
            paddingBottom(px2rem(20))
        })

        let withDescription = css(list{
            paddingBottom(px2rem(16))
        })

        let make = (
            ~description
        ) => fromList(list{
            withDescription->onSome(description),
            shared,
        })
    }

    module Description = {
        let className = "description"
        let shared = css(list{
            backgroundColor(Colors.red),
            padding(px2rem(12)),
            paddingLeft(Wrapper._padding),
            paddingRight(Wrapper._padding),
            backgroundColor(Colors.Gray.Light.default),
            textTransform(#uppercase),

            color(Colors.Gray.Dark.default),
            fontSize(px2rem(12)),
            lineHeight(px2rem(14)),
        })

        let make = () => fromList(list{
            shared
        })
    }
}

@react.component
let make = (
    ~children,
    ~description,
    ~title
) => {
    let title = (
        <p
            className={Cn.fromList(list{
                Styles.Title.className,
                Styles.Title.make()
            })}
        >
            {React.string(title)}
        </p>
    )

    let content = (
        <div
            className={Cn.fromList(list{
                Styles.Content.className,
                Styles.Content.make(~description)
            })}
        >
            {children}
        </div>
    )

    let description = switch description {
        | None => <></>
        | Some(description) => (
            <div
                className={Cn.fromList(list{
                    Styles.Description.className,
                    Styles.Description.make()
                })}
            >
                {React.string(description)}
            </div>
        )
    }

    <div
        className={Cn.fromList(list{
            Styles.Wrapper.className,
            Styles.Wrapper.make()
        })}
    >   
        {title}
        {content}
        {description}
    </div>
}