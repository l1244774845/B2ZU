package com.oracle.web.bean;

public class Book {

    private Integer bid;

    private String bname;

    private String price;

    private String chubanshe;

    private String zhuangtai;

    private String jieshuren;

    private Integer fId;

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }
    
    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname == null ? null : bname.trim();
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public String getChubanshe() {
        return chubanshe;
    }

    public void setChubanshe(String chubanshe) {
        this.chubanshe = chubanshe == null ? null : chubanshe.trim();
    }

    public String getZhuangtai() {
        return zhuangtai;
    }

    public void setZhuangtai(String zhuangtai) {
        this.zhuangtai = zhuangtai == null ? null : zhuangtai.trim();
    }

    public String getJieshuren() {
        return jieshuren;
    }

    public void setJieshuren(String jieshuren) {
        this.jieshuren = jieshuren == null ? null : jieshuren.trim();
    }

    public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }

	public Book(Integer bid, String bname, String price, String chubanshe, String zhuangtai,
			String jieshuren, Integer fId) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.price = price;
		this.chubanshe = chubanshe;
		this.zhuangtai = zhuangtai;
		this.jieshuren = jieshuren;
		this.fId = fId;
	}

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Book [bid=" + bid + ", bname=" + bname + ", price=" + price + ", chubanshe=" + chubanshe
				+ ", zhuangtai=" + zhuangtai + ", jieshuren=" + jieshuren + ", fId=" + fId + "]";
	}
    
    
}