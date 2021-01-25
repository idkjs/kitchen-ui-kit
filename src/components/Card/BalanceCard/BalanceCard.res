module Props = {
    type currency = string
}

@react.component
let make = (
    ~title: ContentCard.Props.title,
    ~balance: BigNumber.t,
    ~description: option<ContentCard.Props.description> =?,
    ~currency: option<Props.currency> =?
) => {
    
    let currency = switch currency {
        | Some(currency) => " " ++ currency
        | None => ""
    }

    let text = balance
        ->BigNumber.toNumber
        ->Js.Float.toString
        ++ currency

    <TextCard
        title
        ?description
        text
    />
}