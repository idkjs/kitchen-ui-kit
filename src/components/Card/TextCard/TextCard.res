module Styles = {
    open Style
    open Emotion
    open! Cn

    module Body = {
        let className = "body"
        let shared = css(list{
            Typography.slab,
            fontSize(px2rem(28)),
            fontWeight(700),
            color(Colors.Secondary.default)
        })

        let make = () => fromList(list{
            shared
        })
    }
}

@react.component
let make = (
    ~text,
    ~description,
    ~title
) => {

    let content = (
        <div
            className={Cn.fromList(list{
                Styles.Body.className,
                Styles.Body.make()
            })}
        >
            {React.string(text)}
        </div>
    )

    <ContentCard
        description
        title
    >
        {content}
    </ContentCard>
}