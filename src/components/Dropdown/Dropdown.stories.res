module Background = {
    let light = Colors.Background.Light
    let dark = Colors.Background.Dark
}
@react.component
let defaultDropdown = (
    ~background
) => {

    let (opened, setOpened) = React.useState(_ => false)
    let icon: option<Icon.kind> = Some(#chevronUp)
    <>  
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <Dropdown
                distanceFromHost={10}
                direction={DropdownProps.Up}
                opened={opened}
                background={background}
            >
            <h1 style=(ReactDOM.Style.make(
                ~width="240px",
                ~height="100px",
                ~padding="12px",
                ()
            ))>
                {React.string("Dropdown")}
            </h1>
        </Dropdown>
        <TextButton
            text={"toggle"}
            ?icon
            iconPosition={ContentButtonProps.Right}
            background={background}
            onClick={_ => setOpened(opened => !opened)}
        />
    </>
}