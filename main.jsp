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
    <meta charset="UTF-8">
    <title>User Info Input</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 50px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 600px;
            animation: fadeIn 1s ease-in-out;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: 600;
            color: #34495e;
        }

        input[type="text"],
        input[type="number"],
        select {
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background: #fdfdfd;
            width: 100%;
            box-sizing: border-box;
        }

        select {
            appearance: none;
        }

        .btn {
            margin-top: 20px;
            padding: 14px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
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

        <label for="gender">Gender:</label>
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
