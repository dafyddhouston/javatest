<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="text" encoding="utf-8"/>

	<xsl:template match="/">
		{ "Products":[
		<xsl:apply-templates />
		]}
	</xsl:template>

	<xsl:template match="Product">
		{
		<xsl:apply-templates select="ProductId" />
		<xsl:apply-templates select="Brand" />
		<xsl:apply-templates select="Specification" />
		<xsl:apply-templates select="Price" />
		}
	</xsl:template>

	<xsl:template match="ProductId">
		"ProductId": "<xsl:value-of select="." />",
	</xsl:template>

	<xsl:template match="Brand">
		"Brand": "<xsl:value-of select="." />",
	</xsl:template>

	<xsl:template match="Specification">
		"Specification": "<xsl:value-of select="." />",
	</xsl:template>

	<xsl:template match="Price">
		"Price": "<xsl:value-of select="." />"
	</xsl:template>

</xsl:stylesheet>