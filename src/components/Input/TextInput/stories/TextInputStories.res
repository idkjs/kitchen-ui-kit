@react.component
let defaultTextInput = (
    ~label,
    ~placeholder,
    ~onChange,
    ~error=?
) => {
    let (value, setValue) = React.useState(_ => "")
    let _onChange = (e) => {
        onChange(e)
        setValue(_ => ReactEvent.Form.target(e)["value"])
    }
    <TextInput
        label
        placeholder
        onChange={_onChange}
        ?error
        value
    />
}