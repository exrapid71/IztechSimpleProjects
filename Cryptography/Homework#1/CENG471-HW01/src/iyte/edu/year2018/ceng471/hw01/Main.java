package iyte.edu.year2018.ceng471.hw01;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		ChineseRemainderTheorem chinese = new ChineseRemainderTheorem();
		ExtendedEuclideanAlgorithm extended = new ExtendedEuclideanAlgorithm();
		PrimalityTesting test = new PrimalityTesting();

		System.out.println("Menu:");
		System.out.println("1 : Chinese Remainder");
		System.out.println("2 : Extended Euclidean");
		System.out.println("3 : Gcd");
		System.out.println("4 : Prime Testing");
		System.out.println("5 : Exit");

		@SuppressWarnings("resource")
		Scanner stdin = new Scanner(System.in);
		int input = 0;
		while (stdin.hasNextLine()) {
			input = stdin.nextInt();
			if (input == 1) {
				chinese.run();
			} else if (input == 2) {
				extended.runExtended();
			} else if (input == 3) {
				extended.runGcd();
			} else if (input == 4) {
				test.run();
			} else if (input == 5) {
				System.out.println("Exiting");
				break;
			} else {
				System.out.println("Exiting");
				break;
			}

		}

	}

}
