/*
 * GruppeKonstanten
 * 
 * Created on 05.01.2009
 * Copyright (c) 2009 IVU Traffic Technologies AG
 */
package de.ivu.wahl.modell;

import static de.ivu.wahl.modell.GruppeKonstanten.StimmabgabeArt.BALLOT;
import static de.ivu.wahl.modell.GruppeKonstanten.StimmabgabeArt.BALLOT_AND_LETTER;
import static de.ivu.wahl.modell.GruppeKonstanten.StimmabgabeArt.LETTER;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import de.ivu.wahl.WahlInfo;
import de.ivu.wahl.modell.ejb.Gebiet;
import de.ivu.wahl.modell.ejb.Wahl;
import de.ivu.wahl.util.BundleHelper;
import de.ivu.wahl.wus.electioncategory.ElectionCategory;

/**
 * @author ugo@ivu.de, IVU Traffic Technologies AG
 */
public class GruppeKonstanten {
  /**
   * Kennung für die Art "Partei" einer Partei/Gruppe
   */
  public static final int GRUPPENART_PARTEI = 0;

  /**
   * Kennung für "Wähler", "Wahlbereichtigte" usw.
   */
  public static final int GRUPPENART_ALLGEMEIN = 1;

  /**
   * "Übersetzung" der Konstanten
   */
  public static final String[] GRUPPENART_KLARTEXT = {"Partei", "Allgemein"}; //$NON-NLS-1$ //$NON-NLS-2$

  public static List<Integer> KEYS_OF_SPECIAL_GROUPS;
  static {
    List<Integer> tmp = new ArrayList<Integer>();
    for (GruppeAllgemein gruppeAllgemein : GruppeAllgemein.values()) {
      tmp.add(Integer.valueOf(gruppeAllgemein.schluessel));
    }
    KEYS_OF_SPECIAL_GROUPS = Collections.unmodifiableList(tmp);
  }

  static final String KEINE_KATEGORIE = ""; //$NON-NLS-1$
  static final String KATEGORIE_3 = "VOTER_TYPE"; //$NON-NLS-1$
  static final String KATEGORIE_4 = "WAEHLER"; //$NON-NLS-1$
  static final String KATEGORIE_5 = "EXPLANATIONS"; //$NON-NLS-1$

  static final boolean COLLAPSIBLE = true;
  static final boolean NOT_COLLAPSIBLE = false;

  public static enum StimmabgabeArt {
    BALLOT, LETTER, BALLOT_AND_LETTER;
  }

  public static enum GruppeAllgemein {
    // The original general groups
    WAHLBERECHTIGTE(100, -24, -24, KEINE_KATEGORIE, BALLOT_AND_LETTER, NOT_COLLAPSIBLE),

    // Admitted voters
    ELECTION_NOTICES(600, -23, -9, KATEGORIE_3, BALLOT, NOT_COLLAPSIBLE),

    PROXY_VOTERS(700, -22, -8, KATEGORIE_3, BALLOT, NOT_COLLAPSIBLE),

    POLLING_CARDS(800, -21, -7, KATEGORIE_3, BALLOT, NOT_COLLAPSIBLE),

    ADMITTED_VOTERS(900, -20, -6, KATEGORIE_3, BALLOT_AND_LETTER, NOT_COLLAPSIBLE),

    // The original general groups
    GUELTIGE(300, -19, -20, KATEGORIE_4, BALLOT_AND_LETTER, NOT_COLLAPSIBLE),

    UNGUELTIGE(500, -18, -21, KATEGORIE_4, BALLOT_AND_LETTER, NOT_COLLAPSIBLE),

    LEER(400, -17, -22, KATEGORIE_4, BALLOT_AND_LETTER, NOT_COLLAPSIBLE),

    WAEHLER(200, -16, -23, KATEGORIE_4, BALLOT_AND_LETTER, NOT_COLLAPSIBLE), // eigentlich: Anzahl
                                                                             // abgegebene Stimmen
                                                                             // (g�ltige, ung�ltige,
                                                                             // leere)

    // Explaining the difference between admitted voters and valid votes
    MORE_VALID_VOTES_THAN_ADMITTED_VOTERS(1000, -15, -19, KATEGORIE_5, BALLOT_AND_LETTER,
        COLLAPSIBLE),

    LESS_VALID_VOTES_THAN_ADMITTED_VOTERS(1100, -14, -18, KATEGORIE_5, BALLOT_AND_LETTER,
        COLLAPSIBLE),

    BALLOT_PAPER_NOT_RETURNED(1200, -13, -17, KATEGORIE_5, BALLOT, COLLAPSIBLE),

