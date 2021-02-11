module Background = {
    let light = Colors.Background.Light
    let dark = Colors.Background.Dark
}

module Styles = {
    open! Cn
    open Emotion

    module Wrapper = {
        let shared = css(list{
            position(#relative)  
        })

        let make = () => fromList(list{
            shared
        })
    }
}

@react.component
let defaultDropdown = (
    ~background
) => {

    let (opened, setOpened) = React.useState(_ => false)
    let icon: option<Icon.kind> = Some(#chevronDown)
    <div
        className={Styles.Wrapper.make()}
    >  
        <TextButton
            text={"toggle"}
            ?icon
            iconPosition={ContentButtonProps.Right}
            background={background}
            onClick={_ => setOpened(opened => !opened)}
        />
        <Dropdown
                distanceFromHost={10}
                direction={DropdownProps.Down}
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
    </div>
}