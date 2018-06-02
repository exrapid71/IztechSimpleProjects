// Ahmet Eroðlu 210201010
package iyte.edu.year2018.ceng437.hw01.test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import iyte.edu.year2018.ceng437.hw01.DeliveryDay;
import iyte.edu.year2018.ceng437.hw01.Shipment;

public class ShipmentTest {

	private int purchaseAmount;
	private int numberOfItems;
	private DeliveryDay deliveryDay;
	Shipment classUnderTest;

	@Before
	public void setUp() throws Exception {
		classUnderTest = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
	}

	@Test
	public void testPurchaseAmount() {
		purchaseAmount = 5;
		classUnderTest.setPurchaseAmount(purchaseAmount);
		int expected = classUnderTest.getPurchaseAmount();
		assertEquals(purchaseAmount, expected);
	}

	@Test
	public void testNumberOfItems() {
		numberOfItems = 5;
		classUnderTest.setNumberOfItems(numberOfItems);
		int expected = classUnderTest.getNumberOfItems();
		assertEquals(numberOfItems, expected);
	}

	@Test
	public void testDeliveryDay() {
		deliveryDay = DeliveryDay.NEXT_DAY;
		classUnderTest.setDeliveryDay(deliveryDay);
		DeliveryDay expected = classUnderTest.getDeliveryDay();
		assertEquals(deliveryDay, expected);
	}
}
