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
    public String calculateBodyFat
    (
        @WebParam(name = "name") String name,
        @WebParam(name = "gender") String gender,
        @WebParam(name = "age") int age,
        @WebParam(name = "bmi") float bmi
    ) 
    
    {
        try 
        {
            if (age <= 0 || bmi <= 0) 
            {
                throw new WebServiceException("Age and BMI must be greater than zero.");
            }

            float bodyFat = 0;

            if (gender.equalsIgnoreCase("male")) 
            {
                bodyFat = (float) ((1.20 * bmi) + (0.23 * age) - 16.2);
            } 
            
            else if (gender.equalsIgnoreCase("female")) 
            {
                bodyFat = (float) ((1.20 * bmi) + (0.23 * age) - 5.4);
            } 
            
            else 
            {
                throw new WebServiceException("Gender must be 'male' or 'female'.");
            }
   
            return "Hi " + name + "! Based on your BMI and age, your Body Fat Percentage is " + String.format("%.2f", bodyFat) + "%.";

        } 
        
        catch (WebServiceException e) 
        {
            throw new WebServiceException("Error: " + e.getMessage());
        } 
    }
}
