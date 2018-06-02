package iyte.edu.year2018.ceng471.hw02.Des;

import iyte.edu.year2018.ceng471.hw02.Des.Client;

public class DH {

	public static void main(final String[] args) throws Exception {
		new DH().init();
	}

	void init() {

		final Client alice = new Client();
		final Client bob = new Client();
		alice.generateKeys();
		bob.generateKeys();
		alice.receivePublicKeyFrom(bob);
		bob.receivePublicKeyFrom(alice);
		alice.generateCommonSecretKey();
		bob.generateCommonSecretKey();
		alice.encryptAndSendMessage("Dh Test", bob);
		bob.whisperTheSecretMessage();
		System.out.println("The Shared Key" + bob.getPublicKey().toString());
	}
}