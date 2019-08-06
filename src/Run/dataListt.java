package Run;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class dataListt extends DefaultHandler{

	private static final int ArrayList = 0;
	private static final int String = 0;
	String xmlFileName = null;
	//String content = null;
	String caseid = null;
	ArrayList<String> dataCollection;
	Multimap<String, ArrayList<String>> dataMulti = ArrayListMultimap.create();
	
	ArrayList<ArrayList<String>> allEvents = new ArrayList<ArrayList<String>>();

	CaseClass caseClass = new CaseClass();
	ActivityClass activityClass = new ActivityClass();
	EventClasss eventClass = new EventClasss();
	TimeStempClass timeStempClass = new TimeStempClass();
	ResourceClass resourceClass = new ResourceClass();
	TimeAnalysiss timeAnalysis = new TimeAnalysiss(dataMulti,caseClass);
	
	protected StringBuffer buffer = null;

	public dataListt(String fileName) {
		this.xmlFileName = fileName;
		parseDocument();
		
		//Sorting
		Collections.sort(allEvents, this.listComparator);

	}
		
	public void parseDocument() {
		SAXParserFactory factory = SAXParserFactory.newInstance();
		buffer = new StringBuffer();
		try {
			SAXParser parser = factory.newSAXParser();
			parser.parse(xmlFileName, this);
		} catch (ParserConfigurationException e) {
			System.out.println("ParserConfig error");
		} catch (SAXException e) {
			System.out.println("SAXException : xml not well formed");
		} catch (IOException e) {
			System.out.println(xmlFileName);
			System.out.println("IO error");
		}
	}

	public void startElement(String uri, String localName, String qName,
			Attributes attributes) throws SAXException {
		if (qName.equals("ProcessInstance")) {
			caseid = attributes.getValue("id");
		}
		
	}

	public void endElement(String uri, String localName, String qName)
			throws SAXException {

		switch (qName) {

		/*case "Process":
			break;*/
		/*case "AuditTrailEntry":
			dataCollection = new ArrayList<String>();
			System.out.println("audit :"+caseid + " -- "+content);
			break;*/
		case "WorkflowModelElement": // Activity
			dataCollection = new ArrayList<String>();
			dataCollection.add(caseid);
			String act = buffer.toString().trim();
			dataCollection.add(act);
			caseClass.setArrayList(caseid);
			activityClass.setArrayList(act);
			//System.out.println("activity :"+caseid + " -- "+content);
			//System.out.println("act :"+act);
			break;
		case "EventType":
			String evType = buffer.toString().trim();
			dataCollection.add(evType);
			eventClass.setArrayList(evType);
			//System.out.println("event type :"+evType);
			break;
		case "Timestamp":
			String tsString = buffer.toString().trim();
			dataCollection.add(tsString);
			timeStempClass.setArrayList(tsString);
			//if(!tsString.substring(0, 4).equalsIgnoreCase("2012") && !tsString.substring(0, 4).equalsIgnoreCase("2013"))
				//System.out.println("time stamp :"+tsString);
			//Date timestamp = XmlUtils.parseXsDateTime(tsString);
			break;
		case "Originator": // Resource
			String resource = buffer.toString().trim();
			dataCollection.add(resource);
			resourceClass.setArrayList(resource);
			dataMulti.put(caseid, dataCollection);
			//save all events
			allEvents.add(dataCollection);
			break;
		}
		buffer.delete(0, buffer.length());
	}

	public void characters(char[] ch, int start, int length)
			throws SAXException {
		buffer.append(ch, start, length);

	}

	public Multimap<String, ArrayList<String>> getMultimap() {
		return dataMulti;
	}
	
	public ArrayList<ArrayList<String>> getArrayList() {
		return allEvents;
	}
	

	
	
	public CaseClass getCase()
	{return caseClass;}
	public ActivityClass getActivity()
	{return activityClass;}
	public EventClasss getEvnet()
	{return eventClass;}
	public TimeStempClass getTimeStemp()
	{return timeStempClass;}
	public ResourceClass getResource()
	{return resourceClass;}
	public TimeAnalysiss getTimeAnalysis()
	{return timeAnalysis; }

    public ArrayList<ArrayList<String>> getAllEvents()
    {
    	return allEvents;
    }
	
    public static Comparator<ArrayList<String>> listComparator = new Comparator<ArrayList<String>>() {

    	public int compare(ArrayList<String> s1, ArrayList<String> s2) {
    	   String listName1 = s1.get(3);
    	   String listName2 = s2.get(3);

    	   //ascending order
    	   return listName1.compareTo(listName2);

    	   //descending order
    	   //return StudentName2.compareTo(StudentName1);
        }};
	
}
