/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dbc;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

/**
 *
 * @author kiranChellan
 */
public class ImageWatermarking {

    public static void main(String[] args) {
        File f1=new File("D:\\example\\a.jpg");
        File f2=new File("D:\\example\\b.jpg");
        File f3=new File("D:\\example\\c.jpg");
        
        ImageWatermarking m=new ImageWatermarking();
        m.addImageWatermarks(f1,f2,f3);
    }
    
    public void addImageWatermarks( File sourceImageFile,File watermarkImageFile, File destImageFile) {
    try 
    {   
//         BufferedImage image = ImageIO.read(sourceImageFile);
//         int widt = image.getWidth();
//         int heigh = image.getHeight();
//         
//         for(int i=0; i<heigh; i++){       
//            for(int j=0; j<widt; j++){            
//               Color c = new Color(image.getRGB(j, i));
//               int red = (int)(c.getRed() * 0.299);
//               int green = (int)(c.getGreen() * 0.587);
//               int blue = (int)(c.getBlue() *0.114);
//               Color newColor = new Color(red+green+blue,red+green+blue,red+green+blue);
//               image.setRGB(j,i,newColor.getRGB());
//            }
//         }
        
        BufferedImage sourceImage = ImageIO.read(sourceImageFile);
//        BufferedImage sourceImage = image;
        BufferedImage watermarkImage = ImageIO.read(watermarkImageFile);
        
        //watermarkImage=getScaledImage(watermarkImage, sourceImage.getWidth(), sourceImage.getHeight());
        
        int width=sourceImage.getWidth();
        int height=sourceImage.getHeight();
        
        int[][] srcpix = convertTo2DUsingGetRGB(sourceImage);
        System.out.println(srcpix[0].length+"---  "+srcpix[0][0]);
        int[][] waterpix = convertTo2DUsingGetRGB(watermarkImage);
        System.out.println(waterpix[0].length+"---");
        
        int k=0;

        int kkk[][]=maps(srcpix, waterpix);//2d watermarked array
        int tmp[]=new int[kkk.length*kkk[0].length];//to save one dimensional watermarked image
        
        for (int i = 0; i < kkk.length; i++) {
            for (int j = 0; j < kkk[0].length; j++) {
                tmp[k]=kkk[i][j];//saving pixel values to 1d array.
                k++;
            }
        }
        
        BufferedImage imagss = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        imagss.setRGB(0, 0, width, height, tmp, 0, width);//add pixels to tmp(1D array)
        ImageIO.write(imagss, "jpg", destImageFile);//saving image
        
    } catch (IOException ex) {
        System.err.println(ex);
    }
}
    /** Merge the red,blue,green components from two images */
	public static int[][] maps(int[][] sourceA, int[][] sourceB) 
        {
		// The output should be the same size as the input. Scale (x,y) values
		// when reading the background
		// (e.g. so the far right pixel of the source is merged with the
		// far-right pixel of the background).
		sourceB=resize(sourceB, sourceA.length, sourceA[0].length);
		int[][] newPic= new int[sourceA.length][sourceA[0].length];
		for(int bX=0; bX<sourceB.length; bX++)
                {
			for(int bY=0; bY<sourceB[0].length; bY++)
                        {
				int pixAR=RGBUtilities.toRed(sourceA[bX][bY]);
				int pixAG=RGBUtilities.toGreen(sourceA[bX][bY]);
				int pixAB=RGBUtilities.toBlue(sourceA[bX][bY]);
				
				int pixBR=RGBUtilities.toRed(sourceB[bX][bY]);
				int pixBG=RGBUtilities.toGreen(sourceB[bX][bY]);
				int pixBB=RGBUtilities.toBlue(sourceB[bX][bY]);
				
//                              int newPixR=(int)(((1.5*pixAR)+(0.5*pixBR))/2);
//				int newPixG=(int)(((1.5*pixAG)+(0.5*pixBG))/2);
//				int newPixB=(int)(((1.5*pixAB)+(0.5*pixBB))/2);
				int newPixR=(int)(((1.0*pixAR)+(0.4*pixBR))/2);
				int newPixG=(int)(((1.0*pixAG)+(0.4*pixBG))/2);
				int newPixB=(int)(((1.0*pixAB)+(0.4*pixBB))/2);
				
				newPic[bX][bY]= RGBUtilities.toRGB(newPixR, newPixG, newPixB);
			}
		}		
		return newPic;
	}
    public static int[][] resize(int[][] source, int newWidth, int newHeight) 
    {
	int srcW=source.length;
	int srcH=source[0].length;
	//double shrinkFactorSquaredHeight= newHeight/srcH;
	//double shrinkFactorSquaredWidth= newWidth/srcW;
	int[][] trgtPic= new int[newWidth][newHeight];
	
	for(int trgtX=0; trgtX< newWidth; trgtX++)	{
		for(int trgtY=0; trgtY< newHeight; trgtY++)	{
			int srcY=(int) ((trgtY/(double) newHeight)*srcH);//Math.sqrt(shrinkFactorSquaredHeight));
			int srcX=(int) ((trgtX/(double) newWidth)*srcW);//Math.sqrt(shrinkFactorSquaredWidth)));
			trgtPic[trgtX][trgtY]=source[srcX][srcY];
			
		}
	}
	return trgtPic; // Fix Me
	// Hints: Use two nested for loops between 0... newWidth-1 and 0.. newHeight-1 inclusive.
	// Hint: You can just use relative proportion to calculate the x (or y coordinate)  in the original image.
	// For example if you're setting a pixel halfway across the image, you should be reading half way across the original image too.
    }
    
