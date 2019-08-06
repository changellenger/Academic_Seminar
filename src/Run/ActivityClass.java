package Run;

import java.util.ArrayList;
import java.util.HashSet;

public class ActivityClass {

	ArrayList<String> activityList = new ArrayList<String>();

	public void setArrayList(String caseid) {
		this.activityList.add(caseid);
	}

	public ArrayList<String> getActivityList() {
		return activityList;
	}

	public ArrayList<String> getHashActivityList() {
		ArrayList<String> HashCase = new ArrayList<String>(activityList);//new HashSet<String>(activityList)
		return HashCase;
	}
	
	public void print() {
		System.out.println(activityList);
		System.out.println(getHashActivityList());
	}
}
