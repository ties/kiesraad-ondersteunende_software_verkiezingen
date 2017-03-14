/*
 * SHAXmlDigestCreatorTest
 * 
 * Created on Nov 14, 2008
 * Copyright (c) 2008 Kiesraad
 */
package de.ivu.wahl.wus.xmlsecurity;

import static org.junit.Assert.assertEquals;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Source;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamSource;

import org.junit.Test;
import org.w3c.dom.Document;

public class SHAXmlDigestCreatorTest {
  private static final String UTF8 = "UTF-8";
  private final SHAXmlDigestCreator cut = new SHAXmlDigestCreator();

  @Test
  public void testCanonizeXml() throws Exception {
    assertEquals("<root></root>", canonicalize("<root  ></root>"));
    assertEquals("<root>\n\n</root>", canonicalize("<root>\n\n</root>"));
    // assertEquals("<root>\n</root>", xomCanonize("<root>\n\r</root>"));
    assertEquals("<root>\n</root>", canonicalize("<root>\r\n</root>"));
    assertEquals("<root></root>", canonicalize("<root/>"));
    assertEquals("<root id=\"some\"></root>", canonicalize("<root   id  =\"some\" ></root>"));
    assertEquals("<root id=\"some\"></root>", canonicalize("<root   id  ='some' ></root>"));
  }

  @Test
  public void testCanonizeXmlFilebased() throws Exception {
    // some test cases are created using the examples
    // at: http://www.w3.org/TR/xml-c14n.html#Examples
    checkCanonizationForFile("input1");
    checkCanonizationForFile("input2");
    checkCanonizationForFile("input3");
    checkCanonizationForFile("input4");
    checkCanonizationForFile("input5");
    checkCanonizationForFile("input6");
  }

  @Test
  public void testCreateDigestFromBytes() throws UnsupportedEncodingException {
    assertEquals("95 cb 0b fd 29 77 c7 61 29 8d 96 24 e4 b4 d4 c7 2a 39 97 4a".toUpperCase(), cut
        .createDigestFromBytes("y".getBytes(UTF8), true));
    assertEquals("7e 5e e1 18 ec e7 9e 5a 2d 22 71 1a 5b d0 f3 0d 61 7b 43 21".toUpperCase(), cut
        .createDigestFromBytes("sample message".getBytes(UTF8), true));
    assertEquals("7e5ee118ece79e5a2d22711a5bd0f30d617b4321".toUpperCase(), cut
        .createDigestFromBytes("sample message".getBytes(UTF8), false));
  }

  @Test(expected = XmlParseException.class)
  public void testCreateDigestNoXmlInput() throws Exception {
    cut.unconditionalCreateDigest(asStream("xyz"));
  }

  @Test
  public void testCreateDigest() throws Exception {
    // refernce SHA created using: http://holger.thoelking.name/skripten/md5
    {
      String expDigest =
                         "97 3f 44 c3 82 b8 a1 58 0f bd 20 54 2e fd a0 6e 7c 7a 87 34"
                             .toUpperCase();
      assertEquals(expDigest, cut.unconditionalCreateDigest(asStream("<a>xyz</a>")));
      assertEquals(expDigest, cut.unconditionalCreateDigest(asSource("<a>xyz</a>")));
      assertEquals(expDigest, cut.unconditionalCreateDigest(asStream("<a  >xyz</a>")));
      assertEquals(expDigest, cut.unconditionalCreateDigest(asSource("<a  >xyz</a>")));
    }

    String expDigest = "D4 80 31 36 30 BA B3 90 34 F8 78 0C D3 3A BE 8A 2A F9 5B 6C";
    assertEquals(expDigest, cut.unconditionalCreateDigest(getClass()
        .getResourceAsStream("input4.xml")));
    assertEquals(expDigest, cut.unconditionalCreateDigest(new DOMSource(parse(getClass()
        .getResourceAsStream("input4.xml")))));
    assertEquals(expDigest, cut.unconditionalCreateDigest(getClass()
        .getResourceAsStream("input4.canonized")));
    assertEquals(expDigest, cut.unconditionalCreateDigest(new DOMSource(parse(getClass()
        .getResourceAsStream("input4.canonized")))));
  }

