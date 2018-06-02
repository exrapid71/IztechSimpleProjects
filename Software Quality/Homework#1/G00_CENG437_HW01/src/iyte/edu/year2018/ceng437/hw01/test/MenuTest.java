// Ahmet Eroðlu 210201010
package iyte.edu.year2018.ceng437.hw01.test;

import static org.junit.contrib.java.lang.system.TextFromStandardInputStream.*;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.contrib.java.lang.system.TextFromStandardInputStream;
import iyte.edu.year2018.ceng437.hw01.DeliveryDay;
import iyte.edu.year2018.ceng437.hw01.Menu;

public class MenuTest extends Menu {

	private Menu classUnderTest;

	@Before
	public void setUp() throws Exception {
		classUnderTest = new Menu();
	}

	@Rule
	public final TextFromStandardInputStream systemInMock = emptyStandardInputStream();

	@Test
	public void testReadPurchaseAmount() {
		systemInMock.provideLines("5");
		int expect = classUnderTest.readPurchaseAmount();
		assertEquals(5, expect);
	}

	@Test
	public void testReadNumberOfItems() {
		systemInMock.provideLines("2");
		int expect = classUnderTest.readNumberOfItems();
		assertEquals(2, expect);
	}

	@Test
	public void testReadDeliveryDayNextDay() {
		systemInMock.provideLines("1");
		DeliveryDay expect = classUnderTest.readDeliveryDay();
		assertEquals(DeliveryDay.NEXT_DAY, expect);
	}

	@Test
	public void testReadDeliveryDayTwoDays() {
		systemInMock.provideLines("2");
		DeliveryDay expect = classUnderTest.readDeliveryDay();
		assertEquals(DeliveryDay.IN_TWO_DAYS, expect);
	}

	@Test
	public void testReadDeliveryDayWeek() {
		systemInMock.provideLines("3");
		DeliveryDay expect = classUnderTest.readDeliveryDay();
		assertEquals(DeliveryDay.IN_A_WEEK, expect);
	}

}
