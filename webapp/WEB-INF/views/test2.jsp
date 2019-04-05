<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

        
    <script>    
        //$(document.ready(function(){ .. });
        $(function(){
            $("#dialog").dialog();
        });
    </script>

</head>
<body>

<div id="dialog" title="공지사항">
    java 초급<br>
    java 중급<br>
    java 고급<br>
    강좌가 새롭게 업로드되었습니다.
</div>


</body>
</html>