global class TrailHeadHttpCalloutMonthlySch implements Schedulable{
    
    global void execute(SchedulableContext sc){
        TrailHeadHttpCalloutBatch trailBatch = new TrailHeadHttpCalloutBatch();
        Database.executeBatch(trailBatch, 20);
    }

}