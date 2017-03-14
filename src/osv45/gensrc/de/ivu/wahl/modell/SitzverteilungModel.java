/*
 * SitzverteilungModel
 * 
 * WARNING! Automatically generated file! Do not edit!
 * Code Generator by IVU
 * Definition Version: $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
 */

package de.ivu.wahl.modell;

import de.ivu.ejb.bmp.Model;

/**
  * Model interface for the entity Sitzverteilung.
  * Contains the list of properties including the IDs of the associated objects.
  * A navigation is not implemented (1:1, 1:n, m:n)
  *
  * @author cos@ivu.de  (c) 2003-7 Statistisches Bundesamt und IVU Traffic Technologies AG
  * @version $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
  */
public interface SitzverteilungModel extends Model {
   /**
     * Gets the value of id_Sitzverteilung in the entity Sitzverteilung
     *
     * @return value of the attribute id_Sitzverteilung
     */
   String getID_Sitzverteilung();

   /**
     * The maximum size of id_Sitzverteilung
     * The size is limited by the database.
     */
   public static final int ID_SITZVERTEILUNG_LENGTH = 13;

   /**
     * Sets the value of id_Ergebniseingang in the entity Sitzverteilung
     *
     * @param id_Ergebniseingang new value of the attribute id_Ergebniseingang
     */
   void setID_Ergebniseingang(String id_Ergebniseingang);

   /**
     * Gets the value of id_Ergebniseingang in the entity Sitzverteilung
     *
     * @return value of the attribute id_Ergebniseingang
     */
   String getID_Ergebniseingang();

   /**
     * The maximum size of id_Ergebniseingang
     * The size is limited by the database.
     */
   public static final int ID_ERGEBNISEINGANG_LENGTH = 13;

   /**
     * Sets the value of id_Liste in the entity Sitzverteilung
     *
     * @param id_Liste new value of the attribute id_Liste
     */
   void setID_Liste(String id_Liste);

   /**
     * Gets the value of id_Liste in the entity Sitzverteilung
     *
     * @return value of the attribute id_Liste
     */
   String getID_Liste();

   /**
     * The maximum size of id_Liste
     * The size is limited by the database.
     */
   public static final int ID_LISTE_LENGTH = 13;

   /**
     * Sets the value of id_Gruppe in the entity Sitzverteilung
     *
     * @param id_Gruppe new value of the attribute id_Gruppe
     */
   void setID_Gruppe(String id_Gruppe);

   /**
     * Gets the value of id_Gruppe in the entity Sitzverteilung
     *
     * @return value of the attribute id_Gruppe
     */
   String getID_Gruppe();

   /**
     * The maximum size of id_Gruppe
     * The size is limited by the database.
     */
   public static final int ID_GRUPPE_LENGTH = 13;

   /**
     * Sets the value of id_Listenkombination in the entity Sitzverteilung
     *
     * @param id_Listenkombination new value of the attribute id_Listenkombination
     */
   void setID_Listenkombination(String id_Listenkombination);

   /**
     * Gets the value of id_Listenkombination in the entity Sitzverteilung
     *
     * @return value of the attribute id_Listenkombination
     */
   String getID_Listenkombination();

   /**
     * The maximum size of id_Listenkombination
     * The size is limited by the database.
     */
   public static final int ID_LISTENKOMBINATION_LENGTH = 13;

   /**
     * Sets the value of sitzeGesamtzahl in the entity Sitzverteilung
     *
     * @param sitzeGesamtzahl new value of the attribute sitzeGesamtzahl
     */
   void setSitzeGesamtzahl(int sitzeGesamtzahl);

   /**
     * Gets the value of sitzeGesamtzahl in the entity Sitzverteilung
     *
     * @return value of the attribute sitzeGesamtzahl
     */
   int getSitzeGesamtzahl();

   /**
     * Copies the object via Object.clone()
     *
     * @return Copy of the model object
     */
   public SitzverteilungModel copy();
}
