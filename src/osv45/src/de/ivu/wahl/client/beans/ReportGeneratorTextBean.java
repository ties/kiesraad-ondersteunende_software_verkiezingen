package de.ivu.wahl.client.beans;

import static de.ivu.ejb.EJBUtil.lookupLocal;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.io.filefilter.SuffixFileFilter;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import de.ivu.wahl.Konstanten;
import de.ivu.wahl.admin.PropertyHandling;
import de.ivu.wahl.admin.PropertyHandlingBean;
import de.ivu.wahl.i18n.MessageKeys;
import de.ivu.wahl.i18n.Messages;

/**
 * Handles uploading and deleting of *-text.xslt files with text resources for the ReportGenerator.
 * See ImportReportGeneratorTextsHandler and ResetReportGeneratorTextsHandler
 * 
 * @author jon@ivu.de, Copyright (c) 2011 IVU Traffic Technologies AG
 */
public class ReportGeneratorTextBean extends BasicUploadBean {
  private static final long serialVersionUID = 1684684774094348017L;

  private static final Logger LOGGER = Logger.getLogger(ReportGeneratorTextBean.class);
  private static final String TEMP_ZIP = "temp.zip"; //$NON-NLS-1$

  private static final String RGTEXT = "rgtext"; //$NON-NLS-1$
  private static final String NL = "nl"; //$NON-NLS-1$
  private static final String FY = "fy"; //$NON-NLS-1$
  private static final String SUFFIX = "-text.xslt"; //$NON-NLS-1$
  private static final String TEXT = "text"; //$NON-NLS-1$

  private static final String SLASH = "/"; //$NON-NLS-1$
  private static final String BACKSLASH = "\\"; //$NON-NLS-1$

  protected final Properties prop = new Properties();

  /**
   * anwenderMsg wird von der Webseite benutzt um eine Satusmeldung für den Anwender anzuzeigen
   */
  public String _adminMsg;
  public String _adminConfirmationMsg = null;

  private transient PropertyHandling _propHandling;

  @Override
  public void executeCommand(HttpServletRequest request, int n) {
    String cmd = getCommand(request, n);
    if (ReportGeneratorTextCommands.RGTEXT_UPLOAD.equals(cmd)) {
      String message = Messages.getString(MessageKeys.Msg_UploadRgTextsGestartet);
      LOGGER.info(message);
      uploadRgtexts(request);
    } else if (ReportGeneratorTextCommands.RGTEXT_RESET.equals(cmd)) {
      String message = Messages.getString(MessageKeys.Msg_ResetRgTextsGestartet);
      LOGGER.info(message);
      resetRgtexts(request);
    } else {
      throw new RuntimeException(Messages.bind(MessageKeys.Error_Command_0_Unknown, cmd));
    }
  }

  /**
   * @param request
   */
  protected void resetRgtexts(HttpServletRequest request) {
    _adminMsg = null;
    _adminConfirmationMsg = null;
    int deleteCount = 0;

    File rgtextDir = getRgtextDirectory();

    if (rgtextDir.exists()) {
      try {
        int totalCount = 0;

        for (String language : Arrays.asList(NL, FY)) {
          File dir = new File(rgtextDir, language);
          FilenameFilter filter = new SuffixFileFilter(SUFFIX);
          File[] files = dir.listFiles(filter);
          for (File file : files) {
            try {
              totalCount++;
              if (file.delete()) {
                deleteCount++;
                LOGGER.error(Messages
                    .bind(MessageKeys.ResetReportGeneratorTextsHandler_fileDeleted, file));
              } else {
                LOGGER.error(Messages
                    .bind(MessageKeys.ResetReportGeneratorTextsHandler_unableToDeleteFile, file));
              }
            } catch (SecurityException e) {
              throw new RuntimeException(Messages
                  .bind(MessageKeys.ResetReportGeneratorTextsHandler_deleteFileError, file));
            }
          }
        }
      } catch (Exception e) {
        _adminMsg = Messages
            .bind(MessageKeys.ResetReportGeneratorTextsHandler_errorDialogResetTitle)
            + e.getMessage();
        LOGGER.error(MessageKeys.ResetReportGeneratorTextsHandler_errorDialogResetTitle
            + ": " + e.getMessage(), e); //$NON-NLS-1$
      }
    }
    _adminConfirmationMsg = Messages
        .bind(MessageKeys.ResetReportGeneratorTextsHandler_resetCompletedSuccessfully, deleteCount);
  }

  /**
   * Hochladen der Datei auf den Server
   */
  void uploadRgtexts(HttpServletRequest request) {
    _adminMsg = null;
    _adminConfirmationMsg = null;
    try {
      File rgtextDir = getAndCreateRgtextDirectory();

      try {
        for (FileItem item : getItems(request)) {
          if (item.isFormField()) {
            LOGGER.debug(Messages
                .bind(MessageKeys.Logger_POSTEnthaeltUnerwarteteDatenSieWerdenIgnoriert_0_1, item
                    .getFieldName(), item.getString()));
          } else if (StringUtils.isEmpty(item.getName())) {
            _adminMsg = Messages.bind(MessageKeys.Msg_EnterValidFilename);
          } else {
            uploadRgtextsFile(rgtextDir, item);
          }
        }
      } catch (SizeLimitExceededException slee) {
        _adminMsg = Messages.bind(MessageKeys.ERROR_DieDateiIstZuGross_0, SIZE_MAX_MBYTE);
        throw new Exception(_adminMsg);
      }
    } catch (Exception e) {
      _adminMsg = Messages.bind(MessageKeys.Error_UploadingRgTextFile) + ": " //$NON-NLS-1$
          + e.getMessage();
      LOGGER.error(e.getMessage(), e);
    }
  }

