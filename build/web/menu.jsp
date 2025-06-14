<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Health Tools Menu</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #e0f7fa;
            /*margin: 0;*/
            /*height: 150vh;*/
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .menu-container {
            margin-top: 2vh !important;
            /*margin-bottom: 20vh !important;*/
            background: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 500px;
        }

        h2 {
            margin-top: 0;
            color: #2c3e50;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 30px 0;
        }

        li {
            margin-bottom: 20px;
            background: #f9f9f9;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.05);
        }

        a {
            display: block;
            font-size: 18px;
            font-weight: bold;
            color: #3498db;
            text-decoration: none;
            margin-bottom: 8px;
        }

        a:hover {
            text-decoration: underline;
        }

        .description {
            font-size: 14px;
            color: #555;
        }

        .welcome {
            font-size: 18px;
            color: #555;
        }
    </style>
</head>
<body>

<div class="menu-container">
    <h2>Welcome, ${sessionScope.name}</h2>
    <p class="welcome">Choose a health calculator tool:</p>
    <ul>
        <li>
            <a href="bmi.jsp">BMI Calculator</a>
            <p class="description">Calculate your Body Mass Index to understand your weight category based on height and weight.</p>
        </li>
        <li>
            <a href="BodyFatPercentage.jsp">Body Fat Calculator</a>
            <p class="description">Estimate your body fat percentage using your body metrics and fitness level.</p>
        </li>
        <li>
            <a href="DailyWaterIntake.jsp">Daily Water Intake</a>
            <p class="description">Find out how much water your body needs daily to stay properly hydrated.</p>
        </li>
        <li>
            <a href="BMR.jsp">Basal Metabolic Rate</a>
            <p class="description">Determine the number of calories your body burns at rest to maintain essential functions.</p>
        </li>
        <li>
            <a href="caloriesBurnRate.jsp">Calories Burn Rate</a>
            <p class="description">Calculate how many calories you burn during various physical activities.</p>
        </li>
    </ul>
</div>

</body>
</html>
