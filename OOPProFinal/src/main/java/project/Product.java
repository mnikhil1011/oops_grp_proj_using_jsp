package project;

public class Product {
	public String itemname;
	public int itemcode;
	public double price;
	public double discount;
	public String qtyavailable;
	public String deliverydate;
	
	public String manager;

	public Product(String itemname, int itemcode, double price, double discount, String qtyavailable,
			String deliverydate, String manager) {
		super();
		this.itemname = itemname;
		this.itemcode = itemcode;
		this.price = price;
		this.discount = discount;
		this.qtyavailable = qtyavailable;
		this.deliverydate = deliverydate;
		this.manager = manager;
	}

	public Product() {
		super();
	}
	
}
