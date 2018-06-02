package iyte.edu.year2018.ceng437.hw01;

public class Shipment {

	private int purchaseAmount;
	private int numberOfItems;
	private DeliveryDay deliveryDay;

	public Shipment(int purchaseAmount, 
					int numberOfItems, 
					DeliveryDay deliveryDay) {
		
		setPurchaseAmount(purchaseAmount);
		setNumberOfItems(numberOfItems);
		setDeliveryDay(deliveryDay);
	}

	public int getPurchaseAmount() {
		return purchaseAmount;
	}

	public void setPurchaseAmount(int purchaseAmount) {
		this.purchaseAmount = purchaseAmount;
	}

	public int getNumberOfItems() {
		return numberOfItems;
	}

	public void setNumberOfItems(int numberOfItems) {
		this.numberOfItems = numberOfItems;
	}

	public DeliveryDay getDeliveryDay() {
		return deliveryDay;
	}

	public void setDeliveryDay(DeliveryDay deliveryDay) {
		this.deliveryDay = deliveryDay;
	}

	@Override
	public String toString() {
		return "Shipment [purchaseAmount=" + purchaseAmount
				+ ", numberOfItems=" + numberOfItems 
				+ ", deliveryDay=" + deliveryDay + "]";
	}
	
}
