package Run;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Map.Entry;

import org.json.simple.JSONObject;

public class TimeWindowMap {

	ArrayList<ArrayList<String>> twMap;
	
	HashMap<String, ArrayList<String>> trace = new LinkedHashMap<String, ArrayList<String>>();
	
	HashMap<String, Integer> actFreq = new HashMap<String, Integer>();
	HashMap<String, Double> actToAct = new LinkedHashMap<String, Double>();
	HashMap<String, Double> instanceActToAct = new HashMap<String, Double>();
	HashMap<String, Double> instanceActToRes = new HashMap<String, Double>();
	
	LinkedHashSet<String> startList = new LinkedHashSet<String>(); 
	
	public JSONObject obj ;
	public StringBuilder notif ;
	
	Date startTime, endTime;
	double frequency, timediff;
	
	public CreateJSON cjson;
	
	public TimeWindowMap()
	{
		
	}
	
	public TimeWindowMap(StringBuilder notif, JSONObject jObj)
	{
		this.notif=notif;
		this.obj =jObj;
	}
	
	
	
	public void addArrayList(ArrayList<ArrayList<String>> twMap)
	{
		this.twMap = twMap;
	}
	
	public HashMap<String, Double> getActToActMap(){
		return actToAct;
	}
	
	//put in the order of instance ID
	public void setInstanceActToAct()
	{
		int sizeWindow=twMap.size();
		
		for(int i=0;i<sizeWindow;i++)
		{
			ArrayList<String> ev = twMap.get(i);
			System.out.println("EV "+ev);
			String[] evList = getStringList(ev); //event list
			String caseID = evList[0];
			String actName = evList[1];
			String evType = evList[2];
			String evName = actName +"("+evType+")";
			
			if(!trace.containsKey(caseID))
			{
				//if it is a new trace, add the act name into array list
				//startList.add(evName);
				ArrayList<String> newEvent = new ArrayList<String>();
				newEvent.add(evName);
				trace.put(caseID, newEvent);
			}else
			{
				//if there exist the case ID, add into the arrayList
				ArrayList<String> ev2;
				ev2 = trace.get(caseID);
				ev2.add(evName);
				trace.put(caseID, ev2);
			}
			
			//instanceActToAct.put(caseID, actName);
		}
	}
	
	public void setActToActMap()
	{
		int sizeWindow=twMap.size();
		
		String pattern;
		
		for(Entry<String, ArrayList<String>>  e : trace.entrySet()) 
		{
			
			Iterator it = e.getValue().iterator();
			
			//first arraylist
			//ArrayList from = (ArrayList) it.next();
			String from = (String) it.next();
			//store activity name
			//String[] startAct = getStringList(from);
			//String startActName = startAct[1]+"("+startAct[2]+")";
			startList.add(from);
			
			addAct(from);
			//prepare the next arraylist
			//ArrayList to;
			String to;
			while(it.hasNext())
			{
				to = (String) it.next();
				//String[] fromList = getStringList(from);
				//String[] toList = getStringList(to);
				
				//time different : assumption : succeeding activity start as soon as preceeding activity finish
				//timestartSet(fromList[3]);
				//timeendSet(toList[3]);
				
				//pattern = toList[1]+"("+toList[2]+")";
				pattern = to;
				addAct(pattern);
				//System.out.println(fromList[3]+ " - " +toList[3]);
				//setTimediff(startTime,endTime);
				
				//setting the activity-to-activity map
				//pattern = fromList[1]+"("+fromList[2]+");"+toList[1]+"("+toList[2]+")";
				pattern = from+";"+to;
				setactToActMap(pattern,1.0);
				
				//setting the instance activity-to-activity map
				//pattern = fromList[0]+";"+fromList[1]+"("+fromList[2]+");"+toList[1]+"("+toList[2]+")";
				pattern = e.getKey()+";"+from+";"+to;
				setInstanceActToActMap(pattern, 1.0);
				
				//setInstanceActToResMap(pattern, getTimediff());
				
				//System.out.println("from  - to :"+fromList[0]+ "=="+ fromList[1]+"-"+toList[1]);
				
				from = to;
				//You don't need this anymore
				//actlist.add(ss.get(1).toString());
				//timelist.add(ss.get(3).toString());
				//System.out.println("time : "+ss.get(3).toString());
			}
		}
		
		
		cjson = new CreateJSON(this);
		obj = cjson.getObject();
	}
	
	public void addAct(String actName)
	{
		if(actFreq.containsKey(actName))
		{
			int freq = actFreq.get(actName);
			freq++;
			actFreq.put(actName, freq);
		}else
		{
			
			actFreq.put(actName, 1);
		}
	}
	
	public double setTimediff(Date tm1, Date tm2){
		Date start = tm1;
	    Date end = tm2;
	    // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
	    //System.out.println(start + " "+end.getDate());
	    long diff=0;
	    long diffDays=0;
	    try{
		//diff = end.getTime() - start.getTime();
		//diffDays = diff / (60 * 1000);
	    }
	    catch(Exception e){
	    	//System.out.println(e.toString());
	    }
	    diff = end.getTime() - start.getTime();
		diffDays = diff / (60 * 1000);
		
		timediff = (double) diffDays;
		return timediff;
	}
	
