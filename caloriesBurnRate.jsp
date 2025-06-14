<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.client.HealthModule" %>
<%@ page import="com.client.HealthModule_Service" %>
<%
    HttpSession sess = request.getSession();
    String gender = (String) sess.getAttribute("gender");
    Long idLong = (Long) sess.getAttribute("id");
    Float weight = (Float) sess.getAttribute("weight");
    Float height = (Float) sess.getAttribute("height");
    Integer age = (Integer) sess.getAttribute("age");
    String name = (String) sess.getAttribute("name");

    Double met = (Double) sess.getAttribute("met");
    Double duration = (Double) sess.getAttribute("duration");

    String result = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        duration = Double.parseDouble(request.getParameter("duration"));
        met = Double.parseDouble(request.getParameter("met"));
        weight = Float.parseFloat(request.getParameter("weight"));
        height = Float.parseFloat(request.getParameter("height"));

        // Store updated values in session
        sess.setAttribute("weight", weight);
        sess.setAttribute("height", height);
        sess.setAttribute("met", met);
        sess.setAttribute("duration", duration);

        HealthModule_Service service = new HealthModule_Service();
        HealthModule port = service.getHealthModulePort();
        result = port.caloriesBurnRate(weight, height, duration, met);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Calories Burn Rate Calculator</title>
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
        max-width: 750px;
        animation: fadeIn 1s ease-in-out;
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
    }

    .layout {
        display: flex;
        flex-direction: column;
        gap: 18px;
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

    .reference {
        margin-top: 40px;
        background-color: #ffffff;
        border: 1px solid #ccc;
        border-radius: 10px;
        padding: 20px;
        font-size: 14px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }

    .reference h3 {
        margin-top: 0;
        color: #2c3e50;
        font-size: 18px;
    }

    .reference table {
        width: 100%;
        border-collapse: collapse;
    }

    .reference th,
    .reference td {
        border-bottom: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    a[title]:hover {
        color: #007BFF;
        cursor: pointer;
    }

    #metTable {
        scroll-margin-top: 100px;
    }

    html {
        scroll-behavior: smooth;
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

    <h1>Calories Burn Rate Calculator</h1>

    <div class="layout">
        <form method="post">
            <label for="weight">Weight (kg):</label>
            <input type="number" step="0.1" name="weight" id="weight" value="<%= weight != null ? weight : "" %>" required>

            <label for="height">Height (cm):</label>
            <input type="number" step="0.1" name="height" id="height" value="<%= height != null ? height : "" %>" required>

            <label for="duration">Activity Duration (minutes):</label>
            <input type="number" name="duration" step="0.1" value="<%= duration != null ? duration : "" %>" required>

            <label for="met">
                MET Value:
                <a href="#metTable" title="View MET reference table" style="text-decoration:none; margin-left:5px;">❓</a>
            </label>
            <input type="number" name="met" step="0.1" value="<%= met != null ? met : "" %>" required>

            <button class="btn">Calculate</button>
        </form>

        <% if (result != null) { %>
            <div class="result">
                <h2>Your Information</h2>
                <p><strong>Name:</strong> <%= name != null ? name : "Not set" %></p>
                <p><strong>ID:</strong> <%= idLong != null ? idLong : "Not set" %></p>
                <p><strong>Gender:</strong> <%= gender %></p>
                <p><strong>Weight:</strong> <%= weight %> kg</p>
                <p><strong>Height:</strong> <%= height %> cm</p>
                <p><strong>Age:</strong> <%= age != null ? age : "Not set" %> years</p>

                <hr style="margin: 20px 0;">
                <h2>Calories Burned</h2>
                <p><%= result %></p>
            </div>
        <% } %>
    </div>

    <!-- MET reference table (outside main layout for visibility) -->
    <div class="reference" id="metTable">
        <h3>Activity MET Values Reference</h3>
        <table>
            <tr><th>Activity</th><th>MET</th></tr>
            <tr><td>Sitting quietly</td><td>1.0</td></tr>
            <tr><td>Walking (slow)</td><td>2.5</td></tr>
            <tr><td>Walking (brisk)</td><td>3.8</td></tr>
            <tr><td>Weight lifting</td><td>3.0</td></tr>
            <tr><td>Dancing</td><td>5.0</td></tr>
            <tr><td>Swimming</td><td>5.8</td></tr>
            <tr><td>Jogging</td><td>6.0</td></tr>
            <tr><td>Cycling (moderate)</td><td>7.5</td></tr>
            <tr><td>Running (6 mph)</td><td>9.8</td></tr>
            <tr><td>Jumping rope</td><td>12.0</td></tr>
        </table>
    </div>
</div>
</body>
</html>
