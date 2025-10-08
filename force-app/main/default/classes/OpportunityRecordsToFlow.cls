public class OpportunityRecordsToFlow {
    
    public class AccountInput {
        @InvocableVariable(required=true)
        public List<Account> acclist;
    }
    
    public class OpportunityIdOutput {
        @InvocableVariable
        public List<Id> oppIds;
    }
   
    
    @InvocableMethod(label='Get Opportunity for flow' description='opportunity')
    public static List<OpportunityIdOutput> getOpportunity(List<AccountInput> accs) {
        
        AccountInput accInp = accs[0];
        List<Account> listAc = accInp.acclist;
       // List<WorkPlan> listOfWorkPlanWithCompletedStep = new List<WorkPlan>();
        
       // List<Id> workPlanIds = new List<Id>();
        
        List<OpportunityIdOutput> oppOutputs = new List<OpportunityIdOutput>();
        
        
        
        List<Id> listIds = new List<Id>();
        OpportunityIdOutput opOP = new OpportunityIdOutput();
        for(Opportunity op: [SELECT Id From Opportunity Where AccountId IN:listAc]) {
            system.debug('ws :'+op);
            listIds.add(op.Id);
        }
         opOP.oppIds = listIds;
         oppOutputs.add(opOP);
        
        System.debug(oppOutputs);
        return oppOutputs;
       
    }
}