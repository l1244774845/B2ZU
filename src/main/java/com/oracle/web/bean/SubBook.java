package com.oracle.web.bean;

public class SubBook extends Book{
	
	public Fenlei fenleis;

	public Fenlei getFenleis() {
		return fenleis;
	}

	public void setFenleis(Fenlei fenleis) {
		this.fenleis = fenleis;
	}

	@Override
	public String toString() {
		return "SubBook [fenleis=" + fenleis + "]";
	}

}