  @Test
  public void testGetCanonicalXmlContent() throws Exception {
    {
      String input = "<a>xyz</a>";
      cut.unconditionalCreateDigest(asStream(input));
      String result = inToString(cut.getCanonicalXmlContent());
      assertEquals("<a>xyz</a>", result);
    }
    {
      String input = "<a>xyz</a>";
      cut.unconditionalCreateDigest(asSource(input));
      String result = inToString(cut.getCanonicalXmlContent());
      assertEquals("<a>xyz</a>", result);
    }
    {
      String input = "<a  >xyz</a>";
      cut.unconditionalCreateDigest(asStream(input));
      String result = inToString(cut.getCanonicalXmlContent());
      assertEquals("<a>xyz</a>", result);
    }
    {
      String input = "<a  >xyz</a>";
      cut.unconditionalCreateDigest(asSource(input));
      String result = inToString(cut.getCanonicalXmlContent());
      assertEquals("<a>xyz</a>", result);
    }
    {
      cut.unconditionalCreateDigest(asStream("<a  >xyz</a>"));
      assertEquals("<a>xyz</a>", inToString(cut.getCanonicalXmlContent()));
      assertEquals("<a>xyz</a>", inToString(cut.getCanonicalXmlContent()));
      cut.unconditionalCreateDigest(asStream("<a\n\n><b/></a>"));
      assertEquals("<a><b></b></a>", inToString(cut.getCanonicalXmlContent()));
    }
    {
      cut.unconditionalCreateDigest(asSource("<a  >xyz</a>"));
      assertEquals("<a>xyz</a>", inToString(cut.getCanonicalXmlContent()));
      assertEquals("<a>xyz</a>", inToString(cut.getCanonicalXmlContent()));
      cut.unconditionalCreateDigest(asSource("<a\n\n><b/></a>"));
      assertEquals("<a><b></b></a>", inToString(cut.getCanonicalXmlContent()));
    }
  }

  @Test(expected = RuntimeException.class)
  public void testGetCanonicalXmlContentNoInputSupplied() throws Exception {
    cut.getCanonicalXmlContent();
  }

  private InputStream asStream(String string) {
    try {
      return new ByteArrayInputStream(string.getBytes(UTF8));
    } catch (UnsupportedEncodingException e) {
      throw new RuntimeException("not expected", e);
    }
  }

  private Source asSource(String string) {
    try {
      return new StreamSource(new ByteArrayInputStream(string.getBytes(UTF8)));
    } catch (UnsupportedEncodingException e) {
      throw new RuntimeException("not expected", e);
    }
  }

  private void checkCanonizationForFile(String file)
      throws IOException, XmlParseException, UnsupportedEncodingException {

    InputStream is = getClass().getResourceAsStream(file + ".xml");
    ByteArrayOutputStream os = new ByteArrayOutputStream();

    cut.conditionalCanonicalizeXml(is, os);

    InputStream refInputStream = getClass().getResourceAsStream(file + ".canonized");

    String refString = inToString(refInputStream);
    String result = new String(os.toByteArray(), UTF8);
    assertEquals(refString, result);
  }

  private String inToString(InputStream in) throws IOException, UnsupportedEncodingException {
    BufferedInputStream ref = new BufferedInputStream(in);
    byte[] buffer = new byte[4096];
    int numBytes = ref.read(buffer);
    String refString = new String(buffer, 0, numBytes, UTF8);
    return refString;
  }

  private String canonicalize(String rawXml) throws Exception {
    ByteArrayInputStream bis = new ByteArrayInputStream(rawXml.getBytes(UTF8));
    ByteArrayOutputStream bos = new ByteArrayOutputStream();
    cut.canonicalizeXml(bis, bos);
    return new String(bos.toByteArray(), UTF8);
  }

  private static Document parse(InputStream template) throws Exception {
    DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
    Document document = docBuilder.parse(template);
    return document;
  }
}
