<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Health Calculator</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to bottom right, #6dd5fa, #ffffff);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .intro-container {
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            padding: 60px;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
            animation: fadeIn 2s ease;
        }

        h1 {
            font-size: 2.8rem;
            color: #2c3e50;
        }

        p {
            font-size: 1.2rem;
            color: #34495e;
            margin: 20px 0;
        }

        .btn-start {
            padding: 12px 30px;
            font-size: 18px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-start:hover {
            background-color: #2980b9;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="intro-container">
        <h1>Welcome to Your Health Calculator</h1>
        <p>Track your health metrics like BMI, BMR, Body Fat, Water Intake & more.</p>
        <form action="main.jsp" method="get">
            <button type="submit" class="btn-start">Start Now</button>
        </form>
    </div>
</body>
</html>