	public void setactToActMap(String pattern, double timediffvalue){
		//setMaxtime(timediffvalue);
		//set frequency -- actToAct
		//set maximum time -- actToActMax
		//set mininum time -- actToActMin
		//set summation time -- actToActTime
		if(actToAct.containsKey(pattern)){
			//frequency
			double actValue=actToAct.get(pattern);
			actValue++;
			actToAct.put(pattern, actValue);
			//time
			/*double timeValue = actToActTime.get(pattern);
			timeValue+=timediffvalue;
			
			actToActTime.put(pattern, timeValue);
			//max
			double maxValue = actToActMax.get(pattern);
			if(timediffvalue > maxValue)
				actToActMax.put(pattern, maxValue);
			
			double minValue = actToActMin.get(pattern);
			if(timediffvalue < minValue)
				actToActMin.put(pattern, minValue);
				
				*/
			//min
		}
		else{
			actToAct.put(pattern, (double)1.0);
			/*actToActMax.put(pattern, (double)timediffvalue);
			actToActMin.put(pattern, (double)timediffvalue);
			actToActTime.put(pattern, (double)timediffvalue);
			actToActFreq.put(pattern, 1.0);*/
			
		}
		//return actToAct;
	}
	
	public void setInstanceActToActMap(String pattern, double timediffvalue){ //Map<String, Double> 
		//setMaxtime(timediffvalue);
		if(instanceActToAct.containsKey(pattern)){
			double actValue=instanceActToAct.get(pattern);
			//assumption : store the maximum value of loop
			if(actValue>timediffvalue)
			    instanceActToAct.put(pattern, actValue);
			else
				instanceActToAct.put(pattern, timediffvalue);
		}
		else{
			instanceActToAct.put(pattern, (double)timediffvalue);
		}
		//return instanceActToAct;
	}
	
	public double getTimediff(){
		return timediff;
	}
	
	public void timestartSet(String timestamp) {

		startTime = null;
		if (timestamp.length() >= "yyyy-MM-ddTHH:mm:ss".length()) {

			String format = "yyyy-MM-dd'T'HH:mm:ss";
			String end = timestamp.substring("yyyy-MM-ddTHH:mm:ss".length());
			timestamp = timestamp.substring(0, "yyyy-MM-ddTHH:mm:ss".length());
			if (!end.equals("")) {
				int ms = end.indexOf(".");
				int tz = end.indexOf("-");
				if (tz == -1) {
					tz = end.indexOf("+");
				}
				if (tz == -1) {
					tz = end.indexOf("Z");

				}
				int mse = 0;

				if (ms != -1) {
					mse = tz;
					if (mse == -1) {
						mse = end.length();
					}
					format += ".SSS";
					timestamp += ".";
					for (int i = 0; i < (mse - ms - 1); i++) {
						if (i > 2) {
							format += "S";
						}
						timestamp += end.charAt(i + 1);
					}
					for (int i = 0; i < 3 - (mse - ms - 1); i++) {
						timestamp += "0";
					}
				}
				if (tz != -1) {
					String timezone = end.substring(mse);

					if (timezone.length() == 1) {
						timezone = "+00:00";
					}
					timestamp += "GMT" + timezone;

					format += "z";

				}
			}
			SimpleDateFormat dateParser = new SimpleDateFormat(format);
			startTime = dateParser.parse(timestamp == null ? "" : timestamp,
				new ParsePosition(0));
		}
	}
	
	public void timeendSet(String timestamp) {

//		SimpleDateFormat dateParser = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
		endTime = null;
		if (timestamp.length() >= "yyyy-MM-ddTHH:mm:ss".length()) {

			String format = "yyyy-MM-dd'T'HH:mm:ss";
			String end = timestamp.substring("yyyy-MM-ddTHH:mm:ss".length());
			timestamp = timestamp.substring(0, "yyyy-MM-ddTHH:mm:ss".length());
			if (!end.equals("")) {
				// end now contains all optional elements, such as:
				// milliseconds and/or
				// timezone
				int ms = end.indexOf(".");
				int tz = end.indexOf("-");
				if (tz == -1) {
					tz = end.indexOf("+");
				}
				if (tz == -1) {
					tz = end.indexOf("Z");

				}
				int mse = 0;

				if (ms != -1) {
					// We have a milliseconds part
					mse = tz;
					if (mse == -1) {
						// no timezone
						mse = end.length();
					}
					format += ".SSS";
					timestamp += ".";
					for (int i = 0; i < (mse - ms - 1); i++) {
						if (i > 2) {
							format += "S";
						}
						timestamp += end.charAt(i + 1);
					}
					for (int i = 0; i < 3 - (mse - ms - 1); i++) {
						timestamp += "0";
					}

				}
				if (tz != -1) {
					// There is a timezone
					// mse is the first index of the timezone part
					String timezone = end.substring(mse);

					if (timezone.length() == 1) {
						// Timezone = 'Z'
						timezone = "+00:00";
					}
					timestamp += "GMT" + timezone;

					format += "z";

				}
			}
			SimpleDateFormat dateParser = new SimpleDateFormat(format);
			endTime = dateParser.parse(timestamp == null ? "" : timestamp,
				new ParsePosition(0));
		}
	}
	
	public String[] getStringList(ArrayList<String> arr)
	{
		String[] content = new String[5];
		content[0]=arr.get(0).toString(); // get case
		content[1]=arr.get(1).toString(); // get activity
		content[4]=arr.get(4).toString(); // get resource
		content[3]=arr.get(3).toString(); // get time
		content[2]=arr.get(2).toString(); // get event type
		return content;
	}
	
	public Map<String, Integer> getActFreq()
	{
		return actFreq;
	}
	
	public LinkedHashSet<String> getStartList()
	{
		return startList;
	}
	
	public String toString()
	{
		return obj.toJSONString();
	}
	
	public JSONObject getObject()
	{
		return obj;
	}
	
	public JSONObject getProcessObj()
	{
		return cjson.getObject();
	}
}
