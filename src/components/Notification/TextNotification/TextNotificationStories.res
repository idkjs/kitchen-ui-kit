let default = Story.make(
    ~component = TextNotification.make,
    ~title = "components/Notification/TextNotificiation"
)

let withTextStory = Story.csfWithArgs(TextNotification.make, {
    "icon": #check,
    "text": "Everything is just fine"
})