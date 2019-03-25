/*
 * BasicListenkandidaturErgebnisHome
 * 
 * WARNING! Automatically generated file! Do not edit!
 * Code Generator by IVU
 * Definition Version: $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
 */

package de.ivu.wahl.modell.ejb;

import java.util.Collection;
import javax.ejb.EJBLocalHome;
import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.FinderException;
import javax.ejb.ObjectNotFoundException;

import de.ivu.ejb.IVUBeanBase;

import de.ivu.wahl.modell.ListenkandidaturErgebnisModel;

/**
  * LocalHome interface for the entity ListenkandidaturErgebnis as BMP Entity Bean.
  *
  * @author D. Cosic  (c) 2003-2016 Statistisches Bundesamt und IVU Traffic Technologies AG
  * @version $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
  */
public interface BasicListenkandidaturErgebnisHome extends EJBLocalHome {

      public static class HomeFinder {
         public static ListenkandidaturErgebnisHome findHome(IVUBeanBase caller) {
            String simpleName = ListenkandidaturErgebnisHome.class.getSimpleName();
            return caller.findLocalHome(simpleName.substring(0, simpleName.length() - 4));
         }
      }

   /**
     * Initializes the Bean-instance. (Bean-supporting method by EJB specification.)
     *
     * @param details Value Object containing data of the Bean
     * @return Primary key of the entity
     * @throws CreateException Bean could not be instantiated 
     * @throws EJBException not used here but allows a cleanly derivative
     */
   ListenkandidaturErgebnis create(ListenkandidaturErgebnisModel details) throws CreateException, EJBException;

   /**
     * Initializes the Bean-instance. (Bean-supporting method by EJB specification.)
     *
     * @param id_ListenkandidaturErgebnis key element of the type {@link String}
     * @param id_Listenkandidatur key element of the type {@link String}
     * @param id_Ergebniseingang key element of the type {@link String}
     * @return Primary key of the entity
     * @throws CreateException Bean could not be instantiated 
     * @throws EJBException not used here but allows a cleanly derivative
     */
   ListenkandidaturErgebnis create(String id_ListenkandidaturErgebnis, String id_Listenkandidatur, String id_Ergebniseingang) throws CreateException, EJBException;

   /**
     * Searches for existing Bean-instance. (Bean-supporting method by EJB specification.)
     *
     * @param pkObj Key of the entity
     * @return Key of the entity
     * @throws ObjectNotFoundException if the entity was not found.
     * @throws FinderException if an error occurred while searching (does NOT mean "not found".
     */
   ListenkandidaturErgebnis findByPrimaryKey(String pkObj) throws ObjectNotFoundException, FinderException;

   /**
     * Searches for all existing Bean-instances. (Bean-supporting method by EJB specification.)
     *
     * @return Collection of keys of the entities
     * @throws FinderException if an error occurred while searching (does NOT mean "not found".
     */
   Collection<ListenkandidaturErgebnis> findAll() throws FinderException;

   /**  
     * Bean-supporting method by EJB standard.
     * Method for support of the navigation of the Bean model.
     *
     * @param id_Listenkandidatur ID of the objects to be searched
     * @return  {@link Collection} of the found ListenkandidaturErgebnis-entities
     * @throws FinderException if an error occurred while searching (does NOT mean "not found".
     */
   Collection<ListenkandidaturErgebnis> findAllByListenkandidatur(String id_Listenkandidatur) throws FinderException;

   /**  
     * Bean-supporting method by EJB standard.
     * Method for support of the navigation of the Bean model.
     *
     * @param id_Ergebniseingang ID of the objects to be searched
     * @return  {@link Collection} of the found ListenkandidaturErgebnis-entities
     * @throws FinderException if an error occurred while searching (does NOT mean "not found".
     */
   Collection<ListenkandidaturErgebnis> findAllByErgebniseingang(String id_Ergebniseingang) throws FinderException;

   /**
     * Returns the set of entities of the type {@link ListenkandidaturErgebnis}, filtered by listenplatz.
     *
     * @param listenplatz searching condition
     * @return  {@link Collection} of {@link EJBLocalObject}s of the type {@link ListenkandidaturErgebnis}
     * @throws FinderException if an error occurred while searching (does NOT mean "not found").
     */
   Collection<ListenkandidaturErgebnis> findAllByListenplatz(int listenplatz) throws FinderException;

   /**
     * Returns the set of entities of the type {@link ListenkandidaturErgebnis}, filtered by gewaehlt.
     *
     * @param gewaehlt searching condition
     * @return  {@link Collection} of {@link EJBLocalObject}s of the type {@link ListenkandidaturErgebnis}
     * @throws FinderException if an error occurred while searching (does NOT mean "not found").
     */
   Collection<ListenkandidaturErgebnis> findAllByGewaehlt(boolean gewaehlt) throws FinderException;

   /**
     * Returns the set of entities of the type {@link ListenkandidaturErgebnis}, filtered by gewaehltInGruppe.
     *
     * @param gewaehltInGruppe searching condition
     * @return  {@link Collection} of {@link EJBLocalObject}s of the type {@link ListenkandidaturErgebnis}
     * @throws FinderException if an error occurred while searching (does NOT mean "not found").
     */
   Collection<ListenkandidaturErgebnis> findAllByGewaehltInGruppe(boolean gewaehltInGruppe) throws FinderException;

   /**
     * Returns the set of entities of the type {@link ListenkandidaturErgebnis}, filtered by bevorzugtGewaehlt.
     *
     * @param bevorzugtGewaehlt searching condition
     * @return  {@link Collection} of {@link EJBLocalObject}s of the type {@link ListenkandidaturErgebnis}
     * @throws FinderException if an error occurred while searching (does NOT mean "not found").
     */
   Collection<ListenkandidaturErgebnis> findAllByBevorzugtGewaehlt(boolean bevorzugtGewaehlt) throws FinderException;

   /**
     * Returns the set of entities of the type {@link ListenkandidaturErgebnis}, filtered by losteilnehmer.
     *
     * @param losteilnehmer searching condition
     * @return  {@link Collection} of {@link EJBLocalObject}s of the type {@link ListenkandidaturErgebnis}
     * @throws FinderException if an error occurred while searching (does NOT mean "not found").
     */
   Collection<ListenkandidaturErgebnis> findAllByLosteilnehmer(boolean losteilnehmer) throws FinderException;

   /**
     * Returns the set of entities of the type {@link ListenkandidaturErgebnis}, filtered by losgewinner.
     *
     * @param losgewinner searching condition
     * @return  {@link Collection} of {@link EJBLocalObject}s of the type {@link ListenkandidaturErgebnis}
     * @throws FinderException if an error occurred while searching (does NOT mean "not found").
     */
   Collection<ListenkandidaturErgebnis> findAllByLosgewinner(boolean losgewinner) throws FinderException;
}
