package Run;

import java.io.FileWriter;
import java.io.IOException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
 
public class JSONSimple {
     public static void main(String[] args) {
 
JSONObject obj = new JSONObject();
obj.put("skills", "programming");
obj.put("age", new Integer(40));
 
JSONArray list1 = new JSONArray();
list1.add("HTML");
list1.add("XML");
 
obj.put("web", list1);

JSONArray list2 = new JSONArray();
list2.add("Java");
list2.add("C");

obj.put("desktop", list2);
 
try {
 
FileWriter file = new FileWriter("test.json");
file.write(obj.toJSONString());
file.flush();
file.close();
 
} catch (IOException e) {
e.printStackTrace();
}
 
System.out.print(obj);
 
     }
 
}


