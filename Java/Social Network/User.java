import java.io.Serializable;
import java.util.ArrayList;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5907626258651914861L;
	private String name;
	private ArrayList<String> posts = new ArrayList<String>();
	private ArrayList<User> following = new ArrayList<User>();
	
	public User(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void postMessage(String message) {
		posts.add(message);
	}
	
	public void follow(User u) {
		following.add(u);
	}
	public ArrayList<String> getPosts(){
		return posts;
		
	}
	public ArrayList<User> getFollowing(){
		return following;
		
	}
	@Override
	public String toString() {
		String s = name + " (" + posts.size() + ") following";
		for (User u: following)
			s = s + " " + u.getName();
		return s;
	}
}
