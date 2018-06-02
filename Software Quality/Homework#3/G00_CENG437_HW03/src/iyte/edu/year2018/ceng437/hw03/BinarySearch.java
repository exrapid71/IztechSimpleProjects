package iyte.edu.year2018.ceng437.hw03;

public class BinarySearch {

	public int binarySearch1(int x, int[] array) {
		int i = 0, j = array.length - 1;
		while (j >= i) {
			int m = (i + j) / 2;
			if (array[m] > x)
				j = m - 1;
			else if (array[m] < x)
				i = m + 1;
			else
				return m;
		}
		return -1;
	}

	public int binarySearch2(int x, int[] array) {
		int i = 0, j = array.length - 1;
		while (j >= i) {
			int m = (i + j) / 2;
			if (array[m] > x) {
				j = m - 1;
				m = m - 1;
			} else if (array[m] < x)
				i = m + 1;
			else
				return m;
		}
		return -1;
	}
}
