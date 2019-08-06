package Run;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Map;

import org.json.simple.JSONObject;
import org.xml.sax.helpers.DefaultHandler;


import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class ProA extends DefaultHandler{

	public static StringBuilder notif = new StringBuilder();
	public static JSONObject jobj = new JSONObject();
	public static JSONObject processObj = new JSONObject();
	
	
	 Multimap<String, ArrayList<String>> dataMultiList;
	 dataListt newFile;
	 String filename = null;
	 ArrayList<String> caseList = new ArrayList<String>();
	 ArrayList<String> activityList = new ArrayList<String>();
	 ArrayList<String> timeStempList = new ArrayList<String>();
	 ArrayList<String> ResourceList = new ArrayList<String>();
	 ArrayList<String> EventList = new ArrayList<String>();
	 int contantSize;
	 int caseSize;
	 int activitySize;
	 int resourceSize;
	 public boolean status;
	
	public ProA(String file) {
		if(file!=null){
		
		status = false;
		System.out.println("file : "+file);
		File Xmlfile = new File(file);
		newFile = new dataListt(Xmlfile.getPath());
		System.out.println("masuk");
		//System.out.println("string :"+getsome());
		ArrayList<String> aa = getTimeStempList();
		for(String sa : aa){
			//System.out.println("sa :"+sa);
		}
		getActToActMap();
		//getProcessMap();
		//printMultimap();
		for(ArrayList<String> ss : newFile.getArrayList())
		{
			for(String ss1 : ss)
			{
				System.out.print(ss1+" , ");
			}
			System.out.println();
		}
		}
	
		//run the log replay
		//execute();
		//ThreadEvent te = new ThreadEvent(newFile.getArrayList());
		
		
		ThreadEvent te = new ThreadEvent(newFile.getArrayList(), notif, jobj);
	}
	
	/*public void execute()
	{
		// 구성하기
				Configuration config = new Configuration();
				config.addEventTypeAutoName("Run");
				
				// Query 문 만들기
				EPServiceProvider epService = EPServiceProviderManager.getDefaultProvider(config);
				String epl = "select * from FactoryLine";// output all 
				EPStatement statement = epService.getEPAdministrator().createEPL(epl);
				
				// 출력하기
				EventListener listener = new EventListener(notif,jobj);
				statement.addListener(listener);
	}*/
	
	public static void main(String[] args){
		String file = "C://Users//USER//workspaceLuna//ProA//T_PC2months.mxml";//repairExampleMin,detail_activity_cut,T_PC2months, 141111, T_PCdateconvert2.mxml
		System.out.println("enter ");
		File Xmlfile = new File(file);
		//KXML k = new KXML(file);
		ProA pa = new ProA(file);
		//newFile = new dataList(Xmlfile.getPath());
		//pa.printMultimap();
		
		}
	
	public synchronized boolean isCompleted() {
		return status;
		}
	public ArrayList<String> getCaseList(){
		caseList = newFile.getCase().getCaseList();
		return caseList;
	}
	
	public ArrayList<String> getActivityList(){
		activityList = newFile.getActivity().getActivityList();
		return activityList;
	}
	
	public ArrayList<String> getTimeStempList(){
		timeStempList = newFile.getTimeStemp().getTimeStempList();
		return timeStempList;
	}
	
	public ArrayList<String> getResourceList(){
		ResourceList = newFile.getResource().getResourceList();
		return ResourceList;
	}
	
	public ArrayList<String> getEventList(){
		EventList = newFile.getEvnet().getEventList();
		return EventList;
	}
	
	public Integer getContantsSize(){
		contantSize = newFile.getCase().getCaseList().size();
		return contantSize;
	}
	public Integer getCaseSize(){
		caseSize = newFile.getCase().getHashCaseList().size();
		return caseSize;
	}
	public Integer getActivitySize(){
		activitySize = newFile.getActivity().getHashActivityList().size();
		return activitySize;
	}
	public Integer getResourceSize(){
		resourceSize = newFile.getResource().getHashResourceList().size();
		return resourceSize;
	}
	
	public String getsome(){
		StringBuffer s = new StringBuffer();
		s.append(newFile.getMultimap());
		return s.toString();
	}
	public void printMultimap(){
		
		//System.out.println("no file : "+newFile.getTimeAnalysis().getActToActMap());//getMultiMap());
		newFile.getTimeAnalysis().setActAndTimeList();
        Map<String, Double> atam = newFile.getTimeAnalysis().getActToActMap();
		
		for(Map.Entry<String, Double> dd : atam.entrySet())
		{
			//System.out.println(dd.getKey() + "--"+ dd.getValue());
		}
	}
	
	public void getActToActMap(){
		newFile.getTimeAnalysis().setActAndTimeList();
		//System.out.println(newFile.getTimeAnalysis().getActToActMap());
	}
	
	public synchronized String getProcessMap()
	{
		return newFile.getTimeAnalysis().getProcessObj().toString();
	}
	
	
	public synchronized String getInt()
	{
		return notif.toString();
	}
	
	public String getString()
	{
		return notif.toString();
	}
	
	public JSONObject getObject()
	{
		return jobj;
	}
	
}
