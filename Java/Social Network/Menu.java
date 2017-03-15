import java.util.ArrayList;
import java.util.Scanner;


public class Menu {
	private ArrayList<MenuItem> menuItems;
	private Scanner scanner;
	
	public Menu(){
	    menuItems= new ArrayList<>();
	    scanner = new Scanner(System.in);
	}
	
	public void addItem(MenuItem item){
		menuItems.add(item);
		
	}
	
	public void display(){
		System.out.println("***********************************");
		for(int  i = 0 ; i < menuItems.size() ;i++){
			System.out.println("	 "+(i+1)+". "+menuItems.get(i).getmTitle());
		}
		System.out.println("***********************************");
		int userChoice = 0;
		boolean validChoice= false;
		while(!validChoice){
        System.out.println("Please enter your choice(1-"+menuItems.size()+")");
        userChoice = scanner.nextInt();
        if(userChoice>0 && userChoice<=menuItems.size())
        	validChoice=true;
        else
        	System.out.println("Invalid choice please enter between 1 to "+ menuItems.size());
		}
		
		menuItems.get(userChoice-1).execute();

	}

}
