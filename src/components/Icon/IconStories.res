let default = Story.make(
    ~component = Icon.make,
    ~title = "components/Icon"
)

let defaultStory = Story.csfWithArgs(Icon.make, {
    "kind": #externalLink,
    "size": 16
})

@react.component
let withTextStoryComponent = (~kind, ~size) => {
    <div>
        <Icon 
            kind 
            size
        />
        <span>
            {React.string("some text")}
        </span>
    </div>
}