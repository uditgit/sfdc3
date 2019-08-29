@isTest
public class AnimalsCalloutsTest {
    @isTest
    static void testGetCallOut(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse response = AnimalsCallouts.makeGetCallout();
        System.assertNotEquals(null, response, 'The callout returned a null response');
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('application/json;charset=UTF-8', response.getHeader('Content-Type'));
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        List<Object> animals = (List<Object>)results.get('animals');
        System.assertEquals(3, animals.size());
    }
    
    @isTest
    static void testPostCallout(){
        Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock());
        HttpResponse response = AnimalsCallouts.makePostCallout();
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, response.getStatusCode());
    }
}