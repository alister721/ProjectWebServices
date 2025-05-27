package com.cal;

import com.cal.HealthModule;
import com.cal.HealthModule_Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ClientOne extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Get form data
        String name = request.getParameter("name");
        int id = Integer.parseInt(request.getParameter("id"));
        String gender = request.getParameter("gender");
        float weight = Float.parseFloat(request.getParameter("weight"));
        float height = Float.parseFloat(request.getParameter("height"));
        int age = Integer.parseInt(request.getParameter("age"));

        // Call the web service client (make sure wsimport generated these classes)
        HealthModule_Service service = new HealthModule_Service();
        HealthModule port = service.getHealthModulePort();

        String displayResult = port.display(name, id, gender, weight, height, age);
        String bmrResult = port.bmrCalculator(age, gender, height, weight);

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html><head><title>HealthModule Results</title></head><body>");
            out.println("<h2>Results</h2>");
            out.println("<pre>" + displayResult + "</pre>");
            out.println("<pre>" + bmrResult + "</pre>");
            out.println("<a href='index.html'>Back to form</a>");
            out.println("</body></html>");
        }
    }

    // Optionally override doGet() to redirect to index.html or show an error
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.html");
    }

    @Override
    public String getServletInfo() {
        return "HealthModule Client Servlet";
    }
}
