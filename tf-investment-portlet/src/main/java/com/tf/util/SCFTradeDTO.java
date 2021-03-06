package com.tf.util;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.tf.model.Company;

public class SCFTradeDTO implements Serializable {
	
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 3161263407139541939L;
	private Long id;	
	private String scfTrade;
	private Integer duration;
	private Date closingDate;
	private Date openingDate;
	private Date investorPaymentDate;	
	private Date SellerPaymentDate;
	private String investorPaymentDateString;	
	private String SellerPaymentDateString;
	private BigDecimal tradeAmount;
	private String status;
	private Company company;
	private String tradeNotes;	
	private boolean tradeSettled;
	private boolean wantToInsure;
	private MultipartFile insuranceDocument;	
	private String promisoryNote;
	
	private String insuranceDocName;
	private String insuranceDocURL;
	
	private String promisoryDocName;
	private String promisoryDocURL;
	
	private String invoiceIds;
	private MultipartFile promisoryDocument;
	private String scfId;
	
	public SCFTradeDTO() {
		this.scfTrade="Yes";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getScfTrade() {
		return scfTrade;
	}

	public void setScfTrade(String scfTrade) {
		this.scfTrade = scfTrade;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Date getClosingDate() {
		return closingDate;
	}

	public void setClosingDate(Date closingDate) {
		this.closingDate = closingDate;
	}

	public Date getOpeningDate() {
		return openingDate;
	}

	public void setOpeningDate(Date openingDate) {
		this.openingDate = openingDate;
	}

	public Date getInvestorPaymentDate() {
		return investorPaymentDate;
	}

	public void setInvestorPaymentDate(Date investorPaymentDate) {
		this.investorPaymentDate = investorPaymentDate;
	}

	public Date getSellerPaymentDate() {
		return SellerPaymentDate;
	}

	public void setSellerPaymentDate(Date sellerPaymentDate) {
		SellerPaymentDate = sellerPaymentDate;
	}

	public BigDecimal getTradeAmount() {
		return tradeAmount;
	}

	public void setTradeAmount(BigDecimal tradeAmount) {
		this.tradeAmount = tradeAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getTradeNotes() {
		return tradeNotes;
	}

	public void setTradeNotes(String tradeNotes) {
		this.tradeNotes = tradeNotes;
	}

	public boolean getTradeSettled() {
		return tradeSettled;
	}

	public void setTradeSettled(boolean tradeSettled) {
		this.tradeSettled = tradeSettled;
	}

	public boolean getWantToInsure() {
		return wantToInsure;
	}

	public void setWantToInsure(boolean wantToInsure) {
		this.wantToInsure = wantToInsure;
	}

	public MultipartFile getInsuranceDocument() {
		return insuranceDocument;
	}

	public void setInsuranceDocument(MultipartFile insuranceDocument) {
		this.insuranceDocument = insuranceDocument;
	}

	public String getPromisoryNote() {
		return promisoryNote;
	}

	public void setPromisoryNote(String promisoryNote) {
		this.promisoryNote = promisoryNote;
	}

	public String getInvoiceIds() {
		return invoiceIds;
	}

	public void setInvoiceIds(String invoiceIds) {
		this.invoiceIds = invoiceIds;
	}

	public String getInsuranceDocName() {
		return insuranceDocName;
	}

	public void setInsuranceDocName(String insuranceDocName) {
		this.insuranceDocName = insuranceDocName;
	}

	public String getInsuranceDocURL() {
		return insuranceDocURL;
	}

	public void setInsuranceDocURL(String insuranceDocURL) {
		this.insuranceDocURL = insuranceDocURL;
	}

	
	public MultipartFile getPromisoryDocument() {
		return promisoryDocument;
	}

	public void setPromisoryDocument(MultipartFile promisoryDocument) {
		this.promisoryDocument = promisoryDocument;
	}

	
	public String getScfId() {
		return scfId;
	}

	public void setScfId(String scfId) {
		this.scfId = scfId;
	}
	

	public String getPromisoryDocName() {
		return promisoryDocName;
	}

	public void setPromisoryDocName(String promisoryDocName) {
		this.promisoryDocName = promisoryDocName;
	}

	public String getPromisoryDocURL() {
		return promisoryDocURL;
	}

	public void setPromisoryDocURL(String promisoryDocURL) {
		this.promisoryDocURL = promisoryDocURL;
	}
	
	public String getInvestorPaymentDateString() {
		return investorPaymentDateString;
	}

	public void setInvestorPaymentDateString(String investorPaymentDateString) {
		this.investorPaymentDateString = investorPaymentDateString;
	}

	public String getSellerPaymentDateString() {
		return SellerPaymentDateString;
	}

	public void setSellerPaymentDateString(String sellerPaymentDateString) {
		SellerPaymentDateString = sellerPaymentDateString;
	}

	@Override
	public String toString() {
		return "SCFTradeDTO [id=" + id + ", scfTrade=" + scfTrade
				+ ", duration=" + duration + ", closingDate=" + closingDate
				+ ", openingDate=" + openingDate + ", investorPaymentDate="
				+ investorPaymentDate + ", SellerPaymentDate="
				+ SellerPaymentDate + ", tradeAmount=" + tradeAmount
				+ ", status=" + status + ", company=" + company
				+ ", tradeNotes=" + tradeNotes + ", tradeSettled="
				+ tradeSettled + ", wantToInsure=" + wantToInsure
				+ ", insuranceDocument=" + insuranceDocument
				+ ", promisoryNote=" + promisoryNote + ", insuranceDocName="
				+ insuranceDocName + ", insuranceDocURL=" + insuranceDocURL
				+ ", promisoryDocName=" + promisoryDocName
				+ ", promisoryDocURL=" + promisoryDocURL + ", invoiceIds="
				+ invoiceIds + ", promisoryDocument=" + promisoryDocument
				+ ", scfId=" + scfId + "]";
	}

	

	


}
