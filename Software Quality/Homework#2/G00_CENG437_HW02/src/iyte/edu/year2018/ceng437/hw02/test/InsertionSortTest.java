package iyte.edu.year2018.ceng437.hw02.test;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import iyte.edu.year2018.ceng437.hw02.InsertionSort;

public class InsertionSortTest {

	private InsertionSort classUnderTest;

	@Before
	public void setUp() throws Exception {
		classUnderTest = new InsertionSort();
	}
	/*
	 * Arr[] = {3,2} N=2 Second Arr[] = {3} N=1 Third Arr[] ={2,3} N = 2
	 * 
	 */

	@Test
	public void testInsertionSortCase1() {
		int[] arr1 = { 3, 2 };
		int n = arr1.length;
		int[] actual = classUnderTest.insertionSort(arr1, n);
		int[] expected = { 2, 3 };
		assertArrayEquals(expected, actual);
	}

	@Test
	public void testInsertionSortCase2() {
		int[] arr1 = { 3 };
		int n = arr1.length;
		int[] actual = classUnderTest.insertionSort(arr1, n);
		int[] expected = { 3 };
		assertArrayEquals(expected, actual);
	}

	@Test
	public void testInsertionSortCase3() {
		int[] arr1 = { 2, 3 };
		int n = arr1.length;
		int[] actual = classUnderTest.insertionSort(arr1, n);
		int[] expected = { 2, 3 };
		assertArrayEquals(expected, actual);
	}
		
	@Test
	public void testInsertionSortErrCase1() {
		int[] arr1 = { 3, 2 };
		int n = arr1.length;
		int[] actual = classUnderTest.insertionSortErr(arr1, n);
		int[] expected = { 2, 3 };
		assertArrayEquals(expected, actual);
	}

	@Test
	public void testInsertionSortErrCase2() {
		int[] arr1 = { 3 };
		int n = arr1.length;
		int[] actual = classUnderTest.insertionSortErr(arr1, n);
		int[] expected = { 3 };
		assertArrayEquals(expected, actual);
	}

	@Test
	public void testInsertionSortErrCase3() {
		int[] arr1 = { 2, 3 };
		int n = arr1.length;
		int[] actual = classUnderTest.insertionSortErr(arr1, n);
		int[] expected = { 2, 3 };
		assertArrayEquals(expected, actual);
	}
	
	
	@Test
	public void testInsertionSortErrCase4() {
		int[] arr1 = { 12, 11, 1, 8, 7, 3, 11, 22, 45, 15};
		int n = arr1.length;
		int[] actual = classUnderTest.insertionSortErr(arr1, n);
		int[] expected = { 1, 3, 7, 8, 11, 11, 12, 15, 22, 45 };
		assertArrayEquals(expected, actual);
	}
	
	

}
