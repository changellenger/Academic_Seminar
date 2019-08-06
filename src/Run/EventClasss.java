package Run;

import java.util.ArrayList;
import java.util.HashSet;

public class EventClasss {

	ArrayList<String> eventList = new ArrayList<String>();
	
	public void setArrayList(String caseid){
		this.eventList.add(caseid);
	}

	public ArrayList<String> getEventList() {
		return eventList;
	}
	
	public ArrayList<String> getHashEventList() {
		ArrayList<String> HashCase = new ArrayList<String>(new HashSet<String>(eventList));
		return HashCase;
	}
	
	public void print(){
		System.out.println(eventList);
		System.out.println(getHashEventList());
	}
}
