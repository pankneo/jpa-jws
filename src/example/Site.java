package example;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Site {
@Id	
private int id;
private String name;
private Double latitude;
private Double longitude;
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
public Double getLatitude() {
	return latitude;
}
public void setLatitude(Double latitude) {
	this.latitude = latitude;
}
public Double getLongitude() {
	return longitude;
}
public void setLongitude(Double longitude) {
	this.longitude = longitude;
}
public Site(int id, String name, Double latitude, Double longitude) {
	super();
	this.id = id;
	this.name = name;
	this.latitude = latitude;
	this.longitude = longitude;
}
public Site() {
	super();
	// TODO Auto-generated constructor stub
}

}
