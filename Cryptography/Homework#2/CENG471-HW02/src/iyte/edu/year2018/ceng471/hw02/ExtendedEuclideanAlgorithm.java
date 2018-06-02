package iyte.edu.year2018.ceng471.hw02;

import java.math.BigInteger;
import java.util.Scanner;

public class ExtendedEuclideanAlgorithm {
	static BigInteger x = new BigInteger("0");
	static BigInteger y = new BigInteger("0");
	static BigInteger z = new BigInteger("0");

	public BigInteger extendedEuclideanAlgortihm(BigInteger p, BigInteger q) {

		BigInteger s = new BigInteger("0");
		BigInteger s_old = new BigInteger("1");
		BigInteger t = new BigInteger("1");
		BigInteger t_old = new BigInteger("0");
		BigInteger r = q;
		BigInteger r_old = p;
		BigInteger quotient;
		BigInteger tmp;

		while (r.compareTo(BigInteger.valueOf(0)) != 0) {
			quotient = r_old.divide(r);

			tmp = r;
			r = r_old.subtract(quotient.multiply(r));
			r_old = tmp;

			tmp = s;
			s = s_old.subtract(quotient.multiply(s));
			s_old = tmp;

			tmp = t;
			t = t_old.subtract(quotient.multiply(t));
			t_old = tmp;
		}

		x = s_old;
		y = t_old;
		return x;
	}

	public BigInteger extendedEuclideanAlgortihmGcd(BigInteger p, BigInteger q) {

		BigInteger s = new BigInteger("0");
		BigInteger s_old = new BigInteger("1");
		BigInteger t = new BigInteger("1");
		BigInteger t_old = new BigInteger("0");
		BigInteger r = q;
		BigInteger r_old = p;
		BigInteger quotient;
		BigInteger tmp;

		while (r.compareTo(BigInteger.valueOf(0)) != 0) {
			quotient = r_old.divide(r);

			tmp = r;
			r = r_old.subtract(quotient.multiply(r));
			r_old = tmp;

			tmp = s;
			s = s_old.subtract(quotient.multiply(s));
			s_old = tmp;

			tmp = t;
			t = t_old.subtract(quotient.multiply(t));
			t_old = tmp;
		}

		x = s_old;
		y = t_old;
		z = r_old;
		return z;
	}

	public void runExtended() {
		System.out.println(
				"Currently Running Extended Euclidean Algorithm Finder." + "Enter two numbers to find EEA pairs");
		@SuppressWarnings("resource")
		Scanner stdin = new Scanner(System.in);
		while (stdin.hasNextLine()) {

			String[] input = stdin.nextLine().split(" ");
			BigInteger p = new BigInteger(input[0]);
			p.add(new BigInteger(input[0]));
			BigInteger q = new BigInteger(input[1]);
			q.add(new BigInteger(input[1]));
			System.out.println("Result of Extended Euclidean Algortihm: " + extendedEuclideanAlgortihm(p, q) + " and "
					+ extendedEuclideanAlgortihm(q, p));
			break;

		}
	}

	public void runGcd() {

		System.out.println("Currently Running Gcd Finder." + "Enter two numbers to find GCD");
		@SuppressWarnings("resource")
		Scanner stdin = new Scanner(System.in);
		while (stdin.hasNextLine()) {

			String[] input = stdin.nextLine().split(" ");
			BigInteger p = new BigInteger(input[0]);
			p.add(new BigInteger(input[0]));
			BigInteger q = new BigInteger(input[1]);
			q.add(new BigInteger(input[1]));
			System.out.println("Result of Gcd Calculation with using Extended Euclidean Algorithm: "
					+ extendedEuclideanAlgortihmGcd(p, q));
			break;
		}
	}
}