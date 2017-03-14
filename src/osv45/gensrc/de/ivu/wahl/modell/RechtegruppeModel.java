/*
 * RechtegruppeModel
 * 
 * WARNING! Automatically generated file! Do not edit!
 * Code Generator by IVU
 * Definition Version: $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
 */

package de.ivu.wahl.modell;

import de.ivu.ejb.bmp.Model;

/**
  * Model interface for the entity Rechtegruppe.
  * Contains the list of properties including the IDs of the associated objects.
  * A navigation is not implemented (1:1, 1:n, m:n)
  *
  * @author cos@ivu.de  (c) 2003-7 IVU Traffic Technologies AG
  * @version $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
  */
public interface RechtegruppeModel extends Model {
   /**
     * Gets the value of id_Rechtegruppe in the entity Rechtegruppe
     *
     * @return value of the attribute id_Rechtegruppe
     */
   String getID_Rechtegruppe();

   /**
     * The maximum size of id_Rechtegruppe
     * The size is limited by the database.
     */
   public static final int ID_RECHTEGRUPPE_LENGTH = 30;

   /**
     * Sets the value of name in the entity Rechtegruppe
     *
     * @param name new value of the attribute name
     */
   void setName(String name);

   /**
     * Gets the value of name in the entity Rechtegruppe
     *
     * @return value of the attribute name
     */
   String getName();

   /**
     * The maximum size of name
     * The size is limited by the database.
     */
   public static final int NAME_LENGTH = 200;

   /**
     * Sets the value of beschreibung in the entity Rechtegruppe
     *
     * @param beschreibung new value of the attribute beschreibung
     */
   void setBeschreibung(String beschreibung);

   /**
     * Gets the value of beschreibung in the entity Rechtegruppe
     *
     * @return value of the attribute beschreibung
     */
   String getBeschreibung();

   /**
     * The maximum size of beschreibung
     * The size is limited by the database.
     */
   public static final int BESCHREIBUNG_LENGTH = 200;

   /**
     * Copies the object via Object.clone()
     *
     * @return Copy of the model object
     */
   public RechtegruppeModel copy();
}
