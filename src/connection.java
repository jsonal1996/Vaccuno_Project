
import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.BulkWriteOperation;
import com.mongodb.BulkWriteResult;
import com.mongodb.Cursor;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.ParallelScanOptions;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase; 
import com.mongodb.MongoCredential;  

class connection {
	MongoClientURI uri;
	MongoClient mongoClient;
	MongoDatabase db;
	MongoCollection<Document> collection;
	connection(String collecname){
		
		try{
			uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
			mongoClient = new MongoClient(uri);
	        System.out.println("Connected to the database successfully");			
		 	db = mongoClient.getDatabase("vaccuno");
		 	collection=db.getCollection(collecname);
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public MongoClientURI getUri() {
		return uri;
	}
	public void setUri(MongoClientURI uri) {
		this.uri = uri;
	}
	public MongoClient getMongoClient() {
		return mongoClient;
	}
	public void setMongoClient(MongoClient mongoClient) {
		this.mongoClient = mongoClient;
	}
	public MongoDatabase getDb() {
		return db;
	}
	public void setDb(MongoDatabase db) {
		this.db = db;
	}
	public MongoCollection<Document> getCollection() {
		return collection;
	}
	public void setCollection(MongoCollection<Document> collection) {
		this.collection = collection;
	}
}

	