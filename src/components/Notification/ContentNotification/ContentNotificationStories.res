let default = Story.make(
    ~component = ContentNotification.make,
    ~title = "components/Notification/ContentNotification"
)

let infoStory = Story.csfWithArgs(ContentNotification.make, {
    "icon": #check,
    "children": React.string("Content goes here"),
    "onClose": Js.log
})