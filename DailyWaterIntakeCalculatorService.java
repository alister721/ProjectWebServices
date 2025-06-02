package org.personalhealthandfitnesscalculator;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.ws.WebServiceException;

@WebService(serviceName = "DailyWaterIntakeCalculatorService")
public class DailyWaterIntakeCalculatorService {

    @WebMethod(operationName = "calculateDailyWaterIntake")
    public String calculateDailyWaterIntake(
        @WebParam(name = "gender") String gender,
        @WebParam(name = "weightKg") double weightKg,
        @WebParam(name = "heightCm") double heightCm,
        @WebParam(name = "activityLevel") String activityLevel,
        @WebParam(name = "climate") String climate
    ) {
        if (weightKg <= 0 || heightCm <= 0) {
            throw new WebServiceException("Invalid input: Weight and height must be > 0.");
        }

        // Base water intake: 0.033 liters per kg
        double baseWaterIntake = weightKg * 0.033;

        // Activity level multiplier
        double activityMultiplier;
        switch (activityLevel.toLowerCase()) {
            case "sedentary":
                activityMultiplier = 0.0;
                break;
            case "light":
                activityMultiplier = 0.35;
                break;
            case "moderate":
                activityMultiplier = 0.70;
                break;
            case "high":
                activityMultiplier = 1.00;
                break;
            case "extreme":
                activityMultiplier = 1.35;
                break;
            default:
                throw new WebServiceException("Invalid activity level input.");
        }

        // Climate multiplier
        double climateMultiplier;
        switch (climate.toLowerCase()) {
            case "cold":
                climateMultiplier = 0.0;
                break;
            case "temperate":
                climateMultiplier = 0.2;
                break;
            case "tropical":
                climateMultiplier = 0.4;
                break;
            default:
                throw new WebServiceException("Invalid climate input.");
        }

        double totalIntake = baseWaterIntake + activityMultiplier + climateMultiplier;

        return String.format("Recommended Daily Water Intake: %.2f liters", totalIntake);
    }
}