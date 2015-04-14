package example;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Tower {
	@Id
	private int id;
	private String name;
	private Double height;
	private int sides;
	private int siteId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public int getSides() {
		return sides;
	}
	public void setSides(int sides) {
		this.sides = sides;
	}
	public int getSiteId() {
		return siteId;
	}
	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}
	public Tower(int id, String name, Double height, int sides, int siteId) {
		super();
		this.id = id;
		this.name = name;
		this.height = height;
		this.sides = sides;
		this.siteId = siteId;
	}
	public Tower() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
