package br.com.fabio.query;

public class QueryOcorrencia {

    public static final String FILTRAR_POR_NATUREZA_E_DATA_OCORRENCIA
            = "select o from Ocorrencia o\n"
            + "where o.naturezaEvento.id = \n"
            + "case when ?1 = 0 then o.naturezaEvento.id \n"
            + "     else ?1 end \n"
            + "and o.dataOcorrencia = \n"
            + "case when ?2 = '' then o.dataOcorrencia \n"
            + "     else ?2 end \n";
}
