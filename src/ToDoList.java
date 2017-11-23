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


public class ToDoList {
	String name;
	String cost;
	String vendor;
	String disease;
	String minNoDoses;
	String status;
	
	public void addVaccTodoList(String collName,String name,String cost,String vendor,String diseases, String minNoDoses) {
   		
		System.out.println("Hello Vaccine");
		connection db=new connection(collName);
		Document document = new Document("name", name)
				.append("cost", cost)
				.append("vendor", vendor)
				.append("disease", diseases)
				.append("minnodoses", minNoDoses)
				.append("status","Not Asked for Appointment");
	
		
		db.getCollection().insertOne(document);
	
		
	}

   	
   	public List<DBObject> gettodolist(String name){
   		
   		MongoClientURI uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
   		MongoClient mongoClient = new MongoClient(uri);
        System.out.println("Connected to the database successfully");			
        DB db = mongoClient.getDB("vaccuno");
        DBCollection collection=db.getCollection(name);
		DBCursor cursor = collection.find();

		
		
		System.out.println("In the java");
		List<DBObject> resultSet = new ArrayList<DBObject>();

   		while (cursor.hasNext()) {

	   		DBObject o = cursor.next();
	   		resultSet.add(o);

   		}

   		return resultSet;

   	}
   	
   	
}
