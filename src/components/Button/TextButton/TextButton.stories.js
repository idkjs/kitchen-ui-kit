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

const MaxWidthContainer = ({width, children}) => (
    <div style={{ width }}>
       {children}
    </div>
)

const maxWidth = (width, children) => (props) => {
    const childWithProps = React.cloneElement(children, props);
    return <MaxWidthContainer width={width}>
        {childWithProps}
    </MaxWidthContainer>
}

const maxWidth200px = (children) => maxWidth('200px', children)

// stories
export const Default = maxWidth200px(<DefaultButton/>)
Default.args = {}

export const Primary = maxWidth200px(<DefaultButton/>)
Primary.args = {
    kind: Kind.primary,
    background: Background.light
}

export const PrimaryMedium = maxWidth("100px",<DefaultButton/>)
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
        background: {
            control: {
                type: 'select',
                options: Background
            }
        },
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
