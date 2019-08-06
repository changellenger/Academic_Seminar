package Run;

import java.util.ArrayList;
import java.util.HashSet;

public class ResourceClass {

		ArrayList<String> resourceList = new ArrayList<String>();
		public void setArrayList(String caseid){
			this.resourceList.add(caseid);
		}

		public ArrayList<String> getResourceList() {
			return resourceList;
		}
		
		
		
		public ArrayList<String> getHashResourceList() {
			ArrayList<String> HashCase = new ArrayList<String>(new HashSet<String>(resourceList));//
			return HashCase;
		}
		
		public void print(){
			System.out.println(resourceList);
			System.out.println(getHashResourceList());

		}
}
