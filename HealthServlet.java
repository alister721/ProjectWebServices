package com.client;

import com.healthclient.ws.HealthService;
import com.healthclient.ws.HealthService_Service;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HealthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String ic = request.getParameter("ic");
        String gender = request.getParameter("gender");
        double weight = Double.parseDouble(request.getParameter("weight"));
        double height = Double.parseDouble(request.getParameter("height"));

        // Call SOAP Web Service
        HealthService_Service service = new HealthService_Service();
        HealthService port = service.getHealthServicePort();

        String summary = port.getUserSummary(name, ic, gender, weight, height);

        // Display result
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Extract BMI value from summary
        String[] lines = summary.split("\n");
        String bmiLine = lines[3]; // Assumes BMI is always at line 4
        double bmiValue = Double.parseDouble(bmiLine.replace("BMI: ", "").trim());

        // Determine category and recommendation
        String category, advice;

        if (bmiValue < 18.5) {
            category = "Underweight";
            advice = "Eat more nutritious foods and consult with a healthcare provider.";
        } else if (bmiValue < 24.9) {
            category = "Normal";
            advice = "Maintain your healthy lifestyle with balanced diet and regular exercise.";
        } else if (bmiValue < 29.9) {
            category = "Overweight";
            advice = "Adopt a healthy diet and increase physical activity.";
        } else {
            category = "Obese";
            advice = "Seek professional help for a weight management plan.";
        }

        // Output
        out.println("<h2>BMI Summary</h2>");
        out.println("<pre>" + summary + "</pre>");
        out.println("<p><strong>Category:</strong> " + category + "</p>");
        out.println("<p><strong>Recommendation:</strong> " + advice + "</p>");
        out.println("<br><a href='index.html'>Back</a>");

    }
}
