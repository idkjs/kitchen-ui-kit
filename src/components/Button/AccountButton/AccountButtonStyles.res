open Emotion
open! Cn

module Wrapper = {

    let ghostButtonHover = ContentButtonStyles.Button.ghostHover
    
    let icon = (
        ~isDropdownOpened
    ) => list{
        transition(
            "all", 
            #ms(250), 
            #linear, 
            #ms(0)
        ),
        position(#relative),
        switch isDropdownOpened {
            | true => transform(#rotate(#deg(180.0)))
            | false => transform(#rotate(#deg(0.0)))
        },
    }

    let shared = (
        ~isDropdownOpened
    ) => fromList(list{
        css(list{
            select("svg", icon(~isDropdownOpened)),
            hover(switch isDropdownOpened {
                | true => list{
                    select(".button", ghostButtonHover)
                }
                | false => list{}
            }),
            // AccountButton is responsible for setting the width
            // of the underlying list, this is not ideal
            select(".dropdown-wrapper", list{
                width(#pct(100.0))
            })
        })
    })

    let make = (
        ~isDropdownOpened
    ) => fromList(list{
        shared(~isDropdownOpened)
    })
}

module ContentWrapper = {
    let shared = css(list{
        textAlign(#left),
        marginLeft(#px(4)),

        select("span", list{
            height(#px(16)),
            fontSize(#px(14)),
            display(#block),
            lineHeight(#px(16)),
            position(#relative),
            top(#px(1))
        })
    })

    let make = () => fromList(list{
        shared
    })
}

module Pkh = {
    let shared = css(list{
        fontWeight(700),
    })

    let make = () => fromList(list{
        shared
    })
}

module Balance = {
    let shared = css(list{
        marginTop(#px(4)),
    })

    let make = () => fromList(list{
        shared
    })
}