  /**
   * @return the base directory in which the *-text.xslt files shall be saved
   * @throws Exception if the directory could not be created
   */
  private File getAndCreateRgtextDirectory() throws Exception {
    File rgtextDir = getRgtextDirectory();
    LOGGER.info("RGTEXT directory: " + rgtextDir); //$NON-NLS-1$
    rgtextDir.mkdirs();
    if (!rgtextDir.isDirectory()) {
      _adminMsg = Messages.bind(MessageKeys.Error_Verzeichnis_0_KonnteNichtAngelegtWerden,
          rgtextDir.getPath());
      throw new Exception(Messages.getString(MessageKeys.VerzeichnisWurdeNichtAngelegt));
    }
    return rgtextDir;
  }

  private File getRgtextDirectory() {
    File exportDir = getPropertyHandling().getFileProperty(Konstanten.PROP_EXPORT_FORMULAR_DIR);
    File rgtextDir = new File(new File(exportDir, ".."), RGTEXT); //$NON-NLS-1$
    return rgtextDir;
  }

  private void uploadRgtextsFile(File rgtextDir, FileItem item)
      throws FileNotFoundException, IOException {

    File tempZipFile = null;
    List<String> extractedFiles = new ArrayList<String>();
    try {
      // Upload zip file
      tempZipFile = new File(rgtextDir, TEMP_ZIP);
      FileOutputStream fout = new FileOutputStream(tempZipFile);
      fout.write(item.get());
      fout.close();

      // Extract *-text.xslt files
      ZipFile zipFile = null;
      try {
        zipFile = new ZipFile(tempZipFile);
      } catch (ZipException e) {
        throw new RuntimeException(Messages.bind(MessageKeys.Error_ReportGeneratorTexts_unzipError,
            item.getName()));
      } catch (IOException e) {
        throw new RuntimeException(Messages
            .bind(MessageKeys.Error_ReportGeneratorTexts_readZipFileError, item.getName()));
      } catch (SecurityException e) {
        throw new RuntimeException(Messages
            .bind(MessageKeys.Error_ReportGeneratorTexts_notAllowedError, item.getName()));
      }
      Enumeration<? extends ZipEntry> entries = zipFile.entries();

      while (entries.hasMoreElements()) {
        ZipEntry entry = entries.nextElement();
        List<String> tokens = getTokens(entry);
        processEntry(entry, zipFile, tokens, extractedFiles, rgtextDir);
      }

      zipFile.close();
    } finally {
      if (tempZipFile != null) {
        tempZipFile.delete();
      }
    }

    _adminConfirmationMsg = Messages.bind(MessageKeys.Msg_UploadRgTextFileSuccessful, item
        .getName(), extractedFiles.size());
  }

  private void processEntry(ZipEntry entry,
      ZipFile zipFile,
      List<String> tokens,
      List<String> extractedFiles,
      File rgtextDir) throws IOException {
    if (entry.isDirectory()) {
      return;
    }
    if (tokens.size() != 2) {
      LOGGER.info(Messages.bind(MessageKeys.Logger_ReportGeneratorTexts_entryIgnored, entry
          .getName()));
      return;
    }

    String dirName = tokens.get(0);
    String fileName = tokens.get(1);
    if (Arrays.asList(NL, FY).contains(dirName) && fileName.endsWith(SUFFIX)) {
      File dir = new File(rgtextDir, dirName);
      dir.mkdirs();
      File file = new File(dir, fileName);

      copyInputStream(zipFile.getInputStream(entry), new BufferedOutputStream(new FileOutputStream(
          file)));
      extractedFiles.add(dirName + BACKSLASH + fileName);
      LOGGER.info(Messages.bind(MessageKeys.Logger_ReportGeneratorTexts_extractedFile, file));
    } else {
      LOGGER.info(Messages.bind(MessageKeys.Logger_ReportGeneratorTexts_entryIgnored, entry
          .getName()));
    }
  }

  private List<String> getTokens(ZipEntry entry) {
    List<String> tokens = new ArrayList<String>(Arrays.asList(tokenize(entry)));
    if (tokens.size() > 0 && tokens.get(0).equals(TEXT)) {
      tokens.remove(0);
    }
    return tokens;
  }

  private String[] tokenize(ZipEntry entry) {
    String s = entry.getName();

    // remove leading and training slashes and backslashes
    if (s.endsWith(SLASH)) {
      s = s.substring(0, s.length() - SLASH.length());
    }
    if (s.endsWith(BACKSLASH)) {
      s = s.substring(0, s.length() - BACKSLASH.length());
    }
    if (s.startsWith(SLASH)) {
      s = s.substring(SLASH.length(), s.length());
    }
    if (s.startsWith(BACKSLASH)) {
      s = s.substring(BACKSLASH.length(), s.length());
    }

    if (s.length() == 0) {
      return new String[]{};
    }

    if (s.contains(SLASH)) {
      return s.split(SLASH);
    }

    if (s.contains(BACKSLASH)) {
      return s.split(BACKSLASH + BACKSLASH);
    }

    return new String[]{s};
  }

  public void copyInputStream(InputStream in, OutputStream out) throws IOException {
    byte[] buffer = new byte[1024 * 1024];
    int len;

    while ((len = in.read(buffer)) >= 0) {
      out.write(buffer, 0, len);
    }

    in.close();
    out.close();
  }

  public boolean isDirectoryKnown() {
    return getPropertyHandling().getFileProperty(Konstanten.PROP_EXPORT_FORMULAR_DIR) != null;
  }

  /**
   * @return {@link PropertyHandling}
   */
  public PropertyHandling getPropertyHandling() {
    if (_propHandling == null) {
      _propHandling = lookupLocal(PropertyHandlingBean.class.getSimpleName());
    }
    return _propHandling;
  }
}