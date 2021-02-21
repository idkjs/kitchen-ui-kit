let default = Story.make(
    ~component = TextButton.make,
    ~title = "components/Button/TextButton"
)

let text = "Click here"
let onClick = Js.log
let description = "To confirm"
let background = Colors.Background.Light
let kind = TextButton.Kind.Default

let defaultStory = Story.csfWithArgs(TextButton.make, {
    "text": text,
    "onClick": onClick,
    "description": description,
    "background": background,
    "kind": kind
})

let primaryStory = Story.csfWithArgs(TextButton.make, {
    "text": text,
    "onClick": onClick,
    "description": description,
    "background": background,
    "kind": TextButton.Kind.Primary
})

let secondaryStory = Story.csfWithArgs(TextButton.make, {
    "text": text,
    "onClick": onClick,
    "description": description,
    "background": background,
    "kind": TextButton.Kind.Secondary
})

let mediumStory = Story.csfWithArgs(TextButton.make, {
    "text": text,
    "onClick": onClick,
    "description": description,
    "background": background,
    "kind": TextButton.Kind.Default,
    "size": ContentButton.Size.Medium
})

let iconStory = Story.csfWithArgs(TextButton.make, {
    "text": text,
    "onClick": onClick,
    "description": description,
    "background": background,
    "kind": TextButton.Kind.Primary,
    "icon": #plusCircle
})


let iconRightStory = Story.csfWithArgs(TextButton.make, {
    "text": text,
    "onClick": onClick,
    "description": description,
    "background": background,
    "kind": TextButton.Kind.Primary,
    "icon": #plusCircle,
    "iconPosition": TextButton.IconPosition.Right
})