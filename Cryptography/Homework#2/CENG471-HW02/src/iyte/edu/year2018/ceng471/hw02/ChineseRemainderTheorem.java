package iyte.edu.year2018.ceng471.hw02;

import java.util.Scanner;
import java.math.BigInteger;
import java.util.ArrayList;

public class ChineseRemainderTheorem {

	static BigInteger x = new BigInteger("0");
	static BigInteger y = new BigInteger("0");

	public BigInteger chinese_remainder_theorem(ArrayList<BigInteger> A, ArrayList<BigInteger> Q, int k) {

		ExtendedEuclideanAlgorithm ex = new ExtendedEuclideanAlgorithm();
		BigInteger p, tmp;
		BigInteger prod = new BigInteger("1");
		BigInteger sum = new BigInteger("0");

		for (int i = 0; i < k; i++)
			prod = prod.multiply(Q.get(i));

		for (int i = 0; i < k; i++) {
			p = prod.divide(Q.get(i));
			tmp = ex.extendedEuclideanAlgortihm(p, Q.get(i));
			sum = sum.add(A.get(i).multiply(tmp).multiply(p));
		}

		return sum.mod(prod);
	}

	public void run() {

		@SuppressWarnings("resource")
		Scanner stdin = new Scanner(System.in);
		int k = 0;

		System.out.println("Enter variable with the given form:");
		System.out.println("First How many different modulo you will enter:\n" + "Then the modulos "
				+ "Finally the remainders for that modolos");
		System.out.println("For example if we want o enter 2 modulos " + "And their values will be 3 mod5 and 2 mod3");
		System.out.println("Your input should be: 2 3 5 2 3");

		ArrayList<BigInteger> A;
		ArrayList<BigInteger> Q;

		while (stdin.hasNextLine()) {

			A = new ArrayList<BigInteger>();
			Q = new ArrayList<BigInteger>();

			String[] input = stdin.nextLine().split(" ");

			k = Integer.parseInt(input[0]);
			int i = 0;
			for (i = 1; i <= k; i++) {
				Q.add(new BigInteger(input[(i)]));
				A.add(new BigInteger(input[(i + k)]));

			}

			System.out.println("Result of Chinese Remainder Theorem: " + chinese_remainder_theorem(A, Q, k).toString());
			break;
		}
	}
}
