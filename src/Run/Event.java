package Run;

public class Event {

	public String caseID;
	public String actName;
	public String eventType;
	public String timestamp;
	public String res;
	
	public Event(String cID, String aName, String eType, String tStamp, String res)
	{
		this.caseID = cID;
		this.actName = aName;
		this.eventType = eType;
		this.timestamp = tStamp;
		this.res = res;
	}
	
	public String getCaseID(){return caseID;}
	public String getActName(){return actName;}
	public String getEvType(){return eventType;}
	public String getTimeStamp(){return timestamp;}
	public String getResource(){return res;}
}
