import java.io.*;
import org.apache.batik.transcoder.image.PNGTranscoder;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import java.nio.file.Paths;
import java.nio.file.Path;
boolean svgToPng(String path, int wid, int hei) {
  try {
    //resize svg file
    FileReader fr = new FileReader(dataPath("svg/"+path));
    BufferedReader textReader = new BufferedReader(fr);
    String line; 
    String lines = ""; 
    while ((line = textReader.readLine()) != null) {
      lines += line;
    }
    textReader.close(); 
    lines = lines.replaceFirst("svg","svg width=\""+Integer.toString(wid)+"\" height=\""+Integer.toString(hei)+"\"");
    FileWriter write = new FileWriter(dataPath("generated_svg/"+path));
    PrintWriter printLine = new PrintWriter(write); 
    printLine.write(lines);
    printLine.close(); 
    //save to .png
    String svg_URI_input = Paths.get(dataPath("generated_svg/"+path)).toUri().toURL().toString();
    TranscoderInput input_svg_image = new TranscoderInput(svg_URI_input); 
    OutputStream png_ostream = new FileOutputStream(dataPath("generated_png/"+path.replace("svg","png")));
    TranscoderOutput output_png_image = new TranscoderOutput(png_ostream);      
    PNGTranscoder my_converter = new PNGTranscoder();
    my_converter.transcode(input_svg_image, output_png_image);
    return true; 
  } catch (Exception e) {
   e.printStackTrace();
   return false;
  }
}