    //new AffineTransform(1f,0f,0f,1f,x,y)
//   private BufferedImage getScaledImage(Image srcImg, int w, int h) {
//    BufferedImage resizedImg = new BufferedImage(w, h, Transparency.TRANSLUCENT);
//    Graphics2D g2 = resizedImg.createGraphics();
//    g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
//    g2.drawImage(srcImg, 0, 0, w, h, null);
//    g2.dispose();
//    return resizedImg;
//} 
   
//public void addImageWatermark(File watermarkImageFile, File sourceImageFile, File destImageFile) {
//    try {
//        BufferedImage sourceImage = ImageIO.read(sourceImageFile);
//        BufferedImage watermarkImage = ImageIO.read(watermarkImageFile);
// 
//        // initializes necessary graphic properties
//        Graphics2D g2d = (Graphics2D) sourceImage.getGraphics();
//        AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.3f);
//        g2d.setComposite(alphaChannel);
// 
//        System.out.print(sourceImage.getWidth()+"----"+ watermarkImage.getWidth());
//        // calculates the coordinate where the image is painted
//        int topLeftX = (sourceImage.getWidth() - watermarkImage.getWidth()) / 2;
//        int topLeftY = (sourceImage.getHeight() - watermarkImage.getHeight()) / 2;
//        
//        // paints the image watermark
//        g2d.drawImage(watermarkImage, topLeftX, topLeftY, null);
//        ImageIO.write(sourceImage, "png", destImageFile);
//        g2d.dispose();
//
//        System.out.println("The image watermark is added to the image.");
// 
//    } catch (IOException ex) {
//       System.err.println(ex);
//    }
//}

private static int[][] convertTo2DUsingGetRGB(BufferedImage image) {
      int width = image.getWidth();
      int height = image.getHeight();
      int[][] result = new int[height][width];

      for (int row = 0; row < height; row++) {
         for (int col = 0; col < width; col++) {
            result[row][col] = image.getRGB(col, row);
         }
      }
      return result;
   }

   private static String toString(long nanoSecs) {
      int minutes    = (int) (nanoSecs / 60000000000.0);
      int seconds    = (int) (nanoSecs / 1000000000.0)  - (minutes * 60);
      int millisecs  = (int) ( ((nanoSecs / 1000000000.0) - (seconds + minutes * 60)) * 1000);

      if (minutes == 0 && seconds == 0)
         return millisecs + "ms";
      else if (minutes == 0 && millisecs == 0)
         return seconds + "s";
      else if (seconds == 0 && millisecs == 0)
         return minutes + "min";
      else if (minutes == 0)
         return seconds + "s " + millisecs + "ms";
      else if (seconds == 0)
         return minutes + "min " + millisecs + "ms";
      else if (millisecs == 0)
         return minutes + "min " + seconds + "s";

      return minutes + "min " + seconds + "s " + millisecs + "ms";
   }
}
