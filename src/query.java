
import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;

public class query {
	String uname;
	String query;
	String reply;
	String docname;
	
	public void addQuery(String uname,String queryy) {
		
		System.out.println("Hello Query");
		connection db=new connection("Query");
		Document document = new Document("uname",uname)
				.append("query", queryy);
		db.getCollection().insertOne(document);
	
		
	}
	
	public List<DBObject> getQuery(String dname){
   		
   		MongoClientURI uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
   		MongoClient mongoClient = new MongoClient(uri);
        System.out.println("Connected to the database successfully");			
        DB db = mongoClient.getDB("vaccuno");

        DBCollection collection=db.getCollection(dname);
		DBCursor cursor = collection.find();

		
		
		System.out.println("In the java");
		List<DBObject> resultSet = new ArrayList<DBObject>();

   		while (cursor.hasNext()) {

	   		DBObject o = cursor.next();
	   		resultSet.add(o);

   		}

   		return resultSet;

   	}
	
	void addReply(String usename,String query,String reply){
		MongoClientURI uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
   		MongoClient mongoClient = new MongoClient(uri);
        System.out.println("Connected to the database successfully");			
        DB db = mongoClient.getDB("vaccuno");
        DBCollection collection=db.getCollection("Query");
        System.out.println("In adding reply");			

        DBObject obj= new BasicDBObject();
		obj.put("query", query);
        DBObject doc= new BasicDBObject();
		doc.put("reply", reply);
		doc.put("by", usename);
		
		collection.update(obj,new BasicDBObject("$set",doc));
		
		
	}


	
}


