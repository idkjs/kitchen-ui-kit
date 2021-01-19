open Emotion
open Cn

module Shared = {
    let contentHeight = (
        ~size: ContentButtonProps.size
    ) => switch size {
        | Medium => #px(16)
        | Large => #px(24)
    }

    let shared = () => css(list{
        textTransform(#uppercase),
        fontWeight(700),
        display(#flex),
        justifyContent(#center),
        alignItems(#center)
    })

    let sharedLarge = css(list{
        fontSize(#px(20)),
        lineHeight(#px(22)),
        height(contentHeight(
            ~size = ContentButtonProps.Large
        ))
    })

    let sharedMedium = css(list{
        fontSize(#px(14)),
        lineHeight(#px(16)),
        height(contentHeight(
            ~size = ContentButtonProps.Medium
        ))
    })
    
    let make = (
        ~size: ContentButtonProps.size
    ) => fromList(list{
        shared(),
        switch size {
            | Medium => sharedMedium
            | Large => sharedLarge
        }
    })
}

module Content = {
    let make = (
        ~size: ContentButtonProps.size
    ) => fromList(list{
        Shared.make(
            ~size = size
        )
    })
}