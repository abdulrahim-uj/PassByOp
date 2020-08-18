/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbc;

import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.Raster;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;

/**
 *
 * @author kiran
 */
public class Pixel {
   BufferedImage image1,image2;
   int width;
   int height;
   
   public Pixel() {
      
      try 
      {
         File input1 = new File("D:\\a.jpg");
         File input2 = new File("D:\\b.jpg");
         image1 = ImageIO.read(input1);
         width = image1.getWidth();
         height = image1.getHeight();
         
         int count = 0;
         for(int i=0; i<width; i++){
            for(int j=0; j<height; j++){            
               count++;
               Color c = new Color(image1.getRGB(i, j));
               System.out.println("S.No: " + count + " Red: " + c.getRed() +"  Green: " + c.getGreen() + " Blue: " + c.getBlue());
               
               
               
            }
         }         
      } catch (Exception e) {}
   }
   
   public static Image getImageFromArray(int[] pixels, int width, int height) {
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
            WritableRaster raster = (WritableRaster) image.getData();
            raster.setPixels(0,0,width,height,pixels);
            return image;
        }
   
   static public void main(String args[]) throws Exception 
   {
//        Pixel obj = new Pixel();
       
       
       File input1 = new File("D:\\b.jpg");
       File input2 = new File("D:\\a.png");
       File input3 = new File("D:\\c.jpg");
       
       try{ 
       System.out.println("-------------------------------------------------------------------------------");
        System.out.println("-------------------------------------------------------------------------------");
        
        BufferedImage img = ImageIO.read(input2); // Throws IOException
//        int[] pixels = img.getRGB(0,0, img.getWidth(), img.getHeight(), null, 0, img.getWidth());
//        
//        for (int i = 0; i < pixels.length; i++) {
//           int pixel = pixels[i];
//           System.out.println(""+pixel);
//        }
        
        // also available through the BufferedImage's Raster, in multiple formats.
        Raster r = img.getData();
        int[] pixel = r.getPixels(0,0,r.getWidth(), r.getHeight(), (int[])null);
        System.out.println(""+pixel.length+"---"+pixel[0]);
        
        int[] pixel3=pixel;
        
        BufferedImage img2 = ImageIO.read(input1); // Throws IOException
        
        // also available through the BufferedImage's Raster, in multiple formats.
        Raster r1 = img.getData();
        Raster r2 = img2.getData();
        int[] pixel1 = r2.getPixels(0,0,r2.getWidth(), r2.getHeight(), (int[])null);
        System.out.println(""+pixel1.length+"---"+pixel1[0]);
        
        int n=pixel.length;
        if(n>pixel1.length)
        {
            n=pixel1.length;
        }
        for (int i = 0; i < n; i++) {
           if(i%2==0){
               pixel[i]=pixel1[i];
           }   
           else{
//               pixel[i]=Math.abs(pixel[i]-pixel1[i]);
               pixel[i]=Math.abs(pixel[i]-3);
           }
        }
        
        System.out.print(r2.getWidth()+"-----"       + r2.getHeight());
        
        //Create a new image
        BufferedImage bi = new BufferedImage(r1.getWidth(), r1.getHeight(), BufferedImage.TYPE_INT_RGB);
        //Create a raster in which to write to
        WritableRaster raster2 = bi.getRaster();
        //Set the pixels in the raster
        raster2.setPixels(0, 0, r1.getWidth(), r1.getHeight(), pixel);
        //Attach the raster to the image
        bi.setData(raster2);
 
     //   String input = JOptionPane.showInputDialog(null, "Enter a name for the new image file");
//        File file = new File( "D:\\" + input + ".jpg");
//Write new file
        try{
        ImageIO.write(bi, "jpg", input3);
        }catch(IOException e){
            JOptionPane.showMessageDialog(null, e);
            
        }
        
        
        
        
        
//        Image im=getImageFromArray(pixel1, r2.getWidth(), r2.getHeight());
//        ImageIO.write((RenderedImage)im, "jpg",new File("D:\\out.jpg"));
        
       }
       catch(Exception e){
           System.out.println("err--"+e.getMessage());
       }
       
//       File input1 = new File("D:\\a.png");
//       File input2 = new File("D:\\b.jpg");
//       File input3 = new File("D:\\c.jpg");
//       
//       addImageWaterMarks(input1, input2, input3);
   } 
   
    public static String addImageWaterMarks(File watermarkImageFile, File sourceImageFile, File destImageFile) {
        try
        { 
        System.out.println("-------------------------------------------------------------------------------");
        System.out.println("-------------------------------------------------------------------------------");
        
        BufferedImage img = ImageIO.read(sourceImageFile); // Throws IOException
        
        // also available through the BufferedImage's Raster, in multiple formats.
        Raster r1 = img.getData();
        int[] pixel = r1.getPixels(0,0,r1.getWidth(), r1.getHeight(), (int[])null);
        System.out.println(""+pixel.length+"---"+pixel[0]);
        
        int[] pixel3=pixel;
        
        BufferedImage img2 = ImageIO.read(watermarkImageFile); // Throws IOException
        
        // also available through the BufferedImage's Raster, in multiple formats.        
        Raster r2 = img2.getData();
        int[] pixel1 = r2.getPixels(0,0,r2.getWidth(), r2.getHeight(), (int[])null);
        System.out.println(""+pixel1.length+"---"+pixel1[0]);
        
        for (int i = 0; i < pixel1.length; i++) {
           if(i%2==0){
               pixel[i]=pixel1[i];
           }   
           else{
//               pixel[i]=Math.abs(pixel[i]-pixel1[i]);
               pixel[i]=Math.abs(pixel[i]-3);
           }
        }
        
        System.out.print(r2.getWidth()+"-----"       + r2.getHeight());
        //Create a new image
        BufferedImage bi = new BufferedImage(r1.getWidth(), r1.getHeight(), BufferedImage.TYPE_INT_RGB);
        //Create a raster in which to write to
        WritableRaster raster2 = bi.getRaster();
        //Set the pixels in the raster
        raster2.setPixels(0, 0, r1.getWidth(), r1.getHeight(), pixel);
        //Attach the raster to the image
        bi.setData(raster2);
 
        String input = JOptionPane.showInputDialog(null, "Enter a name for the new image file");
        
        //Write new file
        try{
        ImageIO.write(bi, "jpg", destImageFile);
        }catch(IOException e){
            JOptionPane.showMessageDialog(null, e);
            
        }
       }
       catch(Exception e){
           System.out.println("err--"+e.getMessage());
       }
        return "";
    }
}
