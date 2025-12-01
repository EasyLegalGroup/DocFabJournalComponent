({
    doInit_helper: function(c, e, h) {
        try {
            // doinit helper
            h.showSpinner_Helper(c, e);
        } catch (err) {
            h.hideSpinner_Helper(c, e);
            console.error(err);
        }
    },

    closeModel_helper: function(c, e, h) {
        try {
            let ismodelclosed = c.get("v.openDocFabForm");
            if (ismodelclosed) {
                c.set("v.openDocFabForm", false);
            }
        } catch (err) {
            console.error(err);
        }
    },

    showSpinner_Helper: function(c, e) {
        c.set("v.isSpinnerOpen", true);
        window.setTimeout(
            $A.getCallback(function() {
                c.set("v.isSpinnerOpen", false);
            }), 4500
        );
    },
    hideSpinner_Helper: function(c, e) {
        c.set("v.isSpinnerOpen", false);
    },
})