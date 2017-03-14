<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="T11_010_Titel" select="'Model T 11. Proces-verbaal van de zitting van een stembureau voor de verkiezing van de leden van de Eerste Kamer der Staten-Generaal'"/>
    <xsl:param name="T11_010_Provincie" select="'Provincie: '"/>
    <xsl:param name="T11_020_Dag_stemming" select="'Dag van de stemming: '"/>
    <xsl:param name="T11_030_A_stemming" select="'De stemming heeft plaatsgevonden om 15.00 uur.'"/>
    <xsl:param name="T11_040_B_stemming" select="'De voorzitter heeft overeenkomstig artikel T 3 van de Kieswet uit de statenvergadering de volgende drie leden benoemd om met hem als voorzitter het stembureau te vormen:'"/>
    <xsl:param name="T11_050_C_01_stemming" select="'De voorzitter heeft meegedeeld dat '"/>
    <xsl:param name="T11_050_C_02_stemming" select="' stembiljetten zijn ingeleverd.'"/>
    <xsl:param name="T11_060_D_01_stemming" select="'Het aantal in de vergadering aanwezige leden, vermeerderd met het aantal leden die als gemachtigde aan de stemming mochten deelnemen, bedroeg: '"/>
    <xsl:param name="T11_060_D_02_stemming" select="'(Indien zich het geval, bedoeld in artikel T 6, tweede en derde lid, van de Kieswet heeft voorgedaan, wordt dit hier vermeld.)'"/>
    <xsl:param name="T11_070_E_stemming" select="'De voorzitter heeft vervolgens de stembiljetten geopend en ten aanzien van elk stembiljet meegedeeld voor welke lijst en welke kandidaat het stembiljet geldt.'"/>
    <xsl:param name="T11_080_F_stemming" select="'Overeenkomstig artikel T 8 van de Kieswet zijn als blanco stem aangemerkt: het stembiljet dat door de kiezer is ingeleverd zonder dat hij geheel of gedeeltelijk een wit stipje rood heeft gemaakt en zonder dat hij anderszins op het stembiljet geschreven of getekend heeft.'"/>
    <xsl:param name="T11_090_G_01_stemming" select="'Overeenkomstig artikel T 8 van de Kieswet zijn ongeldig verklaard:'"/>
    <xsl:param name="T11_090_G_02_stemming" select="'andere stembiljetten dan die welke volgens het bepaalde bij of krachtens deze wet mogen worden gebruikt;'"/>
    <xsl:param name="T11_090_G_03_stemming" select="'stembiljetten, niet-zijnde blanco stembiljetten waarop de kiezer niet, door het geheel of gedeeltelijk rood maken van het witte stipje, op ondubbelzinnige wijze heeft kenbaar gemaakt op welke kandidaat hij zijn stem uitbrengt;'"/>
    <xsl:param name="T11_090_G_04_stemming" select="'stembiljetten waarop bijvoegingen zijn geplaatst waardoor de kiezer kan worden geïdentificeerd.'"/>
    <xsl:param name="T11_090_G_05_stemming" select="'In geval van twijfel over de geldigheid van een stembiljet heeft de vergadering beslist.'"/>
    <xsl:param name="T11_090_G_06_stemming" select="'Het stembureau heeft vervolgens de volgende aantallen vastgesteld:'"/>
    <xsl:param name="T11_090_G_07_stemming" select="'het aantal ingeleverde stembiljetten (zie onder C): '"/>
    <xsl:param name="T11_090_G_08_stemming" select="'het aantal blanco stembiljetten (zie onder F): '"/>
    <xsl:param name="T11_090_G_09_stemming" select="'het totale aantal ongeldige stembiljetten (zie onder G): '"/>
    <xsl:param name="T11_090_G_10_stemming" select="'Het aantal geldige, niet-zijnde blanco, stembiljetten bedraagt derhalve: '"/>
    <xsl:param name="T11_100_H_01_stemming" select="'De voorzitter deelt mede dat zijn uitgebracht op:'"/>
    <xsl:param name="T11_100_H_02_stemming" select="'Tevens heeft de voorzitter medegedeeld:'"/>
    <xsl:param name="T11_100_H_03_stemming" select="'het aantal blanco stemmen;'"/>
    <xsl:param name="T11_100_H_04_stemming" select="'het aantal ongeldig verklaarde stemmen.'"/>
    <xsl:param name="T11_110_I_01_stemming" select="'Vervolgens zijn op de wijze, voorgeschreven in artikel T 10 van de Kieswet, in afzonderlijke pakken gedaan:'"/>
    <xsl:param name="T11_110_I_02_stemming" select="'de blanco stembiljetten;'"/>
    <xsl:param name="T11_110_I_03_stemming" select="'de ongeldig verklaarde stembiljetten;'"/>
    <xsl:param name="T11_110_I_04_stemming" select="'de geldige stembiljetten.'"/>
    <xsl:param name="T11_120_Alle_pakken" select="'Alle pakken zijn daarna verzegeld.'"/>
    <xsl:param name="T11_130_Lijstnr" select="'Lijst nr. '"/>
    <xsl:param name="T11_140_Aanduiding_groepering" select="'Aanduiding van de politieke groepering: '"/>
    <xsl:param name="T11_150_Nr" select="'Nr.'"/>
    <xsl:param name="T11_160_Naam_kandidaten" select="'Naam en voorletters van de kandidaten'"/>
    <xsl:param name="T11_170_Aantal_stemmen" select="'Aantal stemmen'"/>
    <xsl:param name="T11_180_Gezamenlijk_aantal" select="'Gezamenlijk aantal van de op de lijst uitgebrachte stemmen:'"/>
    <xsl:param name="T11_190_Totale_aantal" select="'Totale aantal op de lijst'"/>
    <xsl:param name="T11_200_uitgebrachte_stemmen" select="'uitgebrachte geldige stemmen'"/>
</xsl:stylesheet>
