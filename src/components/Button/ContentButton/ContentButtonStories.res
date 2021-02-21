let default = Story.make(
    ~component = ContentButton.make,
    ~title = "components/Button/ContentButton"
)

let description = "To confirm"
let children = (
    <div 
        style={ReactDOMStyle.make(
            ~backgroundColor = "red",
            ~textAlign = "center",
            ~padding = "12px",
            ()
        )}
    >
        {React.string("Click here")}
    </div>
)

let withTextStory = Story.csfWithArgs(ContentButton.make, {
    "description": description,
    "children": children,
    "onClick": Js.log
})