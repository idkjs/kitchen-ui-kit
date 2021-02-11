let renderItem: SelectList.Props.renderItem<'a> = (value) => (_, item) => {
    module Styles = {
        open! Cn
        open Emotion

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

    let selected = switch value {
        | Some(value) => value.id == item.id
        | None => switch item.data {
            | None => true
            | Some(_) => false
        }
    }

    <p
        className={Styles.Item.make(
            ~selected
        )}
    >
        {React.string(item.label)}
    </p>
}


@react.component
let make = (
    ~items: SelectList.Props.items<'a>,
    ~onChange: SelectList.Props.onChange<'a>,
    ~value: option<SelectList.Props.selectItem<'a>> =?
) => {
    <SelectList
        items
        renderItem
        onChange
        ?value
    />
}