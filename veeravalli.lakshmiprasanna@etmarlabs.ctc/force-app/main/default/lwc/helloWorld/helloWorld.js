import { LightningElement, track , api, wire} from 'lwc';
import getContacts from '@salesforce/apex/ControllerForLWC.getContacts' ;
export default class HelloWorld extends LightningElement {
    @track greeting = 'World';
    @api recordId;
    @track data;
    @track error;
    changeHandler(event) {
        this.greeting = event.target.value;
    }
    @track columns = [{
        label: 'Name',
        fieldName: 'Name',
        type: 'text',
        sortable: true
    },
    {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'Phone',
        sortable: true
    }
    

];

    @wire(getContacts, {accId : '$recordId' })
    wiredConct({
        error,
        data
    }) {
        if (data) {
            this.data = data;
        } else if (error) {
            this.error = error;
        }
    } 
    
    get acceptedFormats(){
        return ['.pdf', '.png']
    }

    
}