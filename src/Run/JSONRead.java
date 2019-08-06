package Run;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
 
public class JSONRead {
     public static void main(String[] args) {
 
JSONParser parser = new JSONParser();
 
try {
 
Object obj = parser.parse(new FileReader("test1.json"));
 
JSONObject jsonObject = (JSONObject) obj;

JSONObject actName = (JSONObject) jsonObject.get("geo-enricher");
//String name = (String) jsonObject.get("Register (start)");
System.out.println("act :"+actName.toString());
 

// loop array
JSONArray msg = (JSONArray) actName.get("inputQueue");
System.out.println("msg "+msg);
Iterator<String> iterator = msg.iterator();
while (iterator.hasNext()) {
System.out.println("detail: "+iterator.next());
}
long comp = (long) actName.get("consumers");
System.out.println("comp "+comp);

//loop 2nd array
JSONArray msg1 = (JSONArray) actName.get("inputThroughput");
Iterator<Long> iterator1 = msg1.iterator();
while (iterator1.hasNext()) {
System.out.println("throughput:"+iterator1.next());
}

} catch (FileNotFoundException e) {
e.printStackTrace();
} catch (IOException e) {
e.printStackTrace();
} catch (ParseException e) {
e.printStackTrace();
}

  }

}
