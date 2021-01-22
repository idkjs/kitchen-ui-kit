
@react.component
let make = (
    ~pkh: AccountButtonProps.pkh,
    ~balance: AccountButtonProps.balance
) => {
    let (isDropdownOpened, setIsDropdownOpened) = Dropdown.useDropdown()

    let balance = XTZBalance.format(balance)
    let truncatedPkh = Pkh.truncateInMiddle(pkh)

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