type currency =
| XTZ
| WXTZ

let currencyToSymbol = currency => switch currency {
    | XTZ => "XTZ"
    | WXTZ => "wXTZ"
}

@react.component
let make = (
    ~value,
    ~currency,
    ~description,
    ~title
) => {
    let text = value->XTZBalance.format
        ++ " " 
        ++ currency->currencyToSymbol

    <TextCard
        text
        description
        title
    />
}