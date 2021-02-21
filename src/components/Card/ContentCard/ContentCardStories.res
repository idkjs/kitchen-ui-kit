let default = Story.make(
    ~component = ContentCard.make,
    ~title = "components/Card/ContentCard"
)

let title = "Something interesting"
let description = "Calculated using BCD"
let text = "Something very interesting shown here"
let children = React.string(text)

let parameters = {
    "backgrounds": {
        "default": "light"
    }
}

let withTextContentStory = Story.csf(ContentCard.make, 
    Some({
        "children": children,
        "title": title
    }), 
    parameters
)

let withDescriptionStory = Story.csf(ContentCard.make,
    Some({
        "children": children,
        "title": title,
        "description": description
    }),
    parameters
)