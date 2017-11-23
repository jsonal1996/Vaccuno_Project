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

public class Rating {

	String doctor;
	String rating;

public void addRating(String dname, String rating) {
		float sum=0;
		MongoClientURI uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
   		MongoClient mongoClient = new MongoClient(uri);
		System.out.println("Connected to the database successfully");			
		DB db = mongoClient.getDB("vaccuno");
		DBCollection collection=db.getCollection(dname);
        System.out.println("Doc name: "+dname);		

		BasicDBObject query = new BasicDBObject();
		query.put("doctor", dname);
	
		BasicDBObject projection = new BasicDBObject();
		projection.get("rating");

		DBCursor findIterable = collection.find(query,projection);
		BasicDBObject info=new BasicDBObject();
		while(findIterable.hasNext()){
			info=(BasicDBObject) findIterable.next();
		}
		String re =(String)info.get("rating");
        System.out.println("re rating: "+re);		

		float sum1;
		if(re==null){
			sum1=Float.parseFloat(rating);
		}
		else{
			sum1=Float.parseFloat(re);
			sum1+=Float.parseFloat(rating);
			sum=(float)(sum1)/2;
	        System.out.println("inside rating: "+sum);		

		}
        System.out.println("Outside rating: "+sum);		

		
		connection db1=new connection(dname);
        System.out.println("In Ratingupdate");		
		Bson filter = new Document("doctor",dname);
		Bson newValue = new Document("rating",Float.toString(sum));
		Bson updateOperationDocument = new Document("$set", newValue);
//		collection.update
		db1.getCollection().updateOne(filter, updateOperationDocument);
		
		
	}

public float getRating(String dname) {

		float sum,count;
		sum=0;
		count=0;
		MongoClientURI uri = new MongoClientURI("mongodb://sonal:qwerty@ds013475.mlab.com:13475/vaccuno");
   		MongoClient mongoClient = new MongoClient(uri);
        System.out.println("Connected to the database successfully");			
        DB db = mongoClient.getDB("vaccuno");
        DBCollection collection=db.getCollection(dname);

		BasicDBObject query = new BasicDBObject();
		query.put("doctor", dname);
	
		BasicDBObject projection = new BasicDBObject();
		projection.get("rating");

		DBCursor findIterable = collection.find(query,projection);
		BasicDBObject info=new BasicDBObject();
		while(findIterable.hasNext()){
			info=(BasicDBObject) findIterable.next();
			
		}
		String re =(String) info.get("rating");
		sum = Float.parseFloat(re);
		return sum;

}
}

		
        

/*MongoCollection<Document> dbCollection = db.getCollection("example", Document.class);
AggregateIterable<org.bson.Document> aggregate = dbCollection.aggregate(Arrays.asList(new BsonField("average", new BsonDocument("$avg", new BsonString("$rating")))));
Document result = aggregate.first();
int rating = result.getDouble("average");
return rating;
}*/
