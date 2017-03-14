<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="RP22_ListOrCombinedList_lijstencombinatie" select="'lijstencombinatie '"/>
    <xsl:param name="RP22_ListOrCombinedList_lijst" select="'lijst '"/>
    
    <xsl:param name="RP22_PartyHeader2Lines_Aanduiding" select="'Aanduiding van de groepering:'"/>
    <xsl:param name="RP22_PartyHeader2Lines_AAantal" select="'A = Aantal uitgebrachte stemmen'"/>
    <xsl:param name="RP22_PartyHeader2Lines_BGeldenVoor" select="'B = Gelden voor'"/>
    <xsl:param name="RP22_PartyHeader2Lines_Lijstengroep" select="'Lijstengroep:'"/>
    <xsl:param name="RP22_PartyHeader2Lines_Kieskring" select="'Kieskring:'"/>
    <xsl:param name="RP22_PartyHeader2Lines_Provincie" select="'Provincie:'"/>
    <xsl:param name="RP22_PartyHeader2Lines_Stel" select="'Stel:'"/>
    <xsl:param name="RP22_PartyHeader2Lines_Lijst" select="'Lijst:'"/>
    <xsl:param name="RP22_PartyHeader2Lines_zichzelf" select="'Op zichzelf staande lijst:'"/>
    <xsl:param name="RP22_PartyHeader2Lines_StelGelijkluidendeLijsten" select="'Stel gelijkluidende lijsten:'"/>
    <xsl:param name="RP22_PartyHeader2Lines_Lijstnummer" select="'Lijstnummer:'"/>
    <xsl:param name="RP22_PartyHeader2Lines_ToegewezenAantal" select="'Toegewezen aantal zetels:'"/>

    <xsl:param name="RP22_PartyHeader4Lines_Lijstengroep" select="'Lijstengroep:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_AAantal" select="'A = Aantal uitgebrachte stemmen'"/>
    <xsl:param name="RP22_PartyHeader4Lines_BGeldenVoor" select="'B = Gelden voor'"/>
    
    <xsl:param name="RP22_O3CandidateVotes_Aanduiding" select="'Aanduiding van de groepering: '"/>
    <xsl:param name="RP22_O3CandidateVotes_Lijstnummer" select="'Lijstnummer: '"/>
    <xsl:param name="RP22_O3CandidateVotes_Volgnummer" select="'Volgnummer op de lijst'"/>
    <xsl:param name="RP22_O3CandidateVotes_Kandidaten" select="'Kandidaten'"/>
    <xsl:param name="RP22_O3CandidateVotes_aantalStemmen" select="'Aantal stemmen'"/>
    <xsl:param name="RP22_O3CandidateVotes_Stemcijfer" select="'Stemcijfer: '"/>
    
    <xsl:param name="RP22_O3-H-CandidateVotes_Volgnummer" select="'Volgnummer op de lijst'"/>
    <xsl:param name="RP22_O3-H-CandidateVotes_Kandidaten" select="'Kandidaten'"/>
    <xsl:param name="RP22_O3-H-CandidateVotes_aantalStemmen" select="'Aantal stemmen'"/>

    <xsl:param name="RP22_FictitiousDistribution_Lijst" select="'Lijst'"/>
    <xsl:param name="RP22_FictitiousDistribution_AantalZetels" select="'Aantal zetels'"/>

    <xsl:param name="RP22_ListOrCombinedListUni_lijstencombinatie" select="'lijstencombinatie '"/>
    <xsl:param name="RP22_ListOrCombinedListUni_kieskring" select="'kieskring '"/>
    <xsl:param name="RP22_ListOrCombinedListUni_stel" select="'stel '"/>
    <xsl:param name="RP22_ListOrCombinedListUni_lijst" select="'lijst '"/>

    <xsl:param name="RP22_Kiesdeler_totaal" select="'Het totaal van de '"/>
    <xsl:param name="RP22_Kiesdeler_kandidaat" select="'op een kandidaat'"/>
    <xsl:param name="RP22_Kiesdeler_uitgebrachteStemmen" select="' uitgebrachte stemmen bedraagt: '"/>
    <xsl:param name="RP22_Kiesdeler_Aangezien" select="'Aangezien '"/>
    <xsl:param name="RP22_Kiesdeler_zetelsTeVerdelen" select="' zetels te verdelen zijn, bedraagt de kiesdeler: '"/>
    <xsl:param name="RP22_Kiesdeler_ration" select="' : '"/>
    <xsl:param name="RP22_Kiesdeler_equals" select="' ='"/>
    
    <xsl:param name="RP22_CheckingCombinedListsWithFictitiousDistribution_AantallenZetels" select="'Aantallen zetels die aan de lijsten van de onderscheidene groeperingen zouden zijn toegewezen, indien geen lijstencombinaties zouden zijn aangegaan overeenkomstig artikel '"/>
    <xsl:param name="RP22_CheckingCombinedListsWithFictitiousDistribution_I10" select="'I 10'"/>
    <xsl:param name="RP22_CheckingCombinedListsWithFictitiousDistribution_S8" select="'S 8'"/>
    <xsl:param name="RP22_CheckingCombinedListsWithFictitiousDistribution_Kieswet" select="' van de Kieswet:'"/>
    <xsl:param name="RP22_CheckingCombinedListsWithFictitiousDistribution_lijstencombinaties" select="'De volgende lijstencombinaties zijn overeenkomstig artikel '"/>
    <xsl:param name="RP22_CheckingCombinedListsWithFictitiousDistribution_aangegaanOnderscheidenlijk" select="' van de Kieswet aangegaan onderscheidenlijk zijn ingevolge artikel '"/>
    <xsl:param name="RP22_CheckingCombinedListsWithFictitiousDistribution_P4" select="'P 4'"/>
    <xsl:param name="RP22_CheckingCombinedListsWithFictitiousDistribution_U6" select="'U 6'"/>
    <xsl:param name="RP22_CheckingCombinedListsWithFictitiousDistribution_tweedeLid" select="', tweede lid, van die wet in aanmerking genomen:'"/>
    <xsl:param name="RP22_CheckingCombinedListsWithFictitiousDistribution_NietVanToepassing" select="'Niet van toepassing'"/>
    
    <xsl:param name="RP22_AssignmentWithinListGroups_lijstengroepenToegewezen" select="'De aan de lijstengroepen toegewezen zetels zijn ingevolge artikel '"/>
    <xsl:param name="RP22_AssignmentWithinListGroups_P12" select="'P 12'"/>
    <xsl:param name="RP22_AssignmentWithinListGroups_U12" select="'U 12'"/>
    <xsl:param name="RP22_AssignmentWithinListGroups_Kieswet" select="' van de Kieswet als volgt verdeeld over de verbonden lijsten. Eerst is de groepskiesdeler vastgesteld door het stemcijfer van de lijstengroep te delen door het aantal aan die groep toegewezen zetels. Vervolgens is de groepskiesdeler gedeeld op de stemcijfers van de lijsten waaruit de groep bestaat. Aan elk van de lijsten is het aantal zetels toegewezen overeenkomend met het aldus voor de desbetreffende lijst verkregen quotiënt. De restzetels zijn toegewezen aan de lijsten die bij genoemde deling de grootste overschotten hebben.'"/>
    <xsl:param name="RP22_AssignmentWithinListGroups_NietVanToepassing" select="'Niet van toepassing.'"/>
    
    <xsl:param name="RP22_DistrictNumber_Totaal" select="'Totaal'"/>
    <xsl:param name="RP22_DistrictNumber_aantal" select="'aantal'"/>
    <xsl:param name="RP22_DistrictNumber_stemmen" select="'stemmen'"/>

    <xsl:param name="RP22_ListOrCombinedListPart2_Kieskring" select="'(Kieskring '"/>
</xsl:stylesheet>
