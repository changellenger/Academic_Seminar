package Run;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ActivityMap {


	//process instance
	
	// activity with status
	public HashMap<String, Integer> events = null;
	//public HashMap<ArrayList<String>, Integer> instance = null;
	public HashMap<String, Integer> actToAct = null;
	//public ArrayList<String> ins = new ArrayList<String>();
	public ArrayList<String> trace = null;
	public ArrayList<String> traceActStat = null;
	public HashMap<String, ArrayList<String>> caseDetail = null;
	public HashMap<String, ArrayList<String>> instanceAct = null;
	public JSONObject obj = null;
	public Set<String> actList = new HashSet<String>();
	public Set<String> actAbb = new HashSet<String>();
	public boolean first=false;
	public boolean first1=false;
	
	
	SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	
	public ActivityMap()
	{
		this.events = new HashMap<String, Integer>();
		this.caseDetail = new HashMap<String, ArrayList<String>>();
		this.trace = new ArrayList<String>();
		this.instanceAct = new HashMap<String, ArrayList<String>>();
		this.traceActStat = new ArrayList<String>();
		this.actToAct = new HashMap<String, Integer>();
		this.obj = new JSONObject();
		this.actList = new HashSet<String>();
		this.actAbb= new HashSet<String>();
	}
	public void addEvent(String name, String status)
	{
		int count=1;
		//String namestatus = name+";"+status;
		String namestatus = name+" ("+status+")";
		//System.out.println("name status repositoryyyyyy "+namestatus);
		if(events.containsKey(namestatus))
		{
			count = events.get(namestatus);
			count++;
			events.put(namestatus, count);
			//JsonObj(namestatus, count);
		}else
		{
			events.put(namestatus, count);
		}
		//JsonObj(namestatus, count);
	}
	
	public void addInstance(String c, String name, String status, String machine, String time)
	{
		
		ArrayList<String> temp = new ArrayList<String>();
		//activity name + event type + resource name + time
		String insDetail = name+";"+status+";"+machine+";"+time;
		
		//add event : activity name + event type
		addEvent(name, status);
		//add event with instance ID 
		addInstanceAct(c, name, status);
		
		
		if(caseDetail.containsKey(c))
		{
			temp  = caseDetail.get(c);
			temp.add(insDetail);
			caseDetail.put(c, temp);
			//instance.put(insDetail, count);
			//JsonObj(insDetail, count);
		}
		else
		{
			/*String startDetail = "Start"+";"+"start"+";"+""+";"+time;
			addEvent("Start","start");
			temp.add(startDetail);*/
			temp.add(insDetail);
			caseDetail.put(c, temp);
		}
		//instance.put(insDetail, count);
		//JsonObj(insDetail, count);
	}
	
	public void addInstanceAct(String c, String name, String status)
	{
		ArrayList<String> temp = new ArrayList<String>();
		ArrayList<String> temp1 = new ArrayList<String>();
		//event that only complete
		//String eventName = name+";"+status;
		String eventName = name+" ("+status+")";
		
		//if(status.equalsIgnoreCase("complete")){
			
		if(instanceAct.containsKey(c.trim()))
		{
			
			temp  = instanceAct.get(c.trim());
			int size = temp.size();
			//System.out.println("size: "+size);
			String n1=null, n2=null;
			/*if(size==2)
			{
				n1 = temp.get(size-2).split(";")[0];
				n2 = temp.get(size-1).split(";")[0];
				System.out.println("is it okay "+n1+" -- "+n2);
				
			}*/
			
				
				//n2 = temp.get(size-1).split(";")[0];
			n2 = temp.get(size-1);
			//System.out.println("name ------------------------------------------:"+n2);
			temp.add(eventName);
			instanceAct.put(c.trim(), temp);
			//instance.put(insDetail, count);
			//JsonObj(insDetail, count);
			
			addActToAct(n2, eventName);
			
			//int count = checkCount(n2, name);
			int count = checkCount(n2, eventName);
			//addtoJSON(n2, name, count);
			//addtoJSON(n2, eventName, count);
			
		}
		else
		{

			//temp.add("Start"+";"+"start");
			temp.add(eventName);
			instanceAct.put(c.trim(), temp);
			//addActToAct("Start", name);
			//int count = checkCount("Start", name);
			//addtoJSON("Start", name, count);
			
			
		}
		//}
		
	}
	
	public void addActToAct(String n1, String n2)
	{
		String name = n1+";"+n2;
		int count=1;
		//System.out.println("check nameeeeeee "+name);
		if(actToAct.containsKey(name))
		{
			count = actToAct.get(name);
			count++;
			actToAct.put(name, count);
			
			
		}else
		{
			actToAct.put(name, count);
			
		}
	}
	
	public int checkCount(String n1, String n2)
	{
		int count=0;
		String name = n1+";"+n2;
		//System.out.println("check counttttttt :"+name);
		if(actToAct.containsKey(name))
		{
			count = actToAct.get(name);
						
		}
		return count;
	}
	
	public void addtoJSON(String name1,String name2, int c )
	{
		//check the number of activity
		//String namestatus1 = name1+";"+"Start";
		//String namestatus2 = name2+";"+"Start";
		//String namestatus1 = name1+";"+"complete";
		//String namestatus2 = name2+";"+"complete";
		//System.out.println("add to JSON----------------- "+namestatus1+"; " +namestatus2);
		//System.out.println("activity "+activity.get(namestatus1));
		//System.out.println("activity "+activity.get(namestatus2));
		int c1 = events.get(name1);
		int c2 = events.get(name2);
		//System.out.println("add to JSON444444444----------------- "+c1+" " +c2);
		
		
		String nm1 = null;
		
		//check the length of string of each activity
		String nm2 = null;
		//if no name1 and name2 in the activity list, add it!
		if(!actList.contains(name1))
		actList.add(name1);
		if(!actList.contains(name2))
		actList.add(name2);
		
		if(name1.length()>20){
			nm1 = name1.substring(0, 20);
			if(actAbb.contains(nm1) && !actList.contains(name1))
			nm1 += "-1";
		}
		     
		else{
			nm1 = name1;
		}
		if(name2.length()>20){
			nm2 = name2.substring(0, 20);
			if(actAbb.contains(nm2)&& !actList.contains(name2))
			nm2 += "-1";
			
		}
			else{
			nm2 = name2;
			}
		//System.out.println("Testing add to JSON");
		
			
		if(exist(name1, name2)){
			
		}
		
		
		//suppose A - B
		//if there is no A in the object, add A
		//if there is A in the object, update the count of A
		//
		
		/*		
		if(!obj.containsKey(nm1))
		{
			obj2.put("consumers",2);
			obj2.put("count", c2);
			//obj2.put("inputQueue", nm1);
			//obj2.put("inputThroughput", c);
			obj.put(nm2, obj2);
		}else
			//if there is A in the object, update the count of A
		if(obj.containsKey(nm1)){
			JSONObject act =  (JSONObject) obj.get(nm1);//.getJSONObject(0).getJSONObject("person");
			act.put("count", c2);
		}
		//check B
		if(!obj.containsKey(nm2))
		{
		obj2.put("consumers",2);
		obj2.put("count", c2);
		obj2.put("inputQueue", nm1);
		obj2.put("inputThroughput", c);
		obj.put(nm2, obj2);
		}*/
		
		/*
		obj2.put("consumers",2);
		obj2.put("count", c2);
		obj.put("start", obj2);
		//obj2.clear();
		obj2.put("consumers",2);
		obj2.put("count", c2);
		obj2.put("inputQueue", "start");
		obj2.put("inputThroughput", c);
		obj.put("next1", obj2);
		//obj2.clear();
		obj2.put("consumers",2);
		obj2.put("count", c2);
		obj2.put("inputQueue", "start");
		obj2.put("inputThroughput", c);
		obj.put("next2", obj2);*/
		//obj2.clear();
		
		
		
		//from
		//the first node should be created
		/*if(!first)
		{
			first=true;
			obj2.put("consumers",2);
			obj2.put("count", 1);
			obj.put(nm1, obj2);
		}*/
		//if exist --> update count only
		
		
		//to
		//JSONParser parser = new JSONParser();
		if(obj.containsKey(nm2))
		{
			JSONObject obj2 = new JSONObject();
			//update the info
			JSONObject findObj =  (JSONObject) obj; 
			
			

			JSONObject actName = (JSONObject) findObj.get(nm2);
			System.out.println("find object : "+findObj);
			/*if(obj.)
			JSONArray msg = (JSONArray) findObj.get(nm2);*/
			
			JSONArray msg;	
			if(actName.get("inputQueue")!=null){
				msg= (JSONArray) actName.get("inputQueue");
				 msg.add(nm1);
				 obj2.put("inputQueue", msg);
			}
			 
			JSONArray msg1;
			if(actName.get("inputThroughput")!=null){
				msg1 = (JSONArray) actName.get("inputThroughput");
				msg1.add(c);
				obj2.put("inputThroughput", msg1);
			}
			//JSONArray msg1 = (JSONArray) findObj.get(nm2);
			//JSONArray msg2 = (JSONArray) findObj.get("inputThroughput");
			obj2.put("consumers",2);
			obj2.put("count", c2);
			//System.out.println("msg : "+msg1+ " == "+nm1);
			
			//msg1.add(nm1);
			
			save(nm2, obj2);
		}else
			//if not exist --> add new
		{
			JSONObject obj1 = new JSONObject();
			System.out.println("enter nm2 "+nm1 + " --- "+nm2+ " == "+obj1.toString());
			
			if(obj.containsKey(nm1))
			{
				//JSONArray msg = (JSONArray) obj2.get("inputQueue");
				//obj2.put("consumers",2);
				
				obj1.put("count", c1);
				save(nm1, obj1);
			}else
				//if not exist --> add new
			{
				obj1.put("consumers",2);
				obj1.put("count", c1);
				//JSONArray list2 = new JSONArray();
				//JSONArray list3 = new JSONArray();
				//list2.add(nm1);
				//list3.add(c);
				//obj2.put("inputQueue", list2);
				//obj2.put("inputThroughput", list3);
				System.out.println("object nm1 -"+obj1.toString());
				System.out.println("JSON nm1 -"+obj.toString());
				save(nm1, obj1);
				//obj2.clear();
			}
			
			
			JSONObject obj3 = new JSONObject();
			
			
			obj3.put("consumers",2);
			obj3.put("count", c2);
			JSONArray list2 = new JSONArray();
			JSONArray list3 = new JSONArray();
			list2.add(nm1);
			list3.add(c);
			obj3.put("inputQueue", list2);
			obj3.put("inputThroughput", list3);
			System.out.println("object nm2 -"+obj3.toString());
			System.out.println("JSON nm2 -"+obj.toString());
			save(nm2,obj3);
			
		}
		
		
		//JSONArray list2 = new JSONArray();

		
		/*if(!obj.containsKey(nm1))
		{
			obj2.put("consumers",2);
			obj2.put("count", c2);
			//obj2.put("inputQueue", nm1);
			//obj2.put("inputThroughput", c);
			//obj.put(nm2, obj2);
			save(nm1, obj2);
		}else
		if(!obj.containsKey(nm2))
		{
		obj2.put("consumers",2);
		obj2.put("count", c2);
		obj2.put("inputQueue", nm1);
		obj2.put("inputThroughput", c);
		//obj.put(nm2, obj2);
		save(nm2, obj2);
		}*/

		
		
		
		System.out.println("=================");
		System.out.println(obj.size() + "=="+obj.toJSONString());
		System.out.println("================ "+name1 + " -- "+name2);
		
		//System.out.println(nm1 + " -- "+ obj.toJSONString());
		//System.out.println(name2 + " -- "+ obj.toJSONString());
	}
	
	public void save(String s1, JSONObject jobj)
	{
		obj.put(s1, jobj);
	}
	public boolean exist(String s1, String s2)
	{
		boolean exist=false;
		String nameToName = s1 + ";"+s2;
		if (actToAct.containsKey(nameToName))
			exist = true;
		else
			exist = false;
		return exist;
	}
	
	public void timediff(String s1, String s2 )
	{
		Date d1 = null;
	    Date d2 = null;
	    try {
			d1 = format.parse(s1);
			d2 = format.parse(s2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
	
	
	
	public String toString()
	{
		return obj.toJSONString();
	}
	
	public JSONObject getObject()
	{
		return obj;
	}
}
