@echo off
echo Skript zur Vorbereitung einer Sourcecode-Auslieferung von P4 + P5
echo Vorher einen Tag auschecken (https://l-cvs.ivu-ag.com/svn/l5/osv/tags/)
echo und die SVN-Infos loeschen (Team/Disconnect... und dann "Also delete the SVN meta information ...")
echo.
pause

cd ..
@echo on
dir

@echo.
@pause
@echo.

copy osv45\jboss\server\osv\deploy\aaa_tray.bsh .
copy osv45\jboss\server\osv\deploy\zzz_splash.bsh .

@echo.
@pause
@echo.

@echo REMOVING PROJECTS ...
@for %%i in (de.ivu.wahl.wus.core,de.ivu.wahl.wus.core.test,de.ivu.wahl.wus.domain,de.ivu.wahl.wus.domain.test,de.ivu.wahl.wus.foundation,de.ivu.wahl.wus.foundation.test,de.ivu.wahl.wus.gbaclient,de.ivu.wahl.wus.javax.xml.bind,de.ivu.wahl.wus.login,de.ivu.wahl.wus.mtp,de.ivu.wahl.wus.net.sf.dozer,de.ivu.wahl.wus.oasis.eml,de.ivu.wahl.wus.oasis.eml.test,de.ivu.wahl.wus.org.apache.derby,de.ivu.wahl.wus.org.apache.log4j.config,de.ivu.wahl.wus.org.hibernate) do rd /q /s %%i
@for %%i in (de.ivu.wahl.wus.p0.core,de.ivu.wahl.wus.p0.help,de.ivu.wahl.wus.p0.Program0,de.ivu.wahl.wus.p1.core,de.ivu.wahl.wus.p1.core.test,de.ivu.wahl.wus.p1.help,de.ivu.wahl.wus.p1.Program1,de.ivu.wahl.wus.p1.Program1.i18n.nl,de.ivu.wahl.wus.p1.Program1.test,de.ivu.wahl.wus.p1.setup,de.ivu.wahl.wus.p2.help,de.ivu.wahl.wus.p2.Program2,de.ivu.wahl.wus.p23.help,de.ivu.wahl.wus.p23.Program23,de.ivu.wahl.wus.p3.help,de.ivu.wahl.wus.p3.Program3) do rd /q /s %%i
@for %%i in (de.ivu.wahl.wus.pdfopener,de.ivu.wahl.wus.useractionlogger,de.ivu.wahl.wus.util.test,osv45_test,rollout,tags,targetplatform) do rd /q /s %%i
@echo REMOVING PROJECTS ... DONE

@echo.
@pause
@echo.

@echo REMOVING DIRECTORIES ...
@for %%i in (osv45\websrc\help, osv45\docs\manuals, osv45\jboss, osv45\lib, osv45\lib.code.quality, osv45\libdoc, osv45\libsrc) do rd /q /s %%i
@for %%i in (osv45\.externalToolBuilders, osv45\.settings, osv45\db) do rd /q /s %%i
@for %%i in (de.ivu.wahl.wus.reportgenerator\external-libs, de.ivu.wahl.wus.reportgenerator\external-libs-src) do rd /q /s %%i
@for %%i in (de.ivu.wahl.wus.reportgenerator\src\test) do rd /q /s %%i
@for %%i in (de.ivu.wahl.wus.gbaclient\cxf, de.ivu.wahl.wus.gbaclient\lib, de.ivu.wahl.wus.gbaclient\jaxb, de.ivu.wahl.wus.gbaclient\jaxws-ri) do rd /q /s %%i
@for %%i in (de.ivu.wahl.wus.xmlsecurity\external-libs) do rd /q /s %%i
@for %%i in (Eml-kiesraad\Examples, Eml-kiesraad\Examples-2.7, Eml-kiesraad\Examples-2.10, Eml-kiesraad\Examples-2.14, Eml-kiesraad\ElectionDefinition\Examples\, Eml-kiesraad\ElectionResultTestData\) do rd /q /s %%i
@for %%i in (de.ivu.wahl.wus.electioncategory\.settings, de.ivu.wahl.wus.loggerinterface\.settings, de.ivu.wahl.wus.reportgenerator\.settings) do rd /q /s %%i
@for %%i in (de.ivu.wahl.wus.reportgenerator\lib, de.ivu.wahl.wus.util\.settings, de.ivu.wahl.wus.xmlsecurity\.settings, de.ivu.wahl.wus.xmlsecurity\lib) do rd /q /s %%i
@for %%i in (osv_alg\config, osv_alg\dist, osv_alg\doc, osv_alg\etc, osv_alg\gensrc, osv_alg\lib) do rd /q /s %%i
@echo REMOVING DIRECTORIES ... DONE

@echo REMOVING FILES ...
@del /s .project
@del /s .bashrc
@del /s .checkstyle
@del /s .fbprefs
@del /s .mymetadata
@del /s .bashrc
@del /s *.jar
@del osv45\*.launch
@del osv45\run*.bat
@del osv45\shutdown.bat
@del osv45\osv45CheckStyleRules.xml

@echo REMOVING FILES ... DONE

@echo.
@pause
@echo.

xcopy /s /i ..\osv45\gensrc .\osv45\gensrc
md osv45\jboss
md osv45\jboss\server
md osv45\jboss\server\osv
md osv45\jboss\server\osv\deploy
move aaa_tray.bsh osv45\jboss\server\osv\deploy\
move zzz_splash.bsh osv45\jboss\server\osv\deploy\

@echo.
@pause
@echo.

cd osv45