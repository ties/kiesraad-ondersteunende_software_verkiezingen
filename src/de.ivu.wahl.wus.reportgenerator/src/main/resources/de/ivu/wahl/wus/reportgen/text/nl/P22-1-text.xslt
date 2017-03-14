<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="P22-1_010_title" select="'Model P 22-1. Proces-verbaal van de zitting van het centraal stembureau tot het vaststellen van de uitslag van de verkiezing van de leden van de Tweede Kamer, van provinciale staten van een provincie die uit meer dan een kieskring bestaat of van het Europees Parlement'"/>
    <xsl:param name="P22-1_020_1_zittingGehouden" select="'Het centraal stembureau voor de '"/>
    <xsl:param name="P22-1_020_2_zittingGehouden" select="' heeft overeenkomstig artikel P 20 van de Kieswet op '"/>
    <xsl:param name="P22-1_020_3_zittingGehouden" select="', om '"/>
    <xsl:param name="P22-1_020_4_zittingGehouden" select="' uur'"/>
    <xsl:param name="P22-1_020_5_zittingGehouden" select="', in de daarvoor aangewezen ruimte zitting gehouden.'"/>
    <xsl:param name="P22-1_030_uitslagVastgesteld" select="'Het centraal stembureau heeft op deze zitting de uitslag vastgesteld en bekendgemaakt van '"/>
    <xsl:param name="P22-1_040_uitslagVastgesteld" select="'Het centraal stembureau heeft deze uitslag op grond van de processen-verbaal die ingevolge artikel O 4, eerste lid, van de Kieswet door de voorzitters van de hoofdstembureaus zijn toegezonden, als volgt vastgesteld en bekendgemaakt:'"/>
    <xsl:param name="P22-1_050_uitslagVastgesteld" select="'A. OVERZICHT VAN DE INGELEVERDE KANDIDATENLIJSTEN'"/>
    <xsl:param name="P22-1_070_deelgenomen" select="'De volgende groeperingen hebben aan de verkiezing deelgenomen:'"/>
    <xsl:param name="P22-1_080_gemeenteHoofdstembureau" select="'Kieskringen en naam van de gemeente waar het hoofdstembureau is gevestigd:'"/>
    <xsl:param name="P22-1_082_gemeenteLichaamHoofdstembureau" select="'Kieskringen en naam van de gemeente / het openbaar lichaam waar het hoofdstembureau is gevestigd:'"/>
    <xsl:param name="P22-1_090_uitgebrachteStemmen" select="'B. OVERZICHT VAN DE AANTALLEN OP DE VERSCHILLENDE LIJSTEN UITGEBRACHTE STEMMEN'"/>
    <xsl:param name="P22-1_100_Kiesdeler" select="'C. VASTSTELLING VAN DE KIESDELER'"/>
    <xsl:param name="P22-1_110_Lijstencombinaties" select="'D. LIJSTENCOMBINATIES'"/>
    <xsl:param name="P22-1_120_artikelI10" select="'De volgende lijstencombinaties zijn overeenkomstig artikel I 10 van de Kieswet aangegaan onderscheidenlijk zijn ingevolge artikel P 4, tweede lid, van die wet in aanmerking genomen:'"/>
    <xsl:param name="P22-1_125_nietVanToepassing" select="'Niet van toepassing'"/>
    <xsl:param name="P22-1_130_verdelingZetelsOverLijstencombinaties" select="'E. VERDELING VAN DE ZETELS OVER DE LIJSTENCOMBINATIES EN DE NIET TOT EEN LIJSTENCOMBINATIE VERBONDEN LIJSTEN'"/>
    <xsl:param name="P22-1_140_verdelingRestzetelsOverLijstencombinaties" select="'F. VERDELING VAN DE RESTZETELS OVER DE LIJSTENCOMBINATIES EN DE NIET TOT EEN LIJSTENCOMBINATIE VERBONDEN LIJSTEN'"/>
    <xsl:param name="P22-1_150_artikelP7" select="'De restzetels zijn met toepassing van artikel P 7 van de Kieswet toegewezen aan de lijstencombinaties onderscheidenlijk lijsten die na toewijzing van de zetel het grootste gemiddeld aantal stemmen per zetel hebben.'"/>
    <xsl:param name="P22-1_160_verdelingOverVerbondenLijsten" select="'G. VERDELING VAN DE AAN DE LIJSTENCOMBINATIES TOEGEWEZEN ZETELS OVER DE VERBONDEN LIJSTEN'"/>
    <xsl:param name="P22-1_170_verdelingOverOnderscheineneGroeperingen" select="'H. VERDELING VAN DE ZETELS OVER DE ONDERSCHEIDENE GROEPERINGEN'"/>
    <xsl:param name="P22-1_180_verdelingInLijstengroepen" select="'I. VERDELING VAN DE AAN DE LIJSTENGROEPEN TOEGEWEZEN ZETELS OVER DE LIJSTEN DIE DEEL UIT MAKEN VAN DIE LIJSTENGROEPEN'"/>
    <xsl:param name="P22-1_190_aantallenStemmenMetZetels" select="'J. AANTALLEN STEMMEN UITGEBRACHT OP KANDIDATEN VAN LIJSTEN VAN GROEPERINGEN WAARAAN EEN OF MEER ZETELS ZIJN TOEGEWEZEN'"/>
    <xsl:param name="P22-1_200_rangschikking" select="'K. TOEWIJZING VAN DE ZETELS AAN DE KANDIDATEN EN RANGSCHIKKING VAN DE KANDIDATEN PER LIJST'"/>
    <xsl:param name="P22-1_210_aantallenStemmenMetGeenZetels" select="'L. AANTALLEN STEMMEN UITGEBRACHT OP KANDIDATEN VAN LIJSTEN VAN GROEPERINGEN WAARAAN GEEN ZETEL IS TOEGEWEZEN'"/>
    <xsl:param name="P22-1_215_nietVanToepassing" select="'Niet van toepassing.'"/>
    <xsl:param name="P22-1_220_AlfabetischeVolgordeKandidaten" select="'M. OVERZICHT IN ALFABETISCHE VOLGORDE VAN DE KANDIDATEN DIE ZIJN GEKOZEN'"/>
    <xsl:param name="P22-1_230_AanwezigeKiezers" select="'Door de in de zittingsruimte aanwezige kiezers zijn'"/>
</xsl:stylesheet>
