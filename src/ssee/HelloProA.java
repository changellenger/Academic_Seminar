package ssee;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
 



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import Run.ProA;
 
public class HelloProA extends HttpServlet {
 
	String notif=null;
	JSONObject jobj = null;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		response.setContentType("text/event-stream");
		response.setCharacterEncoding("UTF-8");
		
		String file = "C://Users//Administrator//workspace//ProAB//DetailActivity600.mxml.mxml";//detail_activity_cut,repairExampleMin,T_PC2months, 141111, T_PCdateconvert2.mxml
		System.out.println("enter ");
		File Xmlfile = new File(file);
		//KXML k = new KXML(file);
		ProA pa = new ProA(file);
		//ProA p = new ProA();
		
		//EsperMains esperMain = new EsperMains();
		//esperMain.execute();
 
		PrintWriter writer = response.getWriter();
		
		while(!pa.isCompleted())
		{
			notif = pa.getInt();
			jobj = pa.getObject();
			//System.out.println(notif.toString());
			writer.write("data: "+notif+"\n\n");
			//writer.write("obj: "+jobj+"\n\n");
			writer.flush();
			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		writer.close();
		/*for (int i = 0; i < 20; i++) {
 
			writer.write("data: "+ System.currentTimeMillis() +"\n\n");
			writer.flush();
			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		writer.close();*/
	}
 
}