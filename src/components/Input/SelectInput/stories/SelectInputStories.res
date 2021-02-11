@react.component
let defaultSelectInput = (
    ~label,
    ~placeholder,
    ~value,
    ~items: SelectList.Props.items<string>,
    ~nullable,
) => {



    <>
    <TextInput
        label="Block Explorer API"
        placeholder="Choose a block explorer to use"
    />
    {
        let (value, setValue) = React.useState(_ => Some(value))
        let (error, setError) = React.useState(_ => Some(""))

        let onChange = (value: option<SelectInput.Props.value<'a>>) => {
            setValue(_ => value)

            switch value {
                | None => setError(_ => Some("This field is required"))
                | Some(_) => setError(_ => None)
            }
        }
        <SelectInput
            ?value
            onChange
            label
            placeholder
            items
            nullable
            ?error
            renderItem={SelectTextList.renderItem}
            displayItem={_ => (_,_) => {
                <div
                    className={TextInput.Styles.Input.value}
                >
                    {React.string(switch value {
                        | None => ""
                        | Some(value) => value.label
                    })}
                </div>
            }}
        />
   
    }
    <TextInput
        label="Block Explorer API"
        placeholder="Choose a block explorer to use"
    />
    </>
}