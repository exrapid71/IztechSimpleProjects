import java.util.Scanner;

public abstract class MenuCommandSingleUser implements MenuCommand {
	public interface UserProvider {
		User findUser(String userName);
	}

	private UserProvider userProvider;
	
	public MenuCommandSingleUser(UserProvider userProvider) {
		this.userProvider = userProvider;
	}
	
	@Override
	public void run() {
		Scanner scanner = new Scanner(System.in);
		User user = null;
		while(user == null){
			System.out.println("What's your name");
			String userName= scanner.nextLine();
			user = userProvider.findUser(userName);
			if (user == null) {
				System.out.println("User does not exist, please enter an existing user");
			}
		}
		processUser(user, scanner);
	}
	
	public abstract void processUser(User user, Scanner scanner);
}
