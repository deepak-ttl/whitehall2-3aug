<%@include file="init.jsp"%>

<portlet:actionURL var="createTradeURL">
	<portlet:param name="action" value="createTrade" />
</portlet:actionURL>

<portlet:renderURL var="defaultRender">
</portlet:renderURL>


<div class="container-fluid">
	<form:form commandName="scfTradeModel" method="post"
		action="${createTradeURL}" id="createTrade" autocomplete="off"
		name="TradeDetail">
		<input type="hidden" value="${deleteTradeURL}" id="deleteURL">
		<div class="row-fluid">
			<div class="span12" style="padding-bottom: 30px;">
				<div class="span4"></div>
				<div class="span4">
					<h4>Add Trade Information</h4>
				</div>
			</div>
		</div>



		<div class="row-fluid">
			<div class="span6">
				<label class="span6">SCF Trade:</label>
				<label class="checkbox span6"> <form:checkbox path="scfTrade"
						value="1" /> 
				</label>

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Duration:</label>
				<form:input path="duration" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Closing Date:</label>
				<form:input path="closingDate" cssClass="span5" id="closingDate" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Opening Date:</label>
				<form:input path="openingDate" cssClass="span5" id="openingDate" />

			</div>

			<div class="span6">
				<label class="span6">Investor Payment Date:</label>
				<form:input path="investorPaymentDate" cssClass="span5"
					id="investorPaymentDate" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Payment Date:</label>
				<form:input path="SellerPaymentDate" cssClass="span5"
					id="SellerPaymentDate" />

			</div>
			<div class="span6">
				<label class="span6">Trade Amount:</label>
				<form:input path="tradeAmount" cssClass="span6" />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Company Name:</label>
				<form:select path="companyId" items="${companyIdMap}"
					class="dropdown span6" id="companyId" placeholder="Company Name" />
			</div>


			<div class="span6">
				<label class="span6">Trade Notes:</label>
				<form:input path="tradeNotes" cssClass="span6" />

			</div>



		</div>
		<div class="row-fluid">
			<div class="span6">
				
				<label class="span6">Trade Settled:</label>
				<label class="checkbox span6"> <form:checkbox path="tradeSettled"
						value="1" /> 
				</label>

			</div>
			<div class="span6">
				
				<label class="span6">Want to Insure?</label>
				<label class="checkbox span6"> <form:checkbox path="wantToInsure" value="1" id="insureCheck" /> 
				</label>

			</div>
		</div>

		<div class="row-fluid" style="display: none;" id="insuranceDocDiv">
			<div class="span6">
				<label class="span6">Insurance Document:</label>
			   <input type="file"		name="insuranceDoc"  class=""/>
				
			</div>
			
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Promisory Note:</label>
				<form:input path="promisoryNote" cssClass="span6" />

			</div>

		</div>


		<div class="row-fluid">
			<div class="span6">
				<input type="button" value="Add Trade" class="btn btn-primary"
					data-url="${createTradeURL}" id="tradeAdd" /> <input type="button"
					value="Go Back" class="btn btn-primary"
					data-url="${defaultRender}" id="tradeback" />
			</div>
		</div>


	</form:form>

</div>





