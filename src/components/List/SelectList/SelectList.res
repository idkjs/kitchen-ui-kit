module Props = {
    type selectItem<'a> = {
        id: string,
        label: string,
        data: option<'a>
    }
    type items<'a> = array<selectItem<'a>>
    type onChange<'a> = (selectItem<'a>) => unit
    type renderItem<'a> = (option<selectItem<'a>>) => (ContentList.Props.index, selectItem<'a>) => React.element
}

module Styles = {
    open! Cn
    open Emotion

    let paddingY = #px(8)

    let shared = css(list{
        minWidth(#px(150)),
        width(#pct(100.0)),
        paddingBottom(paddingY),
        paddingTop(paddingY),
    })

    let make = () => fromList(list{
        shared
    })

}

@react.component
let make = (
    ~items: Props.items<'a>,
    ~renderItem: Props.renderItem<'a>,
    ~onChange: Props.onChange<'a>,
    ~value: option<Props.selectItem<'a>> =?
) => {
    let renderItem = renderItem(value)
    <div
        className={Styles.make()}
    >
        <ContentList
            items
            renderItem
            onClick={onChange}
        />
    </div>
}