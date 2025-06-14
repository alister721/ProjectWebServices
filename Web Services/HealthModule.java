/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package basicCal;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.ws.WebServiceException;

/**
 *
 * @author calis
 */
@WebService(serviceName = "HealthModule")
public class HealthModule {

    /**
     * This is a sample web service operation
     */
     @WebMethod(operationName = "display")
    public String display(
        @WebParam(name = "name") String name, 
        @WebParam(name = "id") long id, 
        @WebParam(name = "gender") String gender, 
        @WebParam(name = "weight") float weight, 
        @WebParam(name = "height") float height, 
        @WebParam(name = "age") int age) {
        String output;
        output = "Name: " + name + "<br>" +
                 "ID: " + id + "<br>" +
                 "Gender: " + gender + "<br>" +
                 "Weight: " + weight + " kg<br>" +
                 "Height: " + height + " cm<br>" +
                 "Age: " + age + " years";

        return output;
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

    return String.format("%.2f calories/day.", bmr);
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "caloriesBurnRate")
    public String caloriesBurnRate(@WebParam(name = "weightKg") double weightKg, @WebParam(name = "heightCm") double heightCm, @WebParam(name = "duration") double duration, @WebParam(name = "metValue") double metValue) {
        if (weightKg <= 0 || heightCm <= 0 || duration <= 0 || metValue <= 0) {
            throw new WebServiceException("Invalid input: All numeric values must be greater than 0.");
        }

        // Calculate calories burned
        double calories = metValue * weightKg * (duration / 60.0);

        // Return result
        return String.format("Calories Burned: %.2f kcal", calories);
    }

    @WebMethod(operationName = "calculateBodyFat")
    public String calculateBodyFat(
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
                    tip = "⚠️ Caution: You're near the minimum fat level needed for basic health. Ensure you're eating enough and not overtraining.";
                    break;
                case "Athlete":
                    tip = "💪 Great work! Your body fat level is optimal for performance. Maintain with consistent training and balanced nutrition.";
                    break;
                case "Fitness":
                    tip = "👍 You're doing well! Consider maintaining this range. Keep up your current lifestyle and consider strength/cardio training to optimize further.";
                    break;
                case "Average":
                    tip = "🙂 This is within the normal range. A healthy diet and routine exercise can help you stay fit.";
                    break;
                case "Obese":
                    tip = "ℹ️ Consider speaking with a healthcare provider for personalized health strategies.";
                    break;
            }

           return "<response>" +
           "<bodyFat>" + String.format("%.2f", bodyFat) + "</bodyFat>" +
           "<category>" + category + "</category>" +
           "<tip>" + tip + "</tip>" +
       "</response>";


        } catch (WebServiceException e) {
            throw new WebServiceException("Error: " + e.getMessage());
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "dailyWaterIntakeCalculator")
    public String dailyWaterIntakeCalculator(
            @WebParam(name = "weightKg") double weightKg, 
            @WebParam(name = "heightCm") double heightCm, 
            @WebParam(name = "activityLevel") String activityLevel, 
            @WebParam(name = "climate") String climate) {
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
    
    /**
    * Web service operation
    */
   @WebMethod(operationName = "calculateBMI")
   public String calculateBMI(
       @WebParam(name = "weight") float weight,
       @WebParam(name = "height") float height,
       @WebParam(name = "age") int age) {
       String eatSuggest;
       String activitySuggest;
       if (weight <= 0 || height <= 0 || age <= 0) {
           throw new WebServiceException("Weight, height, and age must be greater than zero.");
       }

       // Convert height from cm to meters
       float heightInMeters = height / 100;

       // Calculate BMI
       float bmi = weight / (heightInMeters * heightInMeters);

       // Determine category
       String category;
       if (bmi < 18.5) {
           category = "Underweight";
           eatSuggest = "Eat more calorie-dense and nutrient-rich foods (nuts, avocados, lean meats).";
           activitySuggest = "Focus on strength training and light cardio.";
       } else if (bmi < 24.9) {
           category = "Normal weight";
           eatSuggest = "Eat plenty of fruits, vegetables, whole grains.";
           activitySuggest = "Focus on mix cardio and strength.";
       } else if (bmi < 29.9) {
           category = "Overweight";
           eatSuggest = "Reduce processed carbs and sugars.";
           activitySuggest = "Increase daily movement such as walking, cycling and jogging.";
       } else {
           category = "Obese";
           eatSuggest = "Follow a low-calorie, high-fiber meal plan.";
           activitySuggest = "Begin with low-impact cardio such as swimming and walking.";
       }

       return "<response>" +
              "<bmi>" + String.format("%.2f", bmi) + "</bmi>" +
              "<category>" + category + "</category>" +
               "<eatSuggest>" + eatSuggest + "</eatSuggest>" +
               "<activitySuggest>" + activitySuggest + "</activitySuggest>" +
              "</response>";
   }
}
