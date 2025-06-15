<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
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
    Float bmi = (Float) sess.getAttribute("bmi");


    String genderParam = request.getParameter("gender");
    String ageParam = request.getParameter("age");
    String bmiParam = request.getParameter("bmi");

    String result = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            gender = genderParam;
            age = Integer.parseInt(ageParam);
            bmi = Float.parseFloat(bmiParam);

            // Update session
            sess.setAttribute("gender", gender);
            sess.setAttribute("age", age);

            HealthModule_Service service = new HealthModule_Service();
            HealthModule port = service.getHealthModulePort();
            result = port.calculateBodyFat(gender, age, bmi);
        } catch (Exception e) {
            result = "<bodyFat>Invalid input</bodyFat>";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Body Fat Calculator</title>
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

.bmi-helper {
    margin-left: 8px;
    text-decoration: none;
    font-size: 14px;
    color: #3498db;
}

.bmi-helper:hover {
    text-decoration: underline;
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

    <h1>Body Fat Percentage</h1>

    <form method="post">
        <label for="gender">Gender:</label>
        <select name="gender" id="gender" required>
            <option value="male" <%= "male".equalsIgnoreCase(gender) ? "selected" : "" %>>Male</option>
            <option value="female" <%= "female".equalsIgnoreCase(gender) ? "selected" : "" %>>Female</option>
        </select>

        <label for="age">Age:</label>
        <input type="number" name="age" id="age" value="<%= age != null ? age : "" %>" required>

        <label for="bmi">BMI: 
            <% if (bmi == null) { %>
                <a href="bmi.jsp" class="bmi-helper" title="Go to BMI Calculator">-> Calculate my BMI</a>
            <% } %>
        </label>
        <input type="number" step="0.01" name="bmi" id="bmi" value="<%= bmi != null ? bmi : "" %>" required>

        <button type="submit" class="btn">Calculate Body Fat</button>
    </form>

    <div class="result">
        <h2>Your Information</h2>
        <p><strong>Name:</strong> <%= name != null ? name : "Not set" %></p>
        <p><strong>ID:</strong> <%= idLong != null ? idLong : "Not set" %></p>
        <p><strong>Gender:</strong> <%= gender %></p>
        <p><strong>Weight:</strong> <%= weight %> kg</p>
        <p><strong>Height:</strong> <%= height %> cm</p>
        <p><strong>Age:</strong> <%= age %></p>
        <p><strong>BMI:</strong> <%= bmi != null ? String.format("%.2f", bmi) : "N/A" %></p>
        
        <hr style="margin: 20px 0;">

    <% if (result != null && result.contains("<bodyFat>")) {
        String bodyFatValue = result.replaceAll(".*<bodyFat>(.*?)</bodyFat>.*", "$1");
        String category = result.replaceAll(".*<category>(.*?)</category>.*", "$1");
        String tip = result.replaceAll(".*<tip>(.*?)</tip>.*", "$1");
    %>

        <h2>Your Body Fat Analysis</h2>
        <p><strong>Body Fat %:</strong> <%= bodyFatValue %> %</p>
        <p><strong>Category:</strong> <%= category %></p>
        <p>💡 <strong>Health Tip:</strong> <%= tip %></p>
    </div>

    <% } %>
</div>
</body>
</html>