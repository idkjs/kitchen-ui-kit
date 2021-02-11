module Props = {
    type value<'a> = SelectList.Props.selectItem<'a>
    type onChange<'a> = option<value<'a>> => unit

    type label = BaseInput.Props.label
    type placeholder = TextInput.Props.placeholder
    type renderItem<'a> = SelectList.Props.renderItem<'a>
    type displayItem<'a> = renderItem<'a>
    type filter<'a> = (string, SelectList.Props.items<'a>) => SelectList.Props.items<'a>

    type sort<'a> = (SelectList.Props.items<'a>, option<value<'a>>) => SelectList.Props.items<'a>
}

let nullableValue: Props.value<'a> = {
    id: "undefined",
    label: "-",
    data: (None: option<'a>)
}

module Sort = {
    let default: Props.sort<'a> = (items, value) => {
        let items = items
            |> Js.Array.filter((item: Props.value<'a>) => {
                switch value {
                    | None => true
                    | Some(value) => (
                        value.id != item.id
                    )
                }
            })

        switch value {
            | None => ()
            | Some(value) => {
                if (value.data != nullableValue.data) {
                    let _ = Js.Array.unshift(value, items)
                }
            }
        }

        items
    }

    let noPriority: Props.sort<'a> = (items, _) => {
        items
    }
}

module Filter = {
    /**
     * Default filtering function uses the lowercase label
     * to identify desired items
     */
    let default: Props.filter<'a> = (filterValue, filteredItems) => {
        filteredItems
            |> Js.Array.filter((
                item: SelectList.Props.selectItem<'a>
            ) => {
                item.label
                    -> Js.String.toLowerCase
                    |> Js.String.includes(
                        filterValue
                            -> Js.String.toLowerCase
                    )
            })
    }
}

module Styles = {
    open! Cn
    open Emotion

    module Wrapper = {
        let shared = css(list{
            position(#relative),
            select("input ~ .icon", list{
                Animated.Transitions.slower,
                pointerEvents(#none)
            }),
            select("input:focus ~ .icon", list{
                // important()
                color(Colors.Secondary.default)
            })
        })

        let make = () => fromList(list{
            shared
        })
    }

    let labelHeight = 20

    module DisplayItem = {
        let shared = css(list{
            position(#absolute),
            left(#px(0)),
            top(#px(labelHeight)), // label height + margin,
            height(#px(48)), // input height
            width(#pct(100.)),
            pointerEvents(#none),
            opacity(0.),

            select("~ div input", list{
                placeholder(list{
                    color(Colors.transparent)
                })
            }),
        })

        let _isVisible = css(list{
            opacity(1.)
        })

        let make = (
            ~isVisible
        ) => fromList(list{
            shared,
            _isVisible->on(isVisible),
        })
    }
}

@react.component
let make = (
    ~label: Props.label,
    ~items: SelectList.Props.items<'a>,
    ~placeholder: Props.placeholder,
    ~nullable: bool = true,
    ~value: option<Props.value<'a>> =?,
    ~error: option<BaseInput.Props.error> =?,

    ~onChange: Props.onChange<'a>,
    
    ~sort: Props.sort<'a> = Sort.noPriority,
    ~filter: Props.filter<'a> = Filter.default,

    ~displayItem: Props.displayItem<'a>,
    ~renderItem: Props.renderItem<'a>,
) => {
    let (isDropdownOpened, isAnimationFinished, _, openDropdown, closeDropdown) = Dropdown.useDropdown()
    let (filteredItems, setFilteredItems) = React.useState(_ => items)
    let (filterValue, setFilterValue) = React.useState(_ => "")
    
    let wrapperRef = React.useRef(Js.Nullable.null)
        -> ReactDOM.Ref.domRef
    
    let onClickOutside = _ => {
        switch isDropdownOpened {
            | true => {
                closeDropdown()
                let _ = Js.Global.setTimeout(
                    _ => {
                        setFilterValue(_ => "")
                    }, 
                    DropdownStyles.Body.Animation._animationDuration
                )
            }
            | false => ()
        }
    }

    let addNullableItem = (items, nullable) => {
        switch nullable {
            | false => ()
            | true => {
                let containsNullable = Js.Array.find((item: Props.value<'a>) => {
                    item.data == nullableValue.data
                }, items)
                switch containsNullable {
                    | None => {
                        let _ = Js.Array.unshift(nullableValue, items)
                    }
                    | Some(_) => ()
                }
            }
        }
    }

    let applyFilter = (items, filterValue) => {
        let shouldFilter = filterValue
            ->Js.String.length > 0

        switch shouldFilter {
            | false => setFilteredItems(_ => items)
            | true => setFilteredItems(filteredItems => {
                let filteredItems = filteredItems
                    |> filter(filterValue)
            
                let noResultsAvailable = filteredItems->Js.Array.length == 0

                switch noResultsAvailable {
                    // TODO: show a no-results screen
                    | true => items
                    | false => filteredItems
                }
            })
        }
    }

    let applySort = (items, value) => {
        let _ = sort(items, value)
    }

    /**
     * Apply filter when `items` or `filterValue` changes
     */
    React.useEffect2(_ => {
        applySort(items, value)
        None
    }, (items, value))
    
    React.useEffect2(_ => {
        addNullableItem(items, nullable)
        None
    }, (items, nullable))

    React.useEffect2(_ => {
        applyFilter(items, filterValue)
        None
    }, (items, filterValue))

    /**
     * If you click outside of the Input or Dropdown
     * then the Dropdown will close
     */
    wrapperRef
        -> Hooks.useOnClickOutside(onClickOutside)

    let displayItem = {
        switch value {
            | Some(value) => {
                switch value.data {
                    | Some(_) => {
                        <div
                            className={Styles.DisplayItem.make(
                                ~isVisible={!isDropdownOpened && isAnimationFinished}
                            )}
                        >   
                            {None->displayItem(0, value)}
                        </div>
                    }
                    // when the value is manually set to undefined, show nothing
                    | None => <></>
                }
            }
            // when the value is None, not when value.data == None
            | None => <></>
        }
    }

    let dropdown = {
        let selectList = {
            let onChange = value => {
                closeDropdown()
                /**
                 * Wait until the dropdown is closed
                 * then update filter & value accordingly
                 * TODO: change closeDropdown to accept a callback which is
                 * called when the animation is over
                 */
                let _ = Js.Global.setTimeout(
                    _ => {
                        setFilterValue(_ => "")
                        switch value == nullableValue {
                            | true => onChange(None: option<Props.value<'a>>)
                            | false => onChange(Some(value))
                        }
                    }, 
                    DropdownStyles.Body.Animation._animationDuration
                )
            }
            <SelectList
                onChange
                items={filteredItems}
                ?value
                renderItem
            />
        }

        <Dropdown
            background={Colors.Background.Light}
            opened={isDropdownOpened}
            distanceFromHost={10}
            direction={DropdownProps.Down}
        >
            {selectList}
        </Dropdown>
    }

    let input = {
        let onMouseDown = _ => openDropdown()
        /**
         * TextInput value acts is used for filtering the list items
         */
        let onChange = event => {
            let filterValue = ReactEvent.Form.target(event)["value"]
            setFilterValue(_ => filterValue)
        }

        <TextInput
            label
            placeholder
            onChange
            onMouseDown
            ?error
            value={filterValue}
            icon={#selector}
        >
            {dropdown}
        </TextInput>
    }

    (
        <div
            ref={wrapperRef}
            className={Styles.Wrapper.make()}
        >
            {displayItem}
            {input}
        </div>
    )
}