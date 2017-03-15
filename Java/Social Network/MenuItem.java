
public class MenuItem {

	private String mTitle;
	private MenuCommand mCommand;
	
	public MenuItem(String title ,MenuCommand command){
		mTitle=title;
		mCommand=command;		
	}
	public String getmTitle(){
		return mTitle;
	}
	public void execute(){
		if(mCommand!=null)
			mCommand.run();
	}
}
