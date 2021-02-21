let default = Story.make(
    ~component = LoadingNotification.make,
    ~title = "components/Notification/LoadingNotification"
)

let loadingStory = Story.csfWithArgs(LoadingNotification.make, {
    "status": LoadingNotification.Loading
})