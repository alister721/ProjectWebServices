/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package org.CaloriesService;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.ws.WebServiceException;

@WebService(serviceName = "CaloriesService")
public class CaloriesService {

    @WebMethod(operationName = "calculateCaloriesBurned")
    public String processCaloriesBurn(
        @WebParam(name = "gender") String gender,
        @WebParam(name = "weightKg") double weightKg,
        @WebParam(name = "heightCm") double heightCm,
        @WebParam(name = "duration") double duration,
        @WebParam(name = "metValue") double metValue
    ) {
        // Input validation
        if (weightKg <= 0 || heightCm <= 0 || duration <= 0 || metValue <= 0) {
            throw new WebServiceException("Invalid input: All numeric values must be greater than 0.");
        }

        // Calculate calories burned
        double calories = metValue * weightKg * (duration / 60.0);

        // Return result
        return String.format("Calories Burned: %.2f kcal", calories);
    }
}
