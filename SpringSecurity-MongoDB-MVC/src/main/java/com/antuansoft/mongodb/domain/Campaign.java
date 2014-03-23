package com.antuansoft.mongodb.domain;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "campaign" )
public class Campaign {
	

	
	private String id;
	private String name;
	private int cost;
	private String client;
	
	
	
	public Campaign() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Campaign(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	
	
	
	

}
