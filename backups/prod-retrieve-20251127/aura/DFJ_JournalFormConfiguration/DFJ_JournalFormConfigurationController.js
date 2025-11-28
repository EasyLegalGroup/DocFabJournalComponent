/**
 * Created by shubh on 21-08-2019.
 */
({

    doInit : function (c,e,h) {
        h.doInit_Helper(c,e,h);
    },

    getProductConfiguration  :function (c,e,h) {
        h.getProductConfiguration_Helper(c,e,h);
    },

    getAllSections : function (c,e,h) {
        h.getAllSections_Helper(c,e,h);
    },

    handleShowActiveSectionName: function (cmp, event, helper) {
        alert(cmp.find("accordion").get('v.activeSectionName'));
    },
    handleToggleSectionD: function (cmp) {
        cmp.set('v.isDVisible', !cmp.get('v.isDVisible'));
    },
    AddSectionToList : function (c,e,h){
        if (c.get("v.selectedSection") !== null && c.get("v.selectedSection") !== undefined && c.get("v.selectedSection") !== ''){
            h.AddSectionToList_helper(c,e,h);
        }
    },

    addFieldToList : function (c,e,h){
        h.addFieldToList_helper(c,e,h);
    },

    cancelButton : function (c,e,h){
        h.cancelButton_helper(c,e,h);
    },
    saveData : function (c,e,h){
        h.saveData_helper(c,e,h);
    },

    deleteSection : function (c,e,h){
        h.deleteSection_helper(c,e,h);
    },

    deleteField : function (c,e,h){
        h.deleteField_helper(c,e,h);
    },

})