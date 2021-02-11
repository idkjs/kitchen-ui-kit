
type dropdownAction =
| ChangeAccount
| Settings

@react.component
let make = (
    ~pkh: AccountButtonProps.pkh,
    ~balance: AccountButtonProps.balance
) => {
    let (dropdown, isDropdownOpened, openDropdown, closeDropdown) = {
        let (isDropdownOpened, _, _, openDropdown, closeDropdown) = Dropdown.useDropdown()

        let dropdownListItems: SelectList.Props.items<dropdownAction> = [
            {
                id: "changeAccount",
                label: "Change Account",
                data: Some(ChangeAccount)
            },
            {
                id: "settings",
                label: "Settings",
                data: Some(Settings)
            },
        ]

        let selectTextListOnChange: SelectList.Props.onChange<dropdownAction> = (_) => {
            closeDropdown()
        }


        let dropdown = (
            <Dropdown
                background={Colors.Background.Dark}
                opened={isDropdownOpened}
                distanceFromHost={10}
                direction=(DropdownProps.Up)
            >
                <SelectTextList
                    items={dropdownListItems}
                    onChange={selectTextListOnChange}
                />
            </Dropdown>
        )

        (dropdown, isDropdownOpened, openDropdown, closeDropdown)
    }

    let button = {
        let balance = XTZBalance.format(balance)
        let truncatedPkh = Pkh.truncateInMiddle(pkh)
        let onMouseEnter = _ => openDropdown()

        <ContentButton
            kind={ContentButtonProps.Ghost}
            background={Colors.Background.Dark}
            icon={#chevronUp}
            iconPosition={ContentButtonProps.Right}
            onMouseEnter={onMouseEnter}
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
    }
    
    let wrapper = {
        let onMouseLeave = _ => closeDropdown()

        <div 
            className={AccountButtonStyles.Wrapper.make(
                ~isDropdownOpened
            )}
            onMouseLeave={onMouseLeave}
        >
            {dropdown}
            {button}
        </div>
    }

    wrapper
}