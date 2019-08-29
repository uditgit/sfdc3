public class NewCaseListController {
    public List<Case> getNewCases(){
        return [select Id, CaseNumber From Case Where Status='New'];
    }
}