/*
 * ListenkandidaturErgebnisTmpModelImpl
 * 
 * Created on 18.02.2009
 * Copyright (c) 2009 IVU Traffic Technologies AG
 */
package de.ivu.wahl.modell.impl;

import de.ivu.wahl.modell.ListenkandidaturErgebnisTmpModel;

/**
 * @author ugo@ivu.de, IVU Traffic Technologies AG
 * @version $Id$
 */
public class ListenkandidaturErgebnisTmpModelImpl extends ListenkandidaturErgebnisModelImpl
    implements
      ListenkandidaturErgebnisTmpModel {

  /** long */
  private static final long serialVersionUID = 7088288235275957460L;
  private final String id_Liste;
  private final int listenplatzAlt;

  @SuppressWarnings("hiding")
  public ListenkandidaturErgebnisTmpModelImpl(String id_ListenkandidaturErgebnis,
      String id_Liste,
      int listenplatzAlt) {
    super(id_ListenkandidaturErgebnis);
    this.listenplatzAlt = listenplatzAlt;
    this.id_Liste = id_Liste;
  }

  /**
   * Gibt id_Liste zurück.
   * 
   * @return id_Liste.
   */
  public String getID_Liste() {
    return id_Liste;
  }

  /**
   * Gibt listenposition zurück.
   * 
   * @return listenposition.
   */
  public int getListenplatzAlt() {
    return listenplatzAlt;
  }
}
