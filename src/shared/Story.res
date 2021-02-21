type story<'a> = {
    title: string,
    component: React.component<'a>,
    includeStories: Js.Re.t
}

let make = (
    ~title,
    ~component
) => ({
    title: title,
    component: component,
    includeStories: %re("/.*Story$/")
})

let csf = (
    template: 'a,
    args: 'b =?,
    parameters: 'c =?
) => {
    let story = %raw(`
        (template, args, parameters) => {
            const React = require('react')
            let story = args => React.createElement(
                template,
                args
            )
            story.args = args
            story.parameters = parameters
            return story
        }
    `)

    story(template, args, parameters)
}

let csfWithArgs = (template, args) => csf(template, args, None)
let csfPlain = (template) => csf(template, None, None)