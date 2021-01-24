module Props = {
    type index = int
    type renderItem<'a> = (index, 'a) => React.element
    type items<'a> = array<'a>
}

@react.component
let make = (
    ~renderItem: Props.renderItem<'a>,
    ~items: Props.items<'a>
) => {
    Belt.Array.mapWithIndex(items, renderItem)
        -> React.array
}