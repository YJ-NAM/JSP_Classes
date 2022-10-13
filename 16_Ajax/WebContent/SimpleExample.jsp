<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <button id="ajaxButton" type="button">Make a request</button>
        <script>
        
        (() => {
            let httpRequest;
            document.getElementById("#ajaxButton").addEventListener("click", makeRequest);

            function makeRequest() {
                httpRequest = new XMLHttpRequest();

                if(!httpRequest){
                    alert("Giving up :( Cannot creat an XMLHTTP instance");
                    return false;
                }
                httpRequest.onreadystatechange = alertContents;
                httpRequest.open("GET", "test.html");
                httpRequest.send();
            }.

            function alertContents() {
                if(httpRequest.readyState === XMLHttpRequest.DONE) {
                    if(httpRequest.status === 200) {
                        alert(httpRequest.responseText);
                    }else {
                        alert("There was a proble with the request.");
                    }

                }
            }
        })();
    </script>
</body>
</html>