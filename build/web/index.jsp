<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students Directory</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .directory {
            text-align: center;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            margin-bottom: 30px;
            font-size: 2em;
            color: #333;
        }
        .link {
            display: block;
            margin-bottom: 20px;
            text-decoration: none;
            color: #333;
            padding: 10px 20px;
            background-color: #f0f0f0;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .link:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="directory">
        <h1>Students Directory</h1>
        <a href="insert.jsp" class="link">Add New Student</a>
        <a href="update.jsp" class="link">Update Student Data</a>
        <a href="delete.jsp" class="link">Delete Student Data</a>
    </div>
</body>
</html>
