/*
 * AuswertungHandling
 * 
 * Created on 15.10.2003
 * Copyright (c) 2003-2010 IVU Traffic Technologies AG
 */
package de.ivu.wahl.auswertung;

import java.util.Collection;
import java.util.List;

import javax.ejb.EJBException;
import javax.ejb.FinderException;

import de.ivu.wahl.AnwContext;
import de.ivu.wahl.auswertung.erg.EingangsHistorieErgebnis;
import de.ivu.wahl.auswertung.erg.Status;
import de.ivu.wahl.auswertung.erg.EingangsHistorieErgebnis.EingangsContainer;
import de.ivu.wahl.modell.GebietModel;
import de.ivu.wahl.modell.GruppeGebietsspezifischModel;
import de.ivu.wahl.modell.GruppeModel;
import de.ivu.wahl.modell.ejb.Personendaten;

/**
 * @author cos@ivu.de, IVU Traffic Technologies AG
 */
public interface AuswertungHandling {
  /**
   * Liefert ein Status-Objekt, welches Informationen zur aktuellen Wahl und zum Applikationszustand
   * hält
   * 
   * @param anwContext Anwenderkontext für die Bestimmung der Wahl und der Rechte
   * @return Statusinfos der Wahl und der Applikation
   * @throws EJBException Bei einem allgemeinen Problem
   */
  Status getStatus(AnwContext anwContext) throws EJBException;

  /**
   * Liefert eine Liste von GruppeGebietsspezifisch mit Parteien/Gruppen für eine bestimmte Wahl
   * 
   * @param anwContext Anwenderkontext für die Bestimmung der Wahl und der Rechte
   * @return alle Parteien, die an der Wahl teilnehmen, in alphabetischer Reihenfolge
   * @throws EJBException Bei einem allgemeinen Problem
   */
  List<GruppeModel> getParteienForWahl(AnwContext anwContext) throws EJBException;

  /**
   * Liefert eine Liste mit Gebieten, welche eine Wahleinheit sind, mit übergebenen ID einem
   * gemeinsamen Übergebiet zugeordnert werden können und noch keinen gültigen Eingang haben.
   * 
   * @param anwContext Anwenderkontext für die Bestimmung der Wahl und der Rechte
   * @param id_uebergeordnetesGebiet
   * @return List mit Gebiet-Objekten
   * @throws EJBException Bei einem allgemeinen Problem
   */
  List<GebietModel> getUntergeordneteAusstehendeWahleinheitenFuerUebergeordnetenGebiet(AnwContext anwContext,
      String id_uebergeordnetesGebiet) throws EJBException;

  /**
   * Liefert alle teilnehmen Kandiaten als Personendaten-Objekt alphabetisch sortiert
   * 
   * @param anwContext Anwenderkontext für die Bestimmung der Wahl und der Rechte
   * @return Personendaten, alphabetisch sortiert
   * @throws EJBException Bei einem allgemeinen Problem
   */
  Collection<Personendaten> getPersonenAlphabetisch(AnwContext anwContext) throws EJBException;

  String getKonfigurationString(AnwContext anwContext) throws EJBException, FinderException;

  List<GruppeGebietsspezifischModel> getAllGruppen(String id_Gebiet)
      throws EJBException, FinderException;

  public EingangsHistorieErgebnis getEingangshistorie(final String id_Gebiet);

  public List<EingangsContainer> getEingangsStatus();

}
