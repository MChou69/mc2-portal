package mc.com.beans;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Todos")
public class Todo {
	private int id;
	private String note;
	private Date created;
	private Date deadline;
	private int x;
	private int y;
	private int z;
	private int importance;
	
	private boolean iscomplete;
	
	public Todo() {
		// TODO Auto-generated constructor stub
	}
	
	public Todo(String note, int importance, Date deadline) {
		this.note = note;
		this.importance=importance;
		this.created = new Date();
		this.deadline=deadline;
		this.iscomplete = false;
	}
		
	public Todo(String note, int x, int y, int z, int importance, Date deadline) {
		this.note = note;
		this.x = x;
		this.y = y;
		this.z = z;
		this.importance=importance;
		this.created = new Date();
		this.deadline=deadline;
		this.iscomplete = false;
	}
	
	public Todo(String note, int x, int y, int z, boolean iscomplete, int importance, Date deadline) {
		this.note = note;
		this.x = x;
		this.y = y;
		this.z = z;
		this.importance=importance;
		this.created = new Date();
		this.deadline=deadline;
		this.iscomplete = iscomplete;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "note", nullable = false, length = 100)
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}

	@Column(name = "x")
	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}
	@Column(name = "y")
	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}
	@Column(name = "zindex")
	public int getZ() {
		return z;
	}

	public void setZ(int z) {
		this.z = z;
	}
	@Column(name = "importance")
	public int getImportance() {
		return importance;
	}

	public void setImportance(int importance) {
		this.importance = importance;
	}
	
	@Column(name = "created")
	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
	@Column(name = "deadline")
	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
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
		return "Todo [id=" + id + ", note=" + note + ", iscomplete=" + iscomplete + "]";
	}
	
	
	
}
