
$(function () {

    // turn all checkboxs into iCheck boxes
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%'
    });
});

// when a new language is selected, redirect to the language's page
function languageSelected() {
    var redirectUrl = $('#language-picker-dropdown').val();
    window.location.href = redirectUrl;
}

function getClientId() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars["client_id"]
}

