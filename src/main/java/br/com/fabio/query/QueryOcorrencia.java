package br.com.fabio.query;

public class QueryOcorrencia {

    public static final String FILTRAR_POR_ID_E_NATUREZA_E_DATA_OCORRENCIA
            = "select o from Ocorrencia o\n"
            + "where o.id = \n"
            + "case when ?1 = 0 then o.id \n"
            + "     else ?1 end \n"
            + "and o.naturezaEvento.id = \n"
            + "case when ?2 = 0 then o.naturezaEvento.id \n"
            + "     else ?2 end \n"
            + "and o.dataOcorrencia = \n"
            + "case when ?3 is null then o.dataOcorrencia \n"
            + "     else ?3 end \n"
            + "order by o.naturezaEvento.descricao, o.dataOcorrencia\n";

    public static final String FILTRAR_POR_NATUREZA_PERIODO
            = "select count(o), o.naturezaEvento.descricao\n"
            + "from Ocorrencia o\n"
            + "where o.dataOcorrencia between ?1 and ?2\n"
            + "group by o.dataOcorrencia\n";
}
