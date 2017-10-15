
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
import com.mongodb.MongoException;
import com.mongodb.client.FindIterable;

public class Doctor  {
	
	String username;
	String name;
	String email;
	String phoneno;
	String location;
	String licenseNo;
	String password;
	//String description;
	//Description desc;

	public void addDoctorDetails(String username,String name, String email, String phoneno,String location,  String licenseNo,String password)
	{
		try{

			System.out.println("Hello Doctor");
			connection db=new connection("Doctor");
			Document document = new Document("username", username)
					.append("name", name)
					.append("email", email)
					.append("phoneno", phoneno)
					.append("location", location)
					.append("licenseno", licenseNo)
					.append("password", password);
		
			
			db.getCollection().insertOne(document);

		}
		 catch (MongoException e) {
			 System.out.println("In java");
			e.printStackTrace();
		 }
	
	
			
		
		}

		public int getDoctor(String username, String password) {
			
			connection db=new connection("Doctor");

			//For authenticating
			List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
			obj.add(new BasicDBObject("username", username));
			obj.add(new BasicDBObject("password", password));
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
				return 0;
			
			}
		public List<DBObject> getdocdetails(){
	   		
	   		MongoClientURI uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
	   		MongoClient mongoClient = new MongoClient(uri);
	        System.out.println("Connected to the database successfully");			
	        DB db = mongoClient.getDB("vaccuno");
	        DBCollection collection=db.getCollection("Doctor");
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