    TOO_FEW_BALLOT_PAPER_ISSUED(1300, -12, -16, KATEGORIE_5, BALLOT, COLLAPSIBLE),

    TOO_MANY_BALLOT_PAPER_ISSUED(1400, -11, -15, KATEGORIE_5, BALLOT, COLLAPSIBLE),

    EMPTY_POSTAL_VOTES(1500, -10, -14, KATEGORIE_5, LETTER, COLLAPSIBLE),

    POSTAL_VOTES_WITH_MULTIPLE_BALLOT_PAPERS(1600, -9, -13, KATEGORIE_5, LETTER, COLLAPSIBLE),

    BALLOT_PAPERS_LOST(1700, -8, -12, KATEGORIE_5, BALLOT_AND_LETTER, COLLAPSIBLE),

    NO_EXPLANATION(1800, -7, -11, KATEGORIE_5, BALLOT_AND_LETTER, COLLAPSIBLE),

    OTHER_EXPLANATIONS(1900, -6, -10, KATEGORIE_5, BALLOT_AND_LETTER, COLLAPSIBLE);

    private static final String S_GRAVENHAGE = "'s-Gravenhage"; //$NON-NLS-1$

    public int schluessel;
    public int position;
    public String name;
    public String kurzname;
    public String hilfstext;
    public String kategorie;
    public StimmabgabeArt stimmabgabeArt;
    public boolean collapsible;

    @SuppressWarnings("hiding")
    GruppeAllgemein(int schluessel,
        int positionPSB,
        int positionHSBCSB,
        String kategorie,
        StimmabgabeArt stimmabgabeArt,
        boolean collapsible) {
      String ebenenKlartext = GruppeAllgemeinEbeneProvider.getEbenenKlartext();
      int wahlEbene = GruppeAllgemeinEbeneProvider.getWahlEbene();

      this.schluessel = schluessel;
      this.name = BundleHelper
          .getBundleString("GruppeKonstanten." + ebenenKlartext + "." + this.name()); //$NON-NLS-1$ //$NON-NLS-2$
      this.kurzname = BundleHelper.getBundleString("GruppeKonstanten." + this.name() + ".kurz"); //$NON-NLS-1$ //$NON-NLS-2$
      this.hilfstext = BundleHelper
          .getBundleString("GruppeKonstanten." + this.name() + ".hilfstext"); //$NON-NLS-1$ //$NON-NLS-2$
      if (wahlEbene == GebietModel.EBENE_PSB) {
        this.position = positionPSB;
      } else {
        this.position = positionHSBCSB;
      }
      if (StringUtils.isBlank(kategorie)) {
        this.kategorie = ""; //$NON-NLS-1$
      } else {
        this.kategorie = BundleHelper
            .getBundleString("GruppeKonstanten." + ebenenKlartext + ".KATEGORIE." + kategorie); //$NON-NLS-1$ //$NON-NLS-2$
      }
      this.stimmabgabeArt = stimmabgabeArt;
      this.collapsible = collapsible;
    }

    public static String getHilfstext(int position) {
      GruppeAllgemein gruppeAllgemein = findByPosition(position);
      if (gruppeAllgemein == null) {
        return ""; //$NON-NLS-1$
      }
      return gruppeAllgemein.hilfstext;
    }

    public static String getKategorie(int position) {
      GruppeAllgemein gruppeAllgemein = findByPosition(position);
      if (gruppeAllgemein == null || WahlInfo.getWahlInfo().isReferendum()) {
        return ""; //$NON-NLS-1$
      }
      return gruppeAllgemein.kategorie;
    }

    public static String getUnterkategorie(int position) {
      GruppeAllgemein gruppeAllgemein = findByPosition(position);
      if (gruppeAllgemein == null || WahlInfo.getWahlInfo().isReferendum()) {
        return ""; //$NON-NLS-1$
      }
      switch (gruppeAllgemein) {
        case MORE_VALID_VOTES_THAN_ADMITTED_VOTERS :
        case LESS_VALID_VOTES_THAN_ADMITTED_VOTERS :
        case BALLOT_PAPER_NOT_RETURNED :
        case TOO_FEW_BALLOT_PAPER_ISSUED :
        case TOO_MANY_BALLOT_PAPER_ISSUED :
        case EMPTY_POSTAL_VOTES :
        case POSTAL_VOTES_WITH_MULTIPLE_BALLOT_PAPERS :
        case BALLOT_PAPERS_LOST :
        case NO_EXPLANATION :
        case OTHER_EXPLANATIONS :
          return BundleHelper
              .getBundleString("GruppeKonstanten." + GruppeAllgemeinEbeneProvider.getEbenenKlartext() + ".KATEGORIE.EXPLANATIONS.MSG"); //$NON-NLS-1$ //$NON-NLS-2$
      }
      return ""; //$NON-NLS-1$
    }

