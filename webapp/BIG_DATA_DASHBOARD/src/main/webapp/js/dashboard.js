//alert("jajaja");
//$(".nav-collapse").hide(1000;)
$(document).ready(function () {
//$('#iframe').contentWindow.location.reload(true);
});

$(".link").click(function(){
    var url = $(this).attr('url');
    reloadFrame(url);
});

function reloadFrame(address) {
    $("#iframe").attr("src", address);
//    $('#iframe').contentWindow.location.reload(true);
}