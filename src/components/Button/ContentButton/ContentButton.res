module Size = {
    type t =
    | Medium
    | Large
}

module Styles = {
    open! Cn
    open Emotion
    open Style

    let onMedium = (className, size) => switch size {
        | Size.Medium => className
        | _ => ""
    }

    module Wrapper = {
        let className = "wrapper"
        let shared = css(list{
            Typography.condensed
        })

        let make = () => fromList(list{
            shared
        })
    }

    module Content = {
        let className = "content"
        let shared = css(list{
            cursor(#pointer)
        })

        let make = () => fromList(list{
            shared
        })
    }

    module Description = {
        let className = "description"
        let shared = css(list{
            textAlign(#center),
            color(Colors.Gray.Dark.default),
            fontSize(px2rem(12)),
            lineHeight(px2rem(14)),
            marginTop(px2rem(6)),
            userSelect(#none)
        })

        let backgroundDark = css(list{
            color(Colors.white)
        })

        let medium = css(list{
            marginTop(px2rem(4))
        })

        let make = (
            ~background,
            ~size
        ) => fromList(list{
            shared,
            backgroundDark->onDark(background),
            medium->onMedium(size)
        })
    }

}

@react.component
let make = (
    ~description, 
    ~children,
    ~onClick,
    ~background = Colors.Background.Light,
    ~size = Size.Large
) => {
    
    let description = (
        <div
            className={Cn.fromList(list{
                Styles.Description.className,
                Styles.Description.make(
                    ~background,
                    ~size
                )
            })}
        >
            {React.string(description)}
        </div>
    )

    let content = (
        <div
            onClick
            className={Cn.fromList(list{
                Styles.Content.className,
                Styles.Content.make()
            })}
        >
            {children}
        </div>
    )

    <div
        className={Cn.fromList(list{
            Styles.Wrapper.className,
            Styles.Wrapper.make()
        })}
    >
        {content}
        {description}
    </div>
}