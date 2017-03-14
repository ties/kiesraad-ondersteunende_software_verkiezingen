<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="P22-2_010_title" select="'Model P 22-2. Proces-verbaal van de zitting van het hoofdstembureau tot het vaststellen van de uitkomst van de stemming en van de zitting van het centraal stembureau tot het vaststellen van de uitslag van de verkiezing van de leden van de gemeenteraad, van provinciale staten van een provincie die één kieskring vormt of van de eilandsraad'"/>
    <xsl:param name="P22-2_020_1_zittingGehouden" select="'Het hoofdstembureau voor de '"/>
    <xsl:param name="P22-2_020_2_zittingGehouden" select="' heeft overeenkomstig artikel O 1 van de Kieswet op '"/>
    <xsl:param name="P22-2_020_3_zittingGehouden" select="', om 10.00 uur, in de daarvoor aangewezen ruimte zitting gehouden.'"/>
    <xsl:param name="P22-2_030_uitslagVastgesteld" select="'Het hoofdstembureau heeft op deze zitting de uitkomst vastgesteld en bekendgemaakt van de stemming voor '"/>
    <xsl:param name="P22-2_040_uitgebrachteStemmenVastgesteld" select="'Het hoofdstembureau heeft ten aanzien van iedere lijst het aantal op iedere kandidaat uitgebrachte stemmen en het stemcijfer van de lijst vastgesteld. De voorzitter heeft bekendgemaakt dat de aldus verkregen uitkomsten luiden:'"/>
    <xsl:param name="P22-2_050_aanwezigeKiezers" select="'Door de in de zittingsruimte aanwezige kiezers zijn naar aanleiding van de vaststelling van deze uitkomsten'"/>
    <xsl:param name="P22-2_060_volgendeOpTeMerken" select="'Deze bezwaren geven het hoofdstembureau aanleiding het volgende op te merken:'"/>
    <xsl:param name="P22-2_070_uitslagVastgesteld" select="'Vervolgens is het hoofdstembureau opgetreden als centraal stembureau en heeft het in die hoedanigheid de uitslag van de verkiezing als volgt vastgesteld:'"/>
    <xsl:param name="P22-2_090_uitgebrachteStemmen" select="'A. OVERZICHT VAN DE AANTALLEN OP DE VERSCHILLENDE LIJSTEN UITGEBRACHTE STEMMEN'"/>
    <xsl:param name="P22-2_100_Kiesdeler" select="'B. VASTSTELLING VAN DE KIESDELER'"/>
    <xsl:param name="P22-2_110_Lijstencombinaties" select="'C. LIJSTENCOMBINATIES'"/>
    <xsl:param name="P22-2_120_verdelingZetelsOverLijstencombinaties" select="'D. VERDELING VAN DE ZETELS OVER DE LIJSTENCOMBINATIES EN DE NIET TOT EEN LIJSTENCOMBINATIE VERBONDEN LIJSTEN'"/>
    <xsl:param name="P22-2_140_verdelingRestzetelsOverLijstencombinaties" select="'E. VERDELING VAN DE RESTZETELS OVER DE LIJSTENCOMBINATIES EN DE NIET TOT EEN LIJSTENCOMBINATIE VERBONDEN LIJSTEN'"/>
    <xsl:param name="P22-2_145_artikelP7" select="'De restzetels zijn met toepassing van artikel P 7 van de Kieswet toegewezen aan de lijstencombinaties onderscheidenlijk lijsten die na toewijzing van de zetel het grootste gemiddelde aantal stemmen per zetel hebben.'"/>
    <xsl:param name="P22-2_150_artikelP8" select="'De restzetels zijn met toepassing van artikel P 8, eerste en tweede lid, van de Kieswet toegewezen aan de lijstencombinaties onderscheidenlijk lijsten waarvan de stemcijfers bij deling door de kiesdeler de grootste overschotten hebben.'"/>
    <xsl:param name="P22-2_155_zetelsP8" select="'Nadat alle lijsten die daarvoor in aanmerking kwamen een restzetel hadden ontvangen, waren er nog .. zetels te verdelen. Deze zetels zijn met toepassing van artikel P 8, derde lid, van de Kieswet toegewezen aan de lijsten die na toewijzing van de zetel het grootste gemiddelde aantal stemmen per zetel hebben, met dien verstande dat bij deze toewijzing aan geen van de lijsten meer dan één zetel is toegewezen.'"/>
    <xsl:param name="P22-2_160_verdelingOverVerbondenLijsten" select="'F. VERDELING VAN DE AAN DE LIJSTENCOMBINATIES TOEGEWEZEN ZETELS OVER DE VERBONDEN LIJSTEN'"/>
    <xsl:param name="P22-2_170_verdelingOverOnderscheineneGroeperingen" select="'G. VERDELING VAN DE ZETELS OVER DE ONDERSCHEIDENE GROEPERINGEN'"/>
    <xsl:param name="P22-2_190_aantallenStemmenMetZetels" select="'H. AANTALLEN STEMMEN UITGEBRACHT OP KANDIDATEN VAN LIJSTEN VAN GROEPERINGEN WAARAAN EEN OF MEER ZETELS ZIJN TOEGEWEZEN'"/>
    <xsl:param name="P22-2_200_rangschikking" select="'I. TOEWIJZING VAN DE ZETELS AAN DE KANDIDATEN EN RANGSCHIKKING VAN DE KANDIDATEN PER LIJST'"/>
    <xsl:param name="P22-2_220_AlfabetischeVolgordeKandidaten" select="'J. OVERZICHT IN ALFABETISCHE VOLGORDE VAN DE KANDIDATEN DIE ZIJN GEKOZEN'"/>
    <xsl:param name="P22-2_230_aanwezigeKiezers" select="'Door de in de zittingsruimte aanwezige kiezers zijn naar aanleiding van de vaststelling van de uitslag van de verkiezing'"/>
</xsl:stylesheet>
