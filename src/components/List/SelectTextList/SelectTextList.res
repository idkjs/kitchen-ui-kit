module Props = {
    type selectItemData<'a> = {
        label: string,
        value: 'a
    }
    type selectItem<'a> = SelectList.Props.selectItem<selectItemData<'a>>
    type items<'a> = SelectList.Props.items<selectItemData<'a>>
    type onChange<'a> = SelectList.Props.onChange<selectItemData<'a>>
}

type renderItem<'a> = SelectList.Props.renderItem<Props.selectItemData<'a>>

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

    module Item = {
        let paddingX = #px(16)
        let shared = css(list{
            paddingLeft(paddingX),
            paddingRight(paddingX),
            fontSize(#px(12)),
            lineHeight(#px(32)),
            color(Colors.Secondary.default),

            hover(list{
                cursor(#pointer),
                backgroundColor(Colors.Gray.Light.lighter),
            })
        })

        let _selected = css(list{
            color(Colors.Primary.default)
        })

        let make = (~selected) => fromList(list{
            shared,
            _selected->on(selected),
        })
    }
}

@react.component
let make = (
    ~items: Props.items<'a>,
    ~onChange: Props.onChange<'a>
) => {
    let renderItem: renderItem<'a> = (_, item) => {
        <p
            className={Styles.Item.make(
                ~selected = item.selected
            )}
        >
            {React.string(item.data.label)}
        </p>
    }

    <div
        className={Styles.make()}
    >
        <SelectList
            items
            renderItem
            onChange
        />
    </div>
}