/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.im.mycarsale;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author lahir
 */
public class JSONHelper {
    
    /*JSON single object example
    
    {"name":"John Johnson","street":"Oslo West 16","phone":"555 1234567"}
    
    */

    public static String convertToAJsonObject(HashMap<String, String> attributes)
    {
        String text="";
        
        text += "{";
        
        for(Map.Entry<String, String> e : attributes.entrySet())
        {
            text += "\"" + e.getKey() + "\"";   //key
            text += ":" ;
            text += "\"" + e.getValue() + "\"";   //value
            text += ",";
        }
        
        text = text.substring(0, text.length()-1);
        
        text += "}";
        //System.out.println(text);
        
        return text;
    }
    
    /*JSON object list example
    
     "employees":
    [
     {"firstName":"John", "lastName":"Doe"}, 
     {"firstName":"Anna", "lastName":"Smith"}, 
     {"firstName":"Peter","lastName":"Jones"}
     ]
            
     */
    
    public static String convertToJsonObjectSet(ArrayList<HashMap<String,String>> attributes, String collectionName) {

        String text="";
        
        text += "\""+collectionName+"\":[";
        
        for (HashMap<String, String> oneObj : attributes) {
            text += convertToAJsonObject(oneObj) ;
            text += "," ;
        }
        
        text = text.substring(0, text.length()-1);
        text += "]";
        System.out.println(text);
        
        return text;
    }
    
    public static String convertToJsonObjectSet(ArrayList<HashMap<String,String>> attributes) {

        String text="";
        
        text += "[";
        
        for (HashMap<String, String> oneObj : attributes) {
            text += convertToAJsonObject(oneObj) ;
            text += "," ;
        }
        
        text = text.substring(0, text.length()-1);
        text += "]";
        System.out.println(text);
        
        return text;
    }
    
    
    public static void main(String[] args) {
        
        HashMap<String,String> m= new HashMap<String,String>();
        m.put("name", "Lahiru Fernando");
        m.put("age", "22");
        m.put("sex", "male");
        
        HashMap<String,String> m2 = new HashMap<String,String>();
        m2.put("name", "Bhagya Fernando");
        m2.put("age", "25");
        m2.put("sex", "male");
        
        HashMap<String,String> m3 = new HashMap<String,String>();
        m3.put("name", "Irosh Kavinga");
        m3.put("age", "22");
        m3.put("sex", "male");
        
        //JSONHelper.convertToAJsonObject(m);
        
        ArrayList<HashMap<String,String>> obs = new ArrayList<HashMap<String,String>>();
        obs.add(m);
        obs.add(m2);
        obs.add(m3);
        //JSONHelper.convertToJsonObjectSet(obs, "users");
        JSONHelper.convertToJsonObjectSet(obs);
        
    }
    

}
