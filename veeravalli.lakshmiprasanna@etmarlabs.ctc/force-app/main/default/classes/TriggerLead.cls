public class TriggerLead {
    Public static void Leadfield(list<Lead> leadvar) {
        for(Lead var : leadvar){
            if((var.Phone == null) || (var.Phone == '')) {
                var.Phone.addError('Enter Phone Number');                 
            } 
                 if((var.Title == null) || (var.Title == '')){
                var.addError('Enter Title');
              } 
         }
    } 
}