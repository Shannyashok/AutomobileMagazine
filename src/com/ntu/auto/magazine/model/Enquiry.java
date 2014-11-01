package com.ntu.auto.magazine.model;

public class Enquiry {

	private int id;
	private String nature;
	private String name;
	private String email;
	private String comments;
	private String contact;
	
	public Enquiry() {
		super();
		this.id = 0;
		this.nature = "";
		this.name = "";
		this.email = "";
		this.comments = "";
		this.contact = "";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Enquiry [id=");
		builder.append(id);
		builder.append(", nature=");
		builder.append(nature);
		builder.append(", name=");
		builder.append(name);
		builder.append(", email=");
		builder.append(email);
		builder.append(", comments=");
		builder.append(comments);
		builder.append(", contact=");
		builder.append(contact);
		builder.append("]");
		return builder.toString();
	}
}
