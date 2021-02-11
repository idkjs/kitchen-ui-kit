module Props = {
    type index = int
    type renderItem<'a> = (index, 'a) => React.element
    type items<'a> = array<'a>
    type onClick<'a> = 'a => unit
}

@react.component
let make = (
    ~renderItem: Props.renderItem<'a>,
    ~items: Props.items<'a>,
    ~onClick: option<Props.onClick<'a>> =?
) => {

    let renderItemWithKey: Props.renderItem<'a> = (index, item) => (
        <div
            key={string_of_int(index)}
            onClick={switch onClick {
                | Some(onClick) => _ => onClick(item)
                | None => _ => ()
            }}
        >
            {renderItem(index, item)}
        </div>
    )


    Belt.Array.mapWithIndex(items, renderItemWithKey)
        -> React.array
}