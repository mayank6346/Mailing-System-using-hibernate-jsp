package src.main.java;

import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="draft")
public class Draft {
	@Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "too")
	private String to;

	@Override
	public String toString() {
		return "Mails [id=" + id + ", to=" + to + ", cc=" + cc + ", bcc=" + bcc + ", message=" + message + ", from="
				+ from + "]";
	}
	private String cc;
	@Column(name = "bcc")
	private String bcc;
	@Column(name= "message")
	private String message;
	//	
	@Column(name = "frm")
	private String from;
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getBcc() {
		return bcc;
	}
	public void setBcc(String bcc) {
		this.bcc = bcc;
	}
	public Draft() {
		super();
		this.id =new Random().nextInt(10000);
	}
	
	

}
