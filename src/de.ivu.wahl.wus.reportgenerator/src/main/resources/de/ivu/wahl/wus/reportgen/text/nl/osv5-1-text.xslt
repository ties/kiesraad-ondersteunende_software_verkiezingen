<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="o5-1_005_1_Geslacht" select="'dhr. '"/>
    <xsl:param name="o5-1_005_2_Geslacht" select="'mevr. '"/>
    <xsl:param name="o5-1_010_Onderwerp" select="'Onderwerp'"/>
    <xsl:param name="o5-1_020_BenoemingTotLid" select="'Benoeming tot lid van '"/>
    <xsl:param name="o5-1_030_Geachte" select="'Geachte '"/>
    <xsl:param name="o5-1_040_heer" select="'heer'"/>
    <xsl:param name="o5-1_050_mevrouw" select="'mevrouw'"/>
    <xsl:param name="o5-1_060_heerMevrouw" select="'heer/mevrouw'"/>
    <xsl:param name="o5-1_070_1_deelIkUMee" select="'Ter voldoening aan'"/>
    <xsl:param name="o5-1_070_2_deelIkUMee" select="' artikel Y 25, tweede lid, van de Kieswet juncto'"/>
    <xsl:param name="o5-1_070_3_deelIkUMee" select="' artikel V 1, eerste lid, van de Kieswet deel ik u mee, dat '"/>
    <xsl:param name="o5-1_070_4_deelIkUMee" select="'u benoemd bent tot lid van '"/>
    <xsl:param name="o5-1_070_5_deelIkUMee" select="' benoemd is tot lid van '"/>
    <xsl:param name="o5-1_075_OnderstaandInformeer" select="'. Onderstaand informeer ik u nader omtrent de verdere gang van zaken.'"/>
    <xsl:param name="o5-1_080_1_benoemingAanneemt" select="'Indien u uw benoeming tot lid van '"/>
    <xsl:param name="o5-1_080_1a_benoemingAanneemt" select="'Indien hij zijn benoeming tot lid van '"/>
    <xsl:param name="o5-1_080_1b_benoemingAanneemt" select="'Indien zij haar benoeming tot lid van '"/>
    <xsl:param name="o5-1_080_1c_benoemingAanneemt" select="'Indien hij zijn / zij haar benoeming tot lid van '"/>
    <xsl:param name="o5-1_080_2_benoemingAanneemt" select="' aanneemt, dient u hiervan uiterlijk '"/>
    <xsl:param name="o5-1_080_3_benoemingAanneemt" select="' (uiterlijk 10e dag na dagtekening) mededeling te doen aan de voorzitter van '"/>
    <xsl:param name="o5-1_080_4_benoemingAanneemt" select="'In verband met de eerste samenkomst van de nieuwgekozen kamer op '"/>
    <xsl:param name="o5-1_080_5_benoemingAanneemt" select="' (datum eerste samenkomst) is het echter raadzaam deze mededeling zo spoedig mogelijk aan de voorzitter te doen toekomen. '"/>
    <xsl:param name="o5-1_090_1_VoorDeMededeling" select="'Voor de mededeling kunt u gebruik maken van het formulier dat als bijlage bij deze brief is gevoegd. Heeft de voorzitter van '"/>
    <xsl:param name="o5-1_090_2_VoorDeMededeling" select="' de mededeling niet op '"/>
    <xsl:param name="o5-1_090_3_VoorDeMededeling" select="' (uiterlijk 10e dag na dagtekening) ontvangen, dan wordt u geacht de benoeming niet aan te nemen.'"/>
    <xsl:param name="o5-1_090_4_VoorDeMededeling" select="' (uiterlijk 10e dag na dagtekening) ontvangen, dan wordt de kandidaat geacht de benoeming niet aan te nemen.'"/>
    <xsl:param name="o5-1_100_1_BijDeMededeling" select="'Bij de mededeling omtrent de aanneming van de benoeming dient u te overleggen een door de kandidaat ondertekende verklaring, waarin alle openbare betrekkingen vermeld zijn die deze bekleedt. Indien de kandidaat thans geen zitting heeft in '"/>
    <xsl:param name="o5-1_100_2_BijDeMededeling" select="'Bij de mededeling omtrent de aanneming van de benoeming dient u te overleggen een door u ondertekende verklaring, waarin u alle openbare betrekkingen vermeldt, die u bekleedt. Indien u thans geen zitting hebt in '"/>
    <xsl:param name="o5-1_100_3_BijDeMededeling" select="', dient u daarnaast te overleggen een gewaarmerkt afschrift van gegevens uit de basisadministratie persoonsgegevens van de gemeente waar de kandidaat woonachtig is, waaruit '"/>
    <xsl:param name="o5-1_100_3b_BijDeMededeling" select="'zijn'"/>
    <xsl:param name="o5-1_100_3c_BijDeMededeling" select="'haar'"/>
    <xsl:param name="o5-1_100_3d_BijDeMededeling" select="'zijn / haar'"/>
    <xsl:param name="o5-1_100_3e_BijDeMededeling" select="' woonplaats, datum en plaats van geboorte'"/>
    <xsl:param name="o5-1_100_3a_BijDeMededeling" select="', dient u daarnaast te overleggen een uittreksel uit het geboorteregister, waaruit datum en plaats van de geboorte van de kandidaat blijken'"/>
    <xsl:param name="o5-1_100_4_BijDeMededeling" select="', dient u daarnaast te overleggen een gewaarmerkt afschrift van gegevens uit de basisadministratie persoonsgegevens van de gemeente waar u woonachtig bent, waaruit uw woonplaats, datum en plaats van geboorte'"/>
    <xsl:param name="o5-1_100_5_BijDeMededeling" select="', alsmede zijn / haar Nederlanderschap blijkt'"/>
    <xsl:param name="o5-1_100_5a_BijDeMededeling" select="', alsmede een bewijs van het Nederlanderschap'"/>
    <xsl:param name="o5-1_100_5b_BijDeMededeling" select="', alsmede zijn Nederlanderschap blijkt'"/>
    <xsl:param name="o5-1_100_5c_BijDeMededeling" select="', alsmede haar Nederlanderschap blijkt'"/>
    <xsl:param name="o5-1_100_6_BijDeMededeling" select="', alsmede uw Nederlanderschap blijkt'"/>
    <xsl:param name="o5-1_100_7_BijDeMededeling" select="' blijken'"/>
    <xsl:param name="o5-1_110_1_nietAannemen" select="'Wil de kandidaat'"/>
    <xsl:param name="o5-1_110_2_nietAannemen" select="'Wilt u'"/>
    <xsl:param name="o5-1_110_3_nietAannemen" select="' de benoeming niet aannemen, dan dient u hiervan aan ondergetekende mededeling te doen, eveneens uiterlijk op '"/>
    <xsl:param name="o5-1_110_4_nietAannemen" select="' (uiterlijk 10e dag na dagtekening). Ook hiervoor kunt u gebruik maken van het bijgevoegde formulier. '"/>
    <xsl:param name="o5-1_110_1_tekstKieswet" select="'De tekst van de relevante bepalingen uit de Kieswet treft u bijgaand aan.'"/>
    <xsl:param name="o5-1_120_DeVoorzitter" select="'De voorzitter van het centraal stembureau voor de verkiezing van de leden van '"/>
    <xsl:param name="o5-1_130_RelevanteBepalingen" select="'Relevante bepalingen uit de Kieswet'"/>
    <xsl:param name="o5-1_140_ArtikelV1" select="'Artikel V 1'"/>
    <xsl:param name="o5-1_150_ArtikelV1-1" select="'1. De voorzitter van het centraal stembureau geeft de benoemde schriftelijk kennis van zijn benoeming. De brief, houdende deze kennisgeving, wordt uiterlijk de dag na de vaststelling van de uitslag van de verkiezingen of na de benoemdverklaring tegen gedagtekend ontvangstbewijs uitgereikt of aangetekend verzonden. Aan benoemde leden van de Tweede Kamer respectievelijk de Eerste Kamer wordt de brief binnen deze termijn tegen gedagtekend ontvangstbewijs uitgereikt of aangetekend verzonden door de voorzitter van de Tweede Kamer respectievelijk de Eerste Kamer der Staten-Generaal. De voorzitter van het centraal stembureau overhandigt de brief hiertoe onverwijld na de vaststelling van de uitslag of de benoemdverklaring aan de voorzitter van de Tweede Kamer respectievelijk de Eerste Kamer der Staten-Generaal.'"/>
    <xsl:param name="o5-1_160_ArtikelV1-2" select="'2. Indien de benoemde een gemachtigde heeft aangewezen, geschiedt de toezending of uitreiking aan die gemachtigde.'"/>
    <xsl:param name="o5-1_170_ArtikelV1-3" select="'3. De voorzitter geeft tegelijkertijd schriftelijk kennis van de benoeming aan het vertegenwoordigend orgaan. Deze kennisgeving strekt de benoemde tot geloofsbrief.'"/>
    <xsl:param name="o5-1_180_ArtikelV2" select="'Artikel V 2'"/>
    <xsl:param name="o5-1_190_ArtikelV2-1" select="'1. De benoemde draagt er zorg voor dat uiterlijk op de tiende of, bij een benoeming in een na de eerste samenkomst van het nieuw gekozen orgaan opengevallen plaats, de achtentwintigste dag na de dagtekening van de kennisgeving van benoeming het vertegenwoordigend orgaan van hem, onderscheidenlijk van de gemachtigde, bij brief mededeling ontvangt dat hij de benoeming aanneemt.'"/>
    <xsl:param name="o5-1_200_ArtikelV2-2" select="'2. Is binnen die tijd de mededeling niet ontvangen, dan wordt hij geacht de benoeming niet aan te nemen.'"/>
    <xsl:param name="o5-1_210_ArtikelV2-3" select="'3. De voorzitter van het vertegenwoordigend orgaan deelt aan de voorzitter van het centraal stembureau onverwijld mede, dat de benoemde de benoeming heeft aangenomen, dan wel dat hij geacht wordt de benoeming niet aan te nemen.'"/>
    <xsl:param name="o5-1_220_ArtikelV2-4" select="'4. Indien de benoemde de benoeming niet aanneemt, doet hij of zijn gemachtigde daarvan binnen de in het eerste lid bedoelde termijn bij brief mededeling aan de voorzitter van het centraal stembureau. Deze geeft hiervan kennis aan het vertegenwoordigend orgaan.'"/>
    <xsl:param name="o5-1_230_ArtikelV2-5" select="'5. Zolang nog niet tot toelating van de benoemde is besloten, kan deze, onderscheidenlijk zijn gemachtigde, bij brief aan het vertegenwoordigend orgaan mededelen dat hij op de aanneming van de benoeming terugkomt. Hij wordt dan geacht de benoeming niet te hebben aangenomen. De voorzitter van het vertegenwoordigend orgaan geeft van de ontvangst van deze mededeling onverwijld kennis aan de voorzitter van het centraal stembureau.'"/>
    <xsl:param name="o5-1_240_ArtikelV3" select="'Artikel V 3, eerste t/m derde lid'"/>
    <xsl:param name="o5-1_250_ArtikelV3-1" select="'1. Tegelijk met de mededeling dat hij zijn benoeming aanneemt, legt de benoemde, onderscheidenlijk zijn gemachtigde, aan het vertegenwoordigend orgaan een door hem ondertekende verklaring over, vermeldende alle openbare betrekkingen die de benoemde bekleedt.'"/>
    <xsl:param name="o5-1_260_ArtikelV3-2" select="'2. Tenzij de benoemde op het tijdstip van benoeming reeds lid van het vertegenwoordigend orgaan was, legt hij tevens een gewaarmerkt afschrift van gegevens uit de basisadministratie persoonsgegevens van de gemeente waar hij als ingezetene is ingeschreven over, waaruit zijn woonplaats, datum en plaats van de geboorte, alsmede, indien het betreft een benoeming tot lid van de Tweede of Eerste Kamer of provinciale staten, zijn Nederlanderschap blijken.'"/>
    <xsl:param name="o5-1_270_ArtikelV3-3" select="'3. De gemachtigde van de benoemde die buiten Nederland woonplaats heeft, legt in plaats van het afschrift, bedoeld in het tweede lid, een uittreksel uit de geboorteregisters over, waaruit datum en plaats van de geboorte van de benoemde blijken, alsmede een bewijs van Nederlanderschap betreffende de benoemde.'"/>
    <xsl:param name="o5-1_280_ArtikelY25" select="'Artikel Y 25'"/>
    <xsl:param name="o5-1_290_ArtikelY25-1" select="'1. De Tweede Kamer onderzoekt zo spoedig mogelijk of de benoemde op grond van de nationale bepalingen als lid van het Europees Parlement kan worden toegelaten.'"/>
    <xsl:param name="o5-1_300_ArtikelY25-2" select="'2. De artikelen V 1 tot en met V 10 zijn daarbij van overeenkomstige toepassing, met dien verstande dat waar in deze artikelen sprake is van het vertegenwoordigend orgaan of het orgaan waarvoor de benoeming is geschied, daarvoor de Tweede Kamer in de plaats treedt.'"/>
    <xsl:param name="o5-1_310_1_benoemingAanneem" select="'Hierbij verklaar ik dat '"/>
    <xsl:param name="o5-1_310_2_benoemingAanneem" select="'ik mijn'"/>
    <xsl:param name="o5-1_310_2a_benoemingAanneem" select="' zijn'"/>
    <xsl:param name="o5-1_310_2b_benoemingAanneem" select="' haar'"/>
    <xsl:param name="o5-1_310_2c_benoemingAanneem" select="' zijn / haar'"/>
    <xsl:param name="o5-1_310_3_benoemingAanneem" select="' benoeming tot lid van '"/>
    <xsl:param name="o5-1_310_4_benoemingAanneem" select="' wel / niet 1) '"/>
    <xsl:param name="o5-1_310_5_benoemingAanneem" select="'aanneemt.'"/>
    <xsl:param name="o5-1_310_6_benoemingAanneem" select="'aanneem.'"/>
    <xsl:param name="o5-1_320_Datum" select="'Datum:'"/>
    <xsl:param name="o5-1_330_gestippeldeLijn" select="'.......................................................'"/>
    <xsl:param name="o5-1_340_Plaats" select="'Plaats:'"/>
    <xsl:param name="o5-1_350_Naam" select="'Naam:'"/>
    <xsl:param name="o5-1_360_Handtekening" select="'Handtekening:'"/>
    <xsl:param name="o5-1_370_ZendenAan" select="'Zenden aan:'"/>
    <xsl:param name="o5-1_380_bijAanneming" select="'bij aanneming'"/>
    <xsl:param name="o5-1_390_voorzitter" select="'De voorzitter van '"/>
    <xsl:param name="o5-1_400_bijNietAanneming" select="'bij niet-aanneming'"/>
    <xsl:param name="o5-1_410_voorzitterCSB" select="'De voorzitter van het centraal stembureau voor de verkiezing van de leden van '"/>
    <xsl:param name="o5-1_420_Doorhalen" select="'Doorhalen wat niet van toepassing is.'"/>
</xsl:stylesheet>
