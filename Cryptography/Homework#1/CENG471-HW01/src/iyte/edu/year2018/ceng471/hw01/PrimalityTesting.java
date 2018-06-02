package iyte.edu.year2018.ceng471.hw01;

import java.math.*;
import java.util.Random;
import java.util.Scanner;

public class PrimalityTesting {

	private final static Random rand = new Random();

	private static BigInteger getRandom(BigInteger n) {

		while (true) {
			final BigInteger a = new BigInteger(n.bitLength(), rand);
			if (BigInteger.ONE.compareTo(a) <= 0 && a.compareTo(n) < 0) {
				return a;
			}
		}
	}

	public static boolean checkPrime(BigInteger n, int maxIterations) {
		if (n.equals(BigInteger.ONE))
			return false;
		for (int i = 0; i < maxIterations; i++) {
			BigInteger a = getRandom(n);
			a = a.modPow(n.subtract(BigInteger.ONE), n);

			if (!a.equals(BigInteger.ONE))
				return false;
		}
		return true;
	}

	public void run() {

		System.out.println("Currently Running Prime Testing." + "Enter a number to test it.");
		@SuppressWarnings("resource")
		Scanner stdin = new Scanner(System.in);

		while (stdin.hasNextLine()) {

			String[] input = stdin.nextLine().split(" ");

			BigInteger p = new BigInteger(input[0]);
			p.add(new BigInteger(input[0]));

			if (checkPrime(p, 20)) {
				System.out.println("probably prime");
			} else {
				System.out.println("non prime, composite");
			}
			break;
		}

	}
}
