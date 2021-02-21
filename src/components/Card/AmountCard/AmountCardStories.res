let default = Story.make(
    ~component = AmountCard.make,
    ~title = "components/Card/AmountCard"
)
let parameters = TextCardStories.parameters
let title = TextCardStories.title
let description = TextCardStories.description
let value = BigNumber.make(999999999.999999)

let withXTZStory = Story.csf(AmountCard.make,
    {
        "value": value,
        "currency": AmountCard.XTZ,
        "description": description,
        "title": title
    },
    parameters
)