/**
 * @description The DFJ_ProcessDocFabDocument_Apex class is responsible for handling
 * document fabrication processes. It provides methods to interact with the document
 * fabricator settings and retrieve URLs for given records and object API names.
 */

public class DFJ_ProcessDocFabDocument_Apex {

    /**
     * @description The getUrl method is used to retrieve the URL for component
     * dFJ_Process_DocFab_Document.
     *
     * @param recordId The ID of the record for which the URL needs to be
     * retrieved.
     * @param objectApiName The API name of the object for which the URL needs to
     * be retrieved.
     * @return a Url for dFJ_Process_DocFab_Document component.
     */

    @AuraEnabled(Cacheable=true)
    public static String getUrl(String recordId, String objectApiName) {
        try {

            if (String.isNotBlank(recordId) && String.isNotBlank(objectApiName)) {
                String url;

                Doc_Fabricator_Setting__c docFabSetting = Doc_Fabricator_Setting__c.getOrgDefaults();
                if (String.isNotBlank(docFabSetting.URL__c)) {

                    Journal__c journalRecord ;

                    journalRecord = [
                            SELECT Id, Name, Journal_States__c, journal_Deadline__c, LastModifiedDate, CreatedDate, External_record_uuid__c, Type__c,
                                    Account__c, Lead__c
                            FROM Journal__c
                            WHERE
                                    Id = :recordId
                                    OR Account__c = :recordId
                                    OR Lead__c = :recordId
                            WITH SECURITY_ENFORCED
                            ORDER BY LastModifiedDate DESC NULLS LAST
                            LIMIT 1
                    ] ?? null;

                    if (journalRecord != null && journalRecord.External_record_uuid__c != null) {
                        url = docFabSetting.URL__c + 'public/record_templates/' + journalRecord.External_record_uuid__c;
                        return url;
                    }
                }
            }
            return null;
        } catch (Exception e) {
            DFJ_ErrorLogController.addErrorLogs('', 'Get URL', e.getMessage(), 'Error', 'DFJ_ProcessDocFabDocument_Apex.getUrl', '', String.valueOf(e.getLineNumber()));
            return null;
        }
    }

}