open Emotion
open ContentButtonProps
open! Cn


module Shared = {
    let noBoxShadow = boxShadow(
        ~y = #px(0), 
        ~x = #px(0), 
        ~blur = #px(0), 
        ~spread = #px(0), 
        ~inset = false, 
        Colors.transparent
    )

    let disabled = css(list{
        cursor(#notAllowed),
        opacity(0.5),
        noBoxShadow
    });
}

module Wrapper = {
    let shared = css(list{
        width(#pct(100.0))
    })

    let medium = css(list{
        maxWidth(#px(100))
    })

    let large = css(list{
        maxWidth(#px(250))
    })

    let make = (
        ~disabled: disabled,
        ~size: size
    ) => fromList(list{
        shared,
        switch size {
            | Medium => medium
            | Large => large
        },
        Shared.disabled->on(disabled)
    })
}

module Button = {
    let shared = css(list{
        borderRadius(#px(8)),
        cursor(#pointer),
        fontFamily(Typography.fontFamily),
        height(#pct(100.0)),
        transition(
            "all", 
            #ms(100), 
            #linear, 
            #ms(0)
        ),
        display(#flex),
        alignItems(#center),
        justifyContent(#spaceBetween),
        color(Colors.white),
        
    })

    let sharedLarge = css(list{
        padding(#px(12)),
    })

    let sharedMedium = css(list{
        padding(#px(8)),
    })

    let baseDefault = css(list{
        backgroundColor(Colors.Gray.Dark.default),
    })

    let text = css(list{
        width(#pct(100.0)),
        textAlign(#center)
    })

    // background
    let lightBackground = css(list{
        boxShadow(
            ~y = #px(1), 
            ~x = #px(0), 
            ~blur = #px(3), 
            ~spread = #px(0), 
            ~inset = false, 
            Colors.Gray.Light.darkest
        ),
    })

    let darkBackground = css(list{
        boxShadow(
            ~y = #px(1), 
            ~x = #px(0), 
            ~blur = #px(3), 
            ~spread = #px(0), 
            ~inset = false, 
            Colors.Secondary.darker
        ),
    })


    // kind
    let defaultHover = list{
        backgroundColor(Colors.Gray.Dark.darker)
    }
    let default = baseDefault + css(list{
        hover(defaultHover),

        active(list{
            backgroundColor(Colors.Gray.Dark.darkest)
        })
    })

    let primaryHover = list{
        backgroundColor(Colors.Primary.darker)
    }
    let primary = css(list{
        backgroundColor(Colors.Primary.default),

        hover(primaryHover),

        active(list{
            backgroundColor(Colors.Primary.darkest)
        })
    })

    let ghostHover = list{
        backgroundColor(Colors.Secondary.darker)
    }
    let ghost = css(list{
        boxShadow(
            ~y = #px(0), 
            ~x = #px(0), 
            ~blur = #px(0), 
            ~spread = #px(3), 
            ~inset = true, 
            Colors.Secondary.darkest
        ),

        hover(ghostHover),

        active(list{
            backgroundColor(Colors.Secondary.darkest)
        })
    })

    // icon position
    let iconLeft = css(list{
        flexDirection(#row)
    })

    let iconRight = css(list{
        flexDirection(#rowReverse)
    })

    let _disabled = baseDefault + Shared.disabled 

    module Icon = {
        let margin = #px(4)
        
        let iconLeft = css(list{
            marginLeft(margin)
        })

        let iconRight = css(list{
            marginRight(margin)
        })

        let make = (~iconPosition: iconPosition) => fromList(list{
            switch iconPosition {
                | Left => iconLeft
                | Right => iconRight
            }
        })
    }

    let make = (
        ~iconPosition,
        ~kind,
        ~background,
        ~disabled,
        ~size
    ) => fromList(list{
        shared,
        (switch size {
            | Medium => sharedMedium
            | Large => sharedLarge
        }),
        (switch iconPosition {
            | Left => iconLeft
            | Right => iconRight
        }),
        (switch background {
            | Colors.Background.Light => lightBackground
            | Colors.Background.Dark => darkBackground
        }),
        (switch kind {
            | Default => default
            | Primary => primary
            | Ghost => ghost
        })->on(!disabled),
        _disabled->on(disabled),
    })
}

module Description = {
    let shared = css(list{
        fontSize(#px(12)),
        // this isnt ideal as the font overflows the container
        height(#px(14)),
        width(#pct(100.0)),
        textAlign(#center),
        display(#block),
        fontFamily(Typography.fontFamily),
    })

    let lightBackground = css(list{
        color(Colors.Gray.Dark.default)
    })

    let darkBackground = css(list{
        color(Colors.white)
    })

    let mediumDescription = css(list{
        marginTop(#px(4))
    })

    let largeDescription = css(list{
        marginTop(#px(6))
    })

    let make = (
        ~background,
        ~disabled: disabled,
        ~size: ContentButtonProps.size
    ) => fromList(list{
        shared,
        switch background {
            | Colors.Background.Light => lightBackground
            | Colors.Background.Dark => darkBackground
        },
        switch size {
            | Medium => mediumDescription
            | Large => largeDescription
        },
        Shared.disabled->on(disabled)
    })
}
