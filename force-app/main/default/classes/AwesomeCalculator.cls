public class AwesomeCalculator {
    //static AsyncCalculatorServices.doAddResponseFuture addService = new AsyncCalculatorServices.doAddResponseFuture();
    static AsyncParkService.byCountryResponseFuture responseFuture = new AsyncParkService.byCountryResponseFuture();
    @AuraEnabled
    public static String[] result {get;set;}
    
    public static Double add(Double x, Double y){
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        return calculator.doAdd(x, y);
    }
    
   /* @AuraEnabled
    public static Double addAsync(Double x, Double y){
        
        Integer TIMEOUT_INT_SECS = 60; 
        Continuation cont = new Continuation(TIMEOUT_INT_SECS);
        cont.continuationMethod = 'processResponse';
        AsyncCalculatorServices.AsyncCalculatorImplPort cal = new AsyncCalculatorServices.AsyncCalculatorImplPort();
        addService = cal.beginDoAdd(cont, x, y);
        return result;
    }
    
    public Object processResponse(){
        result = addService.getValue();
        return null;
    }*/
    
    
}