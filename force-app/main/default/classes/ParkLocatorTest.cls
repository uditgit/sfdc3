@isTest
public class ParkLocatorTest {
	@isTest
    static void testCallout(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> parks = ParkLocator.country('India');
        System.assertEquals('Park1', parks[0]);
        System.assertEquals('Park2', parks[1]);
    }
}