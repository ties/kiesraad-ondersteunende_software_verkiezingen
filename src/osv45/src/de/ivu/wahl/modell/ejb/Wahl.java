package de.ivu.wahl.modell.ejb;

import javax.ejb.EJBException;

/**
 * Wahl
 * 
 * @author D. Cosic, IVU Traffic Technologies AG
 */

public interface Wahl extends BasicWahl {

  /**
   * Sperrt die ganze Wahl f�r den schreibenden und lesenden Zugriff
   * 
   * @throws EJBException ein Fehler ist aufgetreten
   */
  void lock() throws EJBException;

  /**
   * Sperrt die ganze Wahl f�r den schreibenden (ja, richtig!) Zugriff
   * 
   * @throws EJBException ein Fehler ist aufgetreten
   */
  void readLock() throws EJBException;

  /**
   * @return Name der aktuellen Periode
   * @throws EJBException ein Fehler ist aufgetreten
   */
  String getName() throws EJBException;

  /**
   * @return Kurzbezeichnung der aktuellen Periode
   * @throws EJBException ein Fehler ist aufgetreten
   */
  String getNameKurz() throws EJBException;

  /**
   * @return ob die Wahl f�r die aktuelle Wahlergebnisart freigegeben wurde
   * @throws EJBException ein Fehler ist aufgetreten
   */
  boolean isFreigegeben() throws EJBException;

  /**
   * @param wahlergebnisart Art des Wahlergebnisses (vorl�ufig, endg�ltig, briefwahl; s.
   *          {@link de.ivu.wahl.modell.WahlModel}), der erfasst wurde
   * @return Wahljahr der �bergebenen Wahlergebnisart
   * @throws EJBException ein Fehler ist aufgetreten
   */
  int getWahljahr() throws EJBException;

  /**
   * Liefert f�r die �bergebene Periodenart f�r diese Wahl den Wahltermin
   * 
   * @param wahlperiodenart Periodenart
   * @return Wahltermin der �bergebenen Wahlperiodenart
   * @throws EJBException ein Fehler ist aufgetreten
   */
  String getWahltermin() throws EJBException;
}
