/*
 * StateHandling
 * 
 * Created on 12.09.2008
 * Copyright (c) 2008 IVU Traffic Technologies AG
 */
package de.ivu.wahl.admin;

import javax.ejb.EJBException;

import de.ivu.wahl.AnwContext;
import de.ivu.wahl.GebietsBaum;
import de.ivu.wahl.WahlInfo;

/**
 * Manipulation des Applikations- und Wahlzustandes
 * 
 * @author cos@ivu.de, IVU Traffic Technologies AG
 */
public interface StateHandling {
  /**
   * Gibt die Zeit der letzten Modelländerung zurück (zur Synchronisation von Client und Server)
   * 
   * @param c Anwenderkontext
   * @return Zeit der letzten Modelländerung
   * @throws EJBException genereller Fehler
   */
  long getZeitstempelLetzteAenderung(AnwContext c) throws EJBException;

  /**
   * Setzt den Zeitstempel der letzten Änderung der Wahl auf die aktuelle Systemzeit des Servers
   * 
   * @param c Anwenderkontext
   * @throws EJBException genereller Fehler
   */
  void setLastChangeNow(AnwContext c) throws EJBException;

  /**
   * @param c Anwenderkontext (bestimmt die Wahl)
   * @param wahlergebnisart Erfragen der Freigabe für Wahlergebnisart (nicht implementiert!)
   * @return <code>true</code> wenn die Wahl freigegeben wurde
   * @throws EJBException genereller Fehler
   */
  boolean isFreigegeben(AnwContext c, int wahlergebnisart) throws EJBException;

  /**
   * @param c Anwenderkontext
   * @return <code>true</code>, wenn die Eingabesperre aktiviert ist
   * @throws EJBException genereller Fehler
   */
  boolean isInputDisabled(AnwContext c) throws EJBException;

  /**
   * @param c Anwenderkontext
   * @return <code>true</code>, wenn die aktuelle Wahl vollstaendig ist
   * @throws EJBException genereller Fehler
   */
  boolean isWahlVollstaendig(AnwContext c) throws EJBException;

  /**
   * Setzen der Freigabe für Wahlergebnisart
   * <P>
   * Dies löst gleichzeitig noch die letzten Exporte fürs Internet aus, (und außerdem werden die
   * Werte der Sitzverteilung in die Datenbank geschrieben)
   * </P>
   * 
   * @param c Anwenderkontext
   * @param freigabe <code>true</code>, wenn die Wahl freigegeben werden soll, <code>false</code>,
   *          wenn die Freigabe zurückgenommen werden soll
   * @throws EJBException genereller Fehler
   */
  void setFreigabe(AnwContext c, boolean freigabe) throws EJBException;

  /**
   * Setzen der Freigabe für Wahlergebnisart
   * 
   * @param c Anwenderkontext
   * @param freigabe <code>true</code>, wenn die Wahl freigegeben werden soll, <code>false</code>,
   *          wenn die Freigabe zurückgenommen werden soll
   * @return <code>true</code> wenn die Wahl freigegeben wurde
   * @throws EJBException genereller Fehler
   */
  boolean setFreigabeInternal(AnwContext c, boolean freigabe);

  /**
   * Holen von WahlInfo
   * 
   * @param c Anwenderkontext
   * @return eine auf der Client-Seite benutzbare Kopie der aktuellen WahlInfo
   * @throws EJBException genereller Fehler
   */
  WahlInfo getWahlInfo(AnwContext c) throws EJBException;

  /**
   * @param c Anwednerkontext
   * @return Baum aller Gebiete der durch den Anwenderkontext bestimmten Wahl in einer
   *         GUI-freundlichen Repräsentation
   * @throws EJBException genereller Fehler
   */
  GebietsBaum getGebietsBaum(AnwContext c) throws EJBException;
}
