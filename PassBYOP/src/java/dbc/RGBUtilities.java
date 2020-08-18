/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbc;

public class RGBUtilities {

	public static int toRed(int rgb) {
		int r = (rgb >> 16) & 0xFF;
		return r; // FIX ME
	}

	public static int toGreen(int rgb) {
		int g = (rgb >> 8) & 0xFF;
		return g; // FIX THIS
	}

	public static int toBlue(int rgb) {
		int b = rgb & 0xFF;
		return b; // FIX THIS
	}

	/**
	 * 
	 * @param r the red component (0..255)
	 * @param g the green component (0..255)
	 * @param b the blue component (0..255)
	 * @return a single integer representation the rgb color (8 bits per component) rrggbb
	 */
	static int toRGB(int r, int g, int b) {
		/* Suppose that rgb is an int that encodes a color.
		   To get separate red, green, and blue color components: *;*/
		   
		
		
		   
		/* Suppose that red, green, and blue are color components in
		   the range 0 to 255.  To combine them into a single int: */
		   
		int rgb = ((r << 16) | (g << 8)) | b;
		
		return rgb; // FIX THIS
	}

}