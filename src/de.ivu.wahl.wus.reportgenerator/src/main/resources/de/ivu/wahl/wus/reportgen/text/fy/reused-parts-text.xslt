<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="RP_ElectionName_verkiezingLeden" select="'de ferkiezing fan de leden fan '" />
    <xsl:param name="RP_ElectionName_op" select="' op '" />

    <xsl:param name="RP_ElectionNameP2_verkiezingLeden" select="'ferkiezing fan de leden fan '" />

    <xsl:param name="RP_Salutation_dhr" select="'dhr. '" />
    <xsl:param name="RP_Salutation_mevr" select="'mfr. '" />

    <xsl:param name="RP_Gender_m" select="' (m)'" />
    <xsl:param name="RP_Gender_v" select="' (v)'" />
    <xsl:param name="RP_Gender_unknown" select="' (f)'" />

    <xsl:param name="RP_Gender2_m" select="' (m)'" />
    <xsl:param name="RP_Gender2_v" select="' (v)'" />
    <xsl:param name="RP_Gender2_unknown" select="' (f)'" />

    <xsl:param name="RP_Gender3_hij" select="'hy'" />
    <xsl:param name="RP_Gender3_zij" select="'sy'" />
    <xsl:param name="RP_Gender3_hijZij" select="'hy/sy'" />
    <xsl:param name="RP_Gender3_unknown" select="'sy'" />

    <xsl:param name="RP_Date_januari" select="'jannewaris'" />
    <xsl:param name="RP_Date_februari" select="'febrewaris'" />
    <xsl:param name="RP_Date_maart" select="'maart'" />
    <xsl:param name="RP_Date_april" select="'april'" />
    <xsl:param name="RP_Date_mei" select="'maaie'" />
    <xsl:param name="RP_Date_juni" select="'juny'" />
    <xsl:param name="RP_Date_juli" select="'july'" />
    <xsl:param name="RP_Date_augustus" select="'augustus'" />
    <xsl:param name="RP_Date_september" select="'septimber'" />
    <xsl:param name="RP_Date_oktober" select="'oktober'" />
    <xsl:param name="RP_Date_november" select="'novimber'" />
    <xsl:param name="RP_Date_december" select="'desimber'" />

    <xsl:param name="RP_PartyName_blancoLijst" select="'net fan tapassing (blanko list)'" />

    <xsl:param name="RP_PartyName2_blancoLijst" select="'blanko list mei as earste kandidaat'" />

    <xsl:param name="RP_PartyNameInOmissions_blancoLijst" select="'blanko list mei as earste kandidaat '" />

    <xsl:param name="RP_PartyNameInOmissionsEK_blancoLijst" select="'blanko list mei as earste kandidaat '" />

    <xsl:param name="RP_PartyNameOrFirstCandidate_blancoLijst" select="'blanko list mei as earste kandidaat '" />

    <xsl:param name="RP_Kieskring_inKieskring" select="' yn kiesrûnte '" />

    <xsl:param name="RP_KieskringParty_inKieskring" select="' yn kiesrûnte'" />
    <xsl:param name="RP_KieskringParty_inAlleKieskringen" select="' yn alle kiesrûnten'" />

    <xsl:param name="RP_FootnoteKieskring_voetnoten" select="'[FY]Voetnoten:'" />
    <xsl:param name="RP_FootnoteKieskring_alleenInTeVullen" select="'Allinnich yn te foljen as it om in ferkiezing giet fan de leden fan de Twadde Keamer of fan provinsjale steaten fan in provinsje dy’t út mear as ien kiesrûnte bestiet. Efter ‘kiesrûnte’ it nûmer fan de kiesrûnte en tusken heakjes de namme fan de gemeente dêr’t it haadstimburo fêstige is oanjaan.'" />

    <xsl:param name="RP_Checkbox_iconChecked" select="'■'" />
    <xsl:param name="RP_Checkbox_iconUnchecked" select="'□'" />

    <xsl:param name="RP_FooterWithoutHashcode_concept" select="'(Konsept) '" />
    <xsl:param name="RP_FooterWithoutHashcode_datum" select="'Datum: '" />

    <xsl:param name="RP_FooterWithHashcode_concept" select="'(Konsept) | '" />
    <xsl:param name="RP_FooterWithHashcode_hashcode" select="'Hashcode: '" />

    <xsl:param name="RP_CombinedList_en" select="'en '" />

    <xsl:param name="RP_CombinedListI17_lijst" select="'- List '" />
    <xsl:param name="RP_CombinedListI17_enLijst" select="' en list '" />

    <xsl:param name="RP_CombinedList2_en" select="'en '" />
    <xsl:param name="RP_CombinedList2_lijst" select="' (list '" />

    <xsl:param name="RP_CombinedListListName_blancoLijst" select="'blanko list mei as earste kandidaat '" />

    <xsl:param name="RP_SignatureBlock_plaats" select="'Plak: ........................................................'" />
    <xsl:param name="RP_SignatureBlock_datum" select="'Datum: .......................................................'" />
    <xsl:param name="RP_SignatureBlock_voorzitter" select="'......................................................................, Foarsitter'" />
    <xsl:param name="RP_SignatureBlock_leden" select="'...................................................................... Leden'" />
    <xsl:param name="RP_SignatureBlock_emptyLine" select="'......................................................................'" />

    <xsl:param name="RP_SignatureBlock-3_plaats" select="'Plak: ........................................................'" />
    <xsl:param name="RP_SignatureBlock-3_datum" select="'Datum: .......................................................'" />
    <xsl:param name="RP_SignatureBlock-3_voorzitter" select="'............................................., Foarsitter'" />
    <xsl:param name="RP_SignatureBlock-3_leden" select="'............................................. Leden'" />
    <xsl:param name="RP_SignatureBlock-3_emptyLine" select="'.............................................'" />

    <xsl:param name="RP_ElectionNameSimple_de" select="'de '" />
    <xsl:param name="RP_ElectionNameSimple_het" select="'it '" />

    <xsl:param name="RP_ElectionNameSimple_tweedeKamer" select="'Twadde Keamer fan de Steaten-Generaal'" />
    <xsl:param name="RP_ElectionNameSimple_eersteKamer" select="'Earste Keamer fan de Steaten-Generaal'" />
    <xsl:param name="RP_ElectionNameSimple_provincialeStaten" select="'provinsjale steaten'" />
    <xsl:param name="RP_ElectionNameSimple_hetEuropeesParlement" select="'Europeesk Parlemint'" />
    <xsl:param name="RP_ElectionNameSimple_raadVanDeGemeente" select="'gemeenterie'" />
    <xsl:param name="RP_ElectionNameSimple_eilandsraad" select="'eilânsrie'" />
    <xsl:param name="RP_ElectionNameSimple_deelraad" select="'[FY]de deelraad'" />
    <xsl:param name="RP_ElectionNameSimple_deelgemeenteraad" select="'[FY]de deelgemeenteraad'" />

    <xsl:param name="RP_ElectionNameSimple_van" select="' fan'" />
    <xsl:param name="RP_ElectionNameSimple_van_eilandsraad" select="' fan it iepenbier lichem'" />
    <xsl:param name="RP_ElectionNameSimple_van_stadsdeel" select="' fan stadsdeel'" />

    <xsl:param name="RP_ObjectionsByVoters1_aanwezigeKiezers" select="'Door de in de zittingsruimte aanwezige kiezers zijn'" />

    <xsl:param name="RP_ObjectionsByVoters2_emptyLine" select="'.......................................................................................................................................'" />

    <xsl:param name="RP_ObjectionsByVoters2a_emptyLine" select="'.......................................................................................................................................'" />

    <xsl:param name="RP_ObjectionsByVoters1b_geenBezwarenIngebracht" select="'□ [FY]geen bezwaren ingebracht.'" />
    <xsl:param name="RP_ObjectionsByVoters1b_iconChecked" select="'■'" />
    <xsl:param name="RP_ObjectionsByVoters1b_iconUnchecked" select="'□'" />
    <xsl:param name="RP_ObjectionsByVoters1b_volgendeBezwarenIngebracht" select="' [FY]de volgende bezwaren ingebracht:'" />

    <xsl:param name="RP_ObjectionsReference_aanwezigeKiezers" select="'[FY]Door de in de zittingsruimte aanwezige kiezers zijn'" />
    <xsl:param name="RP_ObjectionsReference_iconUnchecked" select="'□ '" />
    <xsl:param name="RP_ObjectionsReference_geenBezwarenIngebracht" select="'[FY]geen bezwaren ingebracht.'" />
    <xsl:param name="RP_ObjectionsReference_volgendeBezwarenIngebracht" select="'[FY]de volgende bezwaren ingebracht (zie gewaarmerkte bijlage voor bezwaren en opmerkingen daarover van het '" />

    <xsl:param name="RP_LegacyFooter_pagina" select="'side '" />
</xsl:stylesheet>
