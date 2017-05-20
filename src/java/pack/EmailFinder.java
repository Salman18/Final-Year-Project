/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pack;

import com.util.DbConnector;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author jp8
 */
public class EmailFinder {
   public  static  String getEmailId(String receiver){
        System.out.println("in email fiender");
        System.out.println("in email receiver  "+receiver);
        String receiverEmail = null;
        Connection conn= null;
        Statement smt=null;
        ResultSet rs= null;
         try{
             conn = DbConnector.getConnection();
             smt = conn.createStatement();
             rs = smt.executeQuery("select * from user where userid='"+receiver+"'");
             if(rs.next()){
                 receiverEmail = rs.getString("emailid");
             }
         }catch(Exception ex){
             ex.printStackTrace();
         }
         System.out.println("finally email id is  "+receiverEmail);
        return receiverEmail;
    } 
}
