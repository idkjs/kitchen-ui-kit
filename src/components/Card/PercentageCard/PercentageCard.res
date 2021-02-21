@react.component
let make = (
    ~title,
    ~description,
    ~value
) => {
    let text = value->Js.Float.toString
    ++ "%"

    <TextCard
        title
        description
        text
    />
}