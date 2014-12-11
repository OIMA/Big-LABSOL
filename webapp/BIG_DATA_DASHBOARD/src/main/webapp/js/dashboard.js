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