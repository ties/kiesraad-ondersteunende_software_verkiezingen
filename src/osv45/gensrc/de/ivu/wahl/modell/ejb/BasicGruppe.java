/*
 * BasicGruppe
 * 
 * WARNING! Automatically generated file! Do not edit!
 * Code Generator by IVU
 * Definition Version: $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
 */

package de.ivu.wahl.modell.ejb;

import java.util.Collection;

import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

import de.ivu.wahl.modell.GruppeModel;

/**
  * Interface for the entity Gruppe as Entity Bean.
  * The navigation (1:1, 1:n, m:n) is contained
  *
  * @author cos@ivu.de  (c) 2003-7 IVU Traffic Technologies AG
  * @version $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
  */
public interface BasicGruppe extends EJBLocalObject, GruppeModel {
   /**
     * Method to receive a model object for the setting of the current internal object state.
     * Optimizes the Client-Server-Performance
     *
     * @param details model object with new state
     */
   void setDetails(GruppeModel details);

   /**
     * Method to receive a model object, which represents the current internal state of the object.
     * Optimizes the Client-Server-Performance
     *
     * @return Model object with new internal state
     */
   GruppeModel getDetails();


   /**
     * Navigation to the associated entity of the type {@link Wahl}
     *
     * @return the corresponding EJBObject
     * @throws EJBException: an error occurred
     */
   Wahl getWahl() throws EJBException;

   /**
     * Setting of the associated entity of the type {@link Wahl}
     *
     * @param wahl the corresponding EJBObject
     */
   void setWahl(Wahl wahl);

   /**
     * Navigation to the associated entity of the type {@link Listenkombination}
     *
     * @return the corresponding EJBObject
     * @throws EJBException: an error occurred
     */
   Listenkombination getListenkombination() throws EJBException;

   /**
     * Setting of the associated entity of the type {@link Listenkombination}
     *
     * @param listenkombination the corresponding EJBObject
     */
   void setListenkombination(Listenkombination listenkombination);

   /**
     * Returns the set of entities of the type {@link Alternative}.
     *
     * @return  {@link Collection} of {@link EJBLocalObject} type {@link Alternative}
     * @throws EJBException: an error occurred
     */
   Collection<Alternative> getAlternativeCol() throws EJBException;

   /**
     * Adds the object to the set of entities of the type {@link Alternative}.
     *
     * @param alternative Alternative-object
     */
   void addAlternative(Alternative alternative);

   /**
     * Adds the object to the set of entities of the type {@link Alternative}.
     *
     * @param col {@link Collection} of {@link EJBObject}s, which are added to the set.
     */
   void addAllAlternativeCol(Collection<Alternative> col);

   /**
     * Deletes an entity from the set of entities of the type {@link Alternative}.
     *
     * @param alternative Alternative-EJBObject, which is removed from the set.
     */
   void removeAlternative(Alternative alternative);

   /**
     * Returns the set of entities of the type {@link Besonderheit}.
     *
     * @return  {@link Collection} of {@link EJBLocalObject} type {@link Besonderheit}
     * @throws EJBException: an error occurred
     */
   Collection<Besonderheit> getBesonderheitCol() throws EJBException;

   /**
     * Adds the object to the set of entities of the type {@link Besonderheit}.
     *
     * @param besonderheit Besonderheit-object
     */
   void addBesonderheit(Besonderheit besonderheit);

   /**
     * Adds the object to the set of entities of the type {@link Besonderheit}.
     *
     * @param col {@link Collection} of {@link EJBObject}s, which are added to the set.
     */
   void addAllBesonderheitCol(Collection<Besonderheit> col);

   /**
     * Deletes an entity from the set of entities of the type {@link Besonderheit}.
     *
     * @param besonderheit Besonderheit-EJBObject, which is removed from the set.
     */
   void removeBesonderheit(Besonderheit besonderheit);

   /**
     * Returns the set of entities of the type {@link FiktiveSitzverteilung}.
     *
     * @return  {@link Collection} of {@link EJBLocalObject} type {@link FiktiveSitzverteilung}
     * @throws EJBException: an error occurred
     */
   Collection<FiktiveSitzverteilung> getFiktiveSitzverteilungCol() throws EJBException;

