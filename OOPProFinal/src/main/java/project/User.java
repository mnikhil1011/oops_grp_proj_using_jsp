package project;

public class User {
	public String username;
	public String userid;
	public String usertype;
	public String email;
	public String password;
	public String phone;
	public String address;
	public String wallet;
	public String securityQuestion;
	public String answer;
	public User(String username, String userid, String usertype, String email, String password, String phone,
			String address, String wallet, String securityQuestion, String answer) {
		super();
		this.username = username;
		this.userid = userid;
		this.usertype = usertype;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.wallet = wallet;
		this.securityQuestion = securityQuestion;
		this.answer = answer;
	}
	public User() {
		super();
	}
	
	
	
}
