public class leadtemplate {
    public Static void  emailtemplatemethod(List<Lead> le){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(Lead ld : le){
            if((ld.FirstName != null) && (ld.Email != null)  && (ld.Description != null)){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                Emailtemplate templateid = [SELECT Id FROM EmailTemplate WHERE Name = 'LeadDescription'];                
                List<String> sendTo = new List<String>();
                sendTo.add(ld.Email);
                mail.setToAddresses(sendTo); 
                mail.setTargetObjectId(UserInfo.getUserId());
                mail.setTemplateID(templateid.Id); 
                mail.setReplyTo('Veeravalli.LakshmiPrasanna@etmarlabs.com');
                mail.setSenderDisplayName('Et Marlabs');
                mail.setSaveAsActivity(false);                
                mails.add(mail);
                System.debug(mails);
            }
        }
        Messaging.sendEmail(mails);
    }
    public static void emailattachment(List<Lead> led, Map<Id,Lead> oldLeadMap){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(Lead ld : led){
            if(ld.Email != null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> sendTo = new List<String>();
                sendTo.add(ld.Email);
                mail.setToAddresses(sendTo);                
                mail.setReplyTo('Veeravalli.LakshmiPrasanna@etmarlabs.com');
                mail.setSenderDisplayName('Et Marlabs');
                mail.setSubject('Created succesfully');
                String body = 'Hi' + ld.FirstName + ld.LastName + ',';
                body += 'your attachments';
                body += ld.Description + '.';
                mail.setHtmlBody(body);
                List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();
                for (Attachment a : [select Name,body from Attachment where ParentId = : ld.Id])
                {
                    System.debug(a);
                    Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
                    efa.setFileName(a.Name);
                    efa.setBody(a.body);
                    fileAttachments.add(efa);
                }
                mail.setFileAttachments(fileAttachments);
                mails.add(mail);
                System.debug(mails);
            }
        }
        Messaging.sendEmail(mails);
    }
    public static void RobinUserIndex(List<Lead> newlist){
        List<User> us = [Select Id,Name From User Where IsActive = true];
        System.debug('users'+us.size());
        for(Lead ld : newlist){
            ld.Requirement__c = us.size();
            /*System.debug('userIndex'+ld.Round_Robin_ID__c);
            ld.RobinID__c = math.mod(Integer.valueOf(ld.Lead_Number__c), us.size()) + 1 ;
            system.debug('robin'+ld.RobinID__c);
            ld.OwnerId = us[(Integer)ld.RobinID__c].Id; */
        }
    }
   
}