module Props = {
    type text = string
}

module Styles = {
    open! Cn
    open Emotion

    module Wrapper = {
        let shared = css(list{
            fontFamily(Typography.fontFamilySlab),
            fontSize(#px(28)),
            lineHeight(#px(30)),
            fontWeight(700),
            color(Colors.Secondary.default),
            ContentCard.Styles.paddingY,
        })
        let make = () => fromList(list{
            shared
        })
    }
}

@react.component
let make = (
    ~title: ContentCard.Props.title,
    ~text: Props.text,
    ~description: option<ContentCard.Props.description> =?
) => {
    <ContentCard
        title
        ?description
    >
        <div
            className={Styles.Wrapper.make()}
        >
            <p>
                {React.string(text)}
            </p>
        </div>
    </ContentCard>
}