%%raw(`import './../../../tailwind.css'`)
open ContentButtonProps

module DefaultProps = {
    let description = ""
    let background = Light
    let disabled = false
    let iconPosition = Left
    let kind = Default
    let iconSize = #px(24)
    let size = Large
    let icon = None
    let onClick = None
}

@react.component
let make = (
    ~kind: kind,
    ~description: description = DefaultProps.description,
    /**
     * TODO obtain the background information from a BackgroundContext
     * in order to prevent the wrong ContentButtonStyles being applied manually
     */
    ~background: background = DefaultProps.background,
    ~disabled: disabled = DefaultProps.disabled,
    ~icon: icon = DefaultProps.icon,
    ~iconPosition: iconPosition = DefaultProps.iconPosition,
    ~iconSize: Icon.size = DefaultProps.iconSize,
    ~onClick: onClick = DefaultProps.onClick,
    ~size: size = DefaultProps.size,
    ~children
) => {
    let button = {
        let onClick = event => switch (onClick) {
            | Some(onClick) => onClick(event)
            | None => ()
        }

        let icon = switch icon {
            | Some(kind) => (
                <div
                    className={ContentButtonStyles.Button.Icon.make(
                        ~iconPosition = iconPosition
                    )}
                >
                    <Icon
                        kind={kind}
                        size={iconSize}    
                    />
                </div>
            )
            | None => <></>
        };

        <div 
            className={ContentButtonStyles.Button.make(
                ~iconPosition = iconPosition,
                ~kind = kind,
                ~background = background,
                ~disabled = disabled,
                ~size = size
            )}
            onClick={onClick}
        > 
            {icon}
            <span 
                className={ContentButtonStyles.Button.text}
            >
                {children}
            </span>
        </div>
    }
    
    let hasDescription = Js.String.length(description) > 0
    let description = switch hasDescription {
        | true => (
            <span 
                className={ContentButtonStyles.Description.make(
                    ~disabled = disabled,
                    ~background = background,
                    ~size = size
                )}>
                    {React.string(description)}
            </span>
        )
        | false => <></>
    }

    // Wrapper
    <div className={ContentButtonStyles.Wrapper.make(
        ~disabled = disabled
    )}>
        {button}
        {description}
    </div>
}