   /**
     * Adds the object to the set of entities of the type {@link FiktiveSitzverteilung}.
     *
     * @param fiktiveSitzverteilung FiktiveSitzverteilung-object
     */
   void addFiktiveSitzverteilung(FiktiveSitzverteilung fiktiveSitzverteilung);

   /**
     * Adds the object to the set of entities of the type {@link FiktiveSitzverteilung}.
     *
     * @param col {@link Collection} of {@link EJBObject}s, which are added to the set.
     */
   void addAllFiktiveSitzverteilungCol(Collection<FiktiveSitzverteilung> col);

   /**
     * Deletes an entity from the set of entities of the type {@link FiktiveSitzverteilung}.
     *
     * @param fiktiveSitzverteilung FiktiveSitzverteilung-EJBObject, which is removed from the set.
     */
   void removeFiktiveSitzverteilung(FiktiveSitzverteilung fiktiveSitzverteilung);

   /**
     * Returns the set of entities of the type {@link GruppeGebietsspezifisch}.
     *
     * @return  {@link Collection} of {@link EJBLocalObject} type {@link GruppeGebietsspezifisch}
     * @throws EJBException: an error occurred
     */
   Collection<GruppeGebietsspezifisch> getGruppeGebietsspezifischCol() throws EJBException;

   /**
     * Adds the object to the set of entities of the type {@link GruppeGebietsspezifisch}.
     *
     * @param gruppeGebietsspezifisch GruppeGebietsspezifisch-object
     */
   void addGruppeGebietsspezifisch(GruppeGebietsspezifisch gruppeGebietsspezifisch);

   /**
     * Adds the object to the set of entities of the type {@link GruppeGebietsspezifisch}.
     *
     * @param col {@link Collection} of {@link EJBObject}s, which are added to the set.
     */
   void addAllGruppeGebietsspezifischCol(Collection<GruppeGebietsspezifisch> col);

   /**
     * Deletes an entity from the set of entities of the type {@link GruppeGebietsspezifisch}.
     *
     * @param gruppeGebietsspezifisch GruppeGebietsspezifisch-EJBObject, which is removed from the set.
     */
   void removeGruppeGebietsspezifisch(GruppeGebietsspezifisch gruppeGebietsspezifisch);

   /**
     * Returns the set of entities of the type {@link Liste}.
     *
     * @return  {@link Collection} of {@link EJBLocalObject} type {@link Liste}
     * @throws EJBException: an error occurred
     */
   Collection<Liste> getListeCol() throws EJBException;

   /**
     * Adds the object to the set of entities of the type {@link Liste}.
     *
     * @param liste Liste-object
     */
   void addListe(Liste liste);

   /**
     * Adds the object to the set of entities of the type {@link Liste}.
     *
     * @param col {@link Collection} of {@link EJBObject}s, which are added to the set.
     */
   void addAllListeCol(Collection<Liste> col);

   /**
     * Deletes an entity from the set of entities of the type {@link Liste}.
     *
     * @param liste Liste-EJBObject, which is removed from the set.
     */
   void removeListe(Liste liste);

   /**
     * Returns the set of entities of the type {@link ListenkombinationZulassung}.
     *
     * @return  {@link Collection} of {@link EJBLocalObject} type {@link ListenkombinationZulassung}
     * @throws EJBException: an error occurred
     */
   Collection<ListenkombinationZulassung> getListenkombinationZulassungCol() throws EJBException;

   /**
     * Adds the object to the set of entities of the type {@link ListenkombinationZulassung}.
     *
     * @param listenkombinationZulassung ListenkombinationZulassung-object
     */
   void addListenkombinationZulassung(ListenkombinationZulassung listenkombinationZulassung);

   /**
     * Adds the object to the set of entities of the type {@link ListenkombinationZulassung}.
     *
     * @param col {@link Collection} of {@link EJBObject}s, which are added to the set.
     */
   void addAllListenkombinationZulassungCol(Collection<ListenkombinationZulassung> col);

   /**
     * Deletes an entity from the set of entities of the type {@link ListenkombinationZulassung}.
     *
     * @param listenkombinationZulassung ListenkombinationZulassung-EJBObject, which is removed from the set.
     */
   void removeListenkombinationZulassung(ListenkombinationZulassung listenkombinationZulassung);

   /**
     * Returns the set of entities of the type {@link Restsitzverteilung}.
     *
     * @return  {@link Collection} of {@link EJBLocalObject} type {@link Restsitzverteilung}
     * @throws EJBException: an error occurred
     */
   Collection<Restsitzverteilung> getRestsitzverteilungCol() throws EJBException;

