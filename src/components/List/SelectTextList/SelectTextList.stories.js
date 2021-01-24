import { defaultSelectTextList as SelectTextList } from "./SelectTextListStories.bs";
import { maxWidth200px } from "./../../../misc/storyHelpers";

export const DefaultInDropdown = maxWidth200px(<SelectTextList/>)
DefaultInDropdown.args = {
    items: [
        {
            selected: false,
            data: {
                label: "Alice",
                value: "Alice"
            }
        },
        {
            selected: true,
            data: {
                label: "Alice",
                value: "Alice"
            }
        }
    ]
}

export default {
    title: 'components/SelectTextList',
    component: SelectTextList
}