<%@include file="init.jsp"%>
<portlet:renderURL var="invoiceURL">
	<portlet:param name="render" value="updateInvoices" />
</portlet:renderURL>
<portlet:resourceURL id="closeSessionValues" var="closeSessionValuesURL" ></portlet:resourceURL> 
			  	
    <c:choose>
			<c:when test="${fn:length(validInvoiceList) gt 0}">
			  <span class="alert alert-success">Valid Invoices</span><br>
			</c:when>
	</c:choose>	
	<div class="customTableContainer">
		<table class="table table-hover tablesorter table-bordered"
			id="invoiceListTable">
			<thead>
				<tr>
					<c:if test="${defaultRender}">
						<th class="hide-tablesorter"></th>
					</c:if>
					<th>Invoice Number</th>
					<th>PaymentDate</th>
					<th>Amount</th>
					<th>Duration</th>
					<th>Invoice Company</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(validInvoiceList) gt 0}">
					  <c:set var="valid"  scope="page" value="true" />
						<c:forEach items="${validInvoiceList}" var="invoice">
							<tr>
								<c:if test="${defaultRender}">
									<td><c:choose>
											<c:when
												test="${ userType eq 'Seller Admin' && invoice.status eq 'New'}">
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:when>
											<c:when
												test="${userType eq 'Seller Admin' && invoice.status ne 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:when test="${invoice.status eq 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:otherwise>
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:otherwise>
										</c:choose></td>
								</c:if>
								<td><span class='underline'><a
										href="javascript:void(0);"
										onclick="window.location.href='${invoiceURL}&invoiceID=${invoice.id}'">${invoice.invoiceNumber}</a></span></td>
								<td><fmt:formatDate pattern="dd-MM-yyyy"
										value="${invoice.payment_date}" /></td>
								<td>${invoice.invoiceAmount}</td>
								<td>${invoice.duration}</td>
								<td>${invoice.scfCompany.name}</td>
								<%--  <td><fmt:formatDate pattern="dd-MM-yyyy"
										value="${invoice.financeDate}" /></td>  --%>
								<td>
								${invoice.status}
								<c:if test="${invoice.status ne 'New'}">
								(${invoice.scfTrade.scfId})
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
					    <c:set var="valid"  scope="page" value="false" />
					    <td class="" colspan="6" align="center">There are  no  valid invoices.</td>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<c:if test="${valid}">
	<c:choose>
					<c:when test="${fn:length(invalidnvoiceList) gt 0}">
					  <span class="">Invalid Invoices.</span><br>
					  <span class="">These invoices are already present on our platform or not valid.</span><br>
					</c:when>
    </c:choose>
	<div class="customTableContainer">
		<table class="table table-hover tablesorter table-bordered"
			id="invoiceListTable">
			<thead>
				<tr>
					<c:if test="${defaultRender}">
						<th class="hide-tablesorter"></th>
					</c:if>
					<th>Invoice Number</th>
					<th>PaymentDate</th>
					<th>Amount</th>
					<th>Duration</th>
					<th>Invoice Company</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(invalidnvoiceList) gt 0}">
						<c:forEach items="${invalidnvoiceList}" var="invoice">
							<tr>
							<c:if test="${defaultRender}">
									<td><c:choose>
											<c:when
												test="${ userType eq 'Seller Admin' && invoice.status eq 'New'}">
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:when>
											<c:when
												test="${userType eq 'Seller Admin' && invoice.status ne 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:when test="${invoice.status eq 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:otherwise>
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:otherwise>
										</c:choose></td>
								</c:if>
								<td><span class='underline'><a
										href="javascript:void(0);"
										onclick="window.location.href='${invoiceURL}&invoiceID=${invoice.id}'">${invoice.invoiceNumber}</a></span></td>
								<td><fmt:formatDate pattern="dd-MM-yyyy"
										value="${invoice.payment_date}" /></td>
								<td>${invoice.invoiceAmount}</td>
								<td>${invoice.duration}</td>
								<td>${invoice.scfCompany.name}</td>
								<td>
								    ${invoice.status}
								     <c:if test="${invoice.status ne 'New'}">
								           (${invoice.scfTrade.scfId})
								      </c:if>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	</c:if>
	
	
<div class="modal-footer">
<!-- 	<button class="btn btnBrGrSm" data-dismiss="modal" aria-hidden="true">Close</button>
	<button class="btn btnBgGreenSm" id="uploadInvoices">UPLOAD INVOICE</button>
	<input type="button" value="Upload Invoice" class="btn btnBgGreenSm"  id="uploadInvoices"/> -->
	
	<button class="btn btnBrGrSm" id="invoice-popup-close" data-dismiss="modal" aria-hidden="true">Close</button>
	<input type="submit" value="Save Invoices" class="btn btnBgGreenSm" id="last"/>
</div>

