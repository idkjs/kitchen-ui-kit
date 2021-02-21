let default = Story.make(
    ~component = PercentageCard.make,
    ~title = "components/card/PercentageCard"
)

let parameters = TextCardStories.parameters
let title = TextCardStories.title
let description = TextCardStories.description

let withValueStory = Story.csf(PercentageCard.make,
    {
        "value": 15.3,
        "description": description,
        "title": title
    },
    parameters
)