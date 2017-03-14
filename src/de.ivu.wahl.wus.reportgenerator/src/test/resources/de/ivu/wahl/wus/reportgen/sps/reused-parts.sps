<?xml version="1.0" encoding="UTF-8"?>
<structure version="16" html-doctype="HTML4 Transitional" compatibility-view="IE9" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="UTF-8" encodingpdf="UTF-8" useimportschema="1" embed-images="1" pastemode="xml" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources xpathdefaultns="urn:oasis:names:tc:evs:schema:eml">
		<namespaces>
			<nspair prefix="ds" uri="http://www.w3.org/2000/09/xmldsig#"/>
			<nspair prefix="eml" uri="urn:oasis:names:tc:evs:schema:eml"/>
			<nspair prefix="kr" uri="http://www.kiesraad.nl/extensions"/>
			<nspair prefix="rg" uri="http://www.kiesraad.nl/reportgenerator"/>
			<nspair prefix="ts" uri="urn:oasis:names:tc:evs:schema:eml:ts"/>
			<nspair prefix="xal" uri="urn:oasis:names:tc:ciq:xsdschema:xAL:2.0"/>
			<nspair prefix="xnl" uri="urn:oasis:names:tc:ciq:xsdschema:xNL:2.0"/>
		</namespaces>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="D:\projekte\eml-kiesraad\EML-v5.0-os\210-extended.xsd"/>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<mainparts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
		<xpath-functions/>
	</flags>
	<scripts>
		<script language="javascript">
 function doInitialize() {
 markLoaded();
 return false;
 }
 function doIntref(inVerwijzingRef, inLabelRef) {
 var myWin = window;
 var myLabel = &apos;label-&apos; + inLabelRef;
 myWin.location.replace(&apos;#&apos; + myLabel);
 }
 // </script>
	</scripts>
	<script-project>
		<Project version="2" app="AuthenticView"/>
	</script-project>
	<importedxslt>
		<file url="D:\projekte\de.ivu.wahl.wus.reportgenerator\src\main\resources\de\ivu\wahl\wus\reportgen\text\nl\reused-parts-text.xslt"/>
	</importedxslt>
	<globalstyles>
		<rules selector="*">
			<media>
				<media value="all"/>
			</media>
			<rule font-family="Arial"/>
		</rules>
	</globalstyles>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<document-properties/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="variable" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11.69in" papermarginbottom="1.0in" papermarginfooter="0.0in" papermarginheader="0.0in" papermarginleft="0.6in" papermarginright="0.6in" papermargintop="0.79in" paperwidth="8.27in"/>
						<watermark>
							<image transparency="50" fill-page="1" center-if-not-fill="1"/>
							<text transparency="50"/>
						</watermark>
					</documentsection>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<designfragments>
		<children>
			<globaltemplate subtype="named" match="ElectionName">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Election name including date"/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$lang=0">
								<children>
									<text fixtext="de verkiezing van de leden van "/>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<autocalc xpath="$RP_ElectionName_verkiezingLeden"/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<calltemplate subtype="named" match="ElectionNameSimple">
						<parameters>
							<parameter name="isBold" value="$isBold"/>
						</parameters>
					</calltemplate>
					<calltemplate subtype="named" match="ElectionDomain">
						<parameters>
							<parameter name="isBold" value="$isBold"/>
						</parameters>
					</calltemplate>
					<template subtype="element" match="eml:ElectionIdentifier">
						<children>
							<condition>
								<children>
									<conditionbranch xpath="$lang=0">
										<children>
											<text fixtext=" op "/>
										</children>
									</conditionbranch>
									<conditionbranch>
										<children>
											<autocalc xpath="$RP_ElectionName_op"/>
										</children>
									</conditionbranch>
								</children>
							</condition>
							<template subtype="element" match="kr:ElectionDate">
								<children>
									<calltemplate subtype="named" match="Date">
										<parameters>
											<parameter name="isBold" value="$isBold"/>
										</parameters>
									</calltemplate>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="Salutation">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=0">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="0=1">
												<children>
													<text fixtext="Salutation &quot;Mr. &quot; or &quot;Mrs. &quot; with subsequent blank"/>
													<newline/>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<template subtype="element" match="eml:Gender">
										<children>
											<condition>
												<children>
													<conditionbranch xpath=".=&quot;male&quot;">
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="$lang=0">
																		<children>
																			<text fixtext="dhr. "/>
																		</children>
																	</conditionbranch>
																	<conditionbranch>
																		<children>
																			<autocalc xpath="$RP_Salutation_dhr"/>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
														</children>
													</conditionbranch>
													<conditionbranch xpath=".=&quot;female&quot; or .=&quot;unknown&quot;">
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="$lang=0">
																		<children>
																			<text fixtext="mevr. "/>
																		</children>
																	</conditionbranch>
																	<conditionbranch>
																		<children>
																			<autocalc xpath="$RP_Salutation_mevr"/>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=1">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="0=1">
												<children>
													<text fixtext="Salutation &quot;Mr. &quot; or &quot;Mrs. &quot; with subsequent blank"/>
													<newline/>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<template subtype="element" match="eml:Gender">
										<children>
											<condition>
												<children>
													<conditionbranch xpath=".=&quot;male&quot;">
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="$lang=0">
																		<children>
																			<text fixtext="dhr. ">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch>
																		<children>
																			<autocalc xpath="$RP_Salutation_dhr">
																				<styles font-weight="bold"/>
																			</autocalc>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
														</children>
													</conditionbranch>
													<conditionbranch xpath=".=&quot;female&quot; or .=&quot;unknown&quot;">
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="$lang=0">
																		<children>
																			<text fixtext="mevr. ">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch>
																		<children>
																			<autocalc xpath="$RP_Salutation_mevr">
																				<styles font-weight="bold"/>
																			</autocalc>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="Address">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Street and house number &quot;Dasstraat 17&quot;"/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=0">
								<children>
									<template subtype="element" match="xal:Locality">
										<children>
											<template subtype="element" match="xal:AddressLine">
												<children>
													<content subtype="regular"/>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=1">
								<children>
									<template subtype="element" match="xal:Locality">
										<children>
											<template subtype="element" match="xal:AddressLine">
												<children>
													<content subtype="regular">
														<styles font-weight="bold"/>
													</content>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="PostalCodeCity">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Postal code and city like &quot;6361 DV Nuth&quot;"/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<template subtype="element" match="xal:Locality">
						<children>
							<template subtype="element" match="xal:PostalCode">
								<children>
									<content subtype="regular"/>
								</children>
								<variables/>
							</template>
							<condition>
								<children>
									<conditionbranch xpath="count(xal:PostalCode/xal:PostalCodeNumber[text() != &quot;&quot;]) &gt; 0 and count(xal:LocalityName[text() != &quot;&quot;]) &gt; 0">
										<children>
											<calltemplate subtype="named" match="Space">
												<parameters/>
											</calltemplate>
										</children>
									</conditionbranch>
								</children>
							</condition>
							<template subtype="element" match="xal:LocalityName">
								<children>
									<content subtype="regular"/>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="PartyName">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=0">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="./eml:AffiliationIdentifier/eml:RegisteredName[text() != &quot;&quot;]">
												<children>
													<template subtype="element" match="eml:AffiliationIdentifier">
														<children>
															<template subtype="element" match="eml:RegisteredName">
																<children>
																	<content subtype="regular">
																		<format basic-type="xsd" datatype="token"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="niet van toepassing (blanco lijst)"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_PartyName_blancoLijst"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=1">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="./eml:AffiliationIdentifier/eml:RegisteredName[text() != &quot;&quot;]">
												<children>
													<template subtype="element" match="eml:AffiliationIdentifier">
														<children>
															<template subtype="element" match="eml:RegisteredName">
																<children>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																		<format basic-type="xsd" datatype="token"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="niet van toepassing (blanco lijst)">
																		<styles font-weight="bold"/>
																	</text>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_PartyName_blancoLijst">
																		<styles font-weight="bold"/>
																	</autocalc>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="LastNameH1">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="fontSize" type="xs:token" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Displays the last name &quot;Baron van der Zaag jr.&quot; (name components a+b+c+d)."/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize=&apos;normal&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NamePrefix">
																<children>
																	<content subtype="regular"/>
																	<condition>
																		<children>
																			<conditionbranch xpath=". != &apos;&apos;">
																				<children>
																					<calltemplate subtype="named" match="Space">
																						<parameters/>
																					</calltemplate>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xnl:LastName">
																<children>
																	<content subtype="regular"/>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NamePrefix">
																<children>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																	</content>
																	<condition>
																		<children>
																			<conditionbranch xpath=". != &apos;&apos;">
																				<children>
																					<calltemplate subtype="named" match="Space">
																						<parameters/>
																					</calltemplate>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xnl:LastName">
																<children>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize=&apos;smaller&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NamePrefix">
																<children>
																	<content subtype="regular">
																		<styles font-size="smaller"/>
																	</content>
																	<condition>
																		<children>
																			<conditionbranch xpath=". != &apos;&apos;">
																				<children>
																					<calltemplate subtype="named" match="Space">
																						<parameters>
																							<parameter name="fontSize" value="$fontSize"/>
																						</parameters>
																					</calltemplate>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xnl:LastName">
																<children>
																	<content subtype="regular">
																		<styles font-size="smaller"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NamePrefix">
																<children>
																	<content subtype="regular">
																		<styles font-size="smaller" font-weight="bold"/>
																	</content>
																	<condition>
																		<children>
																			<conditionbranch xpath=". != &apos;&apos;">
																				<children>
																					<calltemplate subtype="named" match="Space">
																						<parameters>
																							<parameter name="fontSize" value="$fontSize"/>
																						</parameters>
																					</calltemplate>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xnl:LastName">
																<children>
																	<content subtype="regular">
																		<styles font-size="smaller" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize=&apos;x-small&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NamePrefix">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small"/>
																	</content>
																	<condition>
																		<children>
																			<conditionbranch xpath=". != &apos;&apos;">
																				<children>
																					<calltemplate subtype="named" match="Space">
																						<parameters>
																							<parameter name="fontSize" value="$fontSize"/>
																						</parameters>
																					</calltemplate>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xnl:LastName">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NamePrefix">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small" font-weight="bold"/>
																	</content>
																	<condition>
																		<children>
																			<conditionbranch xpath=". != &apos;&apos;">
																				<children>
																					<calltemplate subtype="named" match="Space">
																						<parameters>
																							<parameter name="fontSize" value="$fontSize"/>
																						</parameters>
																					</calltemplate>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xnl:LastName">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="FirstNameH1">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="fontSize" type="xs:token" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Displays the initials and first name like &quot;H.H.G. (Henk)&quot; (name components e+f)."/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize=&apos;normal&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NameLine">
																<children>
																	<content subtype="regular"/>
																</children>
																<variables/>
															</template>
															<condition>
																<children>
																	<conditionbranch xpath="count(xnl:NameLine[@NameType=&quot;Initials&quot; and text() != &quot;&quot;]) &gt; 0 and count(xnl:FirstName) &gt; 0">
																		<children>
																			<calltemplate subtype="named" match="Space">
																				<parameters>
																					<parameter name="fontSize" value="$fontSize"/>
																				</parameters>
																			</calltemplate>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<template subtype="element" match="xnl:FirstName">
																<children>
																	<text fixtext="("/>
																	<content subtype="regular"/>
																	<text fixtext=")"/>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NameLine">
																<children>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<condition>
																<children>
																	<conditionbranch xpath="count(xnl:NameLine[@NameType=&quot;Initials&quot; and text() != &quot;&quot;]) &gt; 0 and count(xnl:FirstName) &gt; 0">
																		<children>
																			<calltemplate subtype="named" match="Space">
																				<parameters>
																					<parameter name="fontSize" value="$fontSize"/>
																				</parameters>
																			</calltemplate>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<template subtype="element" match="xnl:FirstName">
																<children>
																	<text fixtext="(">
																		<styles font-weight="bold"/>
																	</text>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																	</content>
																	<text fixtext=")">
																		<styles font-weight="bold"/>
																	</text>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize=&apos;smaller&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NameLine">
																<children>
																	<content subtype="regular">
																		<styles font-size="smaller"/>
																	</content>
																</children>
																<variables/>
															</template>
															<condition>
																<children>
																	<conditionbranch xpath="count(xnl:NameLine[@NameType=&quot;Initials&quot; and text() != &quot;&quot;]) &gt; 0 and count(xnl:FirstName) &gt; 0">
																		<children>
																			<calltemplate subtype="named" match="Space">
																				<parameters>
																					<parameter name="fontSize" value="$fontSize"/>
																				</parameters>
																			</calltemplate>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<template subtype="element" match="xnl:FirstName">
																<children>
																	<text fixtext="(">
																		<styles font-size="smaller"/>
																	</text>
																	<content subtype="regular">
																		<styles font-size="smaller"/>
																	</content>
																	<text fixtext=")">
																		<styles font-size="smaller"/>
																	</text>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NameLine">
																<children>
																	<content subtype="regular">
																		<styles font-size="smaller" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<condition>
																<children>
																	<conditionbranch xpath="count(xnl:NameLine[@NameType=&quot;Initials&quot; and text() != &quot;&quot;]) &gt; 0 and count(xnl:FirstName) &gt; 0">
																		<children>
																			<calltemplate subtype="named" match="Space">
																				<parameters>
																					<parameter name="fontSize" value="$fontSize"/>
																				</parameters>
																			</calltemplate>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<template subtype="element" match="xnl:FirstName">
																<children>
																	<text fixtext="(">
																		<styles font-size="smaller" font-weight="bold"/>
																	</text>
																	<content subtype="regular">
																		<styles font-size="smaller" font-weight="bold"/>
																	</content>
																	<text fixtext=")">
																		<styles font-size="smaller" font-weight="bold"/>
																	</text>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize=&apos;x-small&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NameLine">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small"/>
																	</content>
																</children>
																<variables/>
															</template>
															<condition>
																<children>
																	<conditionbranch xpath="count(xnl:NameLine[@NameType=&quot;Initials&quot; and text() != &quot;&quot;]) &gt; 0 and count(xnl:FirstName) &gt; 0">
																		<children>
																			<calltemplate subtype="named" match="Space">
																				<parameters>
																					<parameter name="fontSize" value="$fontSize"/>
																				</parameters>
																			</calltemplate>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<template subtype="element" match="xnl:FirstName">
																<children>
																	<text fixtext="(">
																		<styles font-size="x-small"/>
																	</text>
																	<content subtype="regular">
																		<styles font-size="x-small"/>
																	</content>
																	<text fixtext=")">
																		<styles font-size="x-small"/>
																	</text>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="xnl:PersonName">
														<children>
															<template subtype="element" match="xnl:NameLine">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
															<condition>
																<children>
																	<conditionbranch xpath="count(xnl:NameLine[@NameType=&quot;Initials&quot; and text() != &quot;&quot;]) &gt; 0 and count(xnl:FirstName) &gt; 0">
																		<children>
																			<calltemplate subtype="named" match="Space">
																				<parameters>
																					<parameter name="fontSize" value="$fontSize"/>
																				</parameters>
																			</calltemplate>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<template subtype="element" match="xnl:FirstName">
																<children>
																	<text fixtext="(">
																		<styles font-size="x-small" font-weight="bold"/>
																	</text>
																	<content subtype="regular">
																		<styles font-size="x-small" font-weight="bold"/>
																	</content>
																	<text fixtext=")">
																		<styles font-size="x-small" font-weight="bold"/>
																	</text>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="Gender">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="fontSize" type="xs:token" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Displays the gender as &quot; (m)&quot; or &quot; (v)&quot; with preceding blank (name component g), if @PublishGender = &quot;true&quot;."/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;normal&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="../kr:ListData/@PublishGender=&quot;true&quot;">
																<children>
																	<template subtype="element" match="eml:Gender">
																		<children>
																			<condition>
																				<children>
																					<conditionbranch xpath=".=&quot;male&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (m)"/>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_m"/>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;female&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (v)"/>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_v"/>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;unknown&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (f)"/>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_unknown"/>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																				</children>
																			</condition>
																		</children>
																		<variables/>
																	</template>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="../kr:ListData/@PublishGender=&quot;true&quot;">
																<children>
																	<template subtype="element" match="eml:Gender">
																		<children>
																			<condition>
																				<children>
																					<conditionbranch xpath=".=&quot;male&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (m)">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_m">
																												<styles font-weight="bold"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;female&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (v)">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_v">
																												<styles font-weight="bold"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;unknown&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (f)">
																												<styles font-weight="bold"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_unknown">
																												<styles font-weight="bold"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																				</children>
																			</condition>
																		</children>
																		<variables/>
																	</template>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;smaller&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="../kr:ListData/@PublishGender=&quot;true&quot;">
																<children>
																	<template subtype="element" match="eml:Gender">
																		<children>
																			<condition>
																				<children>
																					<conditionbranch xpath=".=&quot;male&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (m)">
																												<styles font-size="smaller"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_m">
																												<styles font-size="smaller"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;female&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (v)">
																												<styles font-size="smaller"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_v">
																												<styles font-size="smaller"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;unknown&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (f)">
																												<styles font-size="smaller"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_unknown">
																												<styles font-size="smaller"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																				</children>
																			</condition>
																		</children>
																		<variables/>
																	</template>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="../kr:ListData/@PublishGender=&quot;true&quot;">
																<children>
																	<template subtype="element" match="eml:Gender">
																		<children>
																			<condition>
																				<children>
																					<conditionbranch xpath=".=&quot;male&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (m)">
																												<styles font-size="smaller" font-weight="bold"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_m">
																												<styles font-size="smaller" font-weight="bold"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;female&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (v)">
																												<styles font-size="smaller" font-weight="bold"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_v">
																												<styles font-size="smaller" font-weight="bold"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;unknown&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (f)">
																												<styles font-size="smaller" font-weight="bold"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_unknown">
																												<styles font-size="smaller" font-weight="bold"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																				</children>
																			</condition>
																		</children>
																		<variables/>
																	</template>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;x-small&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="../kr:ListData/@PublishGender=&quot;true&quot;">
																<children>
																	<template subtype="element" match="eml:Gender">
																		<children>
																			<condition>
																				<children>
																					<conditionbranch xpath=".=&quot;male&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (m)">
																												<styles font-size="x-small"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_m">
																												<styles font-size="x-small"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;female&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (v)">
																												<styles font-size="x-small"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_v">
																												<styles font-size="x-small"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;unknown&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (f)">
																												<styles font-size="x-small"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_unknown">
																												<styles font-size="x-small"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																				</children>
																			</condition>
																		</children>
																		<variables/>
																	</template>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="../kr:ListData/@PublishGender=&quot;true&quot;">
																<children>
																	<template subtype="element" match="eml:Gender">
																		<children>
																			<condition>
																				<children>
																					<conditionbranch xpath=".=&quot;male&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (m)">
																												<styles font-size="x-small" font-weight="bold"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_m">
																												<styles font-size="x-small" font-weight="bold"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;female&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (v)">
																												<styles font-size="x-small" font-weight="bold"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_v">
																												<styles font-size="x-small" font-weight="bold"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath=".=&quot;unknown&quot;">
																						<children>
																							<condition>
																								<children>
																									<conditionbranch xpath="$lang=0">
																										<children>
																											<text fixtext=" (f)">
																												<styles font-size="x-small" font-weight="bold"/>
																											</text>
																										</children>
																									</conditionbranch>
																									<conditionbranch>
																										<children>
																											<autocalc xpath="$RP_Gender_unknown">
																												<styles font-size="x-small" font-weight="bold"/>
																											</autocalc>
																										</children>
																									</conditionbranch>
																								</children>
																							</condition>
																						</children>
																					</conditionbranch>
																				</children>
																			</condition>
																		</children>
																		<variables/>
																	</template>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="CompleteAddress">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="fontSize" type="xs:token" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Complete adress like &quot;Dasstraat 17, 6361 DV Nuth&quot;"/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;normal&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="xal:Locality">
														<children>
															<template subtype="element" match="xal:AddressLine">
																<children>
																	<content subtype="regular"/>
																	<text fixtext=", "/>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xal:PostalCode">
																<children>
																	<content subtype="regular"/>
																	<condition>
																		<children>
																			<conditionbranch xpath=".!=&quot;&quot;">
																				<children>
																					<text fixtext=" "/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xal:LocalityName">
																<children>
																	<content subtype="regular"/>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="xal:Locality">
														<children>
															<template subtype="element" match="xal:AddressLine">
																<children>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																	</content>
																	<text fixtext=", ">
																		<styles font-weight="bold"/>
																	</text>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xal:PostalCode">
																<children>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																	</content>
																	<condition>
																		<children>
																			<conditionbranch xpath=".!=&quot;&quot;">
																				<children>
																					<text fixtext=" ">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xal:LocalityName">
																<children>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;x-small&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="xal:Locality">
														<children>
															<template subtype="element" match="xal:AddressLine">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small"/>
																	</content>
																	<text fixtext=", ">
																		<styles font-size="x-small"/>
																	</text>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xal:PostalCode">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small"/>
																	</content>
																	<condition>
																		<children>
																			<conditionbranch xpath=".!=&quot;&quot;">
																				<children>
																					<text fixtext=" ">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xal:LocalityName">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="xal:Locality">
														<children>
															<template subtype="element" match="xal:AddressLine">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small" font-weight="bold"/>
																	</content>
																	<text fixtext=", ">
																		<styles font-size="x-small" font-weight="bold"/>
																	</text>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xal:PostalCode">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small" font-weight="bold"/>
																	</content>
																	<condition>
																		<children>
																			<conditionbranch xpath=".!=&quot;&quot;">
																				<children>
																					<text fixtext=" ">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
															<template subtype="element" match="xal:LocalityName">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="NameBCEF">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Displays the name &quot;van der Zaag, H.H.G. (Henk)&quot; (name components b+c+e+f)."/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<calltemplate subtype="named" match="LastNameH1">
						<parameters>
							<parameter name="isBold" value="$isBold"/>
						</parameters>
					</calltemplate>
					<text fixtext=", "/>
					<calltemplate subtype="named" match="FirstNameH1">
						<parameters>
							<parameter name="isBold" value="$isBold"/>
						</parameters>
					</calltemplate>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="Kieskring">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="./eml:ElectionIdentifier/kr:ElectionSubcategory[text()=&quot;TK&quot; or text()=&quot;EK&quot; or text()=&quot;PS2&quot;]  or ../eml:ElectionIdentifier/kr:ElectionSubcategory[text()=&quot;TK&quot; or text()=&quot;EK&quot; or text()=&quot;PS2&quot;] or ../eml:Election/eml:ElectionIdentifier/kr:ElectionSubcategory[text()=&quot;TK&quot; or text()=&quot;EK&quot; or text()=&quot;PS2&quot;]">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$lang=0">
												<children>
													<text fixtext=" in kieskring "/>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<autocalc xpath="$RP_Kieskring_inKieskring"/>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="eml:ContestIdentifier/@Id != &quot;alle&quot;">
												<children>
													<calltemplate subtype="named" match="ContestIdentifier">
														<parameters>
															<parameter name="isBold" value="1"/>
														</parameters>
													</calltemplate>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<template subtype="element" match="rg:RG210">
														<children>
															<calltemplate subtype="named" match="ContestIdentifier">
																<parameters>
																	<parameter name="isBold" value="1"/>
																</parameters>
															</calltemplate>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="City">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="fontSize" type="xs:token" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="City (without postal code) &quot;DV Nuth&quot;"/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;normal&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="xal:Locality">
														<children>
															<template subtype="element" match="xal:LocalityName">
																<children>
																	<content subtype="regular"/>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="xal:Locality">
														<children>
															<template subtype="element" match="xal:LocalityName">
																<children>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;x-small&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="xal:Locality">
														<children>
															<template subtype="element" match="xal:LocalityName">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="xal:Locality">
														<children>
															<template subtype="element" match="xal:LocalityName">
																<children>
																	<content subtype="regular">
																		<styles font-size="x-small" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="FootnoteSign">
				<parameters/>
				<children>
					<template subtype="element" match="eml:ElectionIdentifier">
						<children>
							<template subtype="element" match="kr:ElectionSubcategory">
								<children>
									<condition>
										<children>
											<conditionbranch xpath=".=&quot;TK&quot; or .=&quot;EK&quot; or .=&quot;PS2&quot;">
												<children>
													<text fixtext=" *)"/>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="FootnoteKieskring">
				<parameters/>
				<children>
					<template subtype="element" match="eml:ElectionIdentifier">
						<children>
							<template subtype="element" match="kr:ElectionSubcategory">
								<children>
									<condition>
										<children>
											<conditionbranch xpath=".=&quot;TK&quot; or .=&quot;EK&quot; or .=&quot;PS2&quot;">
												<children>
													<paragraph paragraphtag="p">
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="$lang=0">
																		<children>
																			<text fixtext="Voetnoten:">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch>
																		<children>
																			<autocalc xpath="$RP_FootnoteKieskring_voetnoten">
																				<styles font-weight="bold"/>
																			</autocalc>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
														</children>
													</paragraph>
													<tgrid>
														<properties cellPadding="0" cellSpacing="0" class="footnotes"/>
														<styles vertical-align="top" width="90%"/>
														<children>
															<tgridbody-cols>
																<children>
																	<tgridcol/>
																	<tgridcol>
																		<styles width="100%"/>
																	</tgridcol>
																</children>
															</tgridbody-cols>
															<tgridbody-rows>
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<properties class="footnotesnr" noWrap="65535" vAlign="top"/>
																				<styles vertical-align="top" width="3%"/>
																				<children>
																					<text fixtext="*)"/>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<properties class="footnotescontent" vAlign="top"/>
																				<styles vertical-align="top"/>
																				<children>
																					<condition>
																						<children>
																							<conditionbranch xpath="$lang=0">
																								<children>
																									<text fixtext="Alleen in te vullen, indien het een verkiezing betreft van de leden van de Tweede Kamer of van provinciale staten van een provincie die uit meer dan één kieskring bestaat. Achter “kieskring” het nummer van de kieskring en tussen haakjes de naam van de gemeente waar het hoofdstembureau is gevestigd vermelden."/>
																								</children>
																							</conditionbranch>
																							<conditionbranch>
																								<children>
																									<autocalc xpath="$RP_FootnoteKieskring_alleenInTeVullen"/>
																								</children>
																							</conditionbranch>
																						</children>
																					</condition>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
															</tgridbody-rows>
														</children>
													</tgrid>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="Date">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="fontSize" type="xs:token" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;normal&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="substring(text(),9, 1) != &quot;0&quot;">
																<children>
																	<autocalc xpath="substring(text(),9, 1)"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<autocalc xpath="substring(text(),10, 1)"/>
													<text fixtext=" "/>
													<condition>
														<children>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;01&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="januari"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_januari"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;02&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="februari"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_februari"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;03&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="maart"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_maart"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;04&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="april"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_april"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;05&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="mei"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_mei"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;06&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="juni"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_juni"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;07&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="juli"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_juli"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;08&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="augustus"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_augustus"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;09&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="september"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_september"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;10&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="oktober"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_oktober"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;11&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="november"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_november"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2)  = &quot;12&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="december"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_december"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<text fixtext=" "/>
													<autocalc xpath="substring(text(),1, 4)"/>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="substring(text(),9, 1) != &quot;0&quot;">
																<children>
																	<autocalc xpath="substring(text(),9, 1)">
																		<styles font-weight="bold"/>
																	</autocalc>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<autocalc xpath="substring(text(),10, 1)">
														<styles font-weight="bold"/>
													</autocalc>
													<text fixtext=" ">
														<styles font-weight="bold"/>
													</text>
													<condition>
														<children>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;01&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="januari">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_januari">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;02&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="februari">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_februari">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;03&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="maart">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_maart">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;04&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="april">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_april">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;05&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="mei">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_mei">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;06&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="juni">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_juni">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;07&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="juli">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_juli">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;08&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="augustus">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_augustus">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;09&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="september">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_september">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;10&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="oktober">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_oktober">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;11&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="november">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_november">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2)  = &quot;12&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="december">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_december">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<text fixtext=" ">
														<styles font-weight="bold"/>
													</text>
													<autocalc xpath="substring(text(),1, 4)">
														<styles font-weight="bold"/>
													</autocalc>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;x-small&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="substring(text(),9, 1) != &quot;0&quot;">
																<children>
																	<autocalc xpath="substring(text(),9, 1)">
																		<styles font-size="x-small"/>
																	</autocalc>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<autocalc xpath="substring(text(),10, 1)">
														<styles font-size="x-small"/>
													</autocalc>
													<text fixtext=" ">
														<styles font-size="x-small"/>
													</text>
													<condition>
														<children>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;01&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="januari">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_januari">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;02&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="februari">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_februari">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;03&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="maart">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_maart">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;04&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="april">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_april">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;05&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="mei">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_mei">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;06&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="juni">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_juni">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;07&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="juli">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_juli">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;08&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="augustus">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_augustus">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;09&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="september">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_september">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;10&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="oktober">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_oktober">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;11&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="november">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_november">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2)  = &quot;12&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="december">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_december">
																						<styles font-size="x-small"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<text fixtext=" ">
														<styles font-size="x-small"/>
													</text>
													<autocalc xpath="substring(text(),1, 4)">
														<styles font-size="x-small"/>
													</autocalc>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="substring(text(),9, 1) != &quot;0&quot;">
																<children>
																	<autocalc xpath="substring(text(),9, 1)">
																		<styles font-size="x-small" font-weight="bold"/>
																	</autocalc>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<autocalc xpath="substring(text(),10, 1)">
														<styles font-size="x-small" font-weight="bold"/>
													</autocalc>
													<text fixtext=" ">
														<styles font-size="x-small" font-weight="bold"/>
													</text>
													<condition>
														<children>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;01&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="januari">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_januari">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;02&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="februari">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_februari">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;03&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="maart">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_maart">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;04&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="april">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_april">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;05&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="mei">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_mei">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;06&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="juni">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_juni">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;07&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="juli">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_juli">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;08&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="augustus">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_augustus">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;09&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="september">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_september">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;10&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="oktober">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_oktober">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2) = &quot;11&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="november">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_november">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath="substring(text(),6, 2)  = &quot;12&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="december">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_Date_december">
																						<styles font-size="x-small" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<text fixtext=" ">
														<styles font-size="x-small" font-weight="bold"/>
													</text>
													<autocalc xpath="substring(text(),1, 4)">
														<styles font-size="x-small" font-weight="bold"/>
													</autocalc>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="DateOfBirth">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="fontSize" type="xs:token" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="eml:DateOfBirth">
								<children>
									<template subtype="element" match="eml:DateOfBirth">
										<children>
											<calltemplate subtype="named" match="Date">
												<parameters>
													<parameter name="isBold" value="$isBold"/>
													<parameter name="fontSize" value="$fontSize"/>
												</parameters>
											</calltemplate>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$fontSize = &apos;normal&apos;">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$isBold=0">
																<children>
																	<template subtype="element" match="kr:DateOfBirthAnnex">
																		<children>
																			<text fixtext="XX "/>
																			<condition>
																				<children>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;01&quot;">
																						<children>
																							<text fixtext="januari"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;02&quot;">
																						<children>
																							<text fixtext="februari"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;03&quot;">
																						<children>
																							<text fixtext="maart"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;04&quot;">
																						<children>
																							<text fixtext="april"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;05&quot;">
																						<children>
																							<text fixtext="mei"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;06&quot;">
																						<children>
																							<text fixtext="juni"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;07&quot;">
																						<children>
																							<text fixtext="juli"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;08&quot;">
																						<children>
																							<text fixtext="augustus"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;09&quot;">
																						<children>
																							<text fixtext="september"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;10&quot;">
																						<children>
																							<text fixtext="oktober"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2) = &quot;11&quot;">
																						<children>
																							<text fixtext="november"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2)  = &quot;12&quot;">
																						<children>
																							<text fixtext="december"/>
																						</children>
																					</conditionbranch>
																					<conditionbranch xpath="substring(text(),4, 2)  = &quot;XX&quot;">
																						<children>
																							<text fixtext="XXX"/>
																						</children>
																					</conditionbranch>
																				</children>
																			</condition>
																			<text fixtext=" "/>
																			<autocalc xpath="substring(text(),7, 4)"/>
																		</children>
																		<variables/>
																	</template>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold = 1">
												<children>
													<template subtype="element" match="kr:DateOfBirthAnnex">
														<children>
															<text fixtext="XX ">
																<styles font-weight="bold"/>
															</text>
															<condition>
																<children>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;01&quot;">
																		<children>
																			<text fixtext="januari">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;02&quot;">
																		<children>
																			<text fixtext="februari">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;03&quot;">
																		<children>
																			<text fixtext="maart">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;04&quot;">
																		<children>
																			<text fixtext="april">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;05&quot;">
																		<children>
																			<text fixtext="mei">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;06&quot;">
																		<children>
																			<text fixtext="juni">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;07&quot;">
																		<children>
																			<text fixtext="juli">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;08&quot;">
																		<children>
																			<text fixtext="augustus">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;09&quot;">
																		<children>
																			<text fixtext="september">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;10&quot;">
																		<children>
																			<text fixtext="oktober">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2) = &quot;11&quot;">
																		<children>
																			<text fixtext="november">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2)  = &quot;12&quot;">
																		<children>
																			<text fixtext="december">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																	<conditionbranch xpath="substring(text(),4, 2)  = &quot;XX&quot;">
																		<children>
																			<text fixtext="XXX">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<text fixtext=" ">
																<styles font-weight="bold"/>
															</text>
															<autocalc xpath="substring(text(),7, 4)">
																<styles font-weight="bold"/>
															</autocalc>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="GenerateDate">
				<parameters/>
				<children>
					<autocalc xpath="$generateDate">
						<styles font-size="8pt"/>
					</autocalc>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="HashCode">
				<parameters/>
				<children>
					<autocalc xpath="$hashCode">
						<styles font-size="8pt"/>
					</autocalc>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="FooterWithoutHashcode">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$isDraft=&quot;true&quot;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$lang=0">
												<children>
													<text fixtext="(Concept) ">
														<styles font-size="9pt"/>
													</text>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<autocalc xpath="$RP_FooterWithoutHashcode_concept">
														<styles font-size="9pt"/>
													</autocalc>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$lang=0">
								<children>
									<text fixtext="Datum: ">
										<styles font-size="9pt"/>
									</text>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<autocalc xpath="$RP_FooterWithoutHashcode_datum">
										<styles font-size="9pt"/>
									</autocalc>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<calltemplate subtype="named" match="GenerateDate">
						<parameters/>
					</calltemplate>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="Checkbox">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="text()=&quot;true&quot;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$lang=0">
												<children>
													<text fixtext="■"/>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<autocalc xpath="$RP_Checkbox_iconChecked"/>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<text fixtext="	"/>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$lang=0">
												<children>
													<text fixtext="□"/>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<autocalc xpath="$RP_Checkbox_iconUnchecked"/>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<text fixtext="	"/>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="FooterWithHashcode">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$isDraft=&quot;true&quot;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$lang=0">
												<children>
													<text fixtext="(Concept) | ">
														<styles font-size="9pt"/>
													</text>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<autocalc xpath="$RP_FooterWithHashcode_concept">
														<styles font-size="9pt"/>
													</autocalc>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<calltemplate subtype="named" match="GenerateDate">
										<parameters/>
									</calltemplate>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$lang=0">
												<children>
													<text fixtext="Hashcode: ">
														<styles font-size="8pt"/>
													</text>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<autocalc xpath="$RP_FooterWithHashcode_hashcode">
														<styles font-size="8pt"/>
													</autocalc>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<calltemplate subtype="named" match="HashCode">
										<parameters/>
									</calltemplate>
									<text fixtext=" | ">
										<styles font-size="8pt"/>
									</text>
									<calltemplate subtype="named" match="GenerateDate">
										<parameters/>
									</calltemplate>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ElectionNameP2">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Election name without date"/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$lang=0">
								<children>
									<text fixtext="verkiezing van de leden van "/>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<autocalc xpath="$RP_ElectionNameP2_verkiezingLeden"/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<calltemplate subtype="named" match="ElectionNameSimple">
						<parameters>
							<parameter name="isBold" value="1"/>
						</parameters>
					</calltemplate>
					<calltemplate subtype="named" match="ElectionDomain">
						<parameters>
							<parameter name="isBold" value="1"/>
						</parameters>
					</calltemplate>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="CombinedListI17">
				<parameters/>
				<children>
					<template subtype="element" match="rg:CandidateListName">
						<children>
							<condition>
								<children>
									<conditionbranch xpath="position() = 1">
										<children>
											<condition>
												<children>
													<conditionbranch xpath="$lang=0">
														<children>
															<text fixtext="- Lijst "/>
														</children>
													</conditionbranch>
													<conditionbranch>
														<children>
															<autocalc xpath="$RP_CombinedListI17_lijst"/>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
									</conditionbranch>
									<conditionbranch>
										<children>
											<condition>
												<children>
													<conditionbranch xpath="$lang=0">
														<children>
															<text fixtext=" en lijst "/>
														</children>
													</conditionbranch>
													<conditionbranch>
														<children>
															<autocalc xpath="$RP_CombinedListI17_enLijst"/>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
									</conditionbranch>
								</children>
							</condition>
							<calltemplate subtype="named" match="CombinedListListNumber">
								<parameters/>
							</calltemplate>
							<text fixtext=": "/>
							<calltemplate subtype="named" match="CombinedListListName">
								<parameters/>
							</calltemplate>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="PostalCode">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Postal code and city like &quot;6361 DV&quot;"/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=0">
								<children>
									<template subtype="element" match="xal:Locality">
										<children>
											<template subtype="element" match="xal:PostalCode">
												<children>
													<content subtype="regular"/>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=1">
								<children>
									<template subtype="element" match="xal:Locality">
										<children>
											<template subtype="element" match="xal:PostalCode">
												<children>
													<content subtype="regular">
														<styles font-weight="bold"/>
													</content>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ElectionFraction">
				<parameters>
					<parameter name="smaller" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<template subtype="element" match="rg:Fraction">
						<children>
							<autocalc xpath="floor( @numerator  div  @denominator )"/>
							<condition>
								<children>
									<conditionbranch xpath="@numerator - ( floor(@numerator div  @denominator ) * @denominator) != 0">
										<children>
											<text fixtext=" "/>
											<autocalc xpath="@numerator - ( floor(@numerator div  @denominator ) * @denominator)"/>
											<text fixtext="/"/>
											<template subtype="attribute" match="denominator">
												<children>
													<content subtype="regular">
														<format basic-type="xsd" datatype="integer"/>
													</content>
												</children>
												<variables/>
											</template>
										</children>
									</conditionbranch>
								</children>
							</condition>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="PartyNameOrFirstCandidate">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="If no name is registered, display the &quot;"/>
									<text fixtext="blanco lijst met als eerste kandidaat"/>
									<text fixtext="&quot; + first candidates name"/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<template subtype="element" match="rg:CandidateListName">
						<children>
							<condition>
								<children>
									<conditionbranch xpath="./eml:AffiliationIdentifier/eml:RegisteredName[text()!=&quot;&quot;]">
										<children>
											<template subtype="element" match="eml:AffiliationIdentifier">
												<children>
													<template subtype="element" match="eml:RegisteredName">
														<children>
															<content subtype="regular">
																<format basic-type="xsd" datatype="token"/>
															</content>
														</children>
														<variables/>
													</template>
												</children>
												<variables/>
											</template>
										</children>
									</conditionbranch>
									<conditionbranch>
										<children>
											<condition>
												<children>
													<conditionbranch xpath="$lang=0">
														<children>
															<text fixtext="blanco lijst met als eerste kandidaat "/>
														</children>
													</conditionbranch>
													<conditionbranch>
														<children>
															<autocalc xpath="$RP_PartyNameOrFirstCandidate_blancoLijst"/>
														</children>
													</conditionbranch>
												</children>
											</condition>
											<template subtype="element" match="rg:FirstCandidateName">
												<children>
													<calltemplate subtype="named" match="LastNameH1">
														<parameters/>
													</calltemplate>
													<text fixtext=","/>
													<calltemplate subtype="named" match="Initials">
														<parameters/>
													</calltemplate>
												</children>
												<variables/>
											</template>
										</children>
									</conditionbranch>
								</children>
							</condition>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="SignatureBlock">
				<parameters>
					<parameter name="distance" type="xs:int" occurrence="none-or-one" default-value="1"/>
				</parameters>
				<children>
					<tgrid>
						<properties border="0" cellpadding="1" cellspacing="0" width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol>
										<styles width="140pt"/>
									</tgridcol>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell/>
											<tgridcell>
												<properties align="left" class="entry"/>
												<children>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="Plaats: ........................................................"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock_plaats"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="Datum: ......................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock_datum"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 1">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 2">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................, Voorzitter"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock_voorzitter"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 1">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 2">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 1">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 2">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 1">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 2">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="...................................................................... Leden"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock_leden"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 1">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 2">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 1">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 2">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 1">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<condition>
														<children>
															<conditionbranch xpath="$distance &gt;= 2">
																<children>
																	<newline/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="SignatureBlock-3">
				<parameters/>
				<children>
					<tgrid>
						<properties border="0" cellpadding="1" cellspacing="0" width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol>
										<styles width="140pt"/>
									</tgridcol>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell/>
											<tgridcell>
												<properties align="left" class="entry"/>
												<children>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="Plaats: ........................................................"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock-3_plaats"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="Datum: ......................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock-3_datum"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="............................................., Voorzitter"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock-3_voorzitter"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="............................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock-3_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="............................................. Leden"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock-3_leden"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="............................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_SignatureBlock-3_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ElectionNameSimple">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Just election name"/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<template subtype="element" match="eml:ElectionIdentifier">
						<children>
							<template subtype="element" match="eml:ElectionCategory">
								<children>
									<condition>
										<children>
											<conditionbranch xpath=".=&quot;EP&quot; or .=&quot;BC&quot;">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="het "/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ElectionNameSimple_het"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="de "/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ElectionNameSimple_de"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<condition>
														<children>
															<conditionbranch xpath=".= &quot;TK&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="Tweede Kamer der Staten-Generaal"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_tweedeKamer"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;EK&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="Eerste Kamer der Staten-Generaal"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_eersteKamer"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;PS&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="provinciale staten van"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_provincialeStaten"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;EP&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="Europees Parlement"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_hetEuropeesParlement"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;GR&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="gemeenteraad"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_raadVanDeGemeente"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;ER&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="eilandsraad"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_eilandsraad"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;BC&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="algemeen bestuur van de bestuurscommissie"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_bestuurscommissie"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;GC&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="gebiedscommissie"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_gebiedscommissie"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<condition>
														<children>
															<conditionbranch xpath=".= &quot;TK&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="Tweede Kamer der Staten-Generaal">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_tweedeKamer">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;EK&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="Eerste Kamer der Staten-Generaal">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_eersteKamer">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;PS&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="provinciale staten">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_provincialeStaten">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;EP&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="Europees Parlement">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_hetEuropeesParlement">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;GR&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="gemeenteraad">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_raadVanDeGemeente">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;ER&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="eilandsraad">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_eilandsraad">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;BC&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="algemeen bestuur van de bestuurscommissie">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_bestuurscommissie">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch xpath=".=&quot;GC&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="gebiedscommissie">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ElectionNameSimple_gebiedscommissie">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath=".=&quot;PS&quot;">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext=" van"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ElectionNameSimple_van"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
											<conditionbranch xpath=".=&quot;GR&quot;">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext=" van"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ElectionNameSimple_van"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
											<conditionbranch xpath=".=&quot;ER&quot;">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext=" van het openbaar lichaam"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ElectionNameSimple_van_eilandsraad"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
											<conditionbranch xpath=".=&quot;BC&quot;">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext=" van stadsdeel"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ElectionNameSimple_van_stadsdeel"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ObjectionsByVoters1">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$lang=0">
								<children>
									<text fixtext="Door de in de zittingsruimte aanwezige kiezers zijn"/>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<autocalc xpath="$RP_ObjectionsByVoters1_aanwezigeKiezers"/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<calltemplate subtype="named" match="LineBreakTable">
						<parameters/>
					</calltemplate>
					<calltemplate subtype="named" match="ObjectionsByVoters1b">
						<parameters/>
					</calltemplate>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ObjectionsByVoters2">
				<parameters/>
				<children>
					<template subtype="element" match="rg:ObjectionsByVoters">
						<children>
							<template subtype="element" match="rg:NotesOnObjections">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="../rg:NotesOnObjections[text() != &quot;&quot;]">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$SV_OutputFormat = &apos;RTF&apos;">
																<children>
																	<paragraph paragraphtag="p">
																		<children>
																			<content subtype="regular">
																				<format basic-type="xsd" datatype="string"/>
																			</content>
																		</children>
																	</paragraph>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<paragraph paragraphtag="p">
																		<styles white-space="pre-wrap"/>
																		<children>
																			<content subtype="regular">
																				<format basic-type="xsd" datatype="string"/>
																			</content>
																		</children>
																	</paragraph>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................................................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters2_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................................................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters2_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................................................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters2_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................................................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters2_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................................................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters2_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ObjectionsByVoters2a">
				<parameters/>
				<children>
					<newline/>
					<template subtype="element" match="rg:ObjectionsByVoters">
						<children>
							<template subtype="element" match="rg:Objections">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="../rg:Objections[text() != &quot;&quot;]">
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$SV_OutputFormat = &apos;RTF&apos;">
																<children>
																	<paragraph paragraphtag="p">
																		<children>
																			<content subtype="regular">
																				<format basic-type="xsd" datatype="string"/>
																			</content>
																		</children>
																	</paragraph>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<paragraph paragraphtag="p">
																		<styles white-space="pre-wrap"/>
																		<children>
																			<content subtype="regular">
																				<format basic-type="xsd" datatype="string"/>
																			</content>
																		</children>
																	</paragraph>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................................................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters2a_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................................................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters2a_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................................................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters2a_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................................................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters2a_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<newline/>
													<newline/>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="......................................................................................................................................."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters2a_emptyLine"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="LineBreak">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$SV_OutputFormat = &apos;PDF&apos;">
								<children>
									<paragraph paragraphtag="p"/>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<newline/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="LineBreakTable">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$SV_OutputFormat = &apos;PDF&apos;">
								<children>
									<paragraph paragraphtag="p"/>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="KieskringParty">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Additional information about the distrinct for which a centrally submitted list is nominated"/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="eml:ContestIdentifier/@Id = &quot;alle&quot;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$lang=0">
												<children>
													<text fixtext=" in alle kieskringen"/>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<autocalc xpath="$RP_KieskringParty_inAlleKieskringen"/>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
							<conditionbranch xpath="eml:ContestIdentifier">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$lang=0">
												<children>
													<text fixtext=" in kieskring"/>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<autocalc xpath="$RP_KieskringParty_inKieskring"/>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<text fixtext=" "/>
									<calltemplate subtype="named" match="ContestIdentifier">
										<parameters/>
									</calltemplate>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ElectionDomain">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="font-size" type="xs:token" occurrence="none-or-one" default-value="&apos;small&apos;"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Election domain as part of the elction name - if needed"/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=0 and $font-size=&apos;small&apos;">
								<children>
									<template subtype="element" match="eml:ElectionIdentifier">
										<children>
											<condition>
												<children>
													<conditionbranch xpath="./eml:ElectionCategory[text()=&quot;PS&quot; or text()=&quot;AB&quot; or text()=&quot;GR&quot; or text()=&quot;ER&quot;]">
														<children>
															<template subtype="element" match="kr:ElectionDomain">
																<children>
																	<text fixtext=" "/>
																	<content subtype="regular"/>
																</children>
																<variables/>
															</template>
														</children>
													</conditionbranch>
													<conditionbranch xpath="./eml:ElectionCategory[ text()=&quot;BC&quot; or text()=&quot;GC&quot; ]">
														<children>
															<template subtype="element" match="kr:ElectionDomain">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath=". != &quot;Rotterdam - Centrum&quot;  and  . != &quot;Rotterdam - Pernis&quot;">
																				<children>
																					<text fixtext=" "/>
																					<autocalc xpath="substring( text() , 13 )"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<text fixtext=" "/>
																					<content subtype="regular"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=1 and $font-size=&apos;small&apos;">
								<children>
									<template subtype="element" match="eml:ElectionIdentifier">
										<children>
											<condition>
												<children>
													<conditionbranch xpath="./eml:ElectionCategory[text()=&quot;PS&quot; or text()=&quot;AB&quot; or text()=&quot;GR&quot; or text()=&quot;ER&quot;]">
														<children>
															<template subtype="element" match="kr:ElectionDomain">
																<children>
																	<text fixtext=" ">
																		<styles font-weight="bold"/>
																	</text>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
													</conditionbranch>
													<conditionbranch xpath="./eml:ElectionCategory[ text()=&quot;BC&quot; or text()=&quot;GC&quot; ]">
														<children>
															<template subtype="element" match="kr:ElectionDomain">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath=". != &quot;Rotterdam - Centrum&quot;  and  . != &quot;Rotterdam - Pernis&quot;">
																				<children>
																					<text fixtext=" ">
																						<styles font-weight="bold"/>
																					</text>
																					<autocalc xpath="substring( text() , 13 )">
																						<styles font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<text fixtext=" ">
																						<styles font-weight="bold"/>
																					</text>
																					<content subtype="regular">
																						<styles font-weight="bold"/>
																					</content>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$isBold=1 and $font-size=&apos;medium&apos;">
								<children>
									<template subtype="element" match="eml:ElectionIdentifier">
										<children>
											<condition>
												<children>
													<conditionbranch xpath="./eml:ElectionCategory[text()=&quot;PS&quot; or text()=&quot;AB&quot; or text()=&quot;GR&quot; or text()=&quot;ER&quot;]">
														<children>
															<template subtype="element" match="kr:ElectionDomain">
																<children>
																	<text fixtext=" ">
																		<styles font-size="medium" font-weight="bold"/>
																	</text>
																	<content subtype="regular">
																		<styles font-size="medium" font-weight="bold"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
													</conditionbranch>
													<conditionbranch xpath="./eml:ElectionCategory[ text()=&quot;BC&quot; or text()=&quot;GC&quot; ]">
														<children>
															<template subtype="element" match="kr:ElectionDomain">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath=". != &quot;Rotterdam - Centrum&quot;  and  . != &quot;Rotterdam - Pernis&quot;">
																				<children>
																					<text fixtext=" ">
																						<styles font-size="medium" font-weight="bold"/>
																					</text>
																					<autocalc xpath="substring( text() , 13 )">
																						<styles font-size="medium" font-weight="bold"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<text fixtext=" ">
																						<styles font-size="medium" font-weight="bold"/>
																					</text>
																					<content subtype="regular">
																						<styles font-size="medium" font-weight="bold"/>
																					</content>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
																<variables/>
															</template>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ContestIdentifier">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="fontSize" type="xs:token" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;normal&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="eml:ContestIdentifier">
														<children>
															<template subtype="attribute" match="Id">
																<children>
																	<content subtype="regular">
																		<format basic-type="xsd" datatype="NMTOKEN"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext=" ("/>
															<template subtype="element" match="eml:ContestName">
																<children>
																	<content subtype="regular">
																		<format basic-type="xsd" datatype="token"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext=")"/>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=1">
												<children>
													<template subtype="element" match="eml:ContestIdentifier">
														<children>
															<template subtype="attribute" match="Id">
																<children>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																		<format basic-type="xsd" datatype="NMTOKEN"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext=" (">
																<styles font-weight="bold"/>
															</text>
															<template subtype="element" match="eml:ContestName">
																<children>
																	<content subtype="regular">
																		<styles font-weight="bold"/>
																		<format basic-type="xsd" datatype="token"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext=")">
																<styles font-weight="bold"/>
															</text>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize = &apos;medium&apos;">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$isBold=0">
												<children>
													<template subtype="element" match="eml:ContestIdentifier">
														<children>
															<template subtype="attribute" match="Id">
																<children>
																	<content subtype="regular">
																		<styles font-size="medium"/>
																		<format basic-type="xsd" datatype="NMTOKEN"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext=" (">
																<styles font-size="medium"/>
															</text>
															<template subtype="element" match="eml:ContestName">
																<children>
																	<content subtype="regular">
																		<styles font-size="medium"/>
																		<format basic-type="xsd" datatype="token"/>
																	</content>
																</children>
																<variables/>
															</template>
															<text fixtext=")">
																<styles font-size="medium"/>
															</text>
														</children>
														<variables/>
													</template>
												</children>
											</conditionbranch>
										</children>
									</condition>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ObjectionsByVoters1b">
				<parameters/>
				<children>
					<tgrid>
						<properties border="0" cellpadding="1" cellspacing="0" width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol>
										<styles width="30pt"/>
									</tgridcol>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell/>
											<tgridcell>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="□ geen bezwaren ingebracht."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters1b_geenBezwarenIngebracht"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell/>
											<tgridcell>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="string(rg:ObjectionsByVoters/rg:Objections) != &quot;&quot;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="■"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ObjectionsByVoters1b_iconChecked"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="□"/>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_ObjectionsByVoters1b_iconUnchecked"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext=" de volgende bezwaren ingebracht:"/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsByVoters1b_volgendeBezwarenIngebracht"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<calltemplate subtype="named" match="ObjectionsByVoters2a">
						<parameters/>
					</calltemplate>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="Space">
				<parameters>
					<parameter name="fontSize" type="xs:string" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$fontSize=&quot;normal&quot;">
								<children>
									<autocalc xpath="&apos; &apos;"/>
								</children>
							</conditionbranch>
							<conditionbranch xpath="$fontSize=&quot;smaller&quot;">
								<children>
									<autocalc xpath="&apos; &apos;">
										<styles font-size="smaller"/>
									</autocalc>
								</children>
							</conditionbranch>
							<conditionbranch xpath="$fontSize=&apos;x-small&apos;">
								<children>
									<autocalc xpath="&apos; &apos;">
										<styles font-size="x-small"/>
									</autocalc>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<autocalc xpath="&apos; &apos;"/>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ElectionFractionPart1">
				<parameters>
					<parameter name="smaller" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$smaller = 1">
								<children>
									<template subtype="element" match="rg:Fraction">
										<children>
											<autocalc xpath="floor( @numerator  div  @denominator )">
												<styles font-size="smaller"/>
											</autocalc>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<template subtype="element" match="rg:Fraction">
										<children>
											<autocalc xpath="floor( @numerator  div  @denominator )"/>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ElectionFractionPart2">
				<parameters>
					<parameter name="smaller" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$smaller = 1">
								<children>
									<template subtype="element" match="rg:Fraction">
										<children>
											<condition>
												<children>
													<conditionbranch xpath="@numerator - ( floor(@numerator div  @denominator ) * @denominator) != 0">
														<children>
															<autocalc xpath="@numerator - ( floor(@numerator div  @denominator ) * @denominator)">
																<styles font-size="smaller"/>
															</autocalc>
															<text fixtext="/">
																<styles font-size="smaller"/>
															</text>
															<template subtype="attribute" match="denominator">
																<children>
																	<content subtype="regular">
																		<styles font-size="smaller"/>
																		<format basic-type="xsd" datatype="integer"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<template subtype="element" match="rg:Fraction">
										<children>
											<condition>
												<children>
													<conditionbranch xpath="@numerator - ( floor(@numerator div  @denominator ) * @denominator) != 0">
														<children>
															<autocalc xpath="@numerator - ( floor(@numerator div  @denominator ) * @denominator)"/>
															<text fixtext="/"/>
															<template subtype="attribute" match="denominator">
																<children>
																	<content subtype="regular">
																		<format basic-type="xsd" datatype="integer"/>
																	</content>
																</children>
																<variables/>
															</template>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="CombinedList2">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="The lists that were combined as &quot;&lt;RegistererdName&gt; (lijst &lt;@Id&gt;)&quot; or for blanko lists &quot;blanco lijst met als eerste kandidaat &lt;last name of first candidate&gt; (lijst &lt;@Id&gt;)&quot;, separated by &quot;en&quot;."/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<template subtype="element" match="rg:CandidateListName">
						<children>
							<condition>
								<children>
									<conditionbranch xpath="position() != 1">
										<children>
											<condition>
												<children>
													<conditionbranch xpath="$lang=0">
														<children>
															<text fixtext="en "/>
														</children>
													</conditionbranch>
													<conditionbranch>
														<children>
															<autocalc xpath="$RP_CombinedList2_en"/>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
									</conditionbranch>
								</children>
							</condition>
							<calltemplate subtype="named" match="CombinedListListName">
								<parameters/>
							</calltemplate>
							<condition>
								<children>
									<conditionbranch xpath="$lang=0">
										<children>
											<text fixtext=" (lijst "/>
										</children>
									</conditionbranch>
									<conditionbranch>
										<children>
											<autocalc xpath="$RP_CombinedList2_lijst"/>
										</children>
									</conditionbranch>
								</children>
							</condition>
							<calltemplate subtype="named" match="CombinedListListNumber">
								<parameters/>
							</calltemplate>
							<text fixtext=") "/>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="CombinedListListNumber">
				<parameters/>
				<children>
					<template subtype="element" match="eml:AffiliationIdentifier">
						<children>
							<condition>
								<children>
									<conditionbranch xpath="@Id != 0 and @Id != &quot;&quot;">
										<children>
											<template subtype="attribute" match="Id">
												<children>
													<content subtype="regular">
														<format basic-type="xsd" datatype="NMTOKEN"/>
													</content>
												</children>
												<variables/>
											</template>
										</children>
									</conditionbranch>
									<conditionbranch>
										<children>
											<text fixtext="   "/>
										</children>
									</conditionbranch>
								</children>
							</condition>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="CombinedListListName">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="./eml:AffiliationIdentifier/eml:RegisteredName[text() != &quot;&quot;]">
								<children>
									<template subtype="element" match="eml:AffiliationIdentifier">
										<children>
											<template subtype="element" match="eml:RegisteredName">
												<children>
													<content subtype="regular">
														<format basic-type="xsd" datatype="token"/>
													</content>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
							<conditionbranch>
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$lang=0">
												<children>
													<text fixtext="blanco lijst met als eerste kandidaat "/>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<autocalc xpath="$RP_CombinedListListName_blancoLijst"/>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<template subtype="element" match="rg:FirstCandidateName">
										<children>
											<calltemplate subtype="named" match="LastNameH1">
												<parameters/>
											</calltemplate>
										</children>
										<variables/>
									</template>
								</children>
							</conditionbranch>
						</children>
					</condition>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="Initials">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="Displays the initials like &quot; H.H.G.&quot; (name components f) with preceding blank."/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<template subtype="element" match="xnl:PersonName">
						<children>
							<template subtype="element" match="xnl:NameLine">
								<children>
									<calltemplate subtype="named" match="Space">
										<parameters/>
									</calltemplate>
									<content subtype="regular"/>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="FooterLine">
				<parameters/>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$SV_OutputFormat = &apos;PDF&apos;">
								<children>
									<text fixtext="______">
										<styles margin-bottom="6pt" vertical-align="bottom"/>
									</text>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<text fixtext="__________________________________________________________________">
						<styles margin-bottom="6pt" vertical-align="bottom"/>
					</text>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="LegacyFooter">
				<parameters>
					<parameter name="isHashcode" type="xs:int" occurrence="none-or-one" default-value="1"/>
					<parameter name="isPagenumber" type="xs:int" occurrence="none-or-one" default-value="1"/>
				</parameters>
				<children>
					<tgrid>
						<properties width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol>
										<styles width="83%"/>
									</tgridcol>
									<tgridcol>
										<styles width="17%"/>
									</tgridcol>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<tgridrow>
										<styles height="30pt"/>
										<children>
											<tgridcell>
												<styles padding="0"/>
											</tgridcell>
											<tgridcell joinleft="1"/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<styles padding="0" vertical-align="bottom"/>
												<children>
													<calltemplate subtype="named" match="FooterLine">
														<parameters/>
													</calltemplate>
												</children>
											</tgridcell>
											<tgridcell joinleft="1"/>
										</children>
									</tgridrow>
									<tgridrow>
										<styles height="30pt"/>
										<children>
											<tgridcell>
												<properties align="left"/>
												<styles font-size="9pt" padding="0" vertical-align="top"/>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$isHashcode=1">
																<children>
																	<calltemplate subtype="named" match="FooterWithHashcode">
																		<parameters/>
																	</calltemplate>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<condition>
														<children>
															<conditionbranch xpath="$isHashcode=0">
																<children>
																	<calltemplate subtype="named" match="FooterWithoutHashcode">
																		<parameters/>
																	</calltemplate>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</tgridcell>
											<tgridcell>
												<properties align="right"/>
												<styles font-size="9pt" padding="0" vertical-align="top" width="100pt"/>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$isPagenumber=1">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$lang=0">
																				<children>
																					<text fixtext="pagina ">
																						<styles font-size="9pt"/>
																					</text>
																				</children>
																			</conditionbranch>
																			<conditionbranch>
																				<children>
																					<autocalc xpath="$RP_LegacyFooter_pagina">
																						<styles font-size="9pt"/>
																					</autocalc>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<field>
																		<styles font-size="9pt"/>
																	</field>
																	<text fixtext=" / ">
																		<styles font-size="9pt"/>
																	</text>
																	<field type="pagetotal">
																		<styles font-size="9pt"/>
																	</field>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="ObjectionsReference">
				<parameters>
					<parameter name="authority" type="xs:string" occurrence="none-or-one" default-value="&apos;hoofstembureau&apos;"/>
					<parameter name="skipFirstSentence" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="$skipFirstSentence = 0">
								<children>
									<condition>
										<children>
											<conditionbranch xpath="$lang=0">
												<children>
													<text fixtext="Door de in de zittingsruimte aanwezige kiezers zijn"/>
												</children>
											</conditionbranch>
											<conditionbranch>
												<children>
													<autocalc xpath="$RP_ObjectionsReference_aanwezigeKiezers"/>
												</children>
											</conditionbranch>
										</children>
									</condition>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<tgrid>
						<properties border="0" cellpadding="1" cellspacing="0" width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol>
										<styles width="30pt"/>
									</tgridcol>
									<tgridcol>
										<styles width="15pt"/>
									</tgridcol>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<styles vertical-align="top"/>
											</tgridcell>
											<tgridcell>
												<styles vertical-align="top"/>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="□ "/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsReference_iconUnchecked"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</tgridcell>
											<tgridcell>
												<styles vertical-align="top"/>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="geen bezwaren ingebracht."/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsReference_geenBezwarenIngebracht"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<styles vertical-align="top"/>
											</tgridcell>
											<tgridcell>
												<styles vertical-align="top"/>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="□ "/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsReference_iconUnchecked"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
											</tgridcell>
											<tgridcell>
												<styles vertical-align="top"/>
												<children>
													<condition>
														<children>
															<conditionbranch xpath="$lang=0">
																<children>
																	<text fixtext="de volgende bezwaren ingebracht (zie gewaarmerkte bijlage voor bezwaren en opmerkingen daarover van het "/>
																</children>
															</conditionbranch>
															<conditionbranch>
																<children>
																	<autocalc xpath="$RP_ObjectionsReference_volgendeBezwarenIngebracht"/>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<autocalc xpath="$authority"/>
													<text fixtext=")."/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="LivingAddress">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
				</parameters>
				<children>
					<condition>
						<children>
							<conditionbranch xpath="0=1">
								<children>
									<text fixtext="City and Country code (if present) &quot;Amsterdam&quot; or &quot;Berlin (DE)&quot;"/>
									<newline/>
								</children>
							</conditionbranch>
						</children>
					</condition>
					<template subtype="element" match="kr:LivingAddress">
						<children>
							<condition>
								<children>
									<conditionbranch xpath="$isBold=0">
										<children>
											<template subtype="element" match="kr:LocalityName">
												<children>
													<content subtype="regular"/>
												</children>
												<variables/>
											</template>
											<template subtype="element" match="kr:CountryNameCode">
												<children>
													<text fixtext=" ("/>
													<content subtype="regular"/>
													<text fixtext=")"/>
												</children>
												<variables/>
											</template>
										</children>
									</conditionbranch>
								</children>
							</condition>
							<condition>
								<children>
									<conditionbranch xpath="$isBold=1">
										<children>
											<template subtype="element" match="kr:LocalityName">
												<children>
													<content subtype="regular">
														<styles font-weight="bold"/>
													</content>
												</children>
												<variables/>
											</template>
											<template subtype="element" match="kr:CountryNameCode">
												<children>
													<text fixtext=" (">
														<styles font-weight="bold"/>
													</text>
													<content subtype="regular">
														<styles font-weight="bold"/>
													</content>
													<text fixtext=")">
														<styles font-weight="bold"/>
													</text>
												</children>
												<variables/>
											</template>
										</children>
									</conditionbranch>
								</children>
							</condition>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="CompleteContactAddress">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="fontSize" type="xs:token" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<template subtype="element" match="eml:Contact">
						<children>
							<template subtype="element" match="eml:MailingAddress">
								<children>
									<calltemplate subtype="named" match="CompleteAddress">
										<parameters>
											<parameter name="fontSize" value="$fontSize"/>
											<parameter name="isBold" value="$isBold"/>
										</parameters>
									</calltemplate>
									<template subtype="element" match="xal:Country">
										<children>
											<calltemplate subtype="named" match="CompleteAddress">
												<parameters>
													<parameter name="fontSize" value="$fontSize"/>
													<parameter name="isBold" value="$isBold"/>
												</parameters>
											</calltemplate>
											<template subtype="element" match="xal:CountryNameCode">
												<children>
													<calltemplate subtype="named" match="Space">
														<parameters/>
													</calltemplate>
													<condition>
														<children>
															<conditionbranch xpath="$fontSize = &apos;normal&apos;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$isBold = 0">
																				<children>
																					<text fixtext="("/>
																					<content subtype="regular"/>
																					<text fixtext=")"/>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="$isBold = 1">
																				<children>
																					<text fixtext="(">
																						<styles font-weight="bold"/>
																					</text>
																					<content subtype="regular">
																						<styles font-weight="bold"/>
																					</content>
																					<text fixtext=")">
																						<styles font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
														</children>
													</condition>
													<condition>
														<children>
															<conditionbranch xpath="$fontSize = &apos;x-small&apos;">
																<children>
																	<condition>
																		<children>
																			<conditionbranch xpath="$isBold = 0">
																				<children>
																					<text fixtext="(">
																						<styles font-size="x-small"/>
																					</text>
																					<content subtype="regular">
																						<styles font-size="x-small"/>
																					</content>
																					<text fixtext=")">
																						<styles font-size="x-small"/>
																					</text>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																	<condition>
																		<children>
																			<conditionbranch xpath="$isBold = 1">
																				<children>
																					<text fixtext="(">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																					<content subtype="regular">
																						<styles font-size="x-small" font-weight="bold"/>
																					</content>
																					<text fixtext=")">
																						<styles font-size="x-small" font-weight="bold"/>
																					</text>
																				</children>
																			</conditionbranch>
																		</children>
																	</condition>
																</children>
															</conditionbranch>
														</children>
													</condition>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
			<globaltemplate subtype="named" match="QualifyingAddressCity">
				<parameters>
					<parameter name="isBold" type="xs:int" occurrence="none-or-one" default-value="0"/>
					<parameter name="fontSize" type="xs:token" occurrence="none-or-one" default-value="&apos;normal&apos;"/>
				</parameters>
				<children>
					<template subtype="element" match="eml:QualifyingAddress">
						<children>
							<calltemplate subtype="named" match="City">
								<parameters>
									<parameter name="isBold" value="$isBold"/>
									<parameter name="fontSize" value="$fontSize"/>
								</parameters>
							</calltemplate>
							<template subtype="element" match="xal:Country">
								<children>
									<calltemplate subtype="named" match="City">
										<parameters>
											<parameter name="isBold" value="$isBold"/>
											<parameter name="fontSize" value="$fontSize"/>
										</parameters>
									</calltemplate>
									<template subtype="element" match="xal:CountryNameCode">
										<children>
											<calltemplate subtype="named" match="Space">
												<parameters/>
											</calltemplate>
											<condition>
												<children>
													<conditionbranch xpath="$fontSize = &apos;normal&apos;">
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="$isBold = 0">
																		<children>
																			<text fixtext="("/>
																			<content subtype="regular"/>
																			<text fixtext=")"/>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<condition>
																<children>
																	<conditionbranch xpath="$isBold = 1">
																		<children>
																			<text fixtext="(">
																				<styles font-weight="bold"/>
																			</text>
																			<content subtype="regular">
																				<styles font-weight="bold"/>
																			</content>
																			<text fixtext=")">
																				<styles font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
														</children>
													</conditionbranch>
												</children>
											</condition>
											<condition>
												<children>
													<conditionbranch xpath="$fontSize = &apos;smaller&apos;">
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="$isBold = 0">
																		<children>
																			<text fixtext="(">
																				<styles font-size="smaller"/>
																			</text>
																			<content subtype="regular">
																				<styles font-size="smaller"/>
																			</content>
																			<text fixtext=")">
																				<styles font-size="smaller"/>
																			</text>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<condition>
																<children>
																	<conditionbranch xpath="$isBold = 1">
																		<children>
																			<text fixtext="(">
																				<styles font-size="smaller" font-weight="bold"/>
																			</text>
																			<content subtype="regular">
																				<styles font-size="smaller" font-weight="bold"/>
																			</content>
																			<text fixtext=")">
																				<styles font-size="smaller" font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
														</children>
													</conditionbranch>
												</children>
											</condition>
											<condition>
												<children>
													<conditionbranch xpath="$fontSize = &apos;x-small&apos;">
														<children>
															<condition>
																<children>
																	<conditionbranch xpath="$isBold = 0">
																		<children>
																			<text fixtext="(">
																				<styles font-size="x-small"/>
																			</text>
																			<content subtype="regular">
																				<styles font-size="x-small"/>
																			</content>
																			<text fixtext=")">
																				<styles font-size="x-small"/>
																			</text>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
															<condition>
																<children>
																	<conditionbranch xpath="$isBold = 1">
																		<children>
																			<text fixtext="(">
																				<styles font-size="x-small" font-weight="bold"/>
																			</text>
																			<content subtype="regular">
																				<styles font-size="x-small" font-weight="bold"/>
																			</content>
																			<text fixtext=")">
																				<styles font-size="x-small" font-weight="bold"/>
																			</text>
																		</children>
																	</conditionbranch>
																</children>
															</condition>
														</children>
													</conditionbranch>
												</children>
											</condition>
										</children>
										<variables/>
									</template>
								</children>
								<variables/>
							</template>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</designfragments>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>
