public class StringArrayTest {
    public static List<String> generateStringArray(integer n){
        List<String> testList =  new List<String>();
        String test;
        for(integer i=0;i<n;i++){
            test = 'Test ' + i;
            testList.add(test);
            test = '';
        }
        return testList;
    }

}