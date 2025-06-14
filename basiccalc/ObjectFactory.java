
package basiccalc;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the basiccalc package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _DisplayResponse_QNAME = new QName("http://basicCalc/", "displayResponse");
    private final static QName _CaloriesBurnRateResponse_QNAME = new QName("http://basicCalc/", "caloriesBurnRateResponse");
    private final static QName _DailyWaterIntakeCalculator_QNAME = new QName("http://basicCalc/", "dailyWaterIntakeCalculator");
    private final static QName _CalculateBodyFatResponse_QNAME = new QName("http://basicCalc/", "calculateBodyFatResponse");
    private final static QName _CalculateBodyFat_QNAME = new QName("http://basicCalc/", "calculateBodyFat");
    private final static QName _BmrCalculator_QNAME = new QName("http://basicCalc/", "bmrCalculator");
    private final static QName _CalculateBMIResponse_QNAME = new QName("http://basicCalc/", "calculateBMIResponse");
    private final static QName _CaloriesBurnRate_QNAME = new QName("http://basicCalc/", "caloriesBurnRate");
    private final static QName _CalculateBMI_QNAME = new QName("http://basicCalc/", "calculateBMI");
    private final static QName _Display_QNAME = new QName("http://basicCalc/", "display");
    private final static QName _BmrCalculatorResponse_QNAME = new QName("http://basicCalc/", "bmrCalculatorResponse");
    private final static QName _DailyWaterIntakeCalculatorResponse_QNAME = new QName("http://basicCalc/", "dailyWaterIntakeCalculatorResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: basiccalc
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link BmrCalculator }
     * 
     */
    public BmrCalculator createBmrCalculator() {
        return new BmrCalculator();
    }

    /**
     * Create an instance of {@link CalculateBMIResponse }
     * 
     */
    public CalculateBMIResponse createCalculateBMIResponse() {
        return new CalculateBMIResponse();
    }

    /**
     * Create an instance of {@link CaloriesBurnRate }
     * 
     */
    public CaloriesBurnRate createCaloriesBurnRate() {
        return new CaloriesBurnRate();
    }

    /**
     * Create an instance of {@link BmrCalculatorResponse }
     * 
     */
    public BmrCalculatorResponse createBmrCalculatorResponse() {
        return new BmrCalculatorResponse();
    }

    /**
     * Create an instance of {@link DailyWaterIntakeCalculatorResponse }
     * 
     */
    public DailyWaterIntakeCalculatorResponse createDailyWaterIntakeCalculatorResponse() {
        return new DailyWaterIntakeCalculatorResponse();
    }

    /**
     * Create an instance of {@link CalculateBMI }
     * 
     */
    public CalculateBMI createCalculateBMI() {
        return new CalculateBMI();
    }

    /**
     * Create an instance of {@link Display }
     * 
     */
    public Display createDisplay() {
        return new Display();
    }

    /**
     * Create an instance of {@link DisplayResponse }
     * 
     */
    public DisplayResponse createDisplayResponse() {
        return new DisplayResponse();
    }

    /**
     * Create an instance of {@link CaloriesBurnRateResponse }
     * 
     */
    public CaloriesBurnRateResponse createCaloriesBurnRateResponse() {
        return new CaloriesBurnRateResponse();
    }

    /**
     * Create an instance of {@link DailyWaterIntakeCalculator }
     * 
     */
    public DailyWaterIntakeCalculator createDailyWaterIntakeCalculator() {
        return new DailyWaterIntakeCalculator();
    }

    /**
     * Create an instance of {@link CalculateBodyFat }
     * 
     */
    public CalculateBodyFat createCalculateBodyFat() {
        return new CalculateBodyFat();
    }

    /**
     * Create an instance of {@link CalculateBodyFatResponse }
     * 
     */
    public CalculateBodyFatResponse createCalculateBodyFatResponse() {
        return new CalculateBodyFatResponse();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DisplayResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "displayResponse")
    public JAXBElement<DisplayResponse> createDisplayResponse(DisplayResponse value) {
        return new JAXBElement<DisplayResponse>(_DisplayResponse_QNAME, DisplayResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CaloriesBurnRateResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "caloriesBurnRateResponse")
    public JAXBElement<CaloriesBurnRateResponse> createCaloriesBurnRateResponse(CaloriesBurnRateResponse value) {
        return new JAXBElement<CaloriesBurnRateResponse>(_CaloriesBurnRateResponse_QNAME, CaloriesBurnRateResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DailyWaterIntakeCalculator }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "dailyWaterIntakeCalculator")
    public JAXBElement<DailyWaterIntakeCalculator> createDailyWaterIntakeCalculator(DailyWaterIntakeCalculator value) {
        return new JAXBElement<DailyWaterIntakeCalculator>(_DailyWaterIntakeCalculator_QNAME, DailyWaterIntakeCalculator.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CalculateBodyFatResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "calculateBodyFatResponse")
    public JAXBElement<CalculateBodyFatResponse> createCalculateBodyFatResponse(CalculateBodyFatResponse value) {
        return new JAXBElement<CalculateBodyFatResponse>(_CalculateBodyFatResponse_QNAME, CalculateBodyFatResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CalculateBodyFat }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "calculateBodyFat")
    public JAXBElement<CalculateBodyFat> createCalculateBodyFat(CalculateBodyFat value) {
        return new JAXBElement<CalculateBodyFat>(_CalculateBodyFat_QNAME, CalculateBodyFat.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BmrCalculator }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "bmrCalculator")
    public JAXBElement<BmrCalculator> createBmrCalculator(BmrCalculator value) {
        return new JAXBElement<BmrCalculator>(_BmrCalculator_QNAME, BmrCalculator.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CalculateBMIResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "calculateBMIResponse")
    public JAXBElement<CalculateBMIResponse> createCalculateBMIResponse(CalculateBMIResponse value) {
        return new JAXBElement<CalculateBMIResponse>(_CalculateBMIResponse_QNAME, CalculateBMIResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CaloriesBurnRate }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "caloriesBurnRate")
    public JAXBElement<CaloriesBurnRate> createCaloriesBurnRate(CaloriesBurnRate value) {
        return new JAXBElement<CaloriesBurnRate>(_CaloriesBurnRate_QNAME, CaloriesBurnRate.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CalculateBMI }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "calculateBMI")
    public JAXBElement<CalculateBMI> createCalculateBMI(CalculateBMI value) {
        return new JAXBElement<CalculateBMI>(_CalculateBMI_QNAME, CalculateBMI.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Display }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "display")
    public JAXBElement<Display> createDisplay(Display value) {
        return new JAXBElement<Display>(_Display_QNAME, Display.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BmrCalculatorResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "bmrCalculatorResponse")
    public JAXBElement<BmrCalculatorResponse> createBmrCalculatorResponse(BmrCalculatorResponse value) {
        return new JAXBElement<BmrCalculatorResponse>(_BmrCalculatorResponse_QNAME, BmrCalculatorResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DailyWaterIntakeCalculatorResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCalc/", name = "dailyWaterIntakeCalculatorResponse")
    public JAXBElement<DailyWaterIntakeCalculatorResponse> createDailyWaterIntakeCalculatorResponse(DailyWaterIntakeCalculatorResponse value) {
        return new JAXBElement<DailyWaterIntakeCalculatorResponse>(_DailyWaterIntakeCalculatorResponse_QNAME, DailyWaterIntakeCalculatorResponse.class, null, value);
    }

}
