package de.ivu.wahl.modell;

import java.util.Comparator;
import java.util.Map;

import de.ivu.wahl.util.BundleHelper;
import de.ivu.wahl.util.ConstantMap;
import de.ivu.wahl.wus.electioncategory.ElectionCategory;

/**
 * GebietModel
 * 
 * @author cos@ivu.de, IVU Traffic Technologies AG
 */

public interface GebietModel extends BasicGebietModel {

  public static final String EMPTY_STR = ""; //$NON-NLS-1$

  // AuthorityLevels

  /**
   * Konstante für die Programmebene Zentrales Stimmbüro
   */
  int EBENE_CSB = 0; // AuthorityLevel.EBENE_CSB.getId();
  /**
   * Konstante für die Programmebene Hauptstimmbüro
   */
  int EBENE_HSB = 1; // AuthorityLevel.EBENE_HSB.getId();
  /**
   * Konstante für die Programmebene Gemeinde
   */
  int EBENE_PSB = 2; // AuthorityLevel.EBENE_PSB.getId();
  /**
   * Konstante für die Programmebene polling station
   */
  int EBENE_SB = 3; // AuthorityLevel.EBENE_SB.getId();

  // Region types

  /**
   * Konstante für die Gebietart für das Bundesgebiet
   */
  int GEBIETSART_BUND = 0;

  /**
   * Konstante für die Gebietart für die Bundesländer
   */
  int GEBIETSART_LAND = 1;

  /**
   * Konstante für die Gebietart für die Bundestagswahlkreise, Landtagswahlkreise, politische Kreise
   * und kreisfreie Städte (je nach Wahlart)
   */
  int GEBIETSART_WAHLKREIS = 2;

  /**
   * Konstante für die Gebietart für die Gemeinden
   */
  int GEBIETSART_GEMEINDE = 3;

  /**
   * Konstante für die Gebietart für die speziellen Gemeinden auf den BES islands
   */
  int GEBIETSART_INSELGEMEINDE = 4;

  /**
   * Konstante für die Gebietart für die Ortsteile
   */
  int GEBIETSART_ORTSTEIL = 5;

  /**
   * Konstante für die Gebietart für die Stimmbezirke
   */
  int GEBIETSART_STIMMBEZIRK = 6;

  /**
   * Konstante für die Anzahl der unterschiedlichen Gebietsarten
   */
  int ANZAHL_GEBIETSARTEN = 7;

  /**
   * Konstante für die Klartextbezeichnungen der Gebietsarten
   */
  String[] GEBIETSART_KLARTEXT = {BundleHelper.getBundleString("GebietModel.Klartext_Bund"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Klartext_Bundesland"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Klartext_Wahlkreis"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Klartext_Gemeinde"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Klartext_Inselgemeinde"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Klartext_Ortsteil"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Klartext_Stimmbezirk")}; //$NON-NLS-1$

