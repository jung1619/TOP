package global.sesoc.TOPproject.VO;
 
public class User {
	
	private String id;
	private String pw;
	private String email;
	private String name;
	private String nickname;
	private String company;
	
	public User(){}
	public User(String id, String pw, String email, String name, String nickname, String company) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.company = company;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", email=" + email + ", name=" + name + ", nickname=" + nickname
				+ ", company=" + company + "]";
	}
	
}
