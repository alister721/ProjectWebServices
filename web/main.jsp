<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sess = request.getSession();

    String name = (String) sess.getAttribute("name");
    Long idLong = (Long) sess.getAttribute("id");
    Integer id = idLong != null ? idLong.intValue() : null;

    String gender = (String) sess.getAttribute("gender");
    Float weight = (Float) sess.getAttribute("weight");
    Float height = (Float) sess.getAttribute("height");
    Integer age = (Integer) sess.getAttribute("age");
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Info Input</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h1 {
            color: #2c3e50;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
        }

        input[type="text"], input[type="number"], select{
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        
        select{
            width: 104% !important;
        }
        

        .btn {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Enter Your Information</h1>
    <form action="clientOne" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= name != null ? name : "" %>" required>

        <label for="id">ID:</label>
        <input type="number" name="id" value="<%= id != null ? id : "" %>" required>

        <label for="gender" class="selectGender">Gender:</label>
        <select name="gender" required>
            <option value="male" <%= "male".equalsIgnoreCase(gender) ? "selected" : "" %>>Male</option>
            <option value="female" <%= "female".equalsIgnoreCase(gender) ? "selected" : "" %>>Female</option>
        </select>

        <label for="weight">Weight (kg):</label>
        <input type="number" name="weight" step="0.1" value="<%= weight != null ? weight : "" %>" required>

        <label for="height">Height (cm):</label>
        <input type="number" name="height" step="0.1" value="<%= height != null ? height : "" %>" required>

        <label for="age">Age:</label>
        <input type="number" name="age" value="<%= age != null ? age : "" %>" required>

        <button type="submit" class="btn">Submit</button>
    </form>
</div>
</body>
</html>
