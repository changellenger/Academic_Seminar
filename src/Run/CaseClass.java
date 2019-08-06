package Run;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map.Entry;

public class CaseClass {

	ArrayList<String> caseList = new ArrayList<String>();

	
	public void setArrayList(String caseid){
		this.caseList.add(caseid);
	}
	
	public ArrayList<String> getCaseList(){
		return caseList;
	}
	
	public ArrayList<String> getHashCaseList() {
		ArrayList<String> HashCase = new ArrayList<String>(caseList);//new HashSet<String>
		return HashCase;
	}
	
	
	public void print(){
		System.out.println(caseList);
		System.out.println(getHashCaseList());
	}
}
