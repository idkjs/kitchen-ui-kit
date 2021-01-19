@react.component
let make = (
    ~kind: TextButtonProps.kind = ContentButton.DefaultProps.kind, 
    ~text: string,
    ~background: Colors.Background.t = ContentButton.DefaultProps.background,
    ~description: TextButtonProps.description = ContentButton.DefaultProps.description,
    ~icon: TextButtonProps.icon = ContentButton.DefaultProps.icon,
    ~iconPosition: TextButtonProps.iconPosition = ContentButton.DefaultProps.iconPosition,
    ~disabled: TextButtonProps.disabled = ContentButton.DefaultProps.disabled,
    ~onClick: option<TextButtonProps.onClick> =?,
    ~size: TextButtonProps.size = ContentButton.DefaultProps.size
) => {

    let content = (
        <div className={TextButtonStyles.Content.make(
            ~size = size
        )}>
            {React.string(text)}
        </div>
    )
    
    <ContentButton
        kind={kind}
        description={description}
        background={background}
        icon={icon}
        iconPosition={iconPosition}
        iconSize={TextButtonStyles.Shared.contentHeight(
            ~size = size
        )}
        disabled={disabled}
        size={size}
        ?onClick
    >
        {content}
    </ContentButton>
}