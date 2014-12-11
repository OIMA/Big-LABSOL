//alert("jajaja");
//$(".nav-collapse").hide(1000;)
$(document).ready(function () {
//$('#iframe').contentWindow.location.reload(true);
});

$(".link").click(function () {
    var classes = $(this).attr('class');
    var classList = classes.split(/\s+/);
    $.each(classList, function (i, v) {
        console.log(v);
        if (v === 'ambari') {
            $("#iframe").css("margin-top", "-123");
        } else {
            $("#iframe").css("margin-top", "-43");
        }
    });
    var url = $(this).attr('url');
    reloadFrame(url);
});

$("a").click(function () {
    $("a").removeClass("active");
    $(this).addClass("active");
//    alert($(this).attr("class"));
}
);

function reloadFrame(address) {
    $("#iframe").attr("src", address);
//    $('#iframe').contentWindow.location.reload(true);
}

function checkIframeLoaded() {
    // Get a handle to the iframe element
//     iframe = document.getElementById('i_frame');
    var iframe = $('iframe');
    var iframeDoc = iframe.contentDocument || iframe.contentWindow.document;

    // Check if loading is complete
    if (  iframeDoc.readyState  == 'complete' ) {

        //iframe.contentWindow.alert("Hello");

        iframe.contentWindow.onload = function(){
            alert("I am loaded");
        };

        // The loading is complete, call the function we want executed once the iframe is loaded
        afterLoading();
        return;
    } 

    // If we are here, it is not loaded. Set things up so we check   the status again in 100 milliseconds
    window.setTimeout('checkIframeLoaded();', 100);
}

function afterLoading(){
    alert("I am here");
}