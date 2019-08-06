package Run;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Map.Entry;

import org.json.simple.JSONObject;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class TimeAnalysiss {
	
	Multimap<String,ArrayList<String>> timeMulti =  ArrayListMultimap.create();
	ArrayList<String> actlist;
	ArrayList<String> timelist;
	
	HashMap<String, Integer> actFreq = new HashMap<String, Integer>();
	HashMap<String, Double> actToAct = new LinkedHashMap<String, Double>();
	HashMap<String, Double> actToActTime = new HashMap<String, Double>();
	HashMap<String, Double> actToActFreq = new HashMap<String, Double>();
	HashMap<String, Double> actToActMax = new HashMap<String, Double>();
	HashMap<String, Double> actToActMin = new HashMap<String, Double>();
	HashMap<String, Double> instanceActToAct = new HashMap<String, Double>();
	HashMap<String, Double> instanceActToRes = new HashMap<String, Double>();
	
	LinkedHashSet<String> startList = new LinkedHashSet<String>(); 
	
	CaseClass caseClass;
	String oneActivity, twoActivity, pattern, time1, time2;
	Date startTime, endTime;
	double frequency, timediff;
	double sumTime=0;
	double averageTime=0;
	double maxActitivyTime=0;
	double minActivityTime=0;
	
	public CreateJSON cjson;
	
	
	public TimeAnalysiss (Multimap<String,ArrayList<String>> multi,CaseClass cas){
		this.timeMulti = multi;
		this.caseClass = cas;
	}

	public void setActAndTimeList(){
		for(Entry<String, Collection<ArrayList<String>>>  e : timeMulti.asMap().entrySet()) 
		{
			/*for(int i=0; i<caseClass.getCaseList().size();i++){
				actlist = new ArrayList<String>();
				timelist = new ArrayList<String>();

				if(e.getKey().equalsIgnoreCase(caseClass.getCaseList().get(i)))//(String)caseClass.getHashCaseList().get(i)
				{*/
					Iterator it = e.getValue().iterator();
					
					//first arraylist
					ArrayList from = (ArrayList) it.next();
					//store activity name
					String[] startAct = getStringList(from);
					String startActName = startAct[1]+"("+startAct[2]+")";
					startList.add(startActName);
					
					addAct(startActName);
					//prepare the next arraylist
					ArrayList to;
					while(it.hasNext())
					{
						to = (ArrayList) it.next();
						String[] fromList = getStringList(from);
						String[] toList = getStringList(to);
						
						//time different : assumption : succeeding activity start as soon as preceeding activity finish
						timestartSet(fromList[3]);
						timeendSet(toList[3]);
						
						pattern = toList[1]+"("+toList[2]+")";
						addAct(pattern);
						//System.out.println(fromList[3]+ " - " +toList[3]);
						setTimediff(startTime,endTime);
						
						//setting the activity-to-activity map
						pattern = fromList[1]+"("+fromList[2]+");"+toList[1]+"("+toList[2]+")";
						setactToActMap(pattern,getTimediff());
						
						//setting the instance activity-to-activity map
						pattern = fromList[0]+";"+fromList[1]+"("+fromList[2]+");"+toList[1]+"("+toList[2]+")";
						setInstanceActToActMap(pattern, getTimediff());
						
						//setInstanceActToResMap(pattern, getTimediff());
						
						//System.out.println("from  - to :"+fromList[0]+ "=="+ fromList[1]+"-"+toList[1]);
						
						from = to;
						//You don't need this anymore
						//actlist.add(ss.get(1).toString());
						//timelist.add(ss.get(3).toString());
						//System.out.println("time : "+ss.get(3).toString());
					}
					//setActToActMap(actlist,timelist);
				}
				//}
			//}
		//Open this section for static
		//cjson = new CreateJSON(this);
		//Open this section for static
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

	public void setActToActMap(ArrayList<String> actlist, ArrayList<String> timelist){
		frequency = 0;
		for(int i=0; i<actlist.size();i++){
			if(i+1<actlist.size()){
			oneActivity = actlist.get(i);
			twoActivity = actlist.get(i+1);
			time1 = timelist.get(i);
			time2 = timelist.get(i+1);
			timestartSet(time1);
			timeendSet(time2);
			setTimediff(startTime,endTime);
			pattern = oneActivity+","+twoActivity;
			setactToActMap(pattern,getTimediff());
			}
		}
	}
	
	public HashMap<String, Double> getActToActMap(){
		return actToAct;
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
	
	public void setcalculateTime(Date tm1, Date tm2){
		Date start = tm1;
	    Date end = tm2;
	    // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		long diff = end.getTime() - start.getTime();
		long diffDays = diff / (60 * 1000);
 
		System.out.println("날짜차이=" + diffDays);
		setMaxtime(diffDays);
		setMinTime(diffDays);
		setSumActTime(diffDays);
		setAverageTime(getSumActTime(),getFrequency());
		System.out.println("TimeMax:  "+getMaxTime());
		System.out.println("TimeMin:  "+getMinTime());
		System.out.println("TimeAverage:  "+getAverageTime());

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
	
	public double getTimediff(){
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
			double timeValue = actToActTime.get(pattern);
			timeValue+=timediffvalue;
			
			actToActTime.put(pattern, timeValue);
			//max
			double maxValue = actToActMax.get(pattern);
			if(timediffvalue > maxValue)
				actToActMax.put(pattern, maxValue);
			
			double minValue = actToActMin.get(pattern);
			if(timediffvalue < minValue)
				actToActMin.put(pattern, minValue);
				
				
			//min
		}
		else{
			actToAct.put(pattern, (double)timediffvalue);
			actToActMax.put(pattern, (double)timediffvalue);
			actToActMin.put(pattern, (double)timediffvalue);
			actToActTime.put(pattern, (double)timediffvalue);
			actToActFreq.put(pattern, 1.0);
			
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
	
	public void setInstanceActToResMap(String pattern, double timediffvalue){ //Map<String, Double>
		//setMaxtime(timediffvalue);
		if(instanceActToRes.containsKey(pattern)){
			double actValue=instanceActToRes.get(pattern);
			//assumption : store the average value of loop
			actValue = (actValue + timediffvalue) /2;

			instanceActToRes.put(pattern, actValue);
		}
		else{
			instanceActToRes.put(pattern, (double)timediffvalue);
		}
		//return instanceActToRes;
	}
	
	public void calActTime(double timediff){
		setMaxtime(timediff);
		
	}
	
	public double setMaxtime(double timediff){
			if(maxActitivyTime<=timediff){
				maxActitivyTime = timediff;
			}
		return maxActitivyTime;
	}
	public double getMaxTime(){
		return maxActitivyTime;
	}
	public double setMinTime(double timediff){
		if(minActivityTime==0){
			minActivityTime=timediff;
		}
				if(minActivityTime>=timediff){
					minActivityTime = timediff;
				}
			return minActivityTime;
	}
	
	public double getMinTime(){
		return minActivityTime;
	}
	
	public double setSumActTime(double timediff){
		sumTime+=timediff;
		return sumTime;
	}
	public double getSumActTime(){
		return sumTime;
	}
	public double setFrequency(){
		frequency++;
		return frequency;
	}
	
	public double getFrequency(){
		return frequency;
	}
	
	public double setAverageTime(double total, double fre){
		averageTime = total/fre;
		return averageTime;
	}
	
	public double getAverageTime(){
		return averageTime;
	}
	
	public JSONObject getProcessObj()
	{
		return cjson.getObject();
	}
	
	public LinkedHashSet<String> getStartList()
	{
		return startList;
	}
	
	public Map<String, Integer> getActFreq()
	{
		return actFreq;
	}
	
	/*public void getMultiMap(){

		for(Entry<String, Collection<ArrayList<String>>>  e : timeMulti.asMap().entrySet()) 
		{
			for(int i=0; i<caseClass.getHashCaseList().size();i++){
				System.out.println("size :  "+caseClass.getHashCaseList().size());
				if(e.getKey().equalsIgnoreCase(caseClass.getHashCaseList().get(i)))//(String)caseClass.getHashCaseList().get(i)
				{
					Iterator it = e.getValue().iterator();
						while(it.hasNext())
						{
							ArrayList ss = (ArrayList) it.next();
							System.out.println(ss.get(1).toString());
						}
				}
					//System.out.println(e.getKey()+": "+e.getValue());
				}
			}
	}
	
	public String getMultiMap (String c, int i)
	{
		String search="";
		for(Entry<String, Collection<ArrayList<String>>>  e : timeMulti.asMap().entrySet()) {
			if(e.getKey().equalsIgnoreCase(c))
			{
				Iterator it = e.getValue().iterator();
				int number=0;
				while(it.hasNext())
				{
					
					ArrayList ss = (ArrayList) it.next();
					if (number ==i)
					{
						search = (String) ss.get(1);
					 // System.out.println(ss.toString());
					  break;
					}
					number++;
				}
			}
			 // System.out.println(e.getKey()+": "+e.getValue());
			}
		return search;
	}
		*/

}
