/*
 * ListenplatzNeu
 * 
 * WARNING! Automatically generated file! Do not edit!
 * Code Generator by IVU
 * Definition Version: $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
 */

package de.ivu.wahl.modell.ejb;


import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

import de.ivu.wahl.modell.ListenplatzNeuModel;

/**
  * Interface for the entity ListenplatzNeu as Entity Bean.
  * The navigation (1:1, 1:n, m:n) is contained
  *
  * @author D. Cosic  (c) 2003-2016 Statistisches Bundesamt und IVU Traffic Technologies AG
  * @version $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
  */
public interface ListenplatzNeu extends EJBLocalObject, ListenplatzNeuModel {
   /**
     * Method to receive a model object for the setting of the current internal object state.
     * Optimizes the Client-Server-Performance
     *
     * @param details model object with new state
     */
   void setDetails(ListenplatzNeuModel details);

   /**
     * Method to receive a model object, which represents the current internal state of the object.
     * Optimizes the Client-Server-Performance
     *
     * @return Model object with new internal state
     */
   ListenplatzNeuModel getDetails();


   /**
     * Navigation to the associated entity of the type {@link Liste}
     *
     * @return the corresponding EJBObject
     * @throws EJBException: an error occurred
     */
   Liste getListe() throws EJBException;

   /**
     * Setting of the associated entity of the type {@link Liste}
     *
     * @param liste the corresponding EJBObject
     */
   void setListe(Liste liste);

   /**
     * Navigation to the associated entity of the type {@link Ergebniseingang}
     *
     * @return the corresponding EJBObject
     * @throws EJBException: an error occurred
     */
   Ergebniseingang getErgebniseingang() throws EJBException;

   /**
     * Setting of the associated entity of the type {@link Ergebniseingang}
     *
     * @param ergebniseingang the corresponding EJBObject
     */
   void setErgebniseingang(Ergebniseingang ergebniseingang);
}
