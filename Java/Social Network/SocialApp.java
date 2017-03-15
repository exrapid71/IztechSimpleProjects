import java.io.*;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Scanner;


public class SocialApp implements Serializable, MenuCommandSingleUser.UserProvider {
	private static final String MENU_SAVE_FILENAME = "social_app.bin";
	private static final long serialVersionUID = -1564620024652093239L;

	private ArrayList<User> users = new ArrayList<User>();
	private Map<String, User> userNameMap = new HashMap<String, User>();
	private Menu menu;
	
	public SocialApp() {
		createMenu();
	}

	public void run() {
		while(true){
			menu.display();
		}
	}
	
	public void save(String filename) {
		try {
			ObjectOutputStream fout = new ObjectOutputStream(new FileOutputStream(filename));
			fout.writeObject(users);
			fout.close();
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
	}

	public void load(String filename) {
		try{
		ObjectInputStream fin = new ObjectInputStream(new FileInputStream(filename));
		users = (ArrayList<User>)fin.readObject();
		userNameMap.clear();
		for (User u: users)
			userNameMap.put(u.getName(), u);
		fin.close();
		}
		catch (IOException | ClassNotFoundException e) {
			e.printStackTrace();
			return;
		}
	}

	private void createMenu() {
		menu = new Menu();

		String [] menuTitles = {
				"Add user", "List users", "Post message",
				"Message list", "Follow", "Following List", "Follower list",
				"Save", "Load", "Quit"
		};

		MenuCommand postMessageCmd = new MenuCommandSingleUser(this) {
			@Override
			public void processUser(User user, Scanner scanner) {
				System.out.println("Enter your message");
				String message = scanner.nextLine();
				user.postMessage(message);
			}};
			
		MenuCommand printMessagesCmd = new MenuCommandSingleUser(this) {
			@Override
			public void processUser(User user, Scanner scanner) {
				printMessages(user);
			}};
		MenuCommand printFollowingCmd = new MenuCommandSingleUser(this) {
				@Override
				public void processUser(User user, Scanner scanner) {
					printFollowing(user);
				}};
		MenuCommand printFollowerCmd = new MenuCommandSingleUser(this) {
			@Override
			public void processUser(User user, Scanner scanner) {
				printFollower(user);
			}};
		MenuCommand [] menuCommands = {
				new MenuCommand() {	
					@Override
					public void run() {
						System.out.println("What's your name?");
						Scanner scanner = new Scanner(System.in);
						String userName= scanner.nextLine();
						addUser(userName);
					}},
				new MenuCommand() {	@Override public void run() { printUsers();	}},
				postMessageCmd,
				printMessagesCmd,
				new MenuCommand() {
							@Override
							public void run() {
								Scanner scanner = new Scanner(System.in);
								User[] users = new User[2];
								String[] prompts = { "What's your name", "What's user's name who you want to follow" }; 
								for (int i = 0; i < 2; ++i) {
									while(users[i] == null){
										System.out.println(prompts[i]);
										String userName= scanner.nextLine();
										users[i] = findUser(userName);
										if (users[i] == null) {
											System.out.println("User does not exist, please enter an existing user");
										}
									}
								}
								users[0].follow(users[1]);
							}},
				printFollowingCmd,
				printFollowerCmd,			
				new MenuCommand() {	@Override public void run() { save(MENU_SAVE_FILENAME); }},
				new MenuCommand() { @Override public void run() { load(MENU_SAVE_FILENAME);	}},
				new MenuCommand() {
					@Override
					public void run() {
						System.out.println("Program ends");
						System.exit(0);		
					}}
		};

		for (int i = 0; i < menuTitles.length; ++i)
			menu.addItem(new MenuItem(menuTitles[i],menuCommands[i]));
	}
	
	public User findUser(String name) {
		return userNameMap.get(name);
	}
	
	private User addUser(String name) {
		User u = new User(name);
		users.add(u);
		userNameMap.put(name, u);
		return u;
	}
	
	private void printUsers() {
		for (User u:users)
			System.out.println(u.toString());
	}
	
	private void printMessages(User user){
		for (String m:user.getPosts())
			System.out.println(m);
		
	}
	
	private void printFollowing(User user){
		for (User followingUser:user.getFollowing())
			System.out.println(followingUser.getName());
	}
	
	private void printFollower(User user){
		ArrayList<User> follower = new ArrayList<>();
		for(int i = 0; i < users.size() ;i++){
			if(users.get(i).getFollowing().contains(user)){
				follower.add(users.get(i));
			}
			
		}
		for (User followerUser:follower)
			System.out.println(followerUser.getName());
	}
	
}
