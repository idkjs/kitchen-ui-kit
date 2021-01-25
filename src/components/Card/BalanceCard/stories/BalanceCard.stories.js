import { MediumWithDescription } from "../../TextCard/stories/TextCard.stories";
import { make as BalanceCard } from "./../BalanceCard.bs";
import { defaultBalanceCard as DefaultBalanceCard } from "./BalanceCardStories.bs";
import { mdCardContainer } from "./../../TextCard/stories/helpers";
import BigNumber from "bignumber.js";

export const mediumWithDescription = mdCardContainer(<DefaultBalanceCard/>)

export default {
    title: 'components/card/BalanceCard',
    component: BalanceCard,
    parameters: {
        backgrounds: {
            default: 'light'
        }
    },
    args: {
        title: 'XTZ Balance',
        description: 'Balance of your current account',
        balance: BigNumber(123456789.123456),
        currency: "XTZ"
    }
}