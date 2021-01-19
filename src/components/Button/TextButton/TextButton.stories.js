import React from 'react'
import { make as TextButton } from "./TextButton.bs";
import {
    make as DefaultButton, 
    Kind,
    Background,
    IconPosition,
    Size
} from "./TextButton.stories.bs";
import { IconKinds } from './../../Icon/Icon.stories.bs'
import { maxWidth200px, maxDimensions, backgroundControl } from './../../../misc/storyHelpers'


// stories
export const Default = maxWidth200px(<DefaultButton/>)
Default.args = {}

export const Primary = maxWidth200px(<DefaultButton/>)
Primary.args = {
    kind: Kind.primary,
    background: Background.light
}

export const PrimaryMedium = maxDimensions('100px', '100%',<DefaultButton/>)
PrimaryMedium.args = {
    ...Primary.args,
    size: Size.medium,
    icon: 'arrowCircleLeft',
    text: 'click',
    description: 'To confirm'
}

export const PrimaryWithIcon = maxWidth200px(<DefaultButton/>)
PrimaryWithIcon.args = {
    kind: Kind.primary,
    background: Background.light,
    icon: 'plusCircle'
}

export const PrimaryDark = maxWidth200px(<DefaultButton/>)
PrimaryDark.args = {
    kind: Kind.primary,
    background: Background.dark
}
PrimaryDark.parameters = {
    backgrounds: {
        default: 'dark'
    }
}

export const GhostDark = maxWidth200px(<DefaultButton/>)
GhostDark.parameters = {
    backgrounds: {
        default: 'dark'
    }
}
GhostDark.args = {
    kind: Kind.ghost,
    background: Background.dark
}

export default {
    title: 'components/TextButton',
    component: TextButton,
    args: {
        text: 'click here',
        description: 'And navigate to Dashboard',
        disabled: false,
        background: Background.light,
        kind: Kind.$$default,
        icon: undefined,
        iconPosition: IconPosition.left,
        size: Size.large
    },
    argTypes: {
        background: backgroundControl,
        kind: {
            control: {
                type: 'select', 
                options: Kind
            }
        },
        icon: {
            control: {
                type: 'select',
                options: IconKinds
            }
        },
        iconPosition: {
            control: {
                type: 'select',
                options: IconPosition
            }
        },
        size: {
            control: {
                type: 'select',
                options: Size
            }
        }
    }
}
