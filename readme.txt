
1. 2 Screenshots of my Product API called via the API Manager. 

2. SOAP UI Mock project example wsdl and schema file. Query matched positive and negative tests.

3. An Enterprise Integration project created using the tooling with the following notes

A proxy service (ProductProxy) to call the SOAP UI mock. See the screeshot
An api ProductAPI to recieve a get request
An XSLT Resource  
Used a payloadFactory in the inSequence and called the SOAP UI mocks running on localhost:8280
In the outSequence the response didn't work correctly which I didn't get time to resolve

<?xml version='1.0' encoding='utf-8'?><soapenv:Envelope xmlns:soapenv="http://www.w3.org/2003/05/soap-envelope"><soapenv:Body><ns:binary xmlns:ns="http://ws.apache.org/commons/ns/payload"></ns:binary></soapenv:Body></soapenv:Envelope> 

Hardcoded a payload response
Performed an XSLT on the response to create a JSON. The XSLT worked outside EI, but it didn't work correctely inside. I needed some time to resolve this, therefore harded the expected response

With a little more time I was going to add a query parameter for pricefrom and add an xsl condition to filer the response

e.g. 
<xsl:template match="Product">
<xsl:if test="Price &gt; {pricefrom}"> 
{
    <xsl:apply-templates select="ProductId"/>  
    <xsl:apply-templates select="Brand"/>
    <xsl:apply-templates select="Specification"/>
    <xsl:apply-templates select="Price"/>
}
</xsl:if>
</xsl:template>

With a bit more time
1. I would have used a switch mediator to apply the correct XSLT (https://docs.wso2.com/display/EI611/Routing+Requests+Based+on+Message+Content) based on the pricefrom parameter
2. I also would have done some validations on the SOAP responses and returned 400 bad parameters and 404 for wrong id lookups, 500 for server errors (I had the mocks in place)
3. Added another endpoint for a single product lookup using a uri parameter

