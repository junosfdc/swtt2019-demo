import { LightningElement, wire, track } from 'lwc';
import getWelcomeMessage from '@salesforce/apex/MyCalendarCtrl.getWelcomeMessage';

export default class MyCalendar extends LightningElement {
    @track greetingMessage;
    @track warekiDate;
    @track error;
    
    @wire(getWelcomeMessage)
    wiredWelcomeMessage({error, data}) {
        if (data) {
            this.greetingMessage = data.greetingMessage;
            this.warekiDate = data.warekiDate;
        }
        else if (error) {
            this.error = error;
        }
    }

}