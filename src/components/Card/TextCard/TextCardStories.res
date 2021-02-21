let default = Story.make(
    ~component = TextCard.make,
    ~title = "components/Card/TextCard"
)

let text = "This is very interesting"
let title = ContentCardStories.title
let description = ContentCardStories.description
let parameters = ContentCardStories.parameters

let withTextStory = Story.csf(TextCard.make, 
    {
        "text": text,
        "description": description,
        "title": title
    },
    parameters
)

let withoutDescriptionStory = Story.csf(TextCard.make, 
    {
        "text": text,
        "title": title
    },
    parameters
)