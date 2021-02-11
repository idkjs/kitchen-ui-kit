import { defaultSelectTextList as SelectTextList } from "./SelectTextListStories.bs";
import { maxWidth200px } from "./../../../misc/storyHelpers";

export const DefaultInDropdown = maxWidth200px(<SelectTextList/>)
DefaultInDropdown.args = {
    items: [
        {
            id: 'alice',
            label: "Alice",
            value: "Alice"
        },
        {
            id: 'bob',
            label: "Bob",
            value: "Bob"
        }
    ],
    value: {
        id: 'alice'
    }
}

export default {
    title: 'components/SelectTextList',
    component: SelectTextList
}