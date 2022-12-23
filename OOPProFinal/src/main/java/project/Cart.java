package project;

public class Cart {
	public String userid;
	public int itemid;
	public int quantity;
	public double price;
	public double total;
	public String address;
	public double wallet;
	public long phone;
	public String orderdate;
	public String deliverydate;
	
	public String status;

	public Cart(String userid, int itemid, int quantity, double price, double total, String address, double wallet,
			long phone, String orderdate, String deliverydate, String status) {
		super();
		this.userid = userid;
		this.itemid = itemid;
		this.quantity = quantity;
		this.price = price;
		this.total = total;
		this.address = address;
		this.wallet = wallet;
		this.phone = phone;
		this.orderdate = orderdate;
		this.deliverydate = deliverydate;
		this.status = status;
	}

	public Cart() {
		super();
	}
	
	
}
