import { make as Button } from "./Button.bs";
import { 
    primaryButton, 
    secondaryButton 
} from "./Button.stories.bs";

export const primary = primaryButton
export const secondary = secondaryButton

export default {
    title: 'components/Button',
    component: Button
}
