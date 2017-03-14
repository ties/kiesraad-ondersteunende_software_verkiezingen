<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="RP22_OverviewCandidateListsTK_Lijst" select="'Lijst-'"/>
    <xsl:param name="RP22_OverviewCandidateListsTK_nummer" select="'nummer'"/>
    <xsl:param name="RP22_OverviewCandidateListsTK_Aanduiding" select="'Aanduiding'"/>
    <xsl:param name="RP22_OverviewCandidateListsTK_groeperingHeeft" select="'De groepering heeft bij de '"/>
    <xsl:param name="RP22_OverviewCandidateListsTK_KieskringenIngediend" select="'Kieskring(en) ingediend:'"/>
    <xsl:param name="RP22_OverviewCandidateListsTK_lijstengroep" select="'1) een lijstengroep'"/>
    <xsl:param name="RP22_OverviewCandidateListsTK_stelGelijk" select="'2) een stel gelijk-'"/>
    <xsl:param name="RP22_OverviewCandidateListsTK_luidendeLijsten" select="'luidende lijsten'"/>
    <xsl:param name="RP22_OverviewCandidateListsTK_zichzelfStaandeLijst" select="'3) een op zichzelf staande lijst.'"/>
    <xsl:param name="RP22_OverviewCandidateListsTK_Kieskringen" select="'Kieskringen'"/>
    
    <xsl:param name="RP22_OverviewCandidateListsPS2_Lijst" select="'Lijst-'"/>
    <xsl:param name="RP22_OverviewCandidateListsPS2_nummer" select="'nummer'"/>
    <xsl:param name="RP22_OverviewCandidateListsPS2_Aanduiding" select="'Aanduiding'"/>
    <xsl:param name="RP22_OverviewCandidateListsPS2_groeperingHeeft" select="'De groepering heeft bij de'"/>
    <xsl:param name="RP22_OverviewCandidateListsPS2_KieskringenIngediend" select="'Kieskring(en) ingediend:'"/>
    <xsl:param name="RP22_OverviewCandidateListsPS2_lijstengroep" select="'1) een lijstengroep'"/>
    <xsl:param name="RP22_OverviewCandidateListsPS2_stelGelijk" select="'2) een stel gelijk-'"/>
    <xsl:param name="RP22_OverviewCandidateListsPS2_luidendeLijsten" select="'luidende lijsten'"/>
    <xsl:param name="RP22_OverviewCandidateListsPS2_zichzelfStaandeLijst" select="'3) een op zichzelf staande lijst.'"/>
    <xsl:param name="RP22_OverviewCandidateListsPS2_Kieskringen" select="'Kieskringen'"/>
    
    <xsl:param name="RP22_OverviewCandidateListsEK_Lijst" select="'Lijst-'"/>
    <xsl:param name="RP22_OverviewCandidateListsEK_nummer" select="'nummer'"/>
    <xsl:param name="RP22_OverviewCandidateListsEK_Aanduiding" select="'Aanduiding'"/>
    <xsl:param name="RP22_OverviewCandidateListsEK_groeperingHeeft" select="'De groepering heeft'"/>
    <xsl:param name="RP22_OverviewCandidateListsEK_ingediend" select="'ingediend:'"/>
    <xsl:param name="RP22_OverviewCandidateListsEK_lijstengroep" select="'1) een lijstengroep'"/>
    <xsl:param name="RP22_OverviewCandidateListsEK_stelGelijk" select="'2) een stel gelijk-'"/>
    <xsl:param name="RP22_OverviewCandidateListsEK_luidendeLijsten" select="'luidende lijsten'"/>
    <xsl:param name="RP22_OverviewCandidateListsEK_zichzelfStaandeLijst" select="'3) een op zichzelf staande lijst.'"/>
    <xsl:param name="RP22_OverviewCandidateListsEK_Provincies" select="'Provincie(s)'"/>
    
    <xsl:param name="RP22_OverviewVotes1-10_Kieskring" select="'Kieskring'"/>
    <xsl:param name="RP22_OverviewVotes1-10_Lijst" select="'Lijst-'"/>
    <xsl:param name="RP22_OverviewVotes1-10_nummer" select="'nummer'"/>
    <xsl:param name="RP22_OverviewVotes1-10_stemmenOpEenKandidaat" select="'Totaal aantal stemmen op een kandidaat per kieskring'"/>
    <xsl:param name="RP22_OverviewVotes1-10_kandidaatUitgebrachteStemmen" select="'Totaal aantal op een kandidaat uitgebrachte stemmen'"/>
    <xsl:param name="RP22_OverviewVotes1-10_blancoStemmen" select="'Totaal aantal blanco stemmen'"/>
    <xsl:param name="RP22_OverviewVotes1-10_ongeldigeStemmen" select="'Totaal aantal ongeldige stemmen'"/>

    <xsl:param name="RP22_OverviewVotes11-20_Kieskring" select="'Kieskring'"/>
    <xsl:param name="RP22_OverviewVotes11-20_Lijst" select="'Lijst-'"/>
    <xsl:param name="RP22_OverviewVotes11-20_nummer" select="'nummer'"/>
    <xsl:param name="RP22_OverviewVotes11-20_stemmenOpEenKandidaat" select="'Totaal aantal stemmen op een kandidaat per kieskring'"/>
    <xsl:param name="RP22_OverviewVotes11-20_kandidaatUitgebrachteStemmen" select="'Totaal aantal op een kandidaat uitgebrachte stemmen'"/>
    <xsl:param name="RP22_OverviewVotes11-20_blancoStemmen" select="'Totaal aantal blanco stemmen'"/>
    <xsl:param name="RP22_OverviewVotes11-20_ongeldigeStemmen" select="'Totaal aantal ongeldige stemmen'"/>
    <xsl:param name="RP22_OverviewVotes11-20_TotaalAantal" select="'Totaal aantal'"/>
    <xsl:param name="RP22_OverviewVotes11-20_stemmenPer" select="'stemmen per'"/>
    <xsl:param name="RP22_OverviewVotes11-20_groepering" select="'groepering'"/>
    
    <xsl:param name="RP22_OverviewVotesEK_Lijst" select="'Lijst-'"/>
    <xsl:param name="RP22_OverviewVotesEK_nummer" select="'nummer'"/>
    <xsl:param name="RP22_OverviewVotesEK_Provincie" select="'Provincie'"/>
    <xsl:param name="RP22_OverviewVotesEK_TotaalAantal" select="'Totaal aantal'"/>
    <xsl:param name="RP22_OverviewVotesEK_stemmenPer" select="'stemmen per'"/>
    <xsl:param name="RP22_OverviewVotesEK_groepering" select="'groepering'"/>
    <xsl:param name="RP22_OverviewVotesEK_aantalStemmen" select="'aantal stemmen:'"/>
    <xsl:param name="RP22_OverviewVotesEK_geldenVoor" select="'gelden voor:'"/>
    <xsl:param name="RP22_OverviewVotesEK_stemmenPerProvincie" select="'Totaal aantal stemmen per provincie'"/>
    <xsl:param name="RP22_OverviewVotesEK_uitgebrachteStemmen" select="'Totaal aantal uitgebrachte stemmen'"/>
    
    <xsl:param name="RP22_OverviewCheckedLists_NummerLijstencombinatie" select="'Nummer lijstencombinatie'"/>
    <xsl:param name="RP22_OverviewCheckedLists_verbonden" select="'Nummers van de verbonden lijsten (groepen)'"/>
    <xsl:param name="RP22_OverviewCheckedLists_AantalStemmen" select="'Aantal stemmen'"/>
    <xsl:param name="RP22_OverviewCheckedLists_LijstenTenAanzien" select="'Lijsten ten aanzien waarvan deze combinaties in aanmerking worden genomen'"/>
    <xsl:param name="RP22_OverviewCheckedLists_AantallenStemmenLijstencombinaties" select="'Aantallen stemmen van de lijstencombinaties'"/>

    <xsl:param name="RP22_OverviewFirstAssigment_LijstencombinatieLijst" select="'Lijstencombinatie, lijst'"/>
    <xsl:param name="RP22_OverviewFirstAssigment_Lijst" select="'Lijst'"/>
    <xsl:param name="RP22_OverviewFirstAssigment_AantalStemmen" select="'Aantal stemmen'"/>
    <xsl:param name="RP22_OverviewFirstAssigment_Quotiënt" select="'Quotiënt bij deling'"/>
    <xsl:param name="RP22_OverviewFirstAssigment_doorDeKiesdeler" select="'door de kiesdeler'"/>
    <xsl:param name="RP22_OverviewFirstAssigment_Kieskring" select="'(Kieskring '"/>
    <xsl:param name="RP22_OverviewFirstAssigment_Overeenkomstig" select="'Overeenkomstig artikel '"/>
    <xsl:param name="RP22_OverviewFirstAssigment_P6" select="'P 6'"/>
    <xsl:param name="RP22_OverviewFirstAssigment_U8" select="'U 8'"/>
    <xsl:param name="RP22_OverviewFirstAssigment_vanDeKieswet" select="' van de Kieswet wordt aan elke '"/>
    <xsl:param name="RP22_OverviewFirstAssigment_lijstencombinatie" select="'lijstencombinatie en aan elke '"/>
    <xsl:param name="RP22_OverviewFirstAssigment_lijstToegewezen" select="'lijst toegewezen het aantal zetels gelijk aan het bovenvermelde quotiënt.'"/>
    <xsl:param name="RP22_OverviewFirstAssigment_aantalToegewezen" select="'Het aantal toegewezen zetels bedraagt derhalve: '"/>
    <xsl:param name="RP22_OverviewFirstAssigment_aantalRestzetels" select="'Het aantal restzetels bedraagt: '"/>
    
    <xsl:param name="RP22_OverviewDHondtAssignment_Overeenkomstig" select="'Overeenkomstig artikel '"/>
    <xsl:param name="RP22_OverviewDHondtAssignment_P13" select="'P 13'"/>
    <xsl:param name="RP22_OverviewDHondtAssignment_U13" select="'U 13'"/>
    <xsl:param name="RP22_OverviewDHondtAssignment_P7" select="'P 7'"/>
    <xsl:param name="RP22_OverviewDHondtAssignment_eersteLid" select="', eerste lid van de Kieswet heeft een loting plaatsgevonden tussen '"/>
    <xsl:param name="RP22_OverviewDHondtAssignment_en" select="' en '"/>
    <xsl:param name="RP22_OverviewDHondtAssignment_AlsGevolg" select="'. Als gevolg hiervan is een restzetel toegewezen aan '"/>
    
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_Lijstencombinaties" select="'Lijstencombinaties'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_FootnoteSign" select="'*'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_AantalStemmen" select="'Aantal stemmen'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_AantalPlaatsen" select="'Aantal plaatsen lijstencombinatie'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_Combinatiekiesdeler" select="'Combinatie- kiesdeler'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_Quotiënt" select="'Quotiënt'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_Overschot" select="'Overschot'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_ToegewezenRestzetels" select="'Toegewezen restzetels'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_Lijst" select="'Lijst '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_combinatie" select="'combinatie '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_LijstencombinatiesMet" select="'*Lijstencombinaties met daaronder vermeld de verbonden lijsten.'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_OvereenkomstigP11" select="'Overeenkomstig artikel P 11, vijfde lid van de Kieswet heeft een loting plaatsgevonden tussen '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_en" select="' en '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_AlsGevolg" select="'. Als gevolg hiervan is een restzetel toegewezen aan '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_OvereenkomstigP13" select="'Overeenkomstig artikel P 13, eerste lid van de Kieswet vindt er een overgang plaats van '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_eenZetel" select="'een zetel'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_zetels" select="' zetels'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_van" select="' van '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_naar" select="' naar '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_anderLijst" select="'een ander lijst'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_andereLijsten" select="'andere lijsten'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinCombinedLists_HiernaZijn" select="'Hierna zijn overeenkomstig artikel P 13, tweede lid van de volgende restzetels toegewezen volgens het stelsel van de grootste gemiddelden:'"/>

    <xsl:param name="RP22_OverviewListResult_Aanduiding" select="'Aanduiding van de groepering'"/>
    <xsl:param name="RP22_OverviewListResult_FootnoteSign1" select="'*'"/>
    <xsl:param name="RP22_OverviewListResult_Lijstnummer" select="'Lijstnummer'"/>
    <xsl:param name="RP22_OverviewListResult_AantalZetels" select="'Aantal zetels'"/>
    <xsl:param name="RP22_OverviewListResult_FootnoteSign2" select="'*'"/>
    <xsl:param name="RP22_OverviewListResult_Vermelding" select="'Vermelding in volgorde van het aantal behaalde zetels'"/>
    
    <xsl:param name="RP22_OverviewListResultAndSeats_Aanduiding" select="'Aanduiding van de groepering'"/>
    <xsl:param name="RP22_OverviewListResultAndSeats_Lijst" select="'Lijst'"/>
    <xsl:param name="RP22_OverviewListResultAndSeats_aantalStemmen" select="'Totaal aantal stemmen'"/>
    <xsl:param name="RP22_OverviewListResultAndSeats_aantalZetels" select="'Toegewezen aantal zetels'"/>
    
    <xsl:param name="RP22_OverviewCandidateResultElected_BijDeToewijzing" select="'Bij de toewijzing van de zetels aan de kandidaten wordt ingevolge artikel P 19a van de Kieswet de kandidaat '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_buitenBeschouwing" select="' buiten beschouwing gelaten, aangezien deze is overleden.'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_MetToepassing" select="'Met toepassing van de artikelen '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_U15eerste1" select="'U 15, eerste en derde lid, jo. '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_P15" select="'P 15 en P 16 van de Kieswet zijn de volgende kandidaten van deze '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_lijstengroepDie" select="'lijstengroep die op de gezamenlijke lijsten waarop zij voorkomen'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_lijstDie" select="'lijst die'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_stemmenHebben" select="' een aantal stemmen hebben verkregen, groter dan '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_50" select="'de helft van'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_10" select="'10% van'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_100" select="'of gelijk aan'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_25" select="'25% van'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_deKiesdeler" select="' de kiesdeler, gekozen:'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_Naam" select="'Naam'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_Woonplaats" select="'Woonplaats'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_AantalStemmen" select="'Aantal stemmen'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_opDeGezamenlijke" select="'op de gezamenlijke'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_lijsten1" select="'lijsten'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_opDeLijst" select="'op de lijst'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_LijstWaaropDe" select="'Lijst waarop de'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_zetelWordt" select="'zetel wordt'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_toegewezen" select="'toegewezen'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_Stel" select="'Stel '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_Kieskring1" select="'Kieskring '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_Overeenkomstig" select="'Overeenkomstig artikel P 15, eerste lid van de Kieswet heeft een loting plaatsgevonden tuss'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_en" select="'en '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_AlsGevolg" select="'. Als gevolg hiervan is/zijn gekozen'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_Vervolgens" select="'Vervolgens zijn de aan de '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_lijsten2" select="'lijsten'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_lijst" select="'lijst'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_toegewezenZetels" select="' toegewezen zetels die nog niet aan een kandidaat zijn toegewezen, met toepassing van de artikelen '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_U15eerste2" select="'U 15, eerste en derde lid, jo. '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_P17" select="'P 17 en P 18 van de Kieswet aan de volgende kandidaten van deze '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_lijstengroep" select="'lijstengroep'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_toegewezen2" select="' toegewezen:'"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_StelGelijkluidendeLijsten" select="'Stel gelijkluidende lijsten: '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_Kieskring2" select="'Kieskring: '"/>
    <xsl:param name="RP22_OverviewCandidateResultElected_Provincie" select="'Provincie: '"/>
    
    <xsl:param name="RP22_OverviewCandidateResultNewListOrder_kandidatenZijn" select="'De kandidaten zijn met toepassing van '"/>
    <xsl:param name="RP22_OverviewCandidateResultNewListOrder_P19" select="'artikel P 19'"/>
    <xsl:param name="RP22_OverviewCandidateResultNewListOrder_U15" select="'de artikelen U 15, tweede en derde lid, j° P 19'"/>
    <xsl:param name="RP22_OverviewCandidateResultNewListOrder_Kieswet1" select="' van de Kieswet ten aanzien van iedere lijst gerangschikt in de volgorde zoals hiervoor is aangegeven, met uitzondering van de hierna te vermelden '"/>
    <xsl:param name="RP22_OverviewCandidateResultNewListOrder_lijst" select="'lijst'"/>
    <xsl:param name="RP22_OverviewCandidateResultNewListOrder_lijsten" select="'lijsten'"/>
    <xsl:param name="RP22_OverviewCandidateResultNewListOrder_tenAanzien" select="', ten aanzien waarvan de kandidaten als volgt zijn gerangschikt:'"/>
    <xsl:param name="RP22_OverviewCandidateResultNewListOrder_rangschikking" select="'Kandidaten in de volgorde van de rangschikking:'"/>
    <xsl:param name="RP22_OverviewCandidateResultNewListOrder_Naam" select="'Naam'"/>
    <xsl:param name="RP22_OverviewCandidateResultNewListOrder_Kieswet2" select="' van de Kieswet ten aanzien van deze lijst gerangschikt in de volgorde zoals hiervoor is aangegeven.'"/>

    <xsl:param name="RP22_OverviewElectedCandidate_Naam" select="'Naam van de kandidaat'"/>
    <xsl:param name="RP22_OverviewElectedCandidate_Woonplaats" select="'Woonplaats'"/>
    
    <xsl:param name="RP22_OverviewCandidateListsEP_Lijstnummer" select="'Lijstnummer'"/>
    <xsl:param name="RP22_OverviewCandidateListsEP_Aanduiding" select="'Aanduiding'"/>
    
    <xsl:param name="RP22_ListOrCombinedList_lijstencombinatie" select="'lijstencombinatie '"/>
    <xsl:param name="RP22_ListOrCombinedList_lijst" select="'lijst '"/>
    
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_P9" select="'Door toepassing van artikel P 9 van de Kieswet is een extra zetel toegewezen aan '"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_DaartegenoverVervalt" select="'Daartegenover vervalt een zetel die was toegewezen aan '"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_DaartegenoverHeeft" select="'Daartegenover heeft een loting plaatsgevonden tussen '"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_en" select="' en '"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_AlsGevolg" select="'. Als gevolg hiervan vervalt een zetel die was toegewezen aan '"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_DoorToepassing" select="'Door toepassing van artikel '"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_P10" select="'P 10'"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_U10" select="'U 10'"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_Kieswet" select="' van de Kieswet '"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_is" select="'is'"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_zijn" select="'zijn'"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_lijstuitputting" select="' als gevolg van lijstuitputting bij '"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_extraZetel" select="'een extra zetel toegewezen aan een ander lijst'"/>
    <xsl:param name="RP22_OverviewDHondtAssignmentSpecial_extraZetels" select="' extra zetels toegewezen aan andere lijsten'"/>
    
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

    <xsl:param name="RP22_PartyHeader3Lines_Aanduiding" select="'Aanduiding van de groepering:'"/>
    <xsl:param name="RP22_PartyHeader3Lines_Lijst" select="'Lijst:'"/>
    <xsl:param name="RP22_PartyHeader3Lines_ToegewezenAantal" select="'Toegewezen aantal zetels:'"/>

    <xsl:param name="RP22_PartyHeader4Lines_Aanduiding" select="'Aanduiding van de groepering:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_Lijstengroep" select="'Lijstengroep:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_Kieskring" select="'Kieskring:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_Provincie" select="'Provincie:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_Stel" select="'Stel:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_AAantal" select="'A = Aantal uitgebrachte stemmen'"/>
    <xsl:param name="RP22_PartyHeader4Lines_BGeldenVoor" select="'B = Gelden voor'"/>
    <xsl:param name="RP22_PartyHeader4Lines_aantalStemmen" select="'Totaal aantal stemmen:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_ToegewezenAantal" select="'Toegewezen aantal zetels:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_Lijst" select="'Lijst:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_zichzelf" select="'Op zichzelf staande lijst:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_StelGelijkluidendeLijsten" select="'Stel gelijkluidende lijsten:'"/>
    <xsl:param name="RP22_PartyHeader4Lines_Lijstnummer" select="'Lijstnummer:'"/>
    
    <xsl:param name="RP22_PartyHeader5Lines_Aanduiding" select="'Aanduiding van de groepering:'"/>
    <xsl:param name="RP22_PartyHeader5Lines_Lijstengroepnummer" select="'Lijstengroepnummer:'"/>
    <xsl:param name="RP22_PartyHeader5Lines_aantalStemmen" select="'Totaal aantal stemmen:'"/>
    <xsl:param name="RP22_PartyHeader5Lines_ToegewezenAantal" select="'Toegewezen aantal zetels:'"/>
    <xsl:param name="RP22_PartyHeader5Lines_Groepskiesdeler" select="'Groepskiesdeler:'"/>
    
    <xsl:param name="RP22_O3CandidateVotes_Aanduiding" select="'Aanduiding van de groepering: '"/>
    <xsl:param name="RP22_O3CandidateVotes_Lijstnummer" select="'Lijstnummer: '"/>
    <xsl:param name="RP22_O3CandidateVotes_Volgnummer" select="'Volgnummer op de lijst'"/>
    <xsl:param name="RP22_O3CandidateVotes_Kandidaten" select="'Kandidaten'"/>
    <xsl:param name="RP22_O3CandidateVotes_aantalStemmen" select="'Aantal stemmen'"/>
    <xsl:param name="RP22_O3CandidateVotes_Stemcijfer" select="'Stemcijfer: '"/>
    
    <xsl:param name="RP22_O3-H-CandidateVotes_Volgnummer" select="'Volgnummer op de lijst'"/>
    <xsl:param name="RP22_O3-H-CandidateVotes_Kandidaten" select="'Kandidaten'"/>
    <xsl:param name="RP22_O3-H-CandidateVotes_aantalStemmen" select="'Aantal stemmen'"/>

    <xsl:param name="RP22_OverviewVotesP22-2_Lijstnummer" select="'Lijstnummer'"/>
    <xsl:param name="RP22_OverviewVotesP22-2_Aanduiding" select="'Aanduiding'"/>
    <xsl:param name="RP22_OverviewVotesP22-2_aantalStemmen" select="'Aantal stemmen'"/>
    <xsl:param name="RP22_OverviewVotesP22-2_kandidaatUitgebrachte" select="'Totaal aantal op een kandidaat uitgebrachte stemmen:'"/>
    <xsl:param name="RP22_OverviewVotesP22-2_blancoStemmen" select="'Totaal aantal blanco stemmen:'"/>
    <xsl:param name="RP22_OverviewVotesP22-2_ongeldigeStemmen" select="'Totaal aantal ongeldige stemmen:'"/>

    <xsl:param name="RP22_FictitiousDistribution_Lijst" select="'Lijst'"/>
    <xsl:param name="RP22_FictitiousDistribution_AantalZetels" select="'Aantal zetels'"/>

    <xsl:param name="RP22_OverviewNiemeyerAssignment_LijstencombinatieLijst" select="'Lijstencombinatie, lijst'"/>
    <xsl:param name="RP22_OverviewNiemeyerAssignment_Reeds" select="'Reeds toegewezen zetels'"/>
    <xsl:param name="RP22_OverviewNiemeyerAssignment_Overschot" select="'Overschot'"/>
    <xsl:param name="RP22_OverviewNiemeyerAssignment_restzetels" select="'Toegewezen restzetels'"/>
    <xsl:param name="RP22_OverviewNiemeyerAssignment_Overeenkomstig" select="'Overeenkomstig artikel '"/>
    <xsl:param name="RP22_OverviewNiemeyerAssignment_P13" select="'P 13'"/>
    <xsl:param name="RP22_OverviewNiemeyerAssignment_P7" select="'P 7'"/>
    <xsl:param name="RP22_OverviewNiemeyerAssignment_Kieswet" select="', eerste lid van de Kieswet heeft een loting plaatsgevonden tussen '"/>
    <xsl:param name="RP22_OverviewNiemeyerAssignment_en" select="' en '"/>
    <xsl:param name="RP22_OverviewNiemeyerAssignment_AlsGevolg" select="'. Als gevolg hiervan is een restzetel toegewezen aan '"/>
    
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_LijstStel" select="'Lijst c.q. stel'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_gelijkluidende" select="'gelijkluidende lijsten'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_Stemmenaantal" select="'Stemmenaantal'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_aantalStemmen" select="'Aantal stemmen'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_Quotiënt" select="'Quotiënt'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_Overschot" select="'Overschot'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_restzetels" select="'Toegewezen restzetels'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_toegewezenZetels" select="'Totaal toegewezen zetels'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_Kieskring" select="'Kieskring '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_TotaalStel" select="'Totaal stel '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_Overeenkomstig1" select="'Overeenkomstig artikel '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_P12" select="'P 12'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_U11" select="'U 11'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_vijfdeLid" select="', vijfde lid van de Kieswet heeft een loting plaatsgevonden tussen '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_en" select="' en '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_AlsGevolg" select="'. Als gevolg hiervan is een restzetel toegewezen aan '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_Overeenkomstig2" select="'Overeenkomstig artikel '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_P13" select="'P 13'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_U13" select="'U 13'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_eersteLidEenZetel" select="', eerste lid van de Kieswet, vindt er een overgang plaats van een zetel van '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_eenAnderLijst" select="' naar een ander lijst.'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_eersteLid" select="', eerste lid van de Kieswet, vindt er een overgang plaats van '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_zetels" select="' zetels van '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_andereLijsten" select="' naar andere lijsten.'"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_Hierna" select="'Hierna zijn overeenkomstig artikel '"/>
    <xsl:param name="RP22_OverviewAssignmentWithinListGroups_tweedeLid" select="', tweede lid van de Kieswet volgende restzetels toegewezen volgens het stelsel van de grootste gemiddelden:'"/>
    
    <xsl:param name="RP22_ListOrCombinedListUni_lijstencombinatie" select="'lijstencombinatie '"/>
    <xsl:param name="RP22_ListOrCombinedListUni_kieskring" select="'kieskring '"/>
    <xsl:param name="RP22_ListOrCombinedListUni_stel" select="'stel '"/>
    <xsl:param name="RP22_ListOrCombinedListUni_lijst" select="'lijst '"/>

    <xsl:param name="RP22_OverviewVotes2_Kieskring" select="'Kieskring'"/>
    <xsl:param name="RP22_OverviewVotes2_Lijst" select="'Lijst-'"/>
    <xsl:param name="RP22_OverviewVotes2_nummer" select="'nummer'"/>
    <xsl:param name="RP22_OverviewVotes2_TotaalAantal" select="'Totaal aantal'"/>
    <xsl:param name="RP22_OverviewVotes2_stemmenPer" select="'stemmen per'"/>
    <xsl:param name="RP22_OverviewVotes2_groepering" select="'groepering'"/>
    <xsl:param name="RP22_OverviewVotes2_stemmenKandidaat" select="'Totaal aantal stemmen op een kandidaat per kieskring'"/>
    <xsl:param name="RP22_OverviewVotes2_uitgebrachteStemmen" select="'Totaal aantal op een kandidaat uitgebrachte stemmen'"/>
    <xsl:param name="RP22_OverviewVotes2_blancoStemmen" select="'Totaal aantal blanco stemmen'"/>
    <xsl:param name="RP22_OverviewVotes2_ongeldigeStemmen" select="'Totaal aantal ongeldige stemmen'"/>
    
    <xsl:param name="RP22_OverviewVotes3_Kieskring" select="'Kieskring'"/>
    <xsl:param name="RP22_OverviewVotes3_Lijst" select="'Lijst-'"/>
    <xsl:param name="RP22_OverviewVotes3_nummer" select="'nummer'"/>
    <xsl:param name="RP22_OverviewVotes3_TotaalAantal" select="'Totaal aantal'"/>
    <xsl:param name="RP22_OverviewVotes3_stemmenPer" select="'stemmen per'"/>
    <xsl:param name="RP22_OverviewVotes3_groepering" select="'groepering'"/>
    <xsl:param name="RP22_OverviewVotes3_stemmenKandidaat" select="'Totaal aantal stemmen op een kandidaat per kieskring'"/>
    <xsl:param name="RP22_OverviewVotes3_uitgebrachteStemmen" select="'Totaal aantal op een kandidaat uitgebrachte stemmen'"/>
    <xsl:param name="RP22_OverviewVotes3_blancoStemmen" select="'Totaal aantal blanco stemmen'"/>
    <xsl:param name="RP22_OverviewVotes3_ongeldigeStemmen" select="'Totaal aantal ongeldige stemmen'"/>
    
    <xsl:param name="RP22_OverviewVotes4_Kieskring" select="'Kieskring'"/>
    <xsl:param name="RP22_OverviewVotes4_Lijst" select="'Lijst-'"/>
    <xsl:param name="RP22_OverviewVotes4_nummer" select="'nummer'"/>
    <xsl:param name="RP22_OverviewVotes4_TotaalAantal" select="'Totaal aantal'"/>
    <xsl:param name="RP22_OverviewVotes4_stemmenPer" select="'stemmen per'"/>
    <xsl:param name="RP22_OverviewVotes4_groepering" select="'groepering'"/>
    <xsl:param name="RP22_OverviewVotes4_stemmenKandidaat" select="'Totaal aantal stemmen op een kandidaat per kieskring'"/>
    <xsl:param name="RP22_OverviewVotes4_uitgebrachteStemmen" select="'Totaal aantal op een kandidaat uitgebrachte stemmen'"/>
    <xsl:param name="RP22_OverviewVotes4_blancoStemmen" select="'Totaal aantal blanco stemmen'"/>
    <xsl:param name="RP22_OverviewVotes4_ongeldigeStemmen" select="'Totaal aantal ongeldige stemmen'"/>
    
    <xsl:param name="RP22_Kiesdeler_totaal" select="'Het totaal van de '"/>
    <xsl:param name="RP22_Kiesdeler_kandidaat" select="'op een kandidaat'"/>
    <xsl:param name="RP22_Kiesdeler_uitgebrachteStemmen" select="' uitgebrachte stemmen bedraagt: '"/>
    <xsl:param name="RP22_Kiesdeler_Aangezien" select="'Aangezien '"/>
    <xsl:param name="RP22_Kiesdeler_zetelsTeVerdelen" select="' zetels te verdelen zijn, bedraagt de kiesdeler: '"/>
    <xsl:param name="RP22_Kiesdeler_ration" select="' : '"/>
    <xsl:param name="RP22_Kiesdeler_equals" select="' ='"/>
    
    <xsl:param name="RP22_OverviewDHondtTable2_Lijst" select="'Lijst'"/>
    <xsl:param name="RP22_OverviewDHondtTable2_LijstencombinatieLijst" select="'Lijstencombinatie, lijst'"/>
    <xsl:param name="RP22_OverviewDHondtTable2_Reeds" select="'Reeds toegewezen zetels'"/>
    <xsl:param name="RP22_OverviewDHondtTable2_Gemiddeld" select="'Gemiddeld aantal stemmen bij toewijzing van restzetels'"/>
    <xsl:param name="RP22_OverviewDHondtTable2_restzetels" select="'Toegewezen restzetels'"/>
    
    <xsl:param name="RP22_OverviewDHondtTable3_Lijst" select="'Lijst'"/>
    <xsl:param name="RP22_OverviewDHondtTable3_LijstencombinatieLijst" select="'Lijstencombinatie, lijst'"/>
    <xsl:param name="RP22_OverviewDHondtTable3_Reeds" select="'Reeds toegewezen zetels'"/>
    <xsl:param name="RP22_OverviewDHondtTable3_Gemiddeld" select="'Gemiddeld aantal stemmen bij toewijzing van restzetels'"/>
    <xsl:param name="RP22_OverviewDHondtTable3_restzetels" select="'Toegewezen restzetels'"/>
    
    <xsl:param name="RP22_OverviewDHondtTable4_Lijst" select="'Lijst'"/>
    <xsl:param name="RP22_OverviewDHondtTable4_LijstencombinatieLijst" select="'Lijstencombinatie, lijst'"/>
    <xsl:param name="RP22_OverviewDHondtTable4_Reeds" select="'Reeds toegewezen zetels'"/>
    <xsl:param name="RP22_OverviewDHondtTable4_Gemiddeld" select="'Gemiddeld aantal stemmen bij toewijzing van restzetels'"/>
    <xsl:param name="RP22_OverviewDHondtTable4_restzetels" select="'Toegewezen restzetels'"/>
    
    <xsl:param name="RP22_OverviewDHondtTable5-10_Lijst" select="'Lijst'"/>
    <xsl:param name="RP22_OverviewDHondtTable5-10_LijstencombinatieLijst" select="'Lijstencombinatie, lijst'"/>
    <xsl:param name="RP22_OverviewDHondtTable5-10_Gemiddeld" select="'Gemiddeld aantal stemmen bij toewijzing van restzetels'"/>
    
    <xsl:param name="RP22_OverviewCandidateResult1-1-4_VolgnummerKandidaten" select="'Volgnummer     Kandidaten'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-1-4_AantalStemmen" select="'Aantal stemmen per kieskring'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-1-4_opDeLijst" select="'op de lijst'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-1-4_Totaal" select="'Totaal'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-1-4_aantal" select="'aantal'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-1-4_stemmen" select="'stemmen'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-1-4_Totaal2" select="'Totaal'"/>

    <xsl:param name="RP22_OverviewCandidateResult1-1-7_VolgnummerKandidaten" select="'Volgnummer     Kandidaten'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-1-7_AantalStemmen" select="'Aantal stemmen per kieskring'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-1-7_opDeLijst" select="'op de lijst'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-1-7_Totaal2" select="'Totaal'"/>

    <xsl:param name="RP22_OverviewCandidateResult1-8-20_Volgnummer" select="'Volgnummer'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-8-20_opDeLijst" select="'op de lijst'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-8-20_AantalStemmen" select="'Aantal stemmen per kieskring'"/>
    <xsl:param name="RP22_OverviewCandidateResult1-8-20_Totaal2" select="'Totaal'"/>

    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_Volgnummer" select="'Volgnummer'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_Kandidaten" select="'Kandidaten'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_AantalStemmen" select="'Aantal stemmen (per provincie)'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_Totaal" select="'Totaal'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_opDeLijst" select="'op de lijst'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_aantal" select="'aantal'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_stemmen" select="'stemmen'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_FootnoteSign1" select="'*'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_Totaal2" select="'Totaal'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_FootnoteSign2" select="'* '"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-2_VoorZoverSprake" select="'Voor zover sprake is van gelijkluidende lijsten.'"/>

    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_Volgnummer" select="'Volgnummer'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_Kandidaten" select="'Kandidaten'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_AantalStemmen" select="'Aantal stemmen (per provincie)'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_Totaal" select="'Totaal'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_opDeLijst" select="'op de lijst'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_aantal" select="'aantal'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_stemmen" select="'stemmen'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_FootnoteSign1" select="'*'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_Totaal2" select="'Totaal'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_FootnoteSign2" select="'* '"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-4_VoorZoverSprake" select="'Voor zover sprake is van gelijkluidende lijsten.'"/>

    <xsl:param name="RP22_OverviewCandidateResult-EK-1-5_Volgnummer" select="'Volgnummer'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-5_Kandidaten" select="'Kandidaten'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-5_AantalStemmen" select="'Aantal stemmen (per provincie)'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-5_opDeLijst" select="'op de lijst'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-1-5_Totaal2" select="'Totaal'"/>

    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_Volgnummer" select="'Volgnummer'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_AantalStemmen" select="'Aantal stemmen (per provincie)'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_Totaal" select="'Totaal'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_opDe" select="'op de '"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_lijst" select="'lijst'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_aantal" select="'aantal'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_stemmen" select="'stemmen'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_FootnoteSign1" select="'*'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_Totaal2" select="'Totaal'"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_FootnoteSign2" select="'* '"/>
    <xsl:param name="RP22_OverviewCandidateResult-EK-6-12_VoorZoverSprake" select="'Voor zover sprake is van gelijkluidende lijsten.'"/>

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
    
    <xsl:param name="RP22_ResidualSeatsAssignment_restzetelsZijn" select="'De restzetels zijn met toepassing van artikel '"/>
    <xsl:param name="RP22_ResidualSeatsAssignment_P7" select="'P 7'"/>
    <xsl:param name="RP22_ResidualSeatsAssignment_U9" select="'U 9'"/>
    <xsl:param name="RP22_ResidualSeatsAssignment_toegewezen" select="' van de Kieswet toegewezen aan de '"/>
    <xsl:param name="RP22_ResidualSeatsAssignment_lijstencombinaties" select="'lijstencombinaties onderscheidenlijk '"/>
    <xsl:param name="RP22_ResidualSeatsAssignment_naToewijzing" select="'lijsten die na toewijzing van de zetel het grootste '"/>
    <xsl:param name="RP22_ResidualSeatsAssignment_gemiddeld" select="'gemiddeld'"/>
    <xsl:param name="RP22_ResidualSeatsAssignment_gemiddelde" select="'gemiddelde'"/>
    <xsl:param name="RP22_ResidualSeatsAssignment_stemmenPerZetel" select="' aantal stemmen per zetel hebben.'"/>

    <xsl:param name="RP22_AssignmentWithinCombinedLists_lijstencombinatiesToegewezen" select="'De aan de lijstencombinaties toegewezen zetels zijn ingevolge artikel '"/>
    <xsl:param name="RP22_AssignmentWithinCombinedLists_P11" select="'P 11'"/>
    <xsl:param name="RP22_AssignmentWithinCombinedLists_U11" select="'U 11'"/>
    <xsl:param name="RP22_AssignmentWithinCombinedLists_Kieswet" select="' van de Kieswet als volgt verdeeld over de verbonden lijsten.'"/>
    <xsl:param name="RP22_AssignmentWithinCombinedLists_combinatiekiesdeler" select="'Eerst is de combinatiekiesdeler vastgesteld door het stemcijfer van de lijstencombinatie te delen door het aantal aan die combinatie toegewezen zetels. Vervolgens is de combinatiekiesdeler gedeeld op de stemcijfers van de verbonden lijsten. Aan elk van de lijsten is het aantal zetels toegewezen overeenkomend met het aldus voor de desbetreffende lijst verkregen quotiënt. De restzetels zijn toegewezen aan de lijsten die bij genoemde deling de grootste overschotten hebben.'"/>
    <xsl:param name="RP22_AssignmentWithinCombinedLists_NietVanToepassing" select="'Niet van toepassing.'"/>
    
    <xsl:param name="RP22_AssignmentWithinListGroups_lijstengroepenToegewezen" select="'De aan de lijstengroepen toegewezen zetels zijn ingevolge artikel '"/>
    <xsl:param name="RP22_AssignmentWithinListGroups_P12" select="'P 12'"/>
    <xsl:param name="RP22_AssignmentWithinListGroups_U12" select="'U 12'"/>
    <xsl:param name="RP22_AssignmentWithinListGroups_Kieswet" select="' van de Kieswet als volgt verdeeld over de verbonden lijsten. Eerst is de groepskiesdeler vastgesteld door het stemcijfer van de lijstengroep te delen door het aantal aan die groep toegewezen zetels. Vervolgens is de groepskiesdeler gedeeld op de stemcijfers van de lijsten waaruit de groep bestaat. Aan elk van de lijsten is het aantal zetels toegewezen overeenkomend met het aldus voor de desbetreffende lijst verkregen quotiënt. De restzetels zijn toegewezen aan de lijsten die bij genoemde deling de grootste overschotten hebben.'"/>
    <xsl:param name="RP22_AssignmentWithinListGroups_NietVanToepassing" select="'Niet van toepassing.'"/>
    
    <xsl:param name="RP22_DistrictNumber_Totaal" select="'Totaal'"/>
    <xsl:param name="RP22_DistrictNumber_aantal" select="'aantal'"/>
    <xsl:param name="RP22_DistrictNumber_stemmen" select="'stemmen'"/>

    <xsl:param name="RP22_ProvincesTable_1" select="'1. Groningen'"/>
    <xsl:param name="RP22_ProvincesTable_2" select="'2. Fryslân'"/>
    <xsl:param name="RP22_ProvincesTable_3" select="'3. Drenthe'"/>
    <xsl:param name="RP22_ProvincesTable_4" select="'4. Overijssel'"/>
    <xsl:param name="RP22_ProvincesTable_5" select="'5. Flevoland'"/>
    <xsl:param name="RP22_ProvincesTable_6" select="'6. Gelderland'"/>
    <xsl:param name="RP22_ProvincesTable_7" select="'7. Utrecht'"/>
    <xsl:param name="RP22_ProvincesTable_8" select="'8. Noord-Holland'"/>
    <xsl:param name="RP22_ProvincesTable_9" select="'9. Zuid-Holland'"/>
    <xsl:param name="RP22_ProvincesTable_10" select="'10. Zeeland'"/>
    <xsl:param name="RP22_ProvincesTable_11" select="'11. Noord-Brabant'"/>
    <xsl:param name="RP22_ProvincesTable_12" select="'12. Limburg'"/>

    <xsl:param name="RP22_ListOrCombinedListPart2_Kieskring" select="'(Kieskring '"/>
</xsl:stylesheet>
