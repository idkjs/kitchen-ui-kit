@react.component
let make = (
    ~kind: ContentButtonProps.kind, 
    ~text: string,
    ~background: ContentButtonProps.background,
    ~description: string,
    ~icon: option<Icon.kind>,
    ~iconPosition: ContentButtonProps.iconPosition,
    ~disabled: bool,
    ~onClick: option<ReactEvent.Mouse.t => unit>,
    ~size: ContentButtonProps.size
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
        onClick={onClick}
    >
        {content}
    </ContentButton>
}