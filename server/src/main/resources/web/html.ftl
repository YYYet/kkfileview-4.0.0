<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
<#--    response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", -10);-->
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0">
    <meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Expires" CONTENT="0">
    <#include "*/commonHeader.ftl">
</head>
<body>
    <iframe src="${pdfUrl}" width="100%" frameborder="0"></iframe>
</body>
<script type="text/javascript">
    document.getElementsByTagName('iframe')[0].height = document.documentElement.clientHeight-10;
    /**
     * 页面变化调整高度
     */
    window.onresize = function(){
        var fm = document.getElementsByTagName("iframe")[0];
        fm.height = window.document.documentElement.clientHeight-10;
    }

    // window.addEventListener('message',function(event){
    //     event.source.postMessage('执行完毕', '*')
    // }, false);

    document.getElementsByTagName("iframe")[0].contentWindow.addEventListener("scroll", function () {
        console.log("html页面滚动")
        window.parent.postMessage({scroll:true,timestamp:Date.now()}, "*");
    })


    /*初始化水印*/
    window.onload = function() {
      initWaterMark();


    }
</script>
</html>