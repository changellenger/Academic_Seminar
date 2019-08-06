package Run;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.Map.Entry;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class CreateJSON {

	HashMap<String, Integer> actFreq = new HashMap<String, Integer>();
	HashMap<String, Double> actToAct = new HashMap<String, Double>();
	HashMap<String, Double> actToActTime = new HashMap<String, Double>();
	HashMap<String, Double> actToActFreq = new HashMap<String, Double>();
	HashMap<String, Double> actToActMax = new HashMap<String, Double>();
	HashMap<String, Double> actToActMin = new HashMap<String, Double>();
	
	LinkedHashSet<String> startList = new LinkedHashSet<String>();
	
	public Set<String> actList = new HashSet<String>();
	
	public TimeAnalysiss ta;
	public TimeWindowMap twmap;
	public JSONObject obj = null;
	
	public CreateJSON(TimeAnalysiss ta) {
		this.ta = ta;
		this.actToAct = ta.getActToActMap();
		this.obj = new JSONObject();
		this.actFreq = (HashMap<String, Integer>) ta.getActFreq();
		this.startList = ta.getStartList();
		preparation();
		
	}
	
	public CreateJSON(TimeWindowMap twmap) {
		this.twmap = twmap;
		this.actToAct = twmap.getActToActMap();
		this.obj = new JSONObject();
		this.actFreq = (HashMap<String, Integer>) twmap.getActFreq();
		this.startList = twmap.getStartList();
		preparation();
		
	}
	
	public void preparation()
	{
		String actFrom, actTo;
		
		for(Entry<String, Double> theKey : actToAct.entrySet())
		{
			actFrom = theKey.getKey().split(";")[0];
			actTo = theKey.getKey().split(";")[1];
			double value = theKey.getValue();
			buildJSON(actFrom, actTo, value);
		}
	}
	
	public void buildJSON(String name1, String name2, double value)
	{
		JSONObject obj1 = new JSONObject();
		
		String nm1=null;
		String nm2=null;
		
		if(!actList.contains(name1))
			actList.add(name1);
			if(!actList.contains(name2))
			actList.add(name2);
		
		if(name1.length()>20){
			nm1 = name1.substring(0, 20);
			if( !actList.contains(name1))
			nm1 += "1";
		}
		     
		else{
			nm1 = name1;
		}
		if(name2.length()>20){
			nm2 = name2.substring(0, 20);
			if( !actList.contains(name2))
			nm2 += "1";
			
		}
			else{
			nm2 = name2;
			}
				
		//System.out.println("act name "+nm1+ " == "+nm2);
		int c1 = actFreq.get(name1);
		int c2 = actFreq.get(name2);
		
		//check it is a start
		if(startList.contains(name1))
		{
			obj1.put("consumers",1);
			obj1.put("count", c1);
			obj.put(nm1, obj1);
			
			obj1.put("consumers",2);
			obj1.put("count", c2);
			JSONArray list2 = new JSONArray();
			JSONArray list3 = new JSONArray();
			list2.add(nm1);
			list3.add((int)value);
			obj1.put("inputQueue", list2);
			obj1.put("inputThroughput", list3);
			obj.put(nm2, obj1);
			
		}else
			//if exist
			if(obj.containsKey(nm2))
			{	
				JSONObject obj2= new JSONObject();
				obj2.put("consumers",2);
				obj2.put("count", c2);
				
				JSONObject findObj =  (JSONObject) obj; 

				JSONObject actName = (JSONObject) findObj.get(nm2);
				//System.out.println("find object : "+findObj);
				//if(obj.)
				//JSONArray msg = (JSONArray) findObj.get(nm2);
				
				JSONArray msg;	
				if(actName.get("inputQueue")!=null){
					msg= (JSONArray) actName.get("inputQueue");
					 msg.add(nm1);
					 obj2.put("inputQueue", msg);
				}else
				{
					JSONArray list2 = new JSONArray();
					list2.add(nm1);
					obj2.put("inputQueue", list2);
				}
				 
				JSONArray msg1;
				if(actName.get("inputThroughput")!=null){
					msg1 = (JSONArray) actName.get("inputThroughput");
					msg1.add((int)value);
					obj2.put("inputThroughput", msg1);
				}else
				{
					JSONArray list3 = new JSONArray();
					list3.add((int)value);
					obj2.put("inputThroughput", list3);
				}
				
				//JSONArray list2 = new JSONArray();
				//JSONArray list3 = new JSONArray();
				//list2.add(nm1);
				//list3.add((int)value);
				//obj1.put("inputQueue", list2);
				//obj1.put("inputThroughput", list3);
				obj.put(nm2, obj2);
			}
			//if not exist
			else if(!obj.containsKey(nm2))
			{
				JSONObject obj3= new JSONObject();
				obj3.put("consumers",2);
				obj3.put("count", c2);
				JSONArray list2 = new JSONArray();
				JSONArray list3 = new JSONArray();
				list2.add(nm1);
				list3.add((int)value);
				obj3.put("inputQueue", list2);
				obj3.put("inputThroughput", list3);
				obj.put(nm2, obj3);
			}
		
		
		/*
		if(obj.containsKey(nm2))
		{
		obj1.put("consumers",2);
		obj1.put("count", 2);
		JSONArray list2 = new JSONArray();
		JSONArray list3 = new JSONArray();
		list2.add(nm1);
		list3.add(c);
		obj1.put("inputQueue", list2);
		obj1.put("inputThroughput", list3);
		}else
		{
			
		}
		
		
		if(obj.containsKey(nm2))
		{
			JSONObject obj2 = new JSONObject();
			//update the info
			JSONObject findObj =  (JSONObject) obj; 
			
			

			JSONObject actName = (JSONObject) findObj.get(nm2);
			System.out.println("find object : "+findObj);
			if(obj.)
			JSONArray msg = (JSONArray) findObj.get(nm2);
			
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
			
		}*/
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
