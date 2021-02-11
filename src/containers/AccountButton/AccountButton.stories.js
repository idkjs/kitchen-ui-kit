import { maxDimensions } from '../../misc/storyHelpers'
import { make as AccountButton } from './AccountButton.bs'
import { make as DefaultAccountButton} from './AccountButtonStories.bs'

export const Default = maxDimensions('224px', '500px', <DefaultAccountButton/>)
Default.parameters = {
    backgrounds: {
        default: 'dark'
    }
}

export default {
    component: AccountButton,
    title: 'components/AccountButton',
    args: {
        pkh: 'tz1RB4dczQ6ixCjpowiRTiL5eLFVq6zqDNGz',
        // pkh: 'tz1RB4dczQ6ix',
        balance: '123456789123456'
    }
}