    public static boolean isRadioButtons(int position) {
      GruppeAllgemein gruppeAllgemein = findByPosition(position);
      if (gruppeAllgemein == null || WahlInfo.getWahlInfo().isReferendum()) {
        return false;
      }
      if (gruppeAllgemein.equals(MORE_VALID_VOTES_THAN_ADMITTED_VOTERS)) {
        return GruppeAllgemeinEbeneProvider.getWahlEbene() == GebietModel.EBENE_PSB;
      }
      return false;
    }

    public static boolean isCollapsible(int position) {
      GruppeAllgemein gruppeAllgemein = findByPosition(position);
      if (gruppeAllgemein == null || WahlInfo.getWahlInfo().isReferendum()) {
        return false;
      }
      return gruppeAllgemein.collapsible
          && GruppeAllgemeinEbeneProvider.getWahlEbene() == GebietModel.EBENE_PSB;
    }

    public static String getBuchstabe(int position) {
      GruppeAllgemein gruppeAllgemein = findByPosition(position);
      if (gruppeAllgemein == null || WahlInfo.getWahlInfo().isReferendum()) {
        return null;
      }
      switch (gruppeAllgemein) {
        case WAEHLER :
          if (GruppeAllgemeinEbeneProvider.getWahlEbene() == GebietModel.EBENE_PSB) {
            return "B"; //$NON-NLS-1$
          }
          break;

        case ADMITTED_VOTERS :
          if (GruppeAllgemeinEbeneProvider.getWahlEbene() == GebietModel.EBENE_PSB) {
            return "A"; //$NON-NLS-1$
          }
          break;
      }
      return null;
    }

    public static boolean isSmallFontSize(int position) {
      GruppeAllgemein gruppeAllgemein = findByPosition(position);
      if (gruppeAllgemein == null || WahlInfo.getWahlInfo().isReferendum()) {
        return false;
      }
      switch (gruppeAllgemein) {
        case BALLOT_PAPER_NOT_RETURNED :
        case TOO_FEW_BALLOT_PAPER_ISSUED :
        case TOO_MANY_BALLOT_PAPER_ISSUED :
        case EMPTY_POSTAL_VOTES :
        case POSTAL_VOTES_WITH_MULTIPLE_BALLOT_PAPERS :
        case BALLOT_PAPERS_LOST :
        case NO_EXPLANATION :
        case OTHER_EXPLANATIONS :
          return true;
      }
      return false;
    }

    public static boolean isSmallGapAfterwards(int position) {
      GruppeAllgemein gruppeAllgemein = findByPosition(position);
      if (gruppeAllgemein == null || WahlInfo.getWahlInfo().isReferendum()) {
        return false;
      }
      switch (gruppeAllgemein) {
        case LEER :
          if (GruppeAllgemeinEbeneProvider.getWahlEbene() == GebietModel.EBENE_PSB) {
            return true;
          }
          break;

        case POLLING_CARDS :
        case LESS_VALID_VOTES_THAN_ADMITTED_VOTERS :
          return true;
      }
      return false;
    }

    public static boolean isVisible(int position, Gebiet gebiet) {
      return isVisible(findByPosition(position), gebiet);
    }

    public static List<GruppeAllgemein> filterGruppenAllgemeinVisibleInRegion(Gebiet region,
        Iterable<GruppeAllgemein> gruppenAllgemein) {
      List<GruppeAllgemein> result = new ArrayList<GruppeAllgemein>();
      for (GruppeAllgemein gruppeAllgemein : gruppenAllgemein) {
        if (isVisible(gruppeAllgemein, region)) {
          result.add(gruppeAllgemein);
        }
      }
      return result;
    }

    /**
     * @return all general groups from gruppenAllgemein that are visible in the given region, but
     *         always include TotalCounted (GUELTIGE)
     */
    public static List<GruppeAllgemein> filterGruppenAllgemeinVisibleInRegionOrGueltige(Gebiet region,
        Iterable<GruppeAllgemein> gruppenAllgemein) {
      List<GruppeAllgemein> result = new ArrayList<GruppeAllgemein>();
      for (GruppeAllgemein gruppeAllgemein : gruppenAllgemein) {
        if (GUELTIGE.equals(gruppeAllgemein) || isVisible(gruppeAllgemein, region)) {
          result.add(gruppeAllgemein);
        }
      }
      return result;
    }

