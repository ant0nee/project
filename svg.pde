import java.io.*;
import org.apache.batik.transcoder.image.PNGTranscoder;
import org.apache.batik.transcoder.*;
import java.nio.file.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.*;
PImage svgToPng(String path) {
  try {
    String svg_URI_input = Paths.get(path).toUri().toURL().toString();
    TranscoderInput input_svg_image = new TranscoderInput(svg_URI_input); 
    OutputStream png_ostream = new FileOutputStream(path.replace(".svg",".png"));
    TranscoderOutput output_png_image = new TranscoderOutput(png_ostream);      
    PNGTranscoder my_converter = new PNGTranscoder();
    my_converter.transcode(input_svg_image, output_png_image);
    return loadImage(path.replace(".svg",".png")); 
  } catch (Exception e) {
    return null;
  }
}

boolean resizeSvg(String path, int _wid, int _hei) {
  try {
    DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
    Document doc = docBuilder.parse(path);
    Node svg = doc.getFirstChild();
    NamedNodeMap attr = svg.getAttributes();
    Node wid = attr.getNamedItem("width");
    wid.setTextContent(Integer.toString(_wid));
    Node hei = attr.getNamedItem("height");
    hei.setTextContent(Integer.toString(_hei));
    TransformerFactory transformerFactory = TransformerFactory.newInstance();
    Transformer transformer = transformerFactory.newTransformer();
    DOMSource source = new DOMSource(doc);
    StreamResult result = new StreamResult(new File(path));
    transformer.transform(source, result);
    return true;
  } catch (Exception e) {
    e.printStackTrace();
    return false;
  }
}