   /**
     * Adds the object to the set of entities of the type {@link Restsitzverteilung}.
     *
     * @param restsitzverteilung Restsitzverteilung-object
     */
   void addRestsitzverteilung(Restsitzverteilung restsitzverteilung);

   /**
     * Adds the object to the set of entities of the type {@link Restsitzverteilung}.
     *
     * @param col {@link Collection} of {@link EJBObject}s, which are added to the set.
     */
   void addAllRestsitzverteilungCol(Collection<Restsitzverteilung> col);

   /**
     * Deletes an entity from the set of entities of the type {@link Restsitzverteilung}.
     *
     * @param restsitzverteilung Restsitzverteilung-EJBObject, which is removed from the set.
     */
   void removeRestsitzverteilung(Restsitzverteilung restsitzverteilung);

   /**
     * Returns the set of entities of the type {@link SitzberechnungErgebnis}.
     *
     * @return  {@link Collection} of {@link EJBLocalObject} type {@link SitzberechnungErgebnis}
     * @throws EJBException: an error occurred
     */
   Collection<SitzberechnungErgebnis> getSitzberechnungErgebnisCol() throws EJBException;

   /**
     * Adds the object to the set of entities of the type {@link SitzberechnungErgebnis}.
     *
     * @param sitzberechnungErgebnis SitzberechnungErgebnis-object
     */
   void addSitzberechnungErgebnis(SitzberechnungErgebnis sitzberechnungErgebnis);

   /**
     * Adds the object to the set of entities of the type {@link SitzberechnungErgebnis}.
     *
     * @param col {@link Collection} of {@link EJBObject}s, which are added to the set.
     */
   void addAllSitzberechnungErgebnisCol(Collection<SitzberechnungErgebnis> col);

   /**
     * Deletes an entity from the set of entities of the type {@link SitzberechnungErgebnis}.
     *
     * @param sitzberechnungErgebnis SitzberechnungErgebnis-EJBObject, which is removed from the set.
     */
   void removeSitzberechnungErgebnis(SitzberechnungErgebnis sitzberechnungErgebnis);

   /**
     * Returns the set of entities of the type {@link Sitzverteilung}.
     *
     * @return  {@link Collection} of {@link EJBLocalObject} type {@link Sitzverteilung}
     * @throws EJBException: an error occurred
     */
   Collection<Sitzverteilung> getSitzverteilungCol() throws EJBException;

   /**
     * Adds the object to the set of entities of the type {@link Sitzverteilung}.
     *
     * @param sitzverteilung Sitzverteilung-object
     */
   void addSitzverteilung(Sitzverteilung sitzverteilung);

   /**
     * Adds the object to the set of entities of the type {@link Sitzverteilung}.
     *
     * @param col {@link Collection} of {@link EJBObject}s, which are added to the set.
     */
   void addAllSitzverteilungCol(Collection<Sitzverteilung> col);

   /**
     * Deletes an entity from the set of entities of the type {@link Sitzverteilung}.
     *
     * @param sitzverteilung Sitzverteilung-EJBObject, which is removed from the set.
     */
   void removeSitzverteilung(Sitzverteilung sitzverteilung);

   /**
     * Returns the set of entities of the type {@link Unterverteilung}.
     *
     * @return  {@link Collection} of {@link EJBLocalObject} type {@link Unterverteilung}
     * @throws EJBException: an error occurred
     */
   Collection<Unterverteilung> getUnterverteilungCol() throws EJBException;

   /**
     * Adds the object to the set of entities of the type {@link Unterverteilung}.
     *
     * @param unterverteilung Unterverteilung-object
     */
   void addUnterverteilung(Unterverteilung unterverteilung);

   /**
     * Adds the object to the set of entities of the type {@link Unterverteilung}.
     *
     * @param col {@link Collection} of {@link EJBObject}s, which are added to the set.
     */
   void addAllUnterverteilungCol(Collection<Unterverteilung> col);

   /**
     * Deletes an entity from the set of entities of the type {@link Unterverteilung}.
     *
     * @param unterverteilung Unterverteilung-EJBObject, which is removed from the set.
     */
   void removeUnterverteilung(Unterverteilung unterverteilung);
}
