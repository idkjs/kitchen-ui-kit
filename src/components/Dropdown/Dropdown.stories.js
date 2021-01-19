import { make as Dropdown} from './Dropdown.bs'
import { Background, defaultDropdown as DefaultDropdown } from './Dropdown.stories.bs'
import { maxDimensions, backgroundControl } from './../../misc/storyHelpers'

export const LightBackground = maxDimensions('300px', '200px', <DefaultDropdown/>)

export const DarkBackground = maxDimensions('300px', '200px', <DefaultDropdown/>)
DarkBackground.parameters = {
    backgrounds: {
        default: 'dark'
    }
}

DarkBackground.args = {
    background: Background.dark
}

export default {
    title: 'components/Dropdown',
    component: Dropdown,
    args: {
        background: Background.light,
        opened: true
    },
    argTypes: {
        background: backgroundControl
    }
}