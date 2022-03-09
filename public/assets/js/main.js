function copy_to_clipboard() {
    let copyText=document.getElementById("url").innerHTML;
    navigator.clipboard.writeText(copyText).then(function() {
        alert("短縮URLをコピーしました。");
    }, function(err) {
        alert("短縮URLをコピーできませんでした。");
    });
}