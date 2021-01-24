import { defaultSelectTextList as SelectTextList } from "./SelectTextListStories.bs";
import { maxWidth200px } from "./../../../misc/storyHelpers";

export const Default = maxWidth200px(<SelectTextList/>)
Default.args = {
    items: [
        {
            selected: false,
            data: "Alice"
        },
        {
            selected: true,
            data: "Bob"
        }
    ]
}

export default {
    title: 'components/SelectTextList',
    component: SelectTextList
}