import React from 'react';
import { Background } from './../components/Button/TextButton/TextButton.stories.bs'

const MaxWidthContainer = ({width, height, children}) => (
    <div style={{ 
        width, 
        height,
        position: 'relative'
    }}>
       {children}
    </div>
)

export const maxDimensions = (width, height, children) => (props) => {
    const childWithProps = React.cloneElement(children, props);
    return <MaxWidthContainer width={width} height={height}>
        {childWithProps}
    </MaxWidthContainer>
}

export const maxWidth200px = (children) => maxDimensions('200px', '100%', children)

export const backgroundControl = {
    control: {
        type: 'select',
        options: Background
    }
};