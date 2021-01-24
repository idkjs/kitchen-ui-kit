
type dropdownAction =
| Settings
| ChangeAccount

@react.component
let make = (
    ~pkh: AccountButtonProps.pkh,
    ~balance: AccountButtonProps.balance
) => {
    let (dropdown, isDropdownOpened, openDropdown, closeDropdown) = {
        let (isDropdownOpened, setIsDropdownOpened) = Dropdown.useDropdown()
        let closeDropdown = _ => setIsDropdownOpened(_ => false)
        let openDropdown = _ => setIsDropdownOpened(_ => true)

        let dropdownListItems: SelectTextList.Props.items<dropdownAction> = [
            {
                selected: false,
                data: {
                    label: "Change Account",
                    value: ChangeAccount
                }
            },
            {
                selected: false,
                data: {
                    label: "Settings",
                    value: Settings
                }
            },
        ]

        let selectTextListOnChange: SelectTextList.Props.onChange<dropdownAction> = (item) => {
            closeDropdown()
            switch item.data.value {
                | ChangeAccount => Js.log("change account")
                | Settings => Js.log("settings")
            }
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