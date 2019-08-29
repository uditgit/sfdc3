@isTest
public class CaseManagerTest {
    static Id createTestRecord(){
        Case caseTest = new Case(Subject='Test Record',
                                Status='New',
                                Origin='Phone',
                                Priority='Medium');
        insert caseTest;
        return caseTest.Id;
    }
	@isTest
    static void testGetCaseById(){
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://uditsharma-dev-ed.lightning.force.com/services/apexrest/Cases/'+recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        Case thisCase = CaseManager.getCaseById();
        System.assert(thisCase!=null);
        System.assertEquals('Test Record', thisCase.Subject);
    }
    
    @isTest
    static void testCreatCase(){
        Id thisCaseId = CaseManager.createCase('Ferocious Chipmunk', 'New', 'Phone', 'Low');
        System.assert(thisCaseId!=null);
    }
    
    @isTest
    static void testDeleteCase(){
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://uditsharma-dev-ed.lightning.force.com/services/apexrest/Cases/'+recordId;
        request.httpMethod = 'DELETE';
        RestContext.request = request;
        CaseManager.deleteCase();
        List<Case> lstCase = [SELECT Id FROM Case WHERE Id =:recordId];
        System.assertEquals(lstCase.size(), 0);
    }
    
    @isTest
    static void testUpsertCase(){
        ID case1Id = CaseManager.upsertCase(
                'Ferocious chipmunk', 'New', 'Phone', 'Low', null);        
        System.assert(Case1Id != null);
        Case case1 = [SELECT Id,Subject FROM Case WHERE Id=:case1Id];
        System.assert(case1 != null);
        System.assertEquals(case1.Subject, 'Ferocious chipmunk');

        ID case2Id = CaseManager.upsertCase(
                'Ferocious chipmunk', 'Working', 'Phone', 'Low', case1Id);
        System.assertEquals(case1Id, case2Id);
        Case case2 = [SELECT Id,Status FROM Case WHERE Id=:case2Id];
        System.assert(case2 != null);
        System.assertEquals(case2.Status, 'Working');
    }
    
    @isTest
    static void testUpdateCaseFields(){
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://uditsharma-dev-ed.lightning.force.com/services/apexrest/Cases/'+recordId;
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf('{"status":"Working"}');
        RestContext.request = request;
        Id thisCase = CaseManager.updateCaseFields();
        System.assert(thisCase!=null);
        
    }
}