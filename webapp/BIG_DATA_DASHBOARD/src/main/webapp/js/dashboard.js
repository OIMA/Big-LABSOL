//alert("jajaja");
//$(".nav-collapse").hide(1000;)
$(document).ready(function () {
//$('#iframe').contentWindow.location.reload(true);
});

$(".link").click(function () {
    var classList = $(this).attr('class').split(/\s+/);
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

function reloadFrame(address) {
    $("#iframe").attr("src", address);
//    $('#iframe').contentWindow.location.reload(true);
}