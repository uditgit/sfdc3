global class TrailHeadHttpCalloutBatchScheduler implements Schedulable {
    
    global void execute(SchedulableContext sc){
        TrailHeadHttpCalloutBatch trailBatch = new TrailHeadHttpCalloutBatch();
        Database.executeBatch(trailBatch, 20);
    }

}