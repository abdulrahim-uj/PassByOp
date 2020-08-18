/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dbc;

/**
 *
 * @author vanaja
 */
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Sha1Hex {

    public String makeSHA1Hash(byte[] input)
            throws NoSuchAlgorithmException
        {
            System.out.print(input+"");
            MessageDigest md = MessageDigest.getInstance("SHA1");
            md.reset();
            byte[] buffer = input;
            md.update(buffer);
            byte[] digest = md.digest();

            String hexStr = "";
            for (int i = 0; i < digest.length; i++) {
                hexStr +=  Integer.toString( ( digest[i] & 0xff ) + 0x100, 16).substring( 1 );
            }
            System.out.print("----------------------------------------------------"+hexStr);
            return hexStr;
        }
}
