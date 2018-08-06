Date dt = date.newinstance(2017, 9, 20);

// //MikeroverseInitiator m = new MikeroverseInitiator();
MikeroverseInitiator m = new MikeroverseInitiator(dt);
//m.execute(null);

ChargentHousekeepingBatchable chp = new ChargentHousekeepingBatchable(dt);
Database.executeBatch(chp);

// ProcessingBatch__c pb = [select Id, RetryCount__c, DateScheduled__c, StatusProcessingBatch__c, ProcessingCountopportunities__c
//                        , SystemProcessingControls__c, ProcessingJobName__c, ProcessingJobId__c, ProcessingJobStart__c, Dateprocessing__c
//                        from ProcessingBatch__c
//                        where Id = 'a3LO0000000B471MAC'
//                  ];




// //PBHousekeepingBatchable b = new PBHousekeepingBatchable(pb);
// //Database.executeBatch(b,1);

// List<Opportunity> oList = [select Id from Opportunity where ProcessingBatch__c = 'a3LO0000000B46NMAS'];
// youDoOppy.manageOppy(oList);


// List<ProcessingBatch__c> pb = [select Id, RetryCount__c, DateScheduled__c, StatusProcessingBatch__c, ProcessingCountopportunities__c
//                                , SystemProcessingControls__c, ProcessingJobName__c, ProcessingJobId__c, ProcessingJobStart__c, Dateprocessing__c
//                                from ProcessingBatch__c
//                                where Id = 'a3LO0000000B46NMAS'
// ];

// iHelpProcessingBatch.DoPBSet(pb);
// iHelpProcessingBatch.checkReleaseRD();     // release completed Recurring Donations
// // iHelpProcessingBatch.pbStats();            //redoes the maths on the Processing Batch
// // iHelpProcessingBatch.checkPbStatus();      // update status of processing batch
//  iHelpProcessingBatch.myUpdates();          //updates the 'my' record collection (outside of the cartels control)
// // iHelpProcessingBatch.checkRetries();

// janitor.thisIsTheEnd();



