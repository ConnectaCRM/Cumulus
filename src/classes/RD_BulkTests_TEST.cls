/*
    Copyright (c) 2009, Salesforce.com Foundation
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
    
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Salesforce.com Foundation nor the names of
      its contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN 
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
    POSSIBILITY OF SUCH DAMAGE.
*/
@isTest
public class RD_BulkTests_TEST {

    static testMethod void bulkInsertOpportunities()
    {
        Integer contactCount = 20;
        Integer recurringDonationCount = 20;
        Integer opportunityCount = 20;
        
        List<Contact> contacts = new List<Contact>();
        List<npe03__Recurring_Donation__c> recurringDonations = new List<npe03__Recurring_Donation__c>();
        
        Account a = new Account();
        a.Name = 'test Individual';
        insert a;
        
        for(Integer i=0;i<contactCount;i++){
            Contact c = new Contact();
            c.FirstName = 'test';
            c.LastName = 'contact';
            c.AccountId = a.Id;
            contacts.add(c);
        }
        insert contacts;
        
        for(Integer i=0;i<recurringDonationCount;i++){
            npe03__Recurring_Donation__c r1 = new npe03__Recurring_Donation__c();
            r1.Name = 'test';
            r1.npe03__Installments__c = opportunityCount;
            r1.npe03__Contact__c = contacts[i].Id;
            r1.npe03__Amount__c = 100;
            r1.npe03__Installment_Period__c = 'Yearly';
            r1.npe03__Date_Established__c = System.today();
            r1.npe03__Schedule_Type__c = 'Multiply By';
            recurringDonations.add(r1);
        }
        test.startTest();
        insert recurringDonations;
        test.stopTest();
    }
}