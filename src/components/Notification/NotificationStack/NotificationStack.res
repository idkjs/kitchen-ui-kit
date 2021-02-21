type operation = {
    hash: string,
    status: OperationNotification.status
}

type notificationKind = 
| Operation(operation)
| Loading(LoadingNotification.status)

type notification = {
    id: string,
    kind: notificationKind,
    at: float
}

module Styles = {
    open! Cn
    open Style
    open Emotion

    module Wrapper = {
        let shared = css(list{
            position(#absolute),
            top(px2rem(0)),
            right(px2rem(0))
        })

        let make = () => fromList(list{
            shared
        })
    }
}

@react.component
let make = (~notifications, ~onNotificationClose) => {

    let (internalNotifications, setInternalNotifications) = React.useState(_ => notifications)

    React.useEffect1(_ => {
        setInternalNotifications(internalNotifications => {
            notifications
                -> Js.Array2.concat(internalNotifications)
                -> Lodash.uniq
                -> Lodash.sortBy(notification => notification.at)
                -> Js.Array2.reverseInPlace
        })
        None
    }, [notifications])

    let wasRemoved = notification => {
        let match = notifications
            -> Js.Array2.find(currentNotification => (
                currentNotification.id == notification.id
            )) 

        let wasRemoved = switch match {
            | Some(_) => false
            | None => {
                true
            }
        }

        switch wasRemoved {
            | true => {
                let _ = Js.Global.setTimeout(_ => {
                    setInternalNotifications(internalNotifications => {
                        internalNotifications
                            -> Js.Array2.filter(internalNotification => (
                                internalNotification.id != notification.id
                            ))
                    })
                }, AnimatedNotificationWrapper.Styles._animationDuration * 3) // in reality it should be x2.5
            } 
            | false => ()
        }
        
        wasRemoved
    }

    let notifications = {
        internalNotifications
            -> Js.Array2.map(notification => {
                let onClose = _ => onNotificationClose(notification)
                <AnimatedNotificationWrapper
                    key={notification.id}
                    hide={wasRemoved(notification)}
                >
                    {switch notification.kind {
                        | Operation({hash, status}) => (
                            <OperationNotification 
                                hash
                                status
                                onClose
                            />
                        )
                        | Loading(status) => (
                            <LoadingNotification 
                                status
                            />
                        )
                    }}
                </AnimatedNotificationWrapper>
            })
            -> React.array
    }

    <div
        className={Cn.fromList(list{
            Styles.Wrapper.make()
        })}
    >
        {notifications}
    </div>
}