<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="I4_010_pretitle" select="'Model I 4'"/>
    <xsl:param name="I4_020_title" select="'Proces-verbaal over geldigheid en nummering kandidatenlijsten en lijstencombinaties'"/>
    <xsl:param name="I4_030_MetDitFormulier" select="'Met dit formulier doet het centraal stembureau verslag van de zitting waarin is besloten over:'"/>
    <xsl:param name="I4_030_1_MetDitFormulier" select="'de geldigheid en nummering van de kandidatenlijsten;'"/>
    <xsl:param name="I4_030_2_MetDitFormulier" select="'het handhaven van de kandidaten op, en de aanduidingen bovenaan, de kandidatenlijsten;'"/>
    <xsl:param name="I4_030_3_MetDitFormulier" select="'de geldigheid van lijstencombinaties '"/>
    <xsl:param name="I4_030_MetDitFormulier_nietEK" select="'(niet bij de Eerste Kamerverkiezing).'"/>
    <xsl:param name="I4_040_Zitting" select="'Zitting'"/>
    <xsl:param name="I4_050_HetBetreft" select="'Het betreft de openbare zitting van het centraal stembureau in '"/>
    <xsl:param name="I4_060_DatumZitting" select="'Datum zitting'"/>
    <xsl:param name="I4_070_TijdstipZitting" select="'Tijdstip zitting'"/>
    <xsl:param name="I4_080_GeconstateerdeVerzuimen" select="'Geconstateerde verzuimen'"/>
    <xsl:param name="I4_090_BijHetOnderzoek" select="'Bij het onderzoek naar de kandidatenlijsten waren:'"/>
    <xsl:param name="I4_100_geenVerzuimen" select="' geen herstelbare verzuimen geconstateerd.'"/>
    <xsl:param name="I4_110_deVolgende" select="' de volgende herstelbare verzuimen geconstateerd:'"/>
    <xsl:param name="I4_120_Aanduiding" select="'Aanduiding in de kieskring(en)'"/>
    <xsl:param name="I4_130_omschrijvingVerzuim" select="'omschrijving verzuim'"/>
    <xsl:param name="I4_140_HersteldeVerzuimen" select="'Herstelde verzuimen'"/>
    <xsl:param name="I4_150_verzuimenZijnHersteld" select="'De volgende verzuimen zijn hersteld:'"/>
    <xsl:param name="I4_160_Aanduiding" select="'Aanduiding in de kieskring(en)'"/>
    <xsl:param name="I4_170_omschrijvingVerzuim" select="'omschrijving verzuim'"/>
    <xsl:param name="I4_180_OngeldigeLijsten" select="'Ongeldige lijsten'"/>
    <xsl:param name="I4_190_HetCSBBesluit" select="'Het centraal stembureau besluit dat:'"/>
    <xsl:param name="I4_200_geenLijstOngeldig" select="' geen lijst ongeldig is verklaard.'"/>
    <xsl:param name="I4_210_volgendeLijstOngeldig" select="' de volgende lijsten ongeldig zijn verklaard:'"/>
    <xsl:param name="I4_220_Aanduiding" select="'Aanduiding in de kieskring(en)'"/>
    <xsl:param name="I4_230_Grond" select="'omschrijving verzuim'"/>
    <xsl:param name="I4_240_GeschrapteKandidaten" select="'Geschrapte kandidaten'"/>
    <xsl:param name="I4_250_HetCSBBesluit" select="'Het centraal stembureau besluit dat:'"/>
    <xsl:param name="I4_260_geenLijstGeschrapt" select="' geen kandidaat van een lijst is geschrapt.'"/>
    <xsl:param name="I4_270_volgendeLijstGeschrapt" select="' de volgende kandidaten van een lijst zijn geschrapt:'"/>
    <xsl:param name="I4_280_Aanduiding" select="'Aanduiding in de kieskring(en)'"/>
    <xsl:param name="I4_290_NaamKandidaat" select="'naam kandidaat'"/>
    <xsl:param name="I4_300_reden" select="'reden'"/>
    <xsl:param name="I4_310_GeschrapteAanduidingen" select="'Geschrapte aanduidingen'"/>
    <xsl:param name="I4_320_HetCSBBesluit" select="'Het centraal stembureau besluit dat:'"/>
    <xsl:param name="I4_330_geenAanduidingGeschrapt" select="' geen aanduiding boven een lijst is geschrapt.'"/>
    <xsl:param name="I4_340_volgendeAanduidingGeschrapt" select="' de volgende aanduidingen boven een lijst zijn geschrapt:'"/>
    <xsl:param name="I4_350_Aanduiding" select="'Aanduiding in de kieskring(en)'"/>
    <xsl:param name="I4_360_naamEersteKandidaat" select="'naam eerste kandidaat op de lijst'"/>
    <xsl:param name="I4_370_reden" select="'reden'"/>
    <xsl:param name="I4_380_GecorrigeerdeAanduidingen" select="'Gecorrigeerde aanduidingen'"/>
    <xsl:param name="I4_390_HetCSBBesluit" select="'Het centraal stembureau besluit dat:'"/>
    <xsl:param name="I4_400_geenAanduidingAangepast" select="' geen aanduiding boven een lijst ambtshalve is aangepast.'"/>
    <xsl:param name="I4_410_volgendeAanduidingAangepast" select="' de volgende aanduidingen boven een lijst ambtshalve zijn aangepast:'"/>
    <xsl:param name="I4_420_NaamEersteKandidaat" select="'Naam eerste kandidaat in de kieskring(en)'"/>
    <xsl:param name="I4_430_aanduidingBijInlevering" select="'vermelde aanduiding bij inlevering'"/>
    <xsl:param name="I4_440_aangepasteAanduiding" select="'aangepaste aanduiding'"/>
    <xsl:param name="I4_450_GeldigeLijsten" select="'Geldige lijsten'"/>
    <xsl:param name="I4_460_HetCSBBesluit" select="'Het centraal stembureau besluit dat de volgende lijsten geldig zijn verklaard:'"/>
    <xsl:param name="I4_465_KieskringNederland" select="'Kieskring Nederland'"/>
    <xsl:param name="I4_470_InAlleKieskringen" select="'In alle kieskringen'"/>
    <xsl:param name="I4_480_Kieskring" select="'Kieskring '"/>
    <xsl:param name="I4_490_Naam" select="'naam kandidaat'"/>
    <xsl:param name="I4_500_voorletters" select="'voorletters'"/>
    <xsl:param name="I4_510_Woonplaats" select="'woonplaats'"/>
    <xsl:param name="I4_520_NummeringKandidatenlijsten" select="'Nummering van de kandidatenlijsten'"/>
    <xsl:param name="I4_530_NummeringBijAantalZetels" select="'Nummering op grond van het aantal stemmen behaald bij de laatstgehouden verkiezing'"/>
    <xsl:param name="I4_540_EerstZijn" select="'Eerst zijn de kandidatenlijsten genummerd van de politieke groeperingen die een of meer zetels hebben behaald bij de laatstgehouden verkiezing, in de volgorde van de bij die verkiezing op de desbetreffende lijsten uitgebrachte aantallen stemmen. Voor zover nodig is rekening gehouden met samengevoegde aanduidingen. Bij een gelijk aantal stemmen is er genummerd via loting.'"/>
    <xsl:param name="I4_550_nummer" select="'nummer'"/>
    <xsl:param name="I4_560_aanduidingPolitiekeGroepering" select="'aanduiding politieke groepering'"/>
    <xsl:param name="I4_570_aantalStemmen" select="'aantal stemmen bij laatste verkiezing'"/>
    <xsl:param name="I4_580_NummeringOverigeLijsten" select="'Nummering van de overige lijsten'"/>
    <xsl:param name="I4_590_VervolgensOverigeKandidatenlijsten" select="'Vervolgens zijn de overige kandidatenlijsten genummerd in de volgorde van het aantal kieskringen waarvoor de lijst is ingeleverd. Bij een gelijk aantal kieskringen is er genummerd via loting.'"/>
    <xsl:param name="I4_600_nummer" select="'nummer'"/>
    <xsl:param name="I4_610_aanduiding" select="'aanduiding politieke groepering of naam eerste kandidaat'"/>
    <xsl:param name="I4_620_AantalKieskringen" select="'aantal kieskringen waarvoor lijst geldt'"/>
    <xsl:param name="I4_630_GeldigheidLijstencombinaties" select="'Geldigheid van de lijstencombinaties'"/>
    <xsl:param name="I4_640_nietEK" select="'(niet van toepassing op de Eerste Kamerverkiezing)'"/>
    <xsl:param name="I4_650_GeldigeLijstencombinaties" select="'Geldige lijstencombinaties'"/>
    <xsl:param name="I4_660_HetCSBBesluit" select="'Het centraal stembureau besluit dat de volgende lijstencombinaties geldig zijn:'"/>
    <xsl:param name="I4_670_nummersVanDeLijsten" select="'nummers van de lijsten'"/>
    <xsl:param name="I4_680_aanduidingen" select="'aanduidingen boven de kandidatenlijst'"/>
    <xsl:param name="I4_690_OngeldigeLijstencombinaties" select="'Ongeldige lijstencombinaties'"/>
    <xsl:param name="I4_700_HetCSBBesluit" select="'Het centraal stembureau besluit dat de volgende lijstencombinaties ongeldig zijn:'"/>
    <xsl:param name="I4_710_nummersVanDeLijsten" select="'nummers van de lijsten'"/>
    <xsl:param name="I4_720_aanduidingen" select="'aanduidingen boven de kandidatenlijst'"/>
    <xsl:param name="I4_730_reden" select="'reden ongeldigheid'"/>
    <xsl:param name="I4_740_Bezwaren" select="'Bezwaren van de aanwezige kiezers'"/>
    <xsl:param name="I4_750_TijdensDeZitting" select="'Tijdens de zitting zijn:'"/>
    <xsl:param name="I4_760_geenBezwaren" select="'geen bezwaren ingebracht.'"/>
    <xsl:param name="I4_770_volgendeBezwaren" select="'de volgende bezwaren ingebracht (zie gewaarmerkte bijlage voor bezwaren en opmerkingen daarover van het centraal stembureau).'"/>
    <xsl:param name="I4_780_Ondertekening" select="'Ondertekening'"/>
    <xsl:param name="I4_790_Datum" select="'Datum'"/>
    <xsl:param name="I4_800_HandtekeningVoorzitter" select="'Naam en handtekening voorzitter'"/>
    <xsl:param name="I4_810_HandtekeningLeden" select="'Naam en handtekening leden'"/>
</xsl:stylesheet>
