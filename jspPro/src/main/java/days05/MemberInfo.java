package days05;

import java.io.Serializable;
import java.util.Date;

// javaBean
public class MemberInfo implements Serializable{
	private static final long serialVersionUID = 2490129593045133574L;
	
	private String id;
	private String passwd;
	private String name;
	private Date registerDate;
	private String email;
	
	public MemberInfo(String id, String passwd, String name, Date registerDate, String email) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.registerDate = registerDate;
		this.email = email;
	}
	
	public MemberInfo() {
		super();
	}

	//getter , setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
}
