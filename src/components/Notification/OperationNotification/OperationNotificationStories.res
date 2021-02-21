let default = Story.make(
    ~component = OperationNotification.make,
    ~title = "components/Notification/OperationNotification"
)

let hash = "oo1LsfnQ6yFQPg8utQvhALHSmjqetGVkxegjpTWXKaug42RugHg"

let withInjectedStory = Story.csfWithArgs(OperationNotification.make, {
    "hash": hash,
    "status": OperationNotification.Injected,
    "onClose": Js.log
})