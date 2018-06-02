package iyte.edu.year2018.ceng437.hw02;

public class Main {

	public static void main(String[] args) {

		InsertionSort sort = new InsertionSort();
		int[] arr = { 12, 11, 1, 8, 7, 3, 11, 22, 45, 15 };
		int n = arr.length;
		System.out.println("Before Sort");
		printArray(arr);
		sort.insertionSort(arr, n);
		System.out.println("After Sort");
		printArray(arr);

	}

	static void printArray(int arr[]) {

		for (int i : arr) {
			System.out.print(i + " ");
		}
	}

}
