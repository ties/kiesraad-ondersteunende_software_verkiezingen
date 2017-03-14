/*
 * BasicSchwellwertModelImpl
 * 
 * WARNING! Automatically generated file! Do not edit!
 * Code Generator by IVU
 * Definition Version: $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
 */

package de.ivu.wahl.modell.impl;

import java.math.BigDecimal;
import java.io.Serializable;

import org.apache.log4j.Category;

import de.ivu.util.debug.Log4J;
import de.ivu.ejb.bmp.ModelImpl;
import de.ivu.wahl.modell.SchwellwertModel;

/**
  * Model implementation for the entity Schwellwert.
  * Contains the list of properties including the IDs of the associated objects.
  * A navigation is not implemented (1:1, 1:n, m:n)
  *
  * @author cos@ivu.de  (c) 2003-7 IVU Traffic Technologies AG
  * @version $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
  */

public abstract class BasicSchwellwertModelImpl extends ModelImpl implements SchwellwertModel, Serializable {
   private static final long serialVersionUID = 1513211908847689656L;
   private static final Category LOGGER = Log4J.configure(BasicSchwellwertModelImpl.class);
   static {
      LOGGER.info(Log4J.dumpVersion(BasicSchwellwertModelImpl.class, Log4J.extractVersion("$Revision: 1.36 $"))); //$NON-NLS-1$
   }

   /**
     * Default constructor
     */
   public BasicSchwellwertModelImpl() {
      // No inititalization, only generation of the instance
   }

   /**
     * Constructor with key
     *
     * @param id_Schwellwert key element of the type {@link String}
     */
   public BasicSchwellwertModelImpl(String id_Schwellwert) {
      setID_Schwellwert(id_Schwellwert);
   }

   /**
     * Method for copying
     *
     * @param other the model object the data is copied from
     */
   public void copyFrom(BasicSchwellwertModelImpl other) {
      setID_Wahl(other._id_Wahl);
      setName(other._name);
      setSchwellwertart(other._schwellwertart);
      setWert(other._wert);
   }

   /**
     * Type : VARCHAR Name : ID_Schwellwert
     */
   protected String _id_Schwellwert;

   /**
     * Sets the value of id_Schwellwert in the entity Schwellwert
     *
     * @param id_Schwellwert new value of the attribute id_Schwellwert
     */
   protected void setID_Schwellwert(String id_Schwellwert) {
      if (different(_id_Schwellwert, id_Schwellwert)) {
         _id_Schwellwert = checkLength(id_Schwellwert, SchwellwertModel.ID_SCHWELLWERT_LENGTH);
         setModified();
      }
   }

   /**
     * Gets the value of id_Schwellwert in the entity Schwellwert
     *
     * @return value of the attribute id_Schwellwert
     */
   public String getID_Schwellwert() {
      return _id_Schwellwert;
   }

   /**
     * Type : VARCHAR Name : ID_Wahl
     */
   protected String _id_Wahl;

   /**
     * Sets the value of id_Wahl in the entity Schwellwert
     *
     * @param id_Wahl new value of the attribute id_Wahl
     */
   public void setID_Wahl(String id_Wahl) {
      if (different(_id_Wahl, id_Wahl)) {
         _id_Wahl = checkLength(id_Wahl, SchwellwertModel.ID_WAHL_LENGTH);
         setModified();
      }
   }

   /**
     * Gets the value of id_Wahl in the entity Schwellwert
     *
     * @return value of the attribute id_Wahl
     */
   public String getID_Wahl() {
      return _id_Wahl;
   }

   /**
     * Type : VARCHAR Name : Name
     */
   protected String _name;

   /**
     * Sets the value of name in the entity Schwellwert
     *
     * @param name new value of the attribute name
     */
   public void setName(String name) {
      if (different(_name, name)) {
         _name = checkLength(name, SchwellwertModel.NAME_LENGTH);
         setModified();
      }
   }

   /**
     * Gets the value of name in the entity Schwellwert
     *
     * @return value of the attribute name
     */
   public String getName() {
      return _name;
   }

   /**
     * Type : INT Name : Schwellwertart
     */
   protected int _schwellwertart;

   /**
     * Sets the value of schwellwertart in the entity Schwellwert
     *
     * @param schwellwertart new value of the attribute schwellwertart
     */
   public void setSchwellwertart(int schwellwertart) {
      if (_schwellwertart != schwellwertart) {
         _schwellwertart = schwellwertart;
         setModified();
      }
   }

   /**
     * Gets the value of schwellwertart in the entity Schwellwert
     *
     * @return value of the attribute schwellwertart
     */
   public int getSchwellwertart() {
      return _schwellwertart;
   }

   /**
     * Type : BIGINT Name : Wert
     */
   protected BigDecimal _wert;

   /**
     * Sets the value of wert in the entity Schwellwert
     *
     * @param wert new value of the attribute wert
     */
   public void setWert(BigDecimal wert) {
      if (different(_wert, wert)) {
         _wert = wert;
         setModified();
      }
   }

   /**
     * Gets the value of wert in the entity Schwellwert
     *
     * @return value of the attribute wert
     */
   public BigDecimal getWert() {
      return _wert;
   }

   /**
     * Overwrites the hashCode method in Object
     *
     * @return hash code, calculated as XOR-composition of the hash codes of the elements of the primary keys
     */
   @Override
   public int hashCode() {
      return _id_Schwellwert.hashCode();
   }

   /**
     * Overwrites the equals method in Object
     *
     * @param object Objekt, by what this object can be testet for equality
     * @return <code>true</code> if the compared objects have an equal primary key
     */
   @Override
   public boolean equals(Object object) {
      if (object instanceof BasicSchwellwertModelImpl) {
         BasicSchwellwertModelImpl other = (BasicSchwellwertModelImpl)object;
         return _id_Schwellwert.equals(other._id_Schwellwert);
      } else {
         return false;
      }
   }

   /**
     * Overwrites the toString method in Object
     *
     * @return string representation of the current state as listing of the attributes and their values
     */
   @Override
   public String toString() {
      try {
         String string = "[" + getClass().getName()+ ": "; //$NON-NLS-1$ //$NON-NLS-2$
         if (getID_Schwellwert() != null) {
            string += "id_Schwellwert = " + getID_Schwellwert(); //$NON-NLS-1$
         }
         if (getID_Wahl() != null) {
            string +=  ", id_Wahl = " + getID_Wahl(); //$NON-NLS-1$
         }
         if (getName() != null) {
            string +=  ", name = " + getName(); //$NON-NLS-1$
         }
         string +=  ", schwellwertart = " + getSchwellwertart(); //$NON-NLS-1$
         if (getWert() != null) {
            string +=  ", wert = " + getWert(); //$NON-NLS-1$
         }
         return string  + "]" ; //$NON-NLS-1$
      } catch (Exception e) {
         LOGGER.error(e, e);
         return ""; //$NON-NLS-1$
      }
   }


   /**
     * Copies the object via Object.clone()
     *
     * @return Copy of the model object
     */
   public SchwellwertModel copy() {
      return (SchwellwertModel)clone();
   }
}
