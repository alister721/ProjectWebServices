/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package com.basicCal;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author calis
 */
@WebService(serviceName = "HealthModule")
public class HealthModule {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "display")
    public String display(
            @WebParam(name = "name") String name, 
            @WebParam(name = "id") int id, 
            @WebParam(name = "gender") String gender, 
            @WebParam(name = "weight") float weight, 
            @WebParam(name = "height") float height, 
            @WebParam(name = "age") int age) {
         return "Name: " + name + "\n" +
           "ID: " + id + "\n" +
           "Gender: " + gender + "\n" +
           "Weight: " + weight + " kg\n" +
           "Height: " + height + " cm\n" +
           "Age: " + age + " years";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "bmrCalculator")
    public String bmrCalculator(@WebParam(name = "age") int age, @WebParam(name = "gender") String gender, @WebParam(name = "height") float height, @WebParam(name = "weight") float weight) {
        double bmr;

    if (gender.equalsIgnoreCase("male") || gender.equalsIgnoreCase("m")) {
        bmr = (10*weight) + (6.25*height) - (5*age) + 5;
    } else if (gender.equalsIgnoreCase("female") || gender.equalsIgnoreCase("f")) {
        bmr = (10*weight) + (6.25*height) - (5*age) - 161;
    } else {
        return "Invalid gender input. Please enter 'male' or 'female'.";
    }

    return String.format("Your BMR is %.2f calories/day.", bmr);
    }

}
