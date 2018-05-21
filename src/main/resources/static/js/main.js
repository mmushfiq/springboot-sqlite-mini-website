//Jquery function
(function ($) {
    
    setFbPage();

})(jQuery);


function setFbPage() {
    var url = window.location.href;
    var n = url.indexOf('031');
    if (n !== -1) {
        $("#fb-page-az").css("display", "block");
        $("#fb-page-en").css("display", "none");
    } else {
        $("#fb-page-az").css("display", "none");
        $("#fb-page-en").css("display", "block");
    }
}