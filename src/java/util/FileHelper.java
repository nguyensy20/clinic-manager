/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

/**
 *
 * @author nguye
 */
public class FileHelper {
    public static String readFileByUrl(String url) throws FileNotFoundException, IOException {
        FileReader fr = new FileReader(url);
        String strFile ="";
        int i;
        while ((i = fr.read()) != -1) {
            strFile+=(char)i;
        }
        fr.close();
        return strFile;
    }

//    public static void readFileByUrl(String url) {
//        try {
//            File myObj = new File(url);
//            Scanner myReader = new Scanner(myObj);
//            while (myReader.hasNextLine()) {
//                String data = myReader.nextLine();
//                System.out.println(data);
//            }
//            myReader.close();
//        } catch (FileNotFoundException e) {
//            System.out.println("An error occurred.");
//            e.printStackTrace();
//        }
//    }

//    public static void main(String[] args) throws IOException {
//        String url = "test.txt";
//        readFileByUrl(url);
////        System.out.println(str);
//    }
}
