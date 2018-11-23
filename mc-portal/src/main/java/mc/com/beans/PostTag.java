package mc.com.beans;
// Generated 13 nov. 2018 10:23:21 by Hibernate Tools 5.2.10.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * PostTag generated by hbm2java
 */
@Entity
@Table(name = "posttags")
public class PostTag implements java.io.Serializable {

	private int id;
	private Post posts;
	private Tag tags;

	public PostTag() {
	}

	public PostTag(int id, Post posts, Tag tags) {
		this.id = id;
		this.posts = posts;
		this.tags = tags;
	}

	@Id

	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Post_Id", nullable = false)
	public Post getPosts() {
		return this.posts;
	}

	public void setPosts(Post posts) {
		this.posts = posts;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Tag_Id", nullable = false)
	public Tag getTags() {
		return this.tags;
	}

	public void setTags(Tag tags) {
		this.tags = tags;
	}

}