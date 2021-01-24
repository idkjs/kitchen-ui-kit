@react.component
let defaultSelectTextList = (
    ~items
) => {
    let (opened, setOpened) = React.useState(_ => false)
    React.useEffect(_ => {
        setOpened(_ => true)
        None
    })
    <>
        <br/>
        <br/>
        <br/>
        <Dropdown
            opened={opened}
            direction={DropdownProps.Up}
            background={Colors.Background.Light}
            distanceFromHost={0}
        >
            <SelectTextList
                items
                onChange={Js.log}
            />
        </Dropdown>
    </>
}