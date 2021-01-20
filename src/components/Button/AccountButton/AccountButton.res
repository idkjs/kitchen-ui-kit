
@react.component
let make = (
    ~pkh: AccountButtonProps.pkh,
    ~balance: AccountButtonProps.balance
) => {


    let (isDropdownOpened, setIsDropdownOpened) = React.useState(_ => false)

    let truncateInMiddle = (string: string) => {
        let joinWith = "..."
        let targetLength = 18
        let length = Js.String.length(string)
        let chars = string
            |> Js.String.split("")

        let firstHalf = chars
            |> Js.Array.slice(
                ~start = 0, 
                ~end_ = targetLength / 2
            )

        let secondHalf = chars
            |> Js.Array.slice(
                ~start = length - (targetLength / 2), 
                ~end_ = length
            )

        let truncated = 
            Js.Array.joinWith("", firstHalf)
            ++ joinWith
            ++ Js.Array.joinWith("", secondHalf)

        truncated
    }

    Js.log2("balance", balance)
    let balance = FormatBalance.make(balance)

    Js.log2("balance2", balance)
    

    let truncatedPkh = truncateInMiddle(pkh)

    let closeDropdown = _ => setIsDropdownOpened(_ => false)
    let openDropdown = _ => setIsDropdownOpened(_ => true)
    
    

    <div 
        className={AccountButtonStyles.Wrapper.make(
            ~isDropdownOpened
        )}
        onMouseLeave={_ => closeDropdown()}
    >
        <Dropdown
            background={Colors.Background.Dark}
            opened={isDropdownOpened}
            distanceFromHost={10}
            direction=(DropdownProps.Up)
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

        <ContentButton
            kind={ContentButtonProps.Ghost}
            background={Colors.Background.Dark}
            icon={#chevronUp}
            iconPosition={ContentButtonProps.Right}
            onMouseEnter={_ => openDropdown()}
        >
            <div
                className={AccountButtonStyles.ContentWrapper.make()}
            >
                <span
                    className={AccountButtonStyles.Pkh.make()}
                >
                    {React.string(truncatedPkh)}
                </span>
                <span
                    className={AccountButtonStyles.Balance.make()}
                >
                    {React.string(balance)}{React.string(" XTZ")}
                </span>
            </div>
        </ContentButton>
    </div>
}