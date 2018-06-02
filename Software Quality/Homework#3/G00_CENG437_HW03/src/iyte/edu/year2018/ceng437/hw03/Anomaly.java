package iyte.edu.year2018.ceng437.hw03;

public class Anomaly {
	/*
	 * Program anomaly has been defined by considering three operations, namely,
	 * define (d), reference (r), and undefine (u). The three sequences of
	 * operations identified to be program anomaly are dd, du, and ur. Briefly
	 * explain why each three-operation sequences are not considered to be program
	 * anomaly. In addition, give a small Java code snippet example to each program
	 * anomaly.
	 */
	public int ddAnomaly(int x, int[] array) {
		int i = 5;
		i = 6;
		System.out.print(i);
		return 0;

	}

	public int duAnomaly(int x, int[] array) {
		int i = 5;
		System.out.print(i);
		i = 2;
		return 0;
	}

	public int urAnomaly(int x, int[] array) {
		int i = 5;
		System.out.print(u);
		return 0;
	}

}
