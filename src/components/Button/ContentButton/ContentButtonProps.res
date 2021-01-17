type kind = 
| Default
| Primary

type background =
| Light
| Dark

type iconPosition =
| Left
| Right

type icon = option<Icon.kind>

type size =
| Medium
| Large

type description = string

type disabled = bool;

type onClick = option<ReactEvent.Mouse.t => unit>