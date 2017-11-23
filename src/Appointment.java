import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.async.SingleResultCallback;
import com.mongodb.client.result.DeleteResult;

public class Appointment {

	String uname;
	String name;
	String cost;
	String vendor;
	String disease;
	String minNoDoses;
	List<String> date;
	
	public void addAppointment(String dname,String uname,String name,String cost,String vendor,String diseases, String minNoDoses) {
		
		System.out.println("Hello Appointment");
		connection db=new connection(dname);
		Document document = new Document("uname",uname)
				.append("name", name)
				.append("cost", cost)
				.append("vendor", vendor)
				.append("disease", diseases)
				.append("minnodoses", minNoDoses);
	
		
		db.getCollection().insertOne(document);
	
		
	}
	
	public List<DBObject> getAppointment(String dname){
   		
   		MongoClientURI uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
   		MongoClient mongoClient = new MongoClient(uri);
        System.out.println("Connected to the database successfully");			
        DB db = mongoClient.getDB("vaccuno");
        String output = dname.substring(0, 1).toUpperCase() + dname.substring(1);

		System.out.println("Helllo doc "+output);

        DBCollection collection=db.getCollection(output);
		DBCursor cursor = collection.find();

		
		
		System.out.println("In the java");
		List<DBObject> resultSet = new ArrayList<DBObject>();

   		while (cursor.hasNext()) {

	   		DBObject o = cursor.next();
	   		resultSet.add(o);

   		}

   		return resultSet;

   	}
	
	int updateStatusApproval(String namee,String usename){
   		connection db=new connection(usename);
		Bson filter = new Document("name",namee);
        System.out.println("In Statusupdate");	
        
        List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
		obj.add(new BasicDBObject("name", namee));
		obj.add(new BasicDBObject("status","Approved"));
		BasicDBObject query = new BasicDBObject();
		query.put("$and", obj);
		System.out.println("In the java");
		// Getting the iterable object
		FindIterable<Document> iterDoc = db.getCollection().find(query);
        // Getting the iterator
        Iterator it = iterDoc.iterator();			
        if(it.hasNext()) {
   			return 1;
		}
		else
		{
			Bson newValue = new Document("status","Approved");
			Bson updateOperationDocument = new Document("$set", newValue);
			db.getCollection().updateOne(filter, updateOperationDocument);
			return 0;
		}
   	}
	
	int updateStatusPendApproval(String namee,String usename){
   		connection db=new connection(usename);
		Bson filter = new Document("name",namee);
        System.out.println("In Statusupdate");	
        
        List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
		obj.add(new BasicDBObject("name", namee));
		obj.add(new BasicDBObject("status","Approved"));
		BasicDBObject query = new BasicDBObject();
		query.put("$and", obj);
		System.out.println("In the java");
		// Getting the iterable object
		FindIterable<Document> iterDoc = db.getCollection().find(query);
        // Getting the iterator
        Iterator it = iterDoc.iterator();			
        if(it.hasNext()) {
   			return 1;
		}
		else
		{
			Bson newValue = new Document("status","Pending For Removal");
			Bson updateOperationDocument = new Document("$set", newValue);
			db.getCollection().updateOne(filter, updateOperationDocument);
			return 0;
		}
   	}
	
	void modifyAppointment(String usename,String vaccName,List<String> date){
		MongoClientURI uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
   		MongoClient mongoClient = new MongoClient(uri);
        System.out.println("Connected to the database successfully");			
        DB db = mongoClient.getDB("vaccuno");
        DBCollection collection=db.getCollection(usename);
        System.out.println("In modifyAppoint");			

        DBObject obj= new BasicDBObject();
		obj.put("name", vaccName);
	
		
		DBObject listItem = new BasicDBObject("dates",date);
		DBObject updateQuery = new BasicDBObject("$push", listItem);
		collection.update(obj,updateQuery);
		
		
	}
	
}
	
