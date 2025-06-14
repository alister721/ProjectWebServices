<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.client.HealthModule" %>
<%@ page import="com.client.HealthModule_Service" %>

<%
    HttpSession sess = request.getSession();

    // Load session data
    String gender = (String) sess.getAttribute("gender");
    Long idLong = (Long) sess.getAttribute("id");
    Float weight = (Float) sess.getAttribute("weight");
    Float height = (Float) sess.getAttribute("height");
    Integer age = (Integer) sess.getAttribute("age");
    String name = (String) sess.getAttribute("name");

    // Form values
    String weightParam = request.getParameter("weight");
    String heightParam = request.getParameter("height");
    String ageParam = request.getParameter("age");

    String bmiResult = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            weight = Float.parseFloat(weightParam);
            height = Float.parseFloat(heightParam);
            age = Integer.parseInt(ageParam);

            // Update session values
            sess.setAttribute("weight", weight);
            sess.setAttribute("height", height);
            sess.setAttribute("age", age);

            // Call web service
            HealthModule_Service service = new HealthModule_Service();
            HealthModule port = service.getHealthModulePort();
            bmiResult = port.calculateBMI(weight, height, age, gender);

        } catch (Exception e) {
            bmiResult = "<bmi>Invalid input. Please check your numbers.</bmi>";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BMI Calculator</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f8ff;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }

        form {
            display: grid;
            gap: 15px;
        }

        label {
            font-weight: bold;
        }

        input, select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn {
            background: #3498db;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn:hover {
            background: #2980b9;
        }

        .result {
            margin-top: 25px;
            background: #e8f8f5;
            padding: 15px;
            border-left: 5px solid #3498db;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>BMI Calculator</h1>

    <form method="post">

        <label for="weight">Weight (kg):</label>
        <input type="number" step="0.01" name="weight" id="weight" value="<%= weight != null ? weight : "" %>" required>

        <label for="height">Height (cm):</label>
        <input type="number" step="0.01" name="height" id="height" value="<%= height != null ? height : "" %>" required>

        <label for="age">Age:</label>
        <input type="number" name="age" id="age" value="<%= age != null ? age : "" %>" required>

        <button type="submit" class="btn">Calculate BMI</button>
    </form>

    <% if (bmiResult != null && bmiResult.contains("<bmi>")) {
        String bmiValue = bmiResult.replaceAll(".*<bmi>(.*?)</bmi>.*", "$1");
        String category = bmiResult.replaceAll(".*<category>(.*?)</category>.*", "$1");
        String eatSuggest = bmiResult.replaceAll(".*<eatSuggest>(.*?)</eatSuggest>.*", "$1");
        String activitySuggest = bmiResult.replaceAll(".*<activitySuggest>(.*?)</activitySuggest>.*", "$1");
        
        sess.setAttribute("bmi", Float.parseFloat(bmiValue));
    %>
    <div class="result">
        <h2>Your Information</h2>
        <p><strong>Name:</strong> <%= name != null ? name : "Not set" %></p>
        <p><strong>ID:</strong> <%= idLong != null ? idLong : "Not set" %></p>
        <p><strong>Gender:</strong> <%= gender %></p>
        <p><strong>Weight:</strong> <%= weight %> kg</p>
        <p><strong>Height:</strong> <%= height %> cm</p>
        <p><strong>Age:</strong> <%= age %> years</p>

        <hr style="margin: 20px 0;">

        <h2>BMI Result</h2>
        <p><strong><%= bmiValue %></strong> - <%= category %></p>
        <p>🍽️ Eating Suggestions: <strong><%= eatSuggest %></strong></p>
        <p>🏃 Activity Suggestions: <strong><%= activitySuggest %></strong></p>
    </div>
    <% } %>
</div>
</body>
</html>
