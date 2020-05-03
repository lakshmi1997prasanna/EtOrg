public with sharing class samplePagerCtrl {
    @AuraEnabled
    public static AccountPagerWrapper fetchAccount(Decimal pageNumber ,Integer recordToDisply) {
        Integer pageSize = recordToDisply;
        Integer offset = ((Integer)pageNumber - 1) * pageSize;
        
        // create a instance of wrapper class.
        AccountPagerWrapper obj =  new AccountPagerWrapper();
        // set the pageSize,Page(Number), total records and accounts List(using OFFSET)   
        obj.pageSize = pageSize;
        obj.page = (Integer) pageNumber;
        obj.total = [SELECT count() FROM account];
        obj.accounts = [SELECT Id, Name,Phone FROM Account ORDER BY Name LIMIT :recordToDisply OFFSET :offset];
        // return the wrapper class instance .
        return obj;
    }
    @AuraEnabled
    public static Integer ContactById(String accid){
        system.debug('%%%%');
        List<Contact> con = [SELECT Id,Name FROM Contact WHERE AccountId =:accid];
        system.debug('con--->'+con);
        return con.size();
    }
    @AuraEnabled
    public static String getdeleteaccid(String acid){
        List<Contact> con = [SELECT Id,Name FROM Contact WHERE AccountId =:acid];
        delete con;
        Account delAcc = [SELECT Id,Name FROM Account WHERE Id=:acid];
        delete delAcc;
        return 'SUCCESS';
        //List<Account> remacc = [SELECT Id,Name,Phone FROM Account];
        // return remacc;
    }
    
    // create a wrapper class with @AuraEnabled Properties    
    public class AccountPagerWrapper {
        @AuraEnabled public Integer pageSize {get;set;}
        @AuraEnabled public Integer page {get;set;}
        @AuraEnabled public Integer total {get;set;}
        @AuraEnabled public List<Account> accounts {get;set;}
    }
    @AuraEnabled
    public static List<Account> searchAccount(String searchKeyWord) {
        String s = '%'+searchKeyWord+'%';
  List < Account > lstOfAccount = [select  Name, Phone from Account
                                   where Name LIKE: s.trim() ];
 
 system.debug(lstOfAccount);
  return lstOfAccount;
 }
    @AuraEnabled
    public static Id saveChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) {
        // check if fileId id ''(Always blank in first chunk), then call the saveTheFile method,
        //  which is save the check data and return the attachemnt Id after insert, 
        //  next time (in else) we are call the appentTOFile() method
        //   for update the attachment with reamins chunks   
        if (fileId == '') {
            fileId = saveTheFile(parentId, fileName, base64Data, contentType);
        } else {
            appendToFile(fileId, base64Data);
        }
        System.debug('###'+Id.valueOf(fileId));
        return Id.valueOf(fileId);
    }
    
    public static Id saveTheFile(Id parentId, String fileName, String base64Data, String contentType) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        Attachment oAttachment = new Attachment();
        oAttachment.parentId = parentId;
        
        oAttachment.Body = EncodingUtil.base64Decode(base64Data);
        oAttachment.Name = fileName;
        oAttachment.ContentType = contentType;
        
        insert oAttachment;
        
        return oAttachment.Id;
    }
    
    private static void appendToFile(Id fileId, String base64Data) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        Attachment a = [
            SELECT Id, Body
            FROM Attachment
            WHERE Id =: fileId
        ];
        
        String existingBody = EncodingUtil.base64Encode(a.Body);
        
        a.Body = EncodingUtil.base64Decode(existingBody + base64Data);
        
        update a;
    }
}