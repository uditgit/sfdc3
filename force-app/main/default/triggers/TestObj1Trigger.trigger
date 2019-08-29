trigger TestObj1Trigger on Test_Obj1__c (before insert) {
	/*List<Test_Obj1__c> objs = new List<Test_Obj1__c>();
    for(Test_Obj1__c obj : Trigger.New){
        Test_Obj1__c obj2 = new Test_Obj1__c(Test_Obj1Lookup__c=obj.Id, Name='MyObjs');
        objs.add(obj2);
    }
    insert objs;*/
    /*Account acc = new Account(Id='0017F00000iSqepQAC', description ='New Description'); //Doesnot throw DML Exception
    update acc;
    System.debug('MY Trigger Executed');*/
    /*for(Test_Obj1__c testObj : Trigger.New){//Throws DML Exception
        if(testObj.TextLabel1__c != Trigger.OldMap.get(testObj.Id).TextLabel1__c){
            testObj.trial__c = true;
            update testObj;
        }
    }*/
    /*List<Test_Obj1__c> lstTests = (List<Test_Obj1__c>)Trigger.New;//Throws DML Exception
    Test_Obj1__c testObj1 = lstTests[0];
    testObj1.trial__c = true;
    update testObj1;*/
    List<Test_Obj1__c> lstObjs = Trigger.New;
    for(Test_Obj1__c obj1 : lstObjs){
        System.debug('Rec Type-'+obj1.recordtype.developername);
    }
}