  /**
   * Konstante für die Klartextbezeichnungen Präfixe der Gebietsarten
   */
  String[] GEBIETSART_PREFIX = {BundleHelper.getBundleString("GebietModel.Prefix_Bund"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Prefix_Land"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.28"), //$NON-NLS-1$ 
      BundleHelper.getBundleString("GebietModel.Prefix_Kreis"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Prefix_Kreisbereich"), //$NON-NLS-1$ 
      BundleHelper.getBundleString("GebietModel.Prefix_Gemeinde"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Prefix_Gemeindebereich"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Prefix_Ortsteil"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Prefix_Stimmbezirk"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Prefix_Wahllokal"), //$NON-NLS-1$
      BundleHelper.getBundleString("GebietModel.Prefix_Sondergebiet")}; //$NON-NLS-1$

  /**
   * Konstante für die Klartextbezeichnungen der Gebietsarten für Export/Import
   */
  String[] GEBIETSART_KLARTEXT_EXPORT = {
      BundleHelper.getBundleString("GebietModel.Klartext_Export_Bund"), BundleHelper.getBundleString("GebietModel.Klartext_Export_Land"), BundleHelper.getBundleString("GebietModel.Klartext_Export_Wahlkreis"), //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
      BundleHelper.getBundleString("GebietModel.Klartext_Export_Gemeinde"), BundleHelper.getBundleString("GebietModel.Klartext_Export_Inselgemeinde"), BundleHelper.getBundleString("GebietModel.Klartext_Export_Ortsteil"), BundleHelper.getBundleString("GebietModel.Klartext_Export_Stimmbezirk"), BundleHelper.getBundleString("GebietModel.Klartext_Export_Wahllokal")}; //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$

  /**
   * Zuordnung der Gebietsart der Wahleinheit zur Wahlart
   */
  Map<ElectionCategory, Integer> GEBIETSARTEN_WAHLGEBIET = new ConstantMap<ElectionCategory, Integer>() {
    {
      add(ElectionCategory.EP, GebietModel.GEBIETSART_BUND);
      add(ElectionCategory.EK, GebietModel.GEBIETSART_BUND);
      add(ElectionCategory.TK, GebietModel.GEBIETSART_BUND);
      add(ElectionCategory.PS, GebietModel.GEBIETSART_LAND);
      add(ElectionCategory.GR, GebietModel.GEBIETSART_GEMEINDE);
      add(ElectionCategory.ER, GebietModel.GEBIETSART_INSELGEMEINDE);
      add(ElectionCategory.BC, GebietModel.GEBIETSART_ORTSTEIL);
      add(ElectionCategory.GC, GebietModel.GEBIETSART_ORTSTEIL);
      add(ElectionCategory.NR, GebietModel.GEBIETSART_BUND);
      add(ElectionCategory.PR, GebietModel.GEBIETSART_LAND);
      add(ElectionCategory.LR, GebietModel.GEBIETSART_GEMEINDE);
      add(ElectionCategory.IR, GebietModel.GEBIETSART_INSELGEMEINDE);
    }
  };

  Map<ElectionCategory, Integer> GEBIETSARTEN_MIT_LISTEN = new ConstantMap<ElectionCategory, Integer>() {
    {
      add(ElectionCategory.EP, GebietModel.GEBIETSART_WAHLKREIS);
      add(ElectionCategory.EK, GebietModel.GEBIETSART_LAND);
      add(ElectionCategory.TK, GebietModel.GEBIETSART_WAHLKREIS);
      add(ElectionCategory.PS, GebietModel.GEBIETSART_WAHLKREIS);
      add(ElectionCategory.GR, GebietModel.GEBIETSART_GEMEINDE);
      add(ElectionCategory.ER, GebietModel.GEBIETSART_INSELGEMEINDE);
      add(ElectionCategory.BC, GebietModel.GEBIETSART_ORTSTEIL);
      add(ElectionCategory.GC, GebietModel.GEBIETSART_ORTSTEIL);
      add(ElectionCategory.NR, GebietModel.GEBIETSART_BUND);
      add(ElectionCategory.PR, GebietModel.GEBIETSART_LAND);
      add(ElectionCategory.LR, GebietModel.GEBIETSART_GEMEINDE);
      add(ElectionCategory.IR, GebietModel.GEBIETSART_INSELGEMEINDE);
    }
  };

  /**
   * @return technische, aber menschenlesbare zusammengesetzte Bezeichnung für das Gebiet
   */
  String getBezeichnung();

  /**
   * @return Gebietsart als Klartext aus der internen Tabelle
   */
  String getGebietsartKlartext();

  /**
   * Sorting regions by region number, but municipalities alphabetically
   * 
   * @author ugo@ivu.de, IVU Traffic Technologies AG
   */
  public class GebietsComparator implements Comparator<GebietModel> {

    /*
     * (non-Javadoc)
     * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
     */
    @Override
    public int compare(GebietModel gebiet1, GebietModel gebiet2) {
      int gebietsart1 = gebiet1.getGebietsart();
      int gebietsart2 = gebiet2.getGebietsart();
      if (gebietsart1 != gebietsart2) {
        return Integer.signum(gebietsart1 - gebietsart2);
      }
      if (gebietsart1 == GEBIETSART_GEMEINDE) {
        String name1 = filter(gebiet1.getName().toLowerCase());
        String name2 = filter(gebiet2.getName().toLowerCase());
        return name1.compareTo(name2);
      } else {
        return Integer.signum(gebiet1.getNummer() - gebiet2.getNummer());
      }
    }

    private String filter(String input) {
      int idx = 0;
      while (input.length() > idx && !isLetter(input.charAt(idx))) {
        idx++;
      }
      return input.substring(idx);
    }

    private boolean isLetter(char c) {
      return 'a' <= c && c <= 'z';
    }

  }

  /**
   * @return region number, for gemeente as 4-digit number
   */
  public String getNumber4Display();
}
