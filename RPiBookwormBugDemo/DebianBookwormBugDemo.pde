
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.Robot;
import java.awt.Rectangle;
import java.awt.AWTException;
import java.time.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.imageio.ImageIO;

Robot robot;
String fid;

void setup() {  
  size(640, 360);
  SimpleDateFormat mmddyyhhmmssSSS   = new SimpleDateFormat ("yyyy_MM_dd_HH_mm_ss_SSS");

  try{
    robot = new Robot(); /* java Robot class can be used to control mouse from within the program and inject keystrokes. */
  } catch (AWTException e) {
    e.printStackTrace();
  }
  
  Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
  System.out.println("screenSize="+screenSize.getWidth()+","+screenSize.getHeight());  
  System.getProperties().list(System.out);  
  
  BufferedImage bi = robot.createScreenCapture(new Rectangle((int)screenSize.getWidth(),(int)screenSize.getHeight()));
  String nowFormatted =mmddyyhhmmssSSS.format(new Date());
  fid=System.getProperty("user.home")+System.getProperty("file.separator")+nowFormatted+"_shouldBeNonBlank.png";
  File f = new File(fid);
  try {
    ImageIO.write(bi, "PNG", f);
  } catch (IOException e) {
    System.out.println("IOException "+e);
  }
  textSize(20);
}

void draw() {
  background(0);
  text("Fullscreen capture was perfromed...  png was saved as\n"+fid+"\nSystem properties listed in processing black console\nescape key will exit", 20, 120);
}
