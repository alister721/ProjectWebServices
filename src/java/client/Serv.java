package client;

import com.client.HealthModule;
import com.client.HealthModule_Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/clientOne")
public class Serv extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Get form input
        String name = request.getParameter("name");
        long id = Long.parseLong(request.getParameter("id")); 
        String gender = request.getParameter("gender");
        float weight = Float.parseFloat(request.getParameter("weight"));
        float height = Float.parseFloat(request.getParameter("height"));
        int age = Integer.parseInt(request.getParameter("age"));

        // Call the Web Service
        HealthModule_Service service = new HealthModule_Service();
        HealthModule port = service.getHealthModulePort();

        String displayResult = port.display(name, (int) id, gender, weight, height, age);
        String bmrResult = port.bmrCalculator(age, gender, height, weight);

        // Store results in session
        HttpSession session = request.getSession();
        session.setAttribute("displayResult", displayResult);
        session.setAttribute("bmrResult", bmrResult);
        session.setAttribute("name", name);
        session.setAttribute("id", id);
        session.setAttribute("gender", gender);
        session.setAttribute("weight", weight);
        session.setAttribute("height", height);
        session.setAttribute("age", age);
        System.out.println("Redirecting to menu.jsp");

        // Redirect to menu.jsp
        response.sendRedirect("menu.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("main.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Handles initial user input and displays BMR result";
    }
}

