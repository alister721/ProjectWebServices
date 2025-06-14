
package basiccalc;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for dailyWaterIntakeCalculator complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="dailyWaterIntakeCalculator">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="weightKg" type="{http://www.w3.org/2001/XMLSchema}double"/>
 *         &lt;element name="heightCm" type="{http://www.w3.org/2001/XMLSchema}double"/>
 *         &lt;element name="activityLevel" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="climate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "dailyWaterIntakeCalculator", propOrder = {
    "weightKg",
    "heightCm",
    "activityLevel",
    "climate"
})
public class DailyWaterIntakeCalculator {

    protected double weightKg;
    protected double heightCm;
    protected String activityLevel;
    protected String climate;

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
     * Gets the value of the activityLevel property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getActivityLevel() {
        return activityLevel;
    }

    /**
     * Sets the value of the activityLevel property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setActivityLevel(String value) {
        this.activityLevel = value;
    }

    /**
     * Gets the value of the climate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getClimate() {
        return climate;
    }

    /**
     * Sets the value of the climate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setClimate(String value) {
        this.climate = value;
    }

}
