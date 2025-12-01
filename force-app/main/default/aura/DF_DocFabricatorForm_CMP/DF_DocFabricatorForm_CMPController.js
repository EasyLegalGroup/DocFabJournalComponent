({
    doInit: function(c, e, h) {
        try {
            h.doInit_helper(c, e, h);
        } catch (err) {
            console.error(err);
        }
    },
    closeModel: function(c, e, h) {
        try {
            h.closeModel_helper(c, e, h);
        } catch (err) {
            console.error(err);
        }
    },
})