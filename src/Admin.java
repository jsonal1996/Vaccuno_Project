import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.bson.Document;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoException;
import com.mongodb.client.FindIterable;

public class Admin {

	String username;
	String name;
	//String adminId;
	String email;
	String password;
	Admin(){
		System.out.println("in Admin consructor");

	}

	public void addAdmin(String username,String name,String email,String password) {
		try{

			System.out.println("Hello Admin");
			connection db=new connection("Admin");
			Document document = new Document("username", username)
					.append("name", name)
					.append("email", email)
					.append("password", password);
		
			
			db.getCollection().insertOne(document);

		}
		 catch (MongoException e) {
			 System.out.println("In java");
			e.printStackTrace();
		 }
}

	public int getAdmin(String username, String password) {
		try{
					
			connection db=new connection("Admin");
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
			catch (MongoException e) {
				e.printStackTrace();
				return 0;
			}
		
	}
}