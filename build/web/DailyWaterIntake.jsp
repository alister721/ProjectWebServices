<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.client.HealthModule" %>
<%@ page import="com.client.HealthModule_Service" %>

<%
    HttpSession sess = request.getSession();

    // Load session attributes
    String gender = (String) sess.getAttribute("gender");
    Long idLong = (Long) sess.getAttribute("id");
    Float weight = (Float) sess.getAttribute("weight");
    Float height = (Float) sess.getAttribute("height");
    Integer age = (Integer) sess.getAttribute("age");
    String name = (String) sess.getAttribute("name");
    String activityLevel = (String) sess.getAttribute("activity");
    String climate = (String) sess.getAttribute("climate");

    String result = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            weight = Float.parseFloat(request.getParameter("weight"));
            height = Float.parseFloat(request.getParameter("height"));
            activityLevel = request.getParameter("activity");
            climate = request.getParameter("climate");

            // Store values in session
            sess.setAttribute("weight", weight);
            sess.setAttribute("height", height);
            sess.setAttribute("activity", activityLevel);
            sess.setAttribute("climate", climate);

            // Call web service
            HealthModule_Service service = new HealthModule_Service();
            HealthModule port = service.getHealthModulePort();
            result = port.dailyWaterIntakeCalculator(weight, height, activityLevel, climate);
        } catch (Exception e) {
            result = "Invalid input. Please ensure all fields are correctly filled.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Daily Water Intake</title>
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

        .info, .result {
            margin-top: 25px;
            background: #e8f8f5;
            padding: 15px;
            border-left: 5px solid #3498db;
            border-radius: 6px;
        }

        .info p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Daily Water Intake</h1>

    <form method="post">
        <label for="weight">Weight (kg):</label>
        <input type="number" step="0.01" name="weight" id="weight" required value="<%= weight != null ? weight : "" %>">

        <label for="height">Height (cm):</label>
        <input type="number" step="0.01" name="height" id="height" required value="<%= height != null ? height : "" %>">

        <label for="activity">Activity Level:</label>
        <select name="activity" required>
            <option value="sedentary" <%= "sedentary".equals(activityLevel) ? "selected" : "" %>>Sedentary</option>
            <option value="light" <%= "light".equals(activityLevel) ? "selected" : "" %>>Light</option>
            <option value="moderate" <%= "moderate".equals(activityLevel) ? "selected" : "" %>>Moderate</option>
            <option value="high" <%= "high".equals(activityLevel) ? "selected" : "" %>>High</option>
            <option value="extreme" <%= "extreme".equals(activityLevel) ? "selected" : "" %>>Extreme</option>
        </select>

        <label for="climate">Climate:</label>
        <select name="climate" required>
            <option value="cold" <%= "cold".equals(climate) ? "selected" : "" %>>Cold</option>
            <option value="temperate" <%= "temperate".equals(climate) ? "selected" : "" %>>Temperate</option>
            <option value="tropical" <%= "tropical".equals(climate) ? "selected" : "" %>>Tropical</option>
        </select>

        <button class="btn" type="submit">Calculate</button>
    </form>

    <div class="result">
        <h2>Your Information</h2>
        <p><strong>Name:</strong> <%= name != null ? name : "Not set" %></p>
        <p><strong>ID:</strong> <%= idLong != null ? idLong : "Not set" %></p>
        <p><strong>Gender:</strong> <%= gender %></p>
        <p><strong>Weight:</strong> <%= weight %> kg</p>
        <p><strong>Height:</strong> <%= height %> cm</p>
        <p><strong>Age:</strong> <%= age %></p>
        
    <hr style="margin: 20px 0;">
    <% if (result != null) { %>
            <h2>Required Daily Water Intake</h2>
            <p><%= result %></p>
        </div>
    <% } %>
</div>
</body>
</html>
