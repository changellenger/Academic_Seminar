package Run;

import java.util.ArrayList;
import java.util.HashSet;

public class TimeStempClass {

	ArrayList<String> timeStempList = new ArrayList<String>();
	
	public void setArrayList(String caseid){
		this.timeStempList.add(caseid);
	}
	
	public ArrayList<String> getTimeStempList() {
		return timeStempList;
	}
	
	public ArrayList<String> getHashTimeStempList() {
		ArrayList<String> HashCase = new ArrayList<String>(timeStempList);//new HashSet<String>(timeStempList)
		return HashCase;
	}
	
	public void print(){
		System.out.println(timeStempList);
		//System.out.println(getHashTimeStempList());
	}
}
