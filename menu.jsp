<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Health Tools Menu</title>
    <style>
        body {
            margin: 0;
            padding: 60px 20px;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);
            display: flex;
            justify-content: center;
            align-items: start;
            min-height: 100vh;
            box-sizing: border-box;
        }


    .menu-container {
        background: rgba(255, 255, 255, 0.95);
        padding: 50px 40px;
        border-radius: 20px;
        box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
        text-align: center;
        max-width: 600px;
        width: 100%;
        animation: fadeIn 0.9s ease-in-out;
        margin: 0; 
    }

        h2 {
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .welcome {
            font-size: 16px;
            color: #555;
            margin-bottom: 25px;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin-bottom: 25px;
            background: #f9f9f9;
            padding: 18px 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
            transition: transform 0.2s ease, box-shadow 0.3s ease;
        }

        li:hover {
            transform: translateY(-4px);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.12);
        }

        a {
            display: block;
            font-size: 18px;
            font-weight: bold;
            color: #3498db;
            text-decoration: none;
            margin-bottom: 6px;
        }

        a:hover {
            color: #21618c;
            text-decoration: underline;
        }

        .description {
            font-size: 14px;
            color: #555;
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
