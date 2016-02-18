package com.tf.persistance.util;


public enum TranscationStatus {
	
	DEPOSIT("Deposit"),
	WITHDRAWAL("Withdrawal"),
	INVESTMENT("Investment"),
	REPAYMENT("Repayment"),
	PROFIT("Profit"),
	WHITEHALL_FEE("Whitehall Fee");
		
	private final String value;
	
	TranscationStatus(String value){
		this.value = value;
	}

	public String getValue() {
		return value;
	}

}
