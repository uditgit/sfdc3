public class AnimalLocator {
    public static String getAnimalNameById(Integer Id){
        String animalName;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals/'+Id;
        System.debug(endpoint);
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode()==200){
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            System.debug(results);
            Map<String, Object> animalMap = (Map<String, Object>)results.get('animal');
            animalName = (String)animalMap.get('name');
            System.debug(animalName);
            System.debug(animalMap);
            //animalName = animals[0];
        }
        //System.debug('Animal Name- '+animalName);
        return animalName;
    }
}