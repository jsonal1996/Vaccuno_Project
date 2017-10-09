

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.bson.Document;

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

public class Vaccination {

	
	String name;
	String cost;
	String vendor;
	String disease;
	String minNoDoses;
	

	public void addVacc(String name,String cost,String vendor,String diseases, String minNoDoses) {
	
		System.out.println("Hello Vaccine");
		connection db=new connection("Vaccination");
		Document document = new Document("name", name)
				.append("cost", cost)
				.append("vendor", vendor)
				.append("disease", diseases)
				.append("minnodoses", minNoDoses);
	
		
		db.getCollection().insertOne(document);
	
		/*MongoClient mongo = new MongoClient("localhost", 27017);
		DB db = mongo.getDB("testdb");
		DBCollection table = db.getCollection("Vaccintion");
		BasicDBObject document = new BasicDBObject();
			
		document.put("name", name);
		document.put("cost", cost);
		document.put("vendor", vendor);
		document.put("disease", diseases);
		document.put("minnodoses", minNoDoses);
		
		table.insert(document);*/
	}


	/*public void displayVaccination() {
		MongoClientURI uri = new MongoClientURI("mongodb://<user1>:<123hello123>@ds163494.mlab.com:63494/vaccuno");
		MongoClient mongoClient = new MongoClient(uri);
		
		DB db = mongoClient.getDB(uri.getDatabase());
		DBCollection collection = db.getCollection("Vaccination");

		BasicDBObject query = new BasicDBObject();

	   	 query.put("name", name);
	   	 DBCursor cursor = collection.find();
	   	 while(cursor.hasNext()) {
   	     System.out.println(cursor.next());
   	 }
*/
	   	 
	   	 
	   	public List<DBObject> getdetails(){
	   		
	   		MongoClientURI uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
	   		MongoClient mongoClient = new MongoClient(uri);
	        System.out.println("Connected to the database successfully");			
	        DB db = mongoClient.getDB("vaccuno");
	        DBCollection collection=db.getCollection("Vaccination");
			DBCursor cursor = collection.find();

			
			
			System.out.println("In the java");
			List<DBObject> resultSet = new ArrayList<DBObject>();

	   		while (cursor.hasNext()) {

		   		DBObject o = cursor.next();
		   		resultSet.add(o);

	   		}

	   		return resultSet;

	   		
	        
	   		
	   	/*	MongoClient mongo = new MongoClient("localhost", 27017);
			DB db = mongo.getDB("testdb");
			DBCollection table = db.getCollection("Vaccintion");

	   		DBCursor cursor = table.find();
	   		List<DBObject> resultSet = new ArrayList<DBObject>();

	   		while (cursor.hasNext()) {

		   		DBObject o = cursor.next();
		   		resultSet.add(o);

	   		}

	   		return resultSet;

	   	}*/


	   	}
}

	

