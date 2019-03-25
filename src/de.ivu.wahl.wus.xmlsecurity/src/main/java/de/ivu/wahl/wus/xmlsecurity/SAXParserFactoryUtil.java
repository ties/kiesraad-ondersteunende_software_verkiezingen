/*
 * SAXParserFactoryUtil
 * 
 * Created on 16.11.2018
 * Copyright (c) 2018 IVU Traffic Technologies AG
 */
package de.ivu.wahl.wus.xmlsecurity;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.apache.log4j.Logger;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

/**
 * @author Joachim Nottebaum, IVU Traffic Technologies AG
 */
public class SAXParserFactoryUtil {

  private static final Logger log = Logger.getLogger(SAXParserFactoryUtil.class);

  public static XMLReader getXMLReader() throws XmlParseException {
    XMLReader xmlReader = null;
    try {
      SAXParserFactory saxParserFactory = SAXParserFactoryUtil.getSAXParserFactory();
      SAXParser newSAXParser = saxParserFactory.newSAXParser();
      xmlReader = newSAXParser.getXMLReader();
    } catch (ParserConfigurationException e) {
      throw new XmlParseException("Failed to parse xml", e); //$NON-NLS-1$
    } catch (SAXException e) {
      throw new XmlParseException("Failed to parse xml", e); //$NON-NLS-1$
    }
    return xmlReader;
  }

  public static SAXParserFactory getSAXParserFactory() throws ParserConfigurationException {
    SAXParserFactory factory = SAXParserFactory.newInstance();

    // The following code is based on
    // https://www.owasp.org/index.php/XML_External_Entity_(XXE)_Prevention_Cheat_Sheet#JAXP_DocumentBuilderFactory.2C_SAXParserFactory_and_DOM4J
    // to prevent XML External Entity (XXE) attacks
    String feature = null;

    try {
      // This is the PRIMARY defense. If DTDs (doctypes) are disallowed, almost all XML entity
      // attacks are prevented
      // Xerces 2 only - http://xerces.apache.org/xerces2-j/features.html#disallow-doctype-decl
      feature = "http://apache.org/xml/features/disallow-doctype-decl"; //$NON-NLS-1$
      factory.setFeature(feature, true);

      // If you can't completely disable DTDs, then at least do the following:
      // Xerces 1 - http://xerces.apache.org/xerces-j/features.html#external-general-entities
      // Xerces 2 - http://xerces.apache.org/xerces2-j/features.html#external-general-entities
      // JDK7+ - http://xml.org/sax/features/external-general-entities
      feature = "http://xml.org/sax/features/external-general-entities"; //$NON-NLS-1$
      factory.setFeature(feature, false);

      // Xerces 1 - http://xerces.apache.org/xerces-j/features.html#external-parameter-entities
      // Xerces 2 - http://xerces.apache.org/xerces2-j/features.html#external-parameter-entities
      // JDK7+ - http://xml.org/sax/features/external-parameter-entities
      feature = "http://xml.org/sax/features/external-parameter-entities"; //$NON-NLS-1$
      factory.setFeature(feature, false);

      // Disable external DTDs as well
      feature = "http://apache.org/xml/features/nonvalidating/load-external-dtd"; //$NON-NLS-1$
      factory.setFeature(feature, false);

      // and these as well, per Timothy Morgan's 2014 paper: "XML Schema, DTD, and Entity Attacks"
      factory.setXIncludeAware(false);
      // does not compile: factory.setExpandEntityReferences(false);

      // And, per Timothy Morgan: "If for some reason support for inline DOCTYPEs are a requirement,
      // then
      // ensure the entity settings are disabled (as shown above) and beware that SSRF attacks
      // (http://cwe.mitre.org/data/definitions/918.html) and denial
      // of service attacks (such as billion laughs or decompression bombs via "jar:") are a risk."

    } catch (ParserConfigurationException e) {
      // This should catch a failed setFeature feature
      log.info("ParserConfigurationException was thrown. The feature '" + feature //$NON-NLS-1$
          + "' is probably not supported by your XML processor."); //$NON-NLS-1$
      log.error(e, e);
      throw e;
    } catch (SAXException e) {
      // On Apache, this should be thrown when disallowing DOCTYPE
      log.warn("A DOCTYPE was passed into the XML document"); //$NON-NLS-1$
      log.error(e, e);
    }

    return factory;
  }
}
