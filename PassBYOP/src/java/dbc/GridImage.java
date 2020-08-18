/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbc;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.imageio.ImageIO;

public class GridImage implements Runnable {
    private BufferedImage image;
    private int rows, columns;
    private BufferedImage[][] smallImages;
    private int smallWidth;
    private int smallHeight;
    
    public GridImage(){
    
    }
    public GridImage(String filename, int rows, int columns) {
        this.rows = rows;
        this.columns = columns;
        try {
            image = ImageIO.read(new File(filename));
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.smallWidth = image.getWidth() / columns;
        this.smallHeight = image.getHeight() / rows;
        smallImages = new BufferedImage[columns][rows];
    }

    public void run() {
        int count = 0;
        for (int x = 0; x < columns; x++) {
            for (int y = 0; y < rows; y++) {
                smallImages[x][y] = image.getSubimage(x * smallWidth, y
                        * smallHeight, smallWidth, smallHeight);
                try {
                    ImageIO.write(smallImages[x][y], "png", new File("D:\\tile-"+(count++) + ".png"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public int getImage1(String filepth, int rows, int cols,String lid,String picno){
        int kk=0;
    try{
        BufferedImage image = ImageIO.read(new File(filepth));
        int cnt = 0;
        ArrayList<BufferedImage> smallimages=new ArrayList<BufferedImage>();
        BufferedImage imgs;
        int smallimage_Height = image.getHeight()/rows;
        int smallimage_Width = image.getWidth()/cols;
        int yCo = 0;
        
        int count = 0;
        for(int x=0; x<rows; x++){
            int xCo =0;
            for(int y=0; y<cols; y++)
            {
                    imgs = new BufferedImage(smallimage_Width, smallimage_Height, image.getType());
                    Graphics2D gr = imgs.createGraphics();
                    gr.drawImage(image,0,0, smallimage_Width, smallimage_Height,xCo,yCo,xCo+smallimage_Width,yCo+smallimage_Height,null);
                    gr.dispose();
                        File fl=new File(FilePath.path+"temp\\"+lid+"_"+picno+"_"+(count++) + ".png");
                        //File fl=new File(FilePath.path+"tmp\\grid.png");
                        ImageIO.write(imgs, "png", fl);                    
                    
                    cnt++;
                    xCo += smallimage_Width;
            }
            yCo+= smallimage_Height;
            kk=1;
        }
    }
    catch(Exception e){
        System.out.println("");
        kk=0;
    }
    return kk;
}
    public void getImage(String filename, int rows, int columns,String lid,String picno){
        try{
        rows = rows;
        columns = columns;
        image = ImageIO.read(new File(filename));
        
        smallWidth = image.getWidth() / columns;
        smallHeight = image.getHeight() / rows;
        smallImages = new BufferedImage[columns][rows];
        //------------------------------------------------------------------------------
        
        int count = 0;
        for (int x = 0; x < columns; x++) {
            for (int y = 0; y < rows; y++) {
                smallImages[x][y] = image.getSubimage(x * smallWidth, y * smallHeight, smallWidth, smallHeight);
                try {
                    ImageIO.write(smallImages[x][y], "png", new File(FilePath.path+"temp\\"+lid+"_"+picno+"_"+(count++) + ".png"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        } catch (Exception e) {
                    e.printStackTrace();
                }
        
    }
    
    public static void main(String[] args) {
        
        GridImage gd=new GridImage();
        gd.getImage1("D:\\Penguins.jpg",6, 5,"2","1");
//        GridImage image = new GridImage("C:\\Users\\rithu\\Documents\\NetBeansProjects\\PassBYOP\\web\\upfiles\\Img22022019015157PM.jpg",
//                6, 5);
//        new Thread(image).start();
    }
}