    public static boolean isVisible(GruppeAllgemein gruppeAllgemein, Gebiet gebiet) {
      if (gruppeAllgemein == null) {
        return true;
      }

      if (WahlInfo.getWahlInfo().isReferendum()) {
        switch (gruppeAllgemein) {
          case ELECTION_NOTICES :
          case PROXY_VOTERS :
          case POLLING_CARDS :
          case ADMITTED_VOTERS :
          case MORE_VALID_VOTES_THAN_ADMITTED_VOTERS :
          case LESS_VALID_VOTES_THAN_ADMITTED_VOTERS :
          case BALLOT_PAPER_NOT_RETURNED :
          case TOO_FEW_BALLOT_PAPER_ISSUED :
          case TOO_MANY_BALLOT_PAPER_ISSUED :
          case EMPTY_POSTAL_VOTES :
          case POSTAL_VOTES_WITH_MULTIPLE_BALLOT_PAPERS :
          case BALLOT_PAPERS_LOST :
          case NO_EXPLANATION :
          case OTHER_EXPLANATIONS :
            return false;
        }
        return true;
      }

      // The following Groups shall be invisible in HSB and CSB:
      if (GruppeAllgemeinEbeneProvider.getWahlEbene() != GebietModel.EBENE_PSB) {
        switch (gruppeAllgemein) {
          case GUELTIGE : // Hinweis: Die Gültigen werden dem EML-Export nun immer hinzugefügt
                          // (siehe EML510Helper.appendGeneralVotingResults()) OSV-1462
          case WAEHLER :
          case ELECTION_NOTICES :
          case POLLING_CARDS :
          case ADMITTED_VOTERS :
            return false;
        }
      }

      if (gebiet.isPostalvote()) {
        // For postal polling stations the general group is only visible ...
        if (gruppeAllgemein.stimmabgabeArt.equals(BALLOT)) {
          return false;
        } else {
          // ... if stimmabgabeArt == LETTER or stimmabgabeArt == BALLOT_AND_LETTER.
          return true;
        }
      }

      // The remaining cases are normal (not postal) polling stations and higher level regions

      // They always count presence votes, so ...
      if (gruppeAllgemein.stimmabgabeArt.equals(BALLOT)
          || gruppeAllgemein.stimmabgabeArt.equals(BALLOT_AND_LETTER)) {
        // .. all general groups that deal with ballot votes are visible
        return true;
      }

      // The remaining cases are stimmabgabeArt == LETTER. Here the general group is only visible if
      // the region has a sub-region that is a postal pollig station. These only exist in TK and EP
      // elections

      if (!isTKOrEP(gebiet.getWahl())) {
        return false;
      }

      // Postals polling stations only exist in municipality 's-Gravenhage and kieskring
      // 's-Gravenhage
      if (isGebietOrHasUntergebietSGravenhage(gebiet)) {
        return true;
      }

      return false;
    }

    public static boolean isTKOrEP(Wahl wahl) {
      return wahl.getWahlart() == ElectionCategory.TK.getWahlart()
          || wahl.getWahlart() == ElectionCategory.EP.getWahlart();
    }

    /**
     * @param gebiet
     * @return <code>true</code>, if gebiet or one of its subregions has the name S_GRAVENHAGE
     */
    public static boolean isGebietOrHasUntergebietSGravenhage(Gebiet gebiet) {
      if (S_GRAVENHAGE.equals(gebiet.getName())) {
        return true;
      }
      Collection<Gebiet> subregions = gebiet.getGebietCol();
      for (Gebiet subregion : subregions) {
        if (isGebietOrHasUntergebietSGravenhage(subregion)) {
          return true;
        }
      }

      return false;
    }

    public static boolean isVisibleInOverview(int position, Gebiet gebiet) {
      return isVisibleInOverview(findByPosition(position), gebiet);
    }

    public static boolean isVisibleInOverview(GruppeAllgemein gruppeAllgemein, Gebiet gebiet) {
      return isVisible(gruppeAllgemein, gebiet) || GruppeAllgemein.GUELTIGE.equals(gruppeAllgemein)
          || GruppeAllgemein.WAEHLER.equals(gruppeAllgemein);
    }

    private static GruppeAllgemein findByPosition(int position) {
      for (GruppeAllgemein gruppe : GruppeAllgemein.values()) {
        if (gruppe.position == position) {
          return gruppe;
        }
      }
      return null;
    }

    /**
     * @return true, if this group has another name in referenda than in other elections
     */
    private boolean hasSpecialNameForReferendum() {
      return this.equals(GUELTIGE);
    }

    /**
     * @return my referendum-aware name
     */
    public String getName(boolean isReferendum) {
      if (isReferendum && hasSpecialNameForReferendum()) {
        return BundleHelper.getBundleString("GruppeKonstanten.REFERENDUM." + this.name()); //$NON-NLS-1$
      } else {
        return name;
      }
    }
  }
}
