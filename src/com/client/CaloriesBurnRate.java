
package com.client;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for caloriesBurnRate complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="caloriesBurnRate">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="weightKg" type="{http://www.w3.org/2001/XMLSchema}double"/>
 *         &lt;element name="heightCm" type="{http://www.w3.org/2001/XMLSchema}double"/>
 *         &lt;element name="duration" type="{http://www.w3.org/2001/XMLSchema}double"/>
 *         &lt;element name="metValue" type="{http://www.w3.org/2001/XMLSchema}double"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "caloriesBurnRate", propOrder = {
    "weightKg",
    "heightCm",
    "duration",
    "metValue"
})
public class CaloriesBurnRate {

    protected double weightKg;
    protected double heightCm;
    protected double duration;
    protected double metValue;

    /**
     * Gets the value of the weightKg property.
     * 
     */
    public double getWeightKg() {
        return weightKg;
    }

    /**
     * Sets the value of the weightKg property.
     * 
     */
    public void setWeightKg(double value) {
        this.weightKg = value;
    }

    /**
     * Gets the value of the heightCm property.
     * 
     */
    public double getHeightCm() {
        return heightCm;
    }

    /**
     * Sets the value of the heightCm property.
     * 
     */
    public void setHeightCm(double value) {
        this.heightCm = value;
    }

    /**
     * Gets the value of the duration property.
     * 
     */
    public double getDuration() {
        return duration;
    }

    /**
     * Sets the value of the duration property.
     * 
     */
    public void setDuration(double value) {
        this.duration = value;
    }

    /**
     * Gets the value of the metValue property.
     * 
     */
    public double getMetValue() {
        return metValue;
    }

    /**
     * Sets the value of the metValue property.
     * 
     */
    public void setMetValue(double value) {
        this.metValue = value;
    }

}
