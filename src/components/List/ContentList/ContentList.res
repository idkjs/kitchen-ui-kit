module Props = {
    type renderItem<'a> = ('a) => React.element
    type items<'a> = array<'a>
}

@react.component
let make = (
    ~renderItem: Props.renderItem<'a>,
    ~items: Props.items<'a>
) => {
    Belt.Array.map(items, renderItem)
        -> React.array
}