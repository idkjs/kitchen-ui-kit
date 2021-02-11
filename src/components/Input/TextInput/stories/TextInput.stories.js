import { maxDimensions } from "../../../../misc/storyHelpers";
import { make as TextInput } from "./../TextInput.bs";
import { defaultTextInput as DefaultTextInput } from "./TextInputStories.bs";


export const Default = maxDimensions('400px', '100px', <DefaultTextInput/>)

export default {
    title: 'components/input/TextInput',
    component: TextInput,
    args: {
        label: "Alias",
        placeholder: "Choose an alias for your wXTZ Vault",
        onChange: (e) => console.log(e.target.value),
        error: "",
    }
}