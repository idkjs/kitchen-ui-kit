let default = Story.make(
    ~component = NotificationStack.make,
    ~title = "components/Notification/NotificationStack"
)

open NotificationStack

let createNotification = kind => {
    id: Js.Math.random()->Js.Float.toString,
    at: Js.Date.now(),
    kind,
}

let operationInjectedNotification = () => createNotification(Operation({
    hash: OperationNotificationStories.hash,
    status: OperationNotification.Injected    
}))

let loadingStartedNotification = () => createNotification(Loading(LoadingNotification.Loading))



let notifications = [
    operationInjectedNotification()
]

module Hooks = {
    type process<'a> = ('a, unit => unit) => unit
    @bs.module("use-queue") external useQueue: process<'a> => (unit, 'a => unit) = "default"
}

@bs.module external debounce: ('a => 'b, int) => ('a => 'b) = "lodash.debounce";
@bs.module external throttle: ('a => 'b, int) => ('a => 'b) = "lodash.throttle";

@react.component
let interactiveStack = () => {
    
    let (notifications, setNotifications) = React.useState(_ => [])
    let (_, setNotifications) = Hooks.useQueue((_setNotifications, _done) => {
        setNotifications(_setNotifications)
        // TODO: in reality apply fo
        let _ = Js.Global.setTimeout(_ => {
            _done()
        }, AnimatedNotificationWrapper.Styles._animationDuration  / 2)
    })

    let addNotification = () => {
        let newNotification = operationInjectedNotification()
        setNotifications(notifications => {
            notifications
                -> Js.Array2.concat([
                newNotification
            ])
        })
    }

    let removeNotification = () => setNotifications(notifications => {
        let _ = notifications
            -> Js.Array2.shift
            
        notifications
            -> Js.Array2.concat([])
    })

    let hideSecondNotification = () => setNotifications(notifications => {
        let _ = notifications
            -> Js.Array2.removeCountInPlace(
                ~pos = 1,
                ~count = 1
            )
        notifications
            -> Js.Array2.concat([])
    })

    let addLoadingNotification = () => setNotifications(notifications => {
        notifications
            -> Js.Array2.concat([
                loadingStartedNotification()
            ])
    })

    let removeLoadingNotification = () => setNotifications(notifications => {
        notifications
            -> Js.Array2.filter(notification => switch notification.kind {
                | Loading(_) => false
                | _ => true
            })
    })

    let onNotificationClose = (closedNotification) => setNotifications(notifications => {
        notifications
            -> Js.Array2.filter(notification => closedNotification.id != notification.id)
    })

    Js.log2("demo shown with", notifications)

    <div style={ReactDOMStyle.make(
        ~maxWidth = "300px",
        ()
    )}>
        <NotificationStack 
            notifications
            onNotificationClose
        />

        <button
            onClick={_ => addNotification()}
        >
            {React.string("Add notification")}
        </button>

        <button
            onClick={_ => addLoadingNotification()}
        >
            {React.string("Add loading notification")}
        </button>

        <button
            onClick={_ => removeLoadingNotification()}
        >
            {React.string("Remove loading notification")}
        </button>

        <button
            onClick={_ => removeNotification()}
        >
            {React.string("Remove notification")}
        </button>

        <button
            onClick={_ => hideSecondNotification()}
        >
            {React.string("Hide second notification")}
        </button>
    </div>
}

let withOneNotificationStory = Story.csfWithArgs(NotificationStack.make, {
    "notifications": notifications
})

let interactiveStackStory = Story.csfPlain(interactiveStack)