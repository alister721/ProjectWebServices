package com.BodyFat;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.ws.WebServiceException;

/**
 *
 * @author AR JAWAN
 */
@WebService(serviceName = "BodyFatPercentage")
public class BodyFatPercentage { 
    
    @WebMethod(operationName = "calculateBodyFat")
    public String calculateBodyFat(
        @WebParam(name = "name") String name,
        @WebParam(name = "gender") String gender,
        @WebParam(name = "age") int age,
        @WebParam(name = "bmi") float bmi
    ) {
        try {
            if (age <= 0 || bmi <= 0) {
                throw new WebServiceException("Age and BMI must be greater than zero.");
            }

            float bodyFat;
            String category = "";
            String tip = "";

            if (gender.equalsIgnoreCase("male")) {
                bodyFat = (float) ((1.20 * bmi) + (0.23 * age) - 16.2);

                if (bodyFat < 6)
                    category = "Essential fat";
                else if (bodyFat < 14)
                    category = "Athlete";
                else if (bodyFat < 18)
                    category = "Fitness";
                else if (bodyFat < 25)
                    category = "Average";
                else
                    category = "Obese";

            } else if (gender.equalsIgnoreCase("female")) {
                bodyFat = (float) ((1.20 * bmi) + (0.23 * age) - 5.4);

                if (bodyFat < 14)
                    category = "Essential fat";
                else if (bodyFat < 21)
                    category = "Athlete";
                else if (bodyFat < 25)
                    category = "Fitness";
                else if (bodyFat < 32)
                    category = "Average";
                else
                    category = "Obese";

            } else {
                throw new WebServiceException("Gender must be 'male' or 'female'.");
            }

            // Tip section
            switch (category) {
                case "Essential fat":
                    tip = "Caution: You're near the minimum fat level needed for basic health.";
                    break;
                case "Athlete":
                    tip = "Great job! This level is typical for athletes and active individuals.";
                    break;
                case "Fitness":
                    tip = "You're doing well! Consider maintaining this range.";
                    break;
                case "Average":
                    tip = "This is within the normal range. A healthy diet and routine exercise can help you stay fit.";
                    break;
                case "Obese":
                    tip = "Consider speaking with a healthcare provider for personalized health strategies.";
                    break;
            }

           return "<response>" +
           "<name>" + name + "</name>" +
           "<bodyFat>" + String.format("%.2f", bodyFat) + "</bodyFat>" +
           "<category>" + category + "</category>" +
           "<tip>" + tip + "</tip>" +
       "</response>";


        } catch (WebServiceException e) {
            throw new WebServiceException("Error: " + e.getMessage());
        }
    }

}
