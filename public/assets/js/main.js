function copy_to_clipboard() {
    let copyText=document.getElementById("url_value").innerHTML;
    navigator.clipboard.writeText(copyText).then(function() {
        alert("短縮URLをコピーしました。");
    }, function() {
        alert("短縮URLをコピーできませんでした。");
    });
}
function send(){
    let value = document.getElementById("url").value;

    $.ajax({
        url: location.protocol+"//"+location.host+"/"+"send",
        type: "GET",
        data: {
            "url": value
        },
    }).done(function(data){
        let obj = JSON.parse(data);
        let element = document.getElementById("content_result");
        let result = document.getElementById("url_value");
        element.classList.remove("clear");
        result.innerHTML = location.protocol+"//"+location.host+"/"+obj.url_short;
    }).fail(function(){
        alert("通信に失敗しました。");
    });
}
function clear_result() {
    let element = document.getElementById("content_result");
    element.classList.add("clear");
}