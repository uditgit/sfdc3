@isTest
private class TestVerifyDate {
	@isTest
    static void date2islessthandate1(){
        Date newDate = VerifyDate.CheckDates(Date.newInstance(2018, 6, 9), Date.newInstance(2017, 6, 9));
        String dateCheck = newDate.format();
        System.assertEquals('6/30/2018', dateCheck);
    }
    @isTest
    static void date2ismorethan30daysoddate1(){
        Date newDate = VerifyDate.CheckDates(Date.newInstance(2018, 6, 9), Date.newInstance(2019, 6, 9));
        String dateCheck = newDate.format();
        System.assertEquals('6/30/2018', dateCheck);
    }
    @isTest
    static void date2isWithin30daysofdate1(){
        Date newDate = VerifyDate.CheckDates(Date.newInstance(2018, 6, 9), Date.newInstance(2018, 6, 20));
        String dateCheck = newDate.format();
        System.assertEquals('6/20/2018', dateCheck);
    }
}