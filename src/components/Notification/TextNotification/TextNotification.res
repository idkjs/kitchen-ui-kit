@react.component
let make = (~icon, ~text) => {
    let content = React.string(text)
    <ContentNotification
        icon
    >
        {content}
    </ContentNotification>
}