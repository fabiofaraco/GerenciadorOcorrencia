package br.com.fabio.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {
    
    public static final String FORMATO_DATA_BRASIL      = "dd/MM/yyyy";
    public static final String FORMATO_DATA_AMERICANO   = "yyyy-MM-dd";
    
    public static String converteDateToString(Date dataOcorrencia, String formato) {
        SimpleDateFormat frmt = new SimpleDateFormat(formato);
        
        try {
            return frmt.format(dataOcorrencia);
        } catch(Exception e) {
            return "";
        }
    }
}
