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
    box-shadow: 0 8px 20px rgba(0,0,0,0.2);
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

input[type="number"] {
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
    background: #2980b9;
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

    </style>
</head>
<body>
<div class="container">
        <a href="menu.jsp" class="back-btn">← Back to Menu</a>

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