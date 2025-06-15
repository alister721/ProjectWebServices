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
    margin: 0;
    padding: 60px 20px;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(to right, #a1c4fd, #c2e9fb);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    box-sizing: border-box;
}

.container {
    background: rgba(255, 255, 255, 0.95);
    padding: 50px 40px;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    width: 100%;
    max-width: 650px;
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

input, select {
    padding: 12px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background: #fdfdfd;
    box-sizing: border-box;
}

.btn {
    margin-top: 10px;
    background: #3498db;
    color: white;
    padding: 14px;
    font-size: 16px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #2980b9;
}

.result {
    margin-top: 30px;
    padding: 25px;
    background-color: #f1fbff;
    border-left: 6px solid #3498db;
    border-radius: 10px;
    animation: fadeIn 0.8s ease-in-out;
}

.result h2 {
    color: #2d3436;
    margin-bottom: 15px;
}

.result p {
    margin: 8px 0;
    color: #333;
    line-height: 1.5;
}

hr {
    border: 0;
    height: 1px;
    background: #ddd;
    margin: 20px 0;
}

.back-btn {
    display: inline-block;
    margin-bottom: 20px;
    color: #3498db;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.2s ease;
}

.back-btn:hover {
    color: #21618c;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

    </style>
</head>
<body>
<div class="container">
    <a href="menu.jsp" class="back-btn">← Back to Menu</a>

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