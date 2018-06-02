// Ahmet Eroðlu 210201010
package iyte.edu.year2018.ceng437.hw01.test;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import iyte.edu.year2018.ceng437.hw01.DecisionTable;
import iyte.edu.year2018.ceng437.hw01.DeliveryDay;
import iyte.edu.year2018.ceng437.hw01.Shipment;

public class DecisionTableTest extends DecisionTable {

	private DecisionTable classUnderTest;

	@Before
	public void setUp() throws Exception {
		classUnderTest = new DecisionTable();
	}

	@Test
	public void testCalculateShipmentCost() {
		Shipment shipment;
		int purchaseAmount;
		int numberOfItems;
		DeliveryDay deliveryDay;
		double cost[] = { 6.00, 2.50, 7.50, 3.50, 1.50 };
		double delta = 0.00;
		/*
		 * Case1 Number of Items : 6 Delivery Day : Next Day Purchase Amount : 40
		 * 
		 */
		purchaseAmount = 40;
		numberOfItems = 6;
		deliveryDay = DeliveryDay.NEXT_DAY;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case1 = classUnderTest.calculateShipmentCost(shipment);
		double exps1 = numberOfItems * cost[0];
		assertEquals(exps1, case1, delta);

		/*
		 * Case2 Number of Items : 6 Delivery Day : 2nd Day Purchase Amount : 40
		 * 
		 */
		purchaseAmount = 40;
		numberOfItems = 6;
		deliveryDay = DeliveryDay.IN_TWO_DAYS;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case2 = classUnderTest.calculateShipmentCost(shipment);
		double exps2 = numberOfItems * cost[1];
		assertEquals(exps2, case2, delta);

		/*
		 * Case3 Number of Items : 6 Delivery Day : A Week Purchase Amount : 40
		 * 
		 */
		purchaseAmount = 40;
		numberOfItems = 6;
		deliveryDay = DeliveryDay.IN_A_WEEK;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case3 = classUnderTest.calculateShipmentCost(shipment);
		double exps3 = 0;
		assertEquals(exps3, case3, delta);

		/*
		 * Case4 Number of Items : 2 Delivery Day : Next Day Purchase Amount : 40
		 * 
		 */
		purchaseAmount = 40;
		numberOfItems = 2;
		deliveryDay = DeliveryDay.NEXT_DAY;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case4 = classUnderTest.calculateShipmentCost(shipment);
		double exps4 = 25;
		assertEquals(exps4, case4, delta);

		/*
		 * Case5 Number of Items : 2 Delivery Day : 2nd Day Purchase Amount : 40
		 * 
		 */
		purchaseAmount = 40;
		numberOfItems = 2;
		deliveryDay = DeliveryDay.IN_TWO_DAYS;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case5 = classUnderTest.calculateShipmentCost(shipment);
		double exps5 = 10;
		assertEquals(exps5, case5, delta);

		/*
		 * Case6 Number of Items : 2 Delivery Day : A Week Purchase Amount : 40
		 * 
		 */
		purchaseAmount = 40;
		numberOfItems = 2;
		deliveryDay = DeliveryDay.IN_A_WEEK;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case6 = classUnderTest.calculateShipmentCost(shipment);
		double exps6 = numberOfItems * cost[4];
		assertEquals(exps6, case6, delta);

		/*
		 * Case7 Number of Items : 2 Delivery Day : Next Day Purchase Amount : 140
		 * 
		 */
		purchaseAmount = 140;
		numberOfItems = 2;
		deliveryDay = DeliveryDay.NEXT_DAY;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case7 = classUnderTest.calculateShipmentCost(shipment);
		double exps7 = 35;
		assertEquals(exps7, case7, delta);

		/*
		 * Case8 Number of Items : 2 Delivery Day : 2nd Day Purchase Amount : 140
		 * 
		 */
		purchaseAmount = 140;
		numberOfItems = 2;
		deliveryDay = DeliveryDay.IN_TWO_DAYS;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case8 = classUnderTest.calculateShipmentCost(shipment);
		double exps8 = 15;
		assertEquals(exps8, case8, delta);

		/*
		 * Case9 Number of Items : 2 Delivery Day : A week Purchase Amount : 40
		 * 
		 */
		purchaseAmount = 140;
		numberOfItems = 2;
		deliveryDay = DeliveryDay.IN_A_WEEK;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case9 = classUnderTest.calculateShipmentCost(shipment);
		double exps9 = 10;
		assertEquals(exps9, case9, delta);

		/*
		 * Case10 Number of Items : 6 Delivery Day : Next Day Purchase Amount : 140
		 * 
		 */
		purchaseAmount = 140;
		numberOfItems = 6;
		deliveryDay = DeliveryDay.NEXT_DAY;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case10 = classUnderTest.calculateShipmentCost(shipment);
		double exps10 = numberOfItems * cost[2];
		assertEquals(exps10, case10, delta);

		/*
		 * Case11 Number of Items : 6 Delivery Day : 2nd Day Purchase Amount : 140
		 * 
		 */
		purchaseAmount = 140;
		numberOfItems = 6;
		deliveryDay = DeliveryDay.IN_TWO_DAYS;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case11 = classUnderTest.calculateShipmentCost(shipment);
		double exps11 = numberOfItems * cost[3];
		assertEquals(exps11, case11, delta);

		/*
		 * Case12 Number of Items : 6 Delivery Day : A Week Purchase Amount : 140
		 * 
		 */
		purchaseAmount = 140;
		numberOfItems = 6;
		deliveryDay = DeliveryDay.IN_A_WEEK;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case12 = classUnderTest.calculateShipmentCost(shipment);
		double exps12 = numberOfItems * cost[1];
		assertEquals(exps12, case12, delta);

		/*
		 * Case13 Number of Items : 3 Delivery Day : Next Day Purchase Amount : 850
		 * 
		 */
		purchaseAmount = 850;
		numberOfItems = 3;
		deliveryDay = DeliveryDay.NEXT_DAY;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case13 = classUnderTest.calculateShipmentCost(shipment);
		double exps13 = 35;
		assertEquals(exps13, case13, delta);

		/*
		 * Case14 Number of Items : -1 Delivery Day : A Week Purchase Amount : 140
		 * 
		 */
		purchaseAmount = 140;
		numberOfItems = -1;
		deliveryDay = DeliveryDay.IN_A_WEEK;
		shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay);
		double case14 = classUnderTest.calculateShipmentCost(shipment);
		double exps14 = 10;
		assertEquals(exps14, case14, delta);

		/*
		 * Case15 Number of Items : -1 Delivery Day : Next Day Purchase Amount : 140
		 * 
		 * 
		 * purchaseAmount = 140; numberOfItems = 0; deliveryDay = DeliveryDay.NEXT_DAY;
		 * shipment = new Shipment(purchaseAmount, numberOfItems, deliveryDay); double
		 * case15 = classUnderTest.calculateShipmentCost(shipment); double exps15 = 10;
		 * assertEquals(exps15, case15, delta);
		 */

	}

}
