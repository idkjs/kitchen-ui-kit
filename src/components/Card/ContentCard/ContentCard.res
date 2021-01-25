module Props = {
    type title = string
    type description = string
}

module Styles = {
    open! Cn
    open Emotion
    
    let basePadding = 16
    let _padding = #px(basePadding)
    let paddingY = padding2(#px(0), _padding)
    let _borderRadius = #px(8)

    module Wrapper = {
    
        let boxShadowWrapper = (color) => (
            boxShadow(
                ~y = #px(3), 
                ~x = #px(0), 
                ~blur = #px(4), 
                ~spread = #px(0), 
                ~inset = false, 
                color
            )
        )


        let shared = css(list{
            backgroundColor(Colors.white),
            borderRadius(_borderRadius),
            boxShadowWrapper(Colors.Gray.Light.darkest),
            paddingTop(_padding),
            paddingBottom(#px(24)),
            position(#relative),
            fontFamily(Typography.fontFamily)
        })

        let withDescription = css(list{
            // very bad
            important(paddingBottom(#px(0))),
        })


        let make = (
            ~description
        ) => fromList(list{
            shared,
            withDescription->onSome(description),
            
        })
    }

    module Title = {
        let (_borderWidth, _marginBottom) = {
            open! Pervasives
            let _borderWidth = 4
            let _marginBottom = _borderWidth * 2 + basePadding
            (_borderWidth, _marginBottom)
        }

        let shared = css(list{
            color(Colors.Primary.default),
            fontWeight(700),
            fontSize(#px(18)),
            height(#px(20)),
            marginBottom(#px(_marginBottom)),
            textTransform(#uppercase),
            fontFamily(Typography.fontFamily),
            paddingY,
            select(":after", list{
                width(#px(100)),
                height(#px(0)),
                content(""),
                display(#block),
                borderBottomWidth(#px(_borderWidth)),
                borderBottomColor(Colors.Gray.Light.darker),
                position(#relative),
                top(#px(0))
            })
        })

        let make = () => fromList(list{
            shared
        })
    }

    module Description = {
        let shared = css(list{
            backgroundColor(Colors.Gray.Light.default),
            paddingY,
            borderBottomRightRadius(_borderRadius),
            borderBottomLeftRadius(_borderRadius),
            height(#px(40)),
            fontSize(#px(12)),
            lineHeight(#px(14)),
            textTransform(#uppercase),
            color(Colors.Gray.Dark.default),
            textAlign(#left),
            display(#flex),
            alignItems(#center),
            marginTop(#px(basePadding))
        })

        let make = () => fromList(list{
            shared
        })
    }
}

@react.component
let make = (
    ~title: Props.title,
    ~description: option<Props.description> =?,
    ~children
) => {

    let title = (
        <p
            className={Styles.Title.make()}
        >
            {React.string(title)}
        </p>
    )

    let children = (
        <div>
            {children}
        </div>
    )

    let _description = switch description {
        | Some(description) => (
            <div
                className={Styles.Description.make()}
            >
                <p>
                    {React.string(description)}
                </p>
            </div>
        )
        | None => <></>
    }

    <div
        className={Styles.Wrapper.make(
            ~description
        )}
    >
        {title}
        {children}
        {_description}
    </div>
}