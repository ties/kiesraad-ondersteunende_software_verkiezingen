<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:eml="urn:oasis:names:tc:evs:schema:eml" >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="eml:Candidate[eml:CandidateIdentifier/eml:ShortCode]">
        <xsl:variable name="shortcode" select="eml:CandidateIdentifier/eml:ShortCode"/>
        <xsl:apply-templates select="//eml:Candidate[eml:CandidateIdentifier/@ShortCode = $shortcode]"/>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|text()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="@ShortCode">
    </xsl:template>
    
    <xsl:template match="@*">
        <xsl:copy-of select="."/>
    </xsl:template>
</xsl:stylesheet>
