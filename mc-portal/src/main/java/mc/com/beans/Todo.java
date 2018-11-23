package mc.com.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Todos")
public class Todo {
	private int id;
	private String name;
	private boolean iscomplete;
	
	public Todo() {
		// TODO Auto-generated constructor stub
	}
	
	public Todo(String name, boolean iscomplete) {
		this.name = name;
		this.iscomplete = iscomplete;
	}
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "name", nullable = false, length = 100)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "iscomplete")
	public boolean isIscomplete() {
		return iscomplete;
	}
	public void setIscomplete(boolean iscomplete) {
		this.iscomplete = iscomplete;
	}

	@Override
	public String toString() {
		return "Todo [id=" + id + ", name=" + name + ", iscomplete=" + iscomplete + "]";
	}
	
	
	
}
