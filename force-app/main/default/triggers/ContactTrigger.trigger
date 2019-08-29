trigger ContactTrigger on Contact (after insert) {
	Integer recordCount = Trigger.New.size();
    //EmailManager.sendEmail('udit.aec@gmail.com', 'Trigger Tuts', recordCount + ' contact(s) inserted successfully');
}