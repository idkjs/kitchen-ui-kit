module Props = {
    type selectItem<'a> = {
        selected: bool,
        data: 'a
    }

    type items<'a> = array<selectItem<'a>>
    type renderItem<'a> = (ContentList.Props.index, selectItem<'a>) => React.element
    type onChange<'a> = (selectItem<'a>) => unit
}

@react.component
let make = (
    ~items: Props.items<'a>,
    ~renderItem: Props.renderItem<'a>,
    ~onChange: Props.onChange<'a>
) => {
    let renderItem = (index, item) => {
        <div 
            key={string_of_int(index)}
            onClick={_ => onChange(item)}
        >
            {renderItem(index, item)}
        </div>
    }
    
    <ContentList
        items
        renderItem
    />
}