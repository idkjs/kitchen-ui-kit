import { maxDimensions, maxWidth200px } from "../../../../misc/storyHelpers";
import { make as SelectInput } from "./../SelectInput.bs";
import { defaultSelectInput as DefaultSelectInput } from './SelectInputStories.bs'


export const Default = maxDimensions('300px', '100%', <DefaultSelectInput/>)
Default.args = {
    items: [
        {
            id: "delphinet",
            label: "Delphinet",
            data: 0
        },
        { 
            id: "edonet",
            label: "Edonet",
            data: 1
        },
    ],
    label: "Network",
    placeholder: "Choose a network",
    value: {
        id: "undefined",
        label: "-",
        data: undefined
    },
    nullable: true,
    error: ""
}

export default {
    component: SelectInput,
    title: 'components/input/SelectInput'
}