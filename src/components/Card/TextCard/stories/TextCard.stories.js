import { maxDimensions } from './../../../../misc/storyHelpers'
import { make as TextCard } from './../TextCard.bs'
import { make as DefaultTextCard } from './TextCardStories.bs'
// import { mdCardContainer, smCardContainer } from "./helpers";

const mdCardContainer = (component) => maxDimensions('464px', '144px', component)
const smCardContainer = (component) => maxDimensions('225px', '144px', component)

const description = 'Last transaction to your vaults'

export const MediumWithDescription = mdCardContainer(<DefaultTextCard/>)
MediumWithDescription.args = { description }

export const MediumWithoutDescription = mdCardContainer(<DefaultTextCard/>)

export const SmallWithDescription = smCardContainer(<DefaultTextCard/>)
SmallWithDescription.args = { description }

export const SmallWithoutDescription = smCardContainer(<DefaultTextCard/>)


export default {
    title: 'components/card/TextCard',
    component: TextCard,
    parameters:{
        backgrounds: {
            default: 'light'
        }
    },
    args: {
        title: 'last update at',
        text: '12.03.2020',
    }
}