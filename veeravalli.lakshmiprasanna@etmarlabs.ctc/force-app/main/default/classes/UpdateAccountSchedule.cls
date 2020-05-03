global class UpdateAccountSchedule implements Schedulable {
    global void execute(SchedulableContext sc){
        batchaAccountupdate obj = new batchaAccountupdate();
        Database.executeBatch(obj,3);
    }
}