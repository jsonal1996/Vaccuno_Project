import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoException;
import com.mongodb.client.FindIterable;

public class Customer  {

	String username;
	String name;
	String age;
	String sex;
	String phoneno;
	String email;
	String password;
	String location;


	public void addCustDetails(String username,String name,String age,String sex,String phoneno, String email,String password,String location) {

		try{

			System.out.println("Hello Customer");
			connection db=new connection("Customer");
			Document document = new Document("username", username)
					.append("name", name)
					.append("age", age)
					.append("sex", sex)
					.append("phoneno", phoneno)
					.append("email", email)
					.append("password", password);
		
			
			db.getCollection().insertOne(document);

			
		}
		catch (MongoException e) {
			System.out.println("In java");
			e.printStackTrace();
		}
	}

	public int getCustomer(String username, String password) {

		connection db=new connection("Customer");
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
	
		
	}

