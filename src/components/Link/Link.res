module Styles = {
    open! Cn
    open Emotion
    open Style

    let scoped = "link"->scope

    module Wrapper = {
        let className = "wrapper"->scoped
        let shared = css(list{
            display(#inlineBlock),
            textDecoration(#underline),
            color(Colors.white),
            fontWeight(800),
            Animated.Transitions.evenFaster,
            
            hover(list{
                color(Colors.white)
            }),
        })

        let make = () => fromList(list{
            shared
        })
    }

    module Icon = {
        let className = "icon"->scoped
        let shared = css(list{
            display(#inlineBlock),
            marginRight(px2rem(2)),
            position(#relative),
            top(px2rem(-1)),
            
        })

        let make = () => fromList(list{
            shared
        })
    }
}


@react.component
let make = (~href, ~text) => {
    <a
        className={Cn.fromList(list{
            Styles.Wrapper.className,
            Styles.Wrapper.make()
        })}
        href
        target="_blank"
    >   
        <Icon 
            className={Cn.fromList(list{
                Styles.Icon.className,
                Styles.Icon.make()
            })}
            kind={#externalLink}
            size={14}
        />

        {React.string(text)}
    </a>
}