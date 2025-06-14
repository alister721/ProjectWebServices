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
    
    String genderParam = request.getParameter("gender");
    String weightParam = request.getParameter("weight");
    String heightParam = request.getParameter("height");
    String ageParam = request.getParameter("age");
    

    String result = null;

    if (genderParam != null && weightParam != null && heightParam != null && ageParam != null) {
        // Update from form input
        gender = genderParam;
        weight = Float.parseFloat(weightParam);
        height = Float.parseFloat(heightParam);
        age = Integer.parseInt(ageParam);

        // Save to session
        sess.setAttribute("gender", gender);
        sess.setAttribute("weight", weight);
        sess.setAttribute("height", height);
        sess.setAttribute("age", age);

        // Call web service
        HealthModule_Service service = new HealthModule_Service();
        HealthModule port = service.getHealthModulePort();
        result = port.bmrCalculator(age, gender, height, weight);
    } else if (weight != null && height != null && age != null && gender != null) {
        // Call web service with existing session values
        HealthModule_Service service = new HealthModule_Service();
        HealthModule port = service.getHealthModulePort();
        result = port.bmrCalculator(age, gender, height, weight);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>BMR Calculator</title>
    <style>
        <%@ include file="css/styling.css" %>
    </style>
</head>
<body>
<div class="container">
    <h1>Basal Metabolic Rate</h1>

    <form method="post">
        <label for="gender" class="selectGender">Gender:</label>
        <select name="gender" required>
            <option value="male">Male</option>
            <option value="female">Female</option>
        </select>
        
        <label for="weight">Weight (kg):</label>
        <input type="number" step="0.01" name="weight" id="weight" value="<%= weight != null ? weight : "" %>" required>

        <label for="height">Height (cm):</label>
        <input type="number" step="0.01" name="height" id="height" value="<%= height != null ? height : "" %>" required>

        <label for="age">Age:</label>
        <input type="number" name="age" id="age" value="<%= age != null ? age : "" %>" required>

        <button type="submit" class="btn">Calculate BMR</button>
    </form>

    <% if (result != null) { %>
    <div class="result">
        <h2>Your Information</h2>
        <p><strong>Name:</strong> <%= name != null ? name : "Not set" %></p>
        <p><strong>ID:</strong> <%= idLong != null ? idLong : "Not set" %></p>
        <p><strong>Gender:</strong> <%= gender %></p>
        <p><strong>Weight:</strong> <%= weight %> kg</p>
        <p><strong>Height:</strong> <%= height %> cm</p>
        <p><strong>Age:</strong> <%= age %> years</p>

        <hr style="margin: 20px 0;">
       
        <h2>BMR Result</h2>
        Your BMR is
        <strong><%= result %></strong>
        This is the energy you needed a day just to maintain basic body functions such as heart beating, cell repair etc.
    </div>
    <% } %>
</div>
</body>
</html>
