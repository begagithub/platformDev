public without sharing class M3_Examples 
{
	public String learningApex()
	{
		// To ensure the 'writingApex' variable has initialized
		// correctly and has a value, print it to the log so we 
		// can view its content before taking any other action 
		// that relies on it.
		String writingApex = 'I am writing Apex!';
		System.debug(writingApex);

		return writingApex;
	}

	public Account initializeNewAccount()
	{
		Account account = new Account(Name = 'Wired Brain');

		// We can also modify fields after the Account object
		// is initialized in memory
		account.BillingStreet = '123 Example Street';

		System.debug(account);

		return account;
	}
}