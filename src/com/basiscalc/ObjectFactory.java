
package com.basiscalc;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.basiscalc package. 
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

    private final static QName _DisplayResponse_QNAME = new QName("http://basicCal.com/", "displayResponse");
    private final static QName _BmrCalculatorResponse_QNAME = new QName("http://basicCal.com/", "bmrCalculatorResponse");
    private final static QName _Display_QNAME = new QName("http://basicCal.com/", "display");
    private final static QName _BmrCalculator_QNAME = new QName("http://basicCal.com/", "bmrCalculator");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.basiscalc
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
     * Create an instance of {@link BmrCalculatorResponse }
     * 
     */
    public BmrCalculatorResponse createBmrCalculatorResponse() {
        return new BmrCalculatorResponse();
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
     * Create an instance of {@link JAXBElement }{@code <}{@link DisplayResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCal.com/", name = "displayResponse")
    public JAXBElement<DisplayResponse> createDisplayResponse(DisplayResponse value) {
        return new JAXBElement<DisplayResponse>(_DisplayResponse_QNAME, DisplayResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BmrCalculatorResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCal.com/", name = "bmrCalculatorResponse")
    public JAXBElement<BmrCalculatorResponse> createBmrCalculatorResponse(BmrCalculatorResponse value) {
        return new JAXBElement<BmrCalculatorResponse>(_BmrCalculatorResponse_QNAME, BmrCalculatorResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Display }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCal.com/", name = "display")
    public JAXBElement<Display> createDisplay(Display value) {
        return new JAXBElement<Display>(_Display_QNAME, Display.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BmrCalculator }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://basicCal.com/", name = "bmrCalculator")
    public JAXBElement<BmrCalculator> createBmrCalculator(BmrCalculator value) {
        return new JAXBElement<BmrCalculator>(_BmrCalculator_QNAME, BmrCalculator.class, null, value);
    }

}
