public class EmailOnLead {
    public static void emailmethod(List<Lead> ld){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(Lead led : ld){
            if((led.FirstName != null) && (led.Email != null)  && (led.Description != null)){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
                sendTo.add(led.Email);
                mail.setToAddresses(sendTo);
               
                mail.setReplyTo('Veeravalli.LakshmiPrasanna@etmarlabs.com');
                mail.setSenderDisplayName('Et Marlabs');
                mail.setSubject('Created succesfully');
                String body = 'Hi' + led.FirstName + led.LastName + ',';
                body += 'your lead created succesfully with Description';
                body += led.Description + '.';
                mail.setHtmlBody(body);
                mails.add(mail);
            }
        }
        Messaging.sendEmail(mails);
    }   
}