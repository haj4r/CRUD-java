<%-- 
    Document   : insert
    Author     : hajarismail
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource"
                   driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/studentdb"
                   user="root"
                   password=""/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Student Data</title>
        <style>
            .form-box {
                width: 600px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin: 50px auto;
                font-family: Arial, sans-serif;
            }
            .form-box h1 {
                text-align: center;
            }
            .form-box label {
                display: block;
                margin: 10px 0 5px;
            }
            .form-box input[type="text"], .form-box select {
                width: 100%;
                padding: 8px;
                margin: 5px 0 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            .form-box input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                border: none;
                border-radius: 5px;
                color: white;
                font-size: 16px;
                cursor: pointer;
            }
            .form-box input[type="submit"]:hover {
                background-color: #45a049;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                font-family: Arial, sans-serif;
                box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f4f4f4;
                font-weight: bold;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
        </style>
    </head>
    <body>
        <div class="form-box">
            <h1>Update Student Data</h1>
            <c:set var="id" value="${param.studentId}"/>
            <c:set var="name" value="${param.studentName}"/>
            <c:set var="branch" value="${param.branch}"/> 

            <c:if test="${(id != null) && (name != null) && (branch != null)}">
                <sql:update var="res" dataSource="${myDatasource}">
                    UPDATE STUDENT SET NAME = ?, BRANCH = ? WHERE ID = ?
                    <sql:param value="${name}"/>
                    <sql:param value="${branch}"/>
                    <sql:param value="${id}"/>
                </sql:update>
            </c:if>

            <form action="" method="post">
                <label for="studentId">ID:</label>
                <select id="studentId" name="studentId">
                    <sql:query var="idResult" dataSource="${myDatasource}">
                        SELECT ID FROM STUDENT
                    </sql:query>
                    <c:forEach var="row" items="${idResult.rows}">
                        <option value="${row.ID}">${row.ID}</option>
                    </c:forEach>
                </select>

                <label for="studentName">Name:</label>
                <input type="text" id="studentName" name="studentName">

                <label for="branch">Branch:</label>
                <input type="text" id="branch" name="branch">

                <input type="submit" value="Submit">
            </form>

            <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM STUDENT
            </sql:query>

            <table>
                <!-- column headers -->
                <tr>
                    <c:forEach var="columnName" items="${result.columnNames}">
                        <th><c:out value="${columnName}"/></th>
                    </c:forEach>
                </tr>
                <!-- column data -->
                <c:forEach var="row" items="${result.rowsByIndex}">
                    <tr>
                        <c:forEach var="column" items="${row}">
                            <td><c:out value="${column}"/></td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
