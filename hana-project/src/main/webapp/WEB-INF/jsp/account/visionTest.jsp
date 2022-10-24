<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Google Cloud Vision API with Spring code sample</title>
</head>
<body>

<div>
    <h1>Image Label Annotations</h1>
    <p>Returns labels classifying the content of the image:</p>
    <form action="/extractLabels">
        Web URL of image to analyze:
        <input type="text"
               name="imageUrl"
               value="https://www.google.com/logos/doodles/2018/childrens-day-2018-argentina-peru-5906663952351232-2x.png"/>
        <input type="submit"/>
    </form>
</div>

<div>
    <h1>Text Extraction</h1>
    <p>Read and extract the text from the image:</p>
    <form action="/extractText">
        Web URL of image to analyze:
        <input type="text"
               name="imageUrl"
               value="C:\Users\윤정빈\Downloads\license_yun.jpg"/>
        <input type="submit" />
    </form>
</div>

</body>
</html>