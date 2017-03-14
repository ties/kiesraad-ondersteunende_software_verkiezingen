package de.ivu.wahl.auswertung.erg.sv;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.apache.log4j.Logger;

import de.ivu.util.debug.Log4J;
import de.ivu.wahl.auswertung.erg.Ergebnis;

/**
 * Ergebnisobjekt zum Transport der Sitzverteilung vom Server zum Client.
 * <p>
 * Dieses Objekt hat eine Schreib-Schnittstelle f�r den Server und eine Lese-Schnittstelle f�r den
 * Client.
 * 
 * @author mur@ivu.de, cos@ivu.de Copyright (c) 2004 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
public class SitzverteilungListenkombinationErg extends Ergebnis {
  private static final long serialVersionUID = 1831519522587865476L;

  private final Set<ListenkombinationInfo> _listenkombinationInfoCol = new TreeSet<ListenkombinationInfo>(
      new Comparator<ListenkombinationInfo>() {
        public int compare(ListenkombinationInfo o1, ListenkombinationInfo o2) {
          return o1.getBezeichnung().compareTo(o2.getBezeichnung());
        }
      });

  private final Map<String, Set<ListenkombinationInfo>> _listenkombinationGruppenzeileMap = new HashMap<String, Set<ListenkombinationInfo>>();

  private static final Logger LOGGER = Logger.getLogger(SitzverteilungErg.class);
  static {
    LOGGER.info(Log4J.dumpVersion(SitzverteilungErg.class, Log4J
        .extractVersion("$Revision: 1.1 $"))); //$NON-NLS-1$
  }

  /**
   * Liefert eine Collection von ListenkombinationInfo f�r die Listenkombination
   * 
   * @return Collection von ListenkombinationInfo f�r die Listenkombination
   * @param id_listenkombination
   */
  public Set<ListenkombinationInfo> getGruppeninfoCol(String id_listenkombination) {
    return _listenkombinationGruppenzeileMap.get(id_listenkombination);
  }

  public String getGruppeninfoBezeichnungszusatz(String id_listenkombination) {
    String ret = "";
    Set<ListenkombinationInfo> gruppenInfoCol = getGruppeninfoCol(id_listenkombination);
    if (gruppenInfoCol != null) {
      Iterator<ListenkombinationInfo> iterator = gruppenInfoCol.iterator();
      while (iterator.hasNext()) {
        ListenkombinationInfo next = iterator.next();
        if (next.isBeruecksichtigt()) {
          ret += next.getGruppeBezeichnung() + ", ";
        }
      }
    }
    return ret.length() >= 2 ? ret.substring(0, ret.length() - 2) : ret;
  }

  public void addGruppeninfo(String id_listenkombination, ListenkombinationInfo gz) {
    if (_listenkombinationGruppenzeileMap.containsKey(id_listenkombination)) {
      _listenkombinationGruppenzeileMap.get(id_listenkombination).add(gz);
    } else {
      Set<ListenkombinationInfo> gzSet = new TreeSet<ListenkombinationInfo>();
      gzSet.add(gz);
      _listenkombinationGruppenzeileMap.put(id_listenkombination, gzSet);
    }
  }

  /**
   * Constructor
   */
  public SitzverteilungListenkombinationErg(String ergBezeichnung) {
    super(ergBezeichnung);
  }

  /**
   * @param listenkombinationInfo neuer Wert f�r listenkombinationModelCol
   */
  public void addListenkombinationModel(ListenkombinationInfo listenkombinationInfo) {
    _listenkombinationInfoCol.add(listenkombinationInfo);
  }

  public Set<ListenkombinationInfo> getListenkombinationInfoCol() {
    return _listenkombinationInfoCol;
  }

  public boolean isEineListenkombinationZugelassen() {
    for (ListenkombinationInfo listenkombinationInfo : _listenkombinationInfoCol) {
      String listenkombinationID = listenkombinationInfo.getID_Listenkombination();
      if (isListenkombinationZugelassen(listenkombinationID)) {
        return true;
      }
    }
    return false;

  }

  /**
   * @param listenkombinationID
   */
  public boolean isListenkombinationZugelassen(String listenkombinationID) {
    Set<ListenkombinationInfo> gruppeninfoCol = getGruppeninfoCol(listenkombinationID);
    for (ListenkombinationInfo gruppenInfo : gruppeninfoCol) {
      if (gruppenInfo.isBeruecksichtigt()) {
        return true;
      }
    }
    return false;
  }
}