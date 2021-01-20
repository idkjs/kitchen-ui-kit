type kind = 
| Default
| Primary
| Ghost

type iconPosition =
| Left
| Right

type icon = Icon.kind

type size =
| Medium
| Large

type description = string

type disabled = bool;

type onClick = ReactEvent.Mouse.t => unit
type onMouseEnter = ReactEvent.Mouse.t => unit