public without sharing class M4_Examples 
{
	private String aPrivateString = 'This is private';

	public void creatingLists()
	{
		List<String> stringValues = new List<String>();
		System.debug('stringValues.size() before additions: ' + 
			stringValues.size());

		String dripBrew = '12oz Drip Brew Coffee';

		stringValues.add(dripBrew);
		System.debug('stringValues.size() after additions: ' + 
			stringValues.size());
	}

	public void initializingLists()
	{
		List<String> coffeeTypes = new List<String>
		{
			'Drip Brew',
			'Iced Coffee',
			'Frappe'
		};
		System.debug('coffeeTypes.size(): ' + coffeeTypes.size());
	}

	public void uniqueAccountIds()
	{
		Account wiredBrainCoffee = new Account(Name = 'Wired Brain');
		Account globomantics = new Account(Name = 'Globomantics');
		Account otherGlobomantics = new Account(Name = 'Globomantics');
		Set<String> accountNames = new Set<String>();
		accountNames.add(wiredBrainCoffee.Name);
		accountNames.add(globomantics.Name);
		accountNames.add(otherGlobomantics.Name);
		System.debug('accountNames.size(): ' + accountNames.size());
	}

	public void mapsExample()
	{
		Account wiredBrainCoffee = new Account(Name = 'Wired Brain');
		Map<String, Account> accountNameToAccount = new Map<String, Account>();
		accountNameToAccount.put(wiredBrainCoffee.Name, wiredBrainCoffee);
		System.debug('accountNameToAccount.keySet().size(): ' + 
			accountNameToAccount.keySet().size());
	}

	public void extractingSetFromMap()
	{
		Account wiredBrainCoffee = new Account(Name = 'Wired Brain');
		Map<String, Account> accountNameToAccount = new Map<String, Account>();
		accountNameToAccount.put(wiredBrainCoffee.Name, wiredBrainCoffee);
		Set<String> accountNames = accountNameToAccount.keySet();
		System.debug('accountNames.size(): ' + accountNames.size());
	}

	public void anActualDictionary()
	{
		Map<String, String> nameToDescription = new Map<String, String>
		{
			'Drip Brew' => 'Deliciously filtered using hot water',
			'Iced Cofee' => 'Chilled over 24 hours to perfection',
			'Espresso' => 'For when you need to wake up!'
		};

		String dripBrewDescription = nameToDescription.get('Drip Brew');
		System.debug(dripBrewDescription);
	}

	public void checkingMapKeys()
	{
		Map<String, String> nameToDescription = new Map<String, String>
		{
			'Drip Brew' => 'Deliciously filtered using hot water',
			'Iced Coffee' => 'Chilled over 24 hours to perfection',
			'Espresso' => 'For when you need to wake up!'
		};

		Boolean americanoDefined = nameToDescription.containsKey('Americano');
		System.debug('americanoDefined: ' + americanoDefined);
	}

	public void booleanExpressions()
	{
		Boolean thisIsTrue = true;

		if (thisIsTrue)
			System.debug('This is true');

		if (true)
			System.debug('This is true');

		if (!thisIsTrue)
			System.debug('This is false');
	}

	public class OrderLineItem
	{
		public Integer productId;
		public Decimal price;
	}

	public class CoffeeOrder
	{
		public Decimal amount;
		public List<OrderLineItem> orderLineItems;
		private Boolean paid;

		public Boolean markOrderAsPaid()
		{
			this.paid = true;
			return this.paid;
		}
	
		public CoffeeOrder(){}
	
		public CoffeeOrder(List<OrderLineItem> orderLineItems)
		{
			this.orderLineItems = orderLineItems;
		}
	}

	public void constructingClasses()
	{
		CoffeeOrder coffeeOrderEmpty = new CoffeeOrder();
		System.debug(coffeeOrderEmpty.orderLineItems);

		OrderLineItem orderLineItem = new OrderLineItem();
		orderLineItem.productId = 1;
		orderLineItem.price = 15.0;
		List<OrderLineItem> orderLineItems = new List<OrderLineItem>{ orderLineItem };
		CoffeeOrder coffeeOrderFull = new CoffeeOrder(orderLineItems);
		System.debug(coffeeOrderFull.orderLineItems);
	}

	public void accessingAPrivateString()
	{
		System.debug(this.aPrivateString);
	}
}