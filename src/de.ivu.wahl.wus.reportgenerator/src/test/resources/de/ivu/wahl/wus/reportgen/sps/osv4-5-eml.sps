<?xml version="1.0" encoding="UTF-8"?><structure version="16" xsltversion="1" html-doctype="HTML4 Transitional" compatibility-view="IE7" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="UTF-8" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">	<parameters>		<parameter name="generateDate" default="01-02-2003 04:05:06"/>
		<parameter name="hashCode" default="12 34 56 78 90 AB CD EF 12 34 56 78 90 AB CD EF FF FF FF FF"/>
		<parameter name="isDraft" default="false"/>
		<parameter name="lang" default="1"/>	</parameters>	<schemasources>		<namespaces>			<nspair prefix="ds" uri="http://www.w3.org/2000/09/xmldsig#"/>			<nspair prefix="eml" uri="urn:oasis:names:tc:evs:schema:eml"/>			<nspair prefix="kr" uri="http://www.kiesraad.nl/extensions"/>			<nspair prefix="rg" uri="http://www.kiesraad.nl/reportgenerator"/>			<nspair prefix="ts" uri="urn:oasis:names:tc:evs:schema:eml:ts"/>			<nspair prefix="xal" uri="urn:oasis:names:tc:ciq:xsdschema:xAL:2.0"/>			<nspair prefix="xnl" uri="urn:oasis:names:tc:ciq:xsdschema:xNL:2.0"/>		</namespaces>		<schemasources>			<xsdschemasource name="XML" main="1" schemafile="D:\projekte\Eml-kiesraad\EML-v5.0-os\510-extended.xsd" workingxmlfile="D:\projekte\EML-kiesraad\Examples-2.10\EML 510c EK 2004 Zwolle-rg.xml"/>		</schemasources>	</schemasources>	<modules>		<module spsfile="reused-parts.sps"/>	</modules>	<flags>		<scripts/>		<mainparts>			<mainpart match="/" spsfile="reused-parts.sps" isactive="0"/>		</mainparts>		<globalparts/>		<designfragments>			<designfragment match="Checkbox" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="CombinedList2" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="CombinedListI17" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="CombinedListListName" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="CombinedListListNumber" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="ElectionFraction" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="ElectionFractionPart1" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="ElectionFractionPart2" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="FirstCandidateName" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="FooterWithHashcode" spsfile="reused-parts.sps" isactive="1"/>			<designfragment match="FooterWithoutHashcode" spsfile="reused-parts.sps" isactive="1"/>			<designfragment match="FootnoteKieskring" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="FootnoteSign" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="Gender3" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="HashCode" spsfile="reused-parts.sps" isactive="1"/>			<designfragment match="Initials" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="Kieskring" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="NameBCEF" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="ObjectionsByVoters1" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="ObjectionsByVoters1b" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="ObjectionsByVoters2" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="ObjectionsByVoters2a" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="PartyNameInOmissions" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="PartyNameOrFirstCandidate" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="PostalCode" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="PostalCodeCity" spsfile="reused-parts.sps" isactive="0"/>			<designfragment match="SignatureBlock" spsfile="reused-parts.sps" isactive="0"/>		</designfragments>		<pagelayouts/>		<xpath-functions/>	</flags>	<scripts>		<script language="javascript"> function doInitialize() { markLoaded(); return false; } function doIntref(inVerwijzingRef, inLabelRef) { var myWin = window; var myLabel = &apos;label-&apos; + inLabelRef; myWin.location.replace(&apos;#&apos; + myLabel); } // </script>	</scripts>	<script-project>		<Project version="2" app="AuthenticView"/>	</script-project>	<importedxslt>		<file url="D:\projekte\de.ivu.wahl.wus.reportgenerator\src\main\resources\de\ivu\wahl\wus\reportgen\text\nl\reused-parts-text.xslt"/>		<file url="D:\projekte\de.ivu.wahl.wus.reportgenerator\src\main\resources\de\ivu\wahl\wus\reportgen\text\nl\osv4-5-text.xslt"/>	</importedxslt>	<globalstyles>		<rules selector="*">			<media>				<media value="all"/>			</media>			<rule font-family="Arial" font-size="small"/>		</rules>		<rules selector="td">			<media>				<media value="all"/>			</media>			<rule font-size="small"/>		</rules>		<rules selector="div">			<media>				<media value="all"/>			</media>			<rule margin="0" padding="0"/>		</rules>		<rules selector="h4">			<media>				<media value="all"/>			</media>			<rule font-size="medium" font-weight="bold"/>		</rules>		<rules selector="p">			<media>				<media value="all"/>			</media>			<rule/>		</rules>	</globalstyles>	<mainparts>		<children>			<globaltemplate subtype="main" match="/">				<document-properties title="Model T 11"/>				<children>					<documentsection>						<properties columncount="1" columngap="0.50in" headerfooterheight="variable" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11.69in" papermarginbottom="1.2in" papermarginfooter="0.0in" papermarginheader="0.0in" papermarginleft="0.6in" papermarginright="0.6in" papermargintop="0.79in" paperwidth="8.27in" title="Model T 11"/>						<children>							<globaltemplate subtype="pagelayout" match="footerall">								<children>									<calltemplate subtype="named" match="LegacyFooter">										<parameters/>									</calltemplate>								</children>							</globaltemplate>						</children>						<watermark>							<image transparency="50" fill-page="1" center-if-not-fill="1"/>							<text transparency="50"/>						</watermark>					</documentsection>					<paragraph paragraphtag="h4">						<children>							<condition>								<children>									<conditionbranch xpath="$lang=0">										<children>											<text fixtext="Controlelijst ten behoeve van de vaststelling van de uitslag van de stemming  voor de verkiezing van de leden van de Eerste Kamer der Staten-Generaal">												<styles font-size="medium"/>											</text>										</children>									</conditionbranch>									<conditionbranch>										<children>											<autocalc xpath="$o4-5_010_Titel">												<styles font-size="medium"/>											</autocalc>										</children>									</conditionbranch>								</children>							</condition>							<condition>								<children>									<conditionbranch xpath="$SV_OutputFormat = &apos;PDF&apos;">										<children>											<paragraph paragraphtag="p"/>										</children>									</conditionbranch>								</children>							</condition>						</children>					</paragraph>					<paragraph>						<children>							<template subtype="source" match="XML">								<children>									<template subtype="element" match="eml:EML">										<children>											<condition>												<children>													<conditionbranch xpath="$lang=0">														<children>															<text fixtext="Provincie: "/>														</children>													</conditionbranch>													<conditionbranch>														<children>															<autocalc xpath="$o4-5_020_Provincie"/>														</children>													</conditionbranch>												</children>											</condition>											<template subtype="element" match="eml:Count">												<children>													<template subtype="element" match="eml:Election">														<children>															<template subtype="element" match="eml:Contests">																<children>																	<template subtype="element" match="eml:Contest">																		<children>																			<template subtype="element" match="eml:ContestIdentifier">																				<children>																					<template subtype="element" match="eml:ContestName">																						<children>																							<content subtype="regular">																								<styles font-weight="bold"/>																							</content>																						</children>																						<variables/>																					</template>																				</children>																				<variables/>																			</template>																		</children>																		<variables/>																	</template>																</children>																<variables/>															</template>															<newline/>															<newline/>															<condition>																<children>																	<conditionbranch xpath="$lang=0">																		<children>																			<text fixtext="Dag van de stemming: "/>																		</children>																	</conditionbranch>																	<conditionbranch>																		<children>																			<autocalc xpath="$o4-5_030_Dag_stemming"/>																		</children>																	</conditionbranch>																</children>															</condition>															<template subtype="element" match="eml:ElectionIdentifier">																<children>																	<template subtype="element" match="kr:ElectionDate">																		<children>																			<calltemplate subtype="named" match="Date">																				<parameters>																					<parameter name="isBold" value="1"/>																				</parameters>																			</calltemplate>																		</children>																		<variables/>																	</template>																</children>																<variables/>															</template>														</children>														<variables/>													</template>													<newline/>													<newline/>													<template subtype="element" match="eml:Election">														<children>															<template subtype="element" match="eml:Contests">																<children>																	<template subtype="element" match="eml:Contest">																		<children>																			<template subtype="element" match="eml:TotalVotes">																				<children>																					<condition>																						<children>																							<conditionbranch xpath="$lang=0">																								<children>																									<text fixtext="Het aantal in de vergadering aanwezige leden, vermeerderd met het aantal leden die als gemachtigde aan de stemming mochten deelnemen, bedroeg: "/>																								</children>																							</conditionbranch>																							<conditionbranch>																								<children>																									<autocalc xpath="$o4-5_040_aanwezigeLeden"/>																								</children>																							</conditionbranch>																						</children>																					</condition>																					<template subtype="element" match="eml:Cast">																						<children>																							<content subtype="regular">																								<styles font-weight="bold"/>																								<format basic-type="xsd" datatype="nonNegativeInteger"/>																							</content>																						</children>																						<variables/>																					</template>																					<text fixtext="."/>																					<newline/>																					<newline/>																					<condition>																						<children>																							<conditionbranch xpath="$lang=0">																								<children>																									<text fixtext="Het aantal ingeleverde stembiljetten bedroeg: "/>																								</children>																							</conditionbranch>																							<conditionbranch>																								<children>																									<autocalc xpath="$o4-5_050_ingeleverde"/>																								</children>																							</conditionbranch>																						</children>																					</condition>																					<autocalc xpath="eml:TotalCounted +  eml:RejectedVotes[ @ReasonCode = &quot;blanco&quot; ] +  eml:RejectedVotes[ @ReasonCode = &quot;ongeldig&quot; ]">																						<styles font-weight="bold"/>																					</autocalc>																					<newline/>																					<newline/>																					<condition>																						<children>																							<conditionbranch xpath="$lang=0">																								<children>																									<text fixtext="Het aantal blanco stembiljetten bedroeg: "/>																								</children>																							</conditionbranch>																							<conditionbranch>																								<children>																									<autocalc xpath="$o4-5_060_blanco"/>																								</children>																							</conditionbranch>																						</children>																					</condition>																					<template subtype="element" filter="@ReasonCode = &quot;blanco&quot;" match="eml:RejectedVotes">																						<children>																							<content subtype="regular">																								<styles font-weight="bold"/>																							</content>																						</children>																						<variables/>																					</template>																					<newline/>																					<newline/>																					<condition>																						<children>																							<conditionbranch xpath="$lang=0">																								<children>																									<text fixtext="Het totale aantal ongeldige stembiljetten bedroeg: "/>																								</children>																							</conditionbranch>																							<conditionbranch>																								<children>																									<autocalc xpath="$o4-5_070_ongeldige"/>																								</children>																							</conditionbranch>																						</children>																					</condition>																					<template subtype="element" filter="@ReasonCode = &quot;ongeldig&quot;" match="eml:RejectedVotes">																						<children>																							<content subtype="regular">																								<styles font-weight="bold"/>																							</content>																						</children>																						<variables/>																					</template>																					<newline/>																					<newline/>																					<condition>																						<children>																							<conditionbranch xpath="$lang=0">																								<children>																									<text fixtext="Het aantal geldige, niet-zijnde blanco, stembiljetten bedroeg derhalve: "/>																								</children>																							</conditionbranch>																							<conditionbranch>																								<children>																									<autocalc xpath="$o4-5_080_geldige"/>																								</children>																							</conditionbranch>																						</children>																					</condition>																					<template subtype="element" match="eml:TotalCounted">																						<children>																							<content subtype="regular">																								<styles font-weight="bold"/>																								<format basic-type="xsd" datatype="nonNegativeInteger"/>																							</content>																						</children>																						<variables/>																					</template>																				</children>																				<variables/>																			</template>																		</children>																		<variables/>																	</template>																</children>																<variables/>															</template>														</children>														<variables/>													</template>													<newline/>													<newline/>													<newline/>													<condition>														<children>															<conditionbranch xpath="$lang=0">																<children>																	<text fixtext="Op de verschillende lijsten is het volgende aantal stemmen uitgebracht:"/>																</children>															</conditionbranch>															<conditionbranch>																<children>																	<autocalc xpath="$o4-5_090_volgendeAantalStemmen"/>																</children>															</conditionbranch>														</children>													</condition>													<newline/>													<newline break="page"/>													<template subtype="element" match="rg:RG510">														<children>															<template subtype="element" match="rg:PresenceVotes">																<children>																	<calltemplate subtype="named" match="AffiliationVotes">																		<parameters/>																	</calltemplate>																</children>																<variables/>															</template>														</children>														<variables/>													</template>													<newline/>													<newline/>													<template subtype="element" match="eml:Election">														<children>															<condition>																<children>																	<conditionbranch xpath="$lang=0">																		<children>																			<text fixtext="Hierbij verklaart ondergetekende dat de hierboven opgenomen aantallen voor de verkiezing van de Eerste Kamer gehouden in de provincie "/>																		</children>																	</conditionbranch>																	<conditionbranch>																		<children>																			<autocalc xpath="$o4-5_100_1_HierbijVerklaart"/>																		</children>																	</conditionbranch>																</children>															</condition>															<template subtype="element" match="eml:Contests">																<children>																	<template subtype="element" match="eml:Contest">																		<children>																			<template subtype="element" match="eml:ContestIdentifier">																				<children>																					<template subtype="element" match="eml:ContestName">																						<children>																							<content subtype="regular">																								<styles font-weight="bold"/>																							</content>																						</children>																						<variables/>																					</template>																				</children>																				<variables/>																			</template>																		</children>																		<variables/>																	</template>																</children>																<variables/>															</template>															<condition>																<children>																	<conditionbranch xpath="$lang=0">																		<children>																			<text fixtext=" gelijk zijn aan de opgenomen aantallen in het op "/>																		</children>																	</conditionbranch>																	<conditionbranch>																		<children>																			<autocalc xpath="$o4-5_100_2_HierbijVerklaart"/>																		</children>																	</conditionbranch>																</children>															</condition>															<template subtype="element" match="eml:ElectionIdentifier">																<children>																	<template subtype="element" match="kr:ElectionDate">																		<children>																			<calltemplate subtype="named" match="Date">																				<parameters>																					<parameter name="isBold" value="1"/>																				</parameters>																			</calltemplate>																		</children>																		<variables/>																	</template>																</children>																<variables/>															</template>															<condition>																<children>																	<conditionbranch xpath="$lang=0">																		<children>																			<text fixtext=" ondertekende proces-verbaal ter vaststelling van de uitslag van de stemming (T 11)."/>																		</children>																	</conditionbranch>																	<conditionbranch>																		<children>																			<autocalc xpath="$o4-5_100_3_HierbijVerklaart"/>																		</children>																	</conditionbranch>																</children>															</condition>															<newline/>															<newline/>															<condition>																<children>																	<conditionbranch xpath="$lang=0">																		<children>																			<text fixtext="Deze controlelijst dient door (of namens) de voorzitter van het stembureau te worden ondertekend en tezamen met het officiële ondertekende proces-verbaal T 11 te worden overgebracht naar het centraal stembureau."/>																		</children>																	</conditionbranch>																	<conditionbranch>																		<children>																			<autocalc xpath="$o4-5_110_DezeControlelijst"/>																		</children>																	</conditionbranch>																</children>															</condition>														</children>														<variables/>													</template>												</children>												<variables/>											</template>										</children>										<variables/>									</template>								</children>								<variables/>							</template>						</children>					</paragraph>					<newline/>					<newline/>					<tgrid>						<properties border="0" cellpadding="1" cellspacing="0" width="100%"/>						<children>							<tgridbody-cols>								<children>									<tgridcol>										<styles width="140pt"/>									</tgridcol>									<tgridcol/>								</children>							</tgridbody-cols>							<tgridbody-rows>								<children>									<tgridrow>										<children>											<tgridcell/>											<tgridcell>												<properties align="left" class="entry"/>												<children>													<newline/>													<condition>														<children>															<conditionbranch xpath="$lang=0">																<children>																	<text fixtext="Plaats: ........................................................"/>																</children>															</conditionbranch>															<conditionbranch>																<children>																	<autocalc xpath="$o4-5_250_Plaats"/>																</children>															</conditionbranch>														</children>													</condition>													<newline/>													<newline/>													<condition>														<children>															<conditionbranch xpath="$lang=0">																<children>																	<text fixtext="Datum: ......................................................."/>																</children>															</conditionbranch>															<conditionbranch>																<children>																	<autocalc xpath="$o4-5_260_Datum"/>																</children>															</conditionbranch>														</children>													</condition>													<newline/>													<newline/>													<newline/>													<newline/>													<newline/>													<condition>														<children>															<conditionbranch xpath="$lang=0">																<children>																	<text fixtext="............................................., Voorzitter"/>																</children>															</conditionbranch>															<conditionbranch>																<children>																	<autocalc xpath="$o4-5_270_Vorzitter"/>																</children>															</conditionbranch>														</children>													</condition>													<newline/>												</children>											</tgridcell>										</children>									</tgridrow>								</children>							</tgridbody-rows>						</children>					</tgrid>				</children>			</globaltemplate>		</children>	</mainparts>	<globalparts/>	<designfragments>		<children>			<globaltemplate subtype="named" match="AffiliationVotes">				<parameters/>				<children>					<template subtype="element" match="rg:AffiliationVotes">						<children>							<newline/>							<paragraph>								<children>									<condition>										<children>											<conditionbranch xpath="$lang=0">												<children>													<text fixtext="Lijst nr. "/>												</children>											</conditionbranch>											<conditionbranch>												<children>													<autocalc xpath="$o4-5_130_Lijstnr"/>												</children>											</conditionbranch>										</children>									</condition>									<template subtype="element" match="eml:AffiliationIdentifier">										<children>											<template subtype="attribute" match="Id">												<children>													<content subtype="regular">														<styles font-weight="bold"/>														<format basic-type="xsd" datatype="NMTOKEN"/>													</content>												</children>												<variables/>											</template>										</children>										<variables/>									</template>								</children>							</paragraph>							<paragraph>								<children>									<condition>										<children>											<conditionbranch xpath="$lang=0">												<children>													<text fixtext="Aanduiding van de politieke groepering: "/>												</children>											</conditionbranch>											<conditionbranch>												<children>													<autocalc xpath="$o4-5_140_Aanduiding_groepering"/>												</children>											</conditionbranch>										</children>									</condition>									<calltemplate subtype="named" match="PartyName">										<parameters>											<parameter name="isBold" value="1"/>										</parameters>									</calltemplate>								</children>							</paragraph>							<newline/>							<condition>								<children>									<conditionbranch xpath="rg:CandidateVotes">										<children>											<tgrid>												<properties border="0" cellpadding="1" cellspacing="0"/>												<styles border-bottom="1px solid #000" border-top="1px solid #000"/>												<children>													<tgridbody-cols>														<children>															<tgridcol/>															<tgridcol/>															<tgridcol/>														</children>													</tgridbody-cols>													<tgridheader-rows>														<children>															<tgridrow>																<styles height="20pt"/>																<children>																	<tgridcell>																		<styles border-bottom="1px solid #000" vertical-align="top" width="20pt"/>																		<children>																			<condition>																				<children>																					<conditionbranch xpath="$lang=0">																						<children>																							<text fixtext="Nr."/>																						</children>																					</conditionbranch>																					<conditionbranch>																						<children>																							<autocalc xpath="$o4-5_150_Nr"/>																						</children>																					</conditionbranch>																				</children>																			</condition>																		</children>																	</tgridcell>																	<tgridcell>																		<properties align="left"/>																		<styles border-bottom="1px solid #000" vertical-align="top" width="400pt"/>																		<children>																			<condition>																				<children>																					<conditionbranch xpath="$lang=0">																						<children>																							<text fixtext="Naam en voorletters van de kandidaten"/>																						</children>																					</conditionbranch>																					<conditionbranch>																						<children>																							<autocalc xpath="$o4-5_160_Naam_kandidaten"/>																						</children>																					</conditionbranch>																				</children>																			</condition>																		</children>																	</tgridcell>																	<tgridcell>																		<properties align="right"/>																		<styles border-bottom="1px solid #000" vertical-align="top" width="100pt"/>																		<children>																			<condition>																				<children>																					<conditionbranch xpath="$lang=0">																						<children>																							<text fixtext="Aantal stemmen"/>																						</children>																					</conditionbranch>																					<conditionbranch>																						<children>																							<autocalc xpath="$o4-5_170_Aantal_stemmen"/>																						</children>																					</conditionbranch>																				</children>																			</condition>																		</children>																	</tgridcell>																</children>															</tgridrow>														</children>													</tgridheader-rows>													<tgridbody-rows>														<children>															<template subtype="element" match="rg:CandidateVotes">																<sort>																	<key match="eml:Candidate/eml:CandidateIdentifier/@Id" datatype="Number"/>																</sort>																<children>																	<tgridrow>																		<styles vertical-align="top"/>																		<children>																			<tgridcell>																				<children>																					<template subtype="element" match="eml:Candidate">																						<children>																							<template subtype="element" match="eml:CandidateIdentifier">																								<children>																									<template subtype="attribute" match="Id">																										<children>																											<content subtype="regular">																												<format basic-type="xsd" datatype="NMTOKEN"/>																											</content>																											<text fixtext="."/>																										</children>																										<variables/>																									</template>																								</children>																								<variables/>																							</template>																							<text fixtext=" "/>																						</children>																						<variables/>																					</template>																				</children>																			</tgridcell>																			<tgridcell>																				<properties align="left"/>																				<children>																					<template subtype="element" match="eml:Candidate">																						<children>																							<template subtype="element" match="eml:CandidateFullName">																								<children>																									<calltemplate subtype="named" match="LastNameH1">																										<parameters/>																									</calltemplate>																									<text fixtext=", "/>																									<calltemplate subtype="named" match="FirstNameH1">																										<parameters/>																									</calltemplate>																								</children>																								<variables/>																							</template>																							<calltemplate subtype="named" match="Gender2">																								<parameters/>																							</calltemplate>																						</children>																						<variables/>																					</template>																				</children>																			</tgridcell>																			<tgridcell>																				<properties align="right"/>																				<children>																					<template subtype="element" match="rg:ValidVotes">																						<children>																							<content subtype="regular">																								<format basic-type="xsd" datatype="nonNegativeInteger"/>																							</content>																						</children>																						<variables/>																					</template>																				</children>																			</tgridcell>																		</children>																	</tgridrow>																</children>																<variables/>															</template>															<tgridrow>																<styles height="20pt"/>																<children>																	<tgridcell>																		<styles border-top="1px solid #000" vertical-align="bottom"/>																		<children>																			<condition>																				<children>																					<conditionbranch xpath="$lang=0">																						<children>																							<text fixtext="Gezamenlijk aantal van de op de lijst uitgebrachte stemmen:"/>																						</children>																					</conditionbranch>																					<conditionbranch>																						<children>																							<autocalc xpath="$o4-5_180_Gezamenlijk_aantal"/>																						</children>																					</conditionbranch>																				</children>																			</condition>																		</children>																	</tgridcell>																	<tgridcell joinleft="1">																		<properties align="left"/>																		<styles border-top="1px solid #000" vertical-align="bottom"/>																	</tgridcell>																	<tgridcell>																		<properties align="right"/>																		<styles border-top="1px solid #000" vertical-align="bottom"/>																		<children>																			<template subtype="element" match="rg:ValidVotes">																				<children>																					<content subtype="regular">																						<format basic-type="xsd" datatype="nonNegativeInteger"/>																					</content>																				</children>																				<variables/>																			</template>																		</children>																	</tgridcell>																</children>															</tgridrow>														</children>													</tgridbody-rows>												</children>											</tgrid>										</children>									</conditionbranch>									<conditionbranch>										<children>											<tgrid>												<properties border="1"/>												<styles font-size="smaller"/>												<children>													<tgridbody-cols>														<children>															<tgridcol/>															<tgridcol/>														</children>													</tgridbody-cols>													<tgridbody-rows>														<children>															<tgridrow>																<styles vertical-align="top"/>																<children>																	<tgridcell>																		<properties align="left"/>																		<children>																			<condition>																				<children>																					<conditionbranch xpath="$lang=0">																						<children>																							<text fixtext="Totale aantal op de lijst"/>																						</children>																					</conditionbranch>																					<conditionbranch>																						<children>																							<autocalc xpath="$o4-5_190_Totale_aantal"/>																						</children>																					</conditionbranch>																				</children>																			</condition>																			<newline/>																			<condition>																				<children>																					<conditionbranch xpath="$lang=0">																						<children>																							<text fixtext="uitgebrachte geldige stemmen"/>																						</children>																					</conditionbranch>																					<conditionbranch>																						<children>																							<autocalc xpath="$o4-5_200_uitgebrachte_stemmen"/>																						</children>																					</conditionbranch>																				</children>																			</condition>																		</children>																	</tgridcell>																	<tgridcell>																		<properties align="left"/>																		<styles vertical-align="bottom"/>																		<children>																			<template subtype="element" match="rg:ValidVotes">																				<children>																					<content subtype="regular">																						<format basic-type="xsd" datatype="nonNegativeInteger"/>																					</content>																				</children>																				<variables/>																			</template>																		</children>																	</tgridcell>																</children>															</tgridrow>														</children>													</tgridbody-rows>												</children>											</tgrid>										</children>									</conditionbranch>								</children>							</condition>							<calltemplate subtype="named" match="LineBreakTable">								<parameters/>							</calltemplate>							<newline break="page"/>						</children>						<variables/>					</template>				</children>			</globaltemplate>		</children>	</designfragments>	<xmltables/>	<authentic-custom-toolbar-buttons/></structure>