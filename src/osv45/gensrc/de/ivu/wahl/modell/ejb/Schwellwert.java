/*
 * Schwellwert
 * 
 * WARNING! Automatically generated file! Do not edit!
 * Code Generator by IVU
 * Definition Version: $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
 */

package de.ivu.wahl.modell.ejb;


import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

import de.ivu.wahl.modell.SchwellwertModel;

/**
  * Interface for the entity Schwellwert as Entity Bean.
  * The navigation (1:1, 1:n, m:n) is contained
  *
  * @author cos@ivu.de  (c) 2003-7 IVU Traffic Technologies AG
  * @version $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
  */
public interface Schwellwert extends EJBLocalObject, SchwellwertModel {
   /**
     * Method to receive a model object for the setting of the current internal object state.
     * Optimizes the Client-Server-Performance
     *
     * @param details model object with new state
     */
   void setDetails(SchwellwertModel details);

   /**
     * Method to receive a model object, which represents the current internal state of the object.
     * Optimizes the Client-Server-Performance
     *
     * @return Model object with new internal state
     */
   SchwellwertModel getDetails();


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
}
