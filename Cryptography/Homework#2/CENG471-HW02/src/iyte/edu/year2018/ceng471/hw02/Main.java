package iyte.edu.year2018.ceng471.hw02;

import java.io.IOException;
import java.util.Scanner;
import iyte.edu.year2018.ceng471.hw02.Rsa.*;
import iyte.edu.year2018.ceng471.hw02.Des.Des;
import iyte.edu.year2018.ceng471.hw02.ElGamal.*;

public class Main {

	@SuppressWarnings({ "resource", "static-access" })
	public static void main(String[] args) {
		ChineseRemainderTheorem chinese = new ChineseRemainderTheorem();
		ExtendedEuclideanAlgorithm extended = new ExtendedEuclideanAlgorithm();
		PrimalityTesting test = new PrimalityTesting();
		ElGamal elgamal = new ElGamal();
		RsaTest rsa = new RsaTest();
		Des des = new Des();
		System.out.println("Select A Encryption Method:");
		System.out.println("1 : Symmetrical encryption");
		System.out.println("2 : Asymmetrical encryption");
		System.out.println("3 : Exit");

		@SuppressWarnings("resource")
		Scanner stdin = new Scanner(System.in);
		int input = 0;
		int var = 0;
		while (stdin.hasNextLine()) {

			input = stdin.nextInt();
			if (input == 1) {
				des.run();
			} else if (input == 2) {
				System.out.println("Select A Encryption Method:");
				System.out.println("1 : Rsa ");
				System.out.println("2 : ElGamal");
				Scanner stdinput = new Scanner(System.in);
				var = stdinput.nextInt();
				if (var == 1) {
					try {
						rsa.run();
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else if (var == 2) {
					elgamal.run();
				} else {
					System.out.println("Error");
				}

			} else if (input == 3) {
				System.out.println("Exiting");
				break;
			} else {
				System.out.println("Exiting");
				break;
			}

			System.out.println("Select A Encryption Method:");
			System.out.println("1 : Symmetrical encryption");
			System.out.println("2 : Asymmetrical encryption");
			System.out.println("3 : Exit");

		}

	}

}
