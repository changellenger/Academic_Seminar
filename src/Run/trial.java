package Run;

import java.util.Collection;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class trial {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Multimap<String, String> outdoorElements = ArrayListMultimap.create();
	    outdoorElements.put("fish", "walleye ");
	    outdoorElements.put("fish", "muskellunge");
	    outdoorElements.put("fish", "walleye ");
	    outdoorElements.put("insect", "ants");
	    outdoorElements.put("insect", "water boatman");
	    outdoorElements.put("insect", "Lord Howe Island stick insect");
	    outdoorElements.put("tree", "oak");
	    outdoorElements.put("tree", "birch");
	    
	    Collection<String> fishies = outdoorElements.get("fish");
	    
	    StringBuffer s = new StringBuffer();
		s.append(fishies);
		
		System.out.println(s.toString());
	    
	    //logger.info(fishies);

	    //assertTrue(fishies.size() == 3);
	}

}
