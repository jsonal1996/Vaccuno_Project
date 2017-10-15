

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
	
		
	}

	   	 
	   	 
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

	   	}
	   	
	   	void deleteVaccine(String gname){
	   		MongoClientURI uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
	   		MongoClient mongoClient = new MongoClient(uri);
	        System.out.println("Connected to the database successfully");			
	        DB db = mongoClient.getDB("vaccuno");
	        DBCollection collection=db.getCollection("Vaccination");
	        System.out.println("In Vaccinedelete");			

	        DBObject obj= new BasicDBObject();
			obj.put("name", gname);
			
	        collection.remove(obj);
			
	   		
			System.out.println("In the java");
			
			
			
	   	}
	   	
	   	void updatevaccine(String costt,String namee){
	   		connection db=new connection("Vaccination");
	        System.out.println("In Vaccineupdate");		
			Bson filter = new Document("name",namee);
			Bson newValue = new Document("cost", costt);
			Bson updateOperationDocument = new Document("$set", newValue);
			db.getCollection().updateOne(filter, updateOperationDocument);

	   	}
}

	

