package br.com.fabio.query;

public class QueryRequerente {

    public static final String BUSCAR_REQUERENTE_CPF
            = "select r from Requerente r \n"
            + "where r.cpf = ?1 and r.id <> ?2";

    public static final String FILTRAR_POR_NOME_OU_CPF
            = "select r from Requerente r \n"
            + "where upper(r.nome) like \n"
            + "case when ?1 <> '' then concat('%', upper(?1), '%') \n"
            + "     else concat('%', upper(r.nome), '%') end \n"
            + "and upper(r.cpf) = \n"
            + "case when ?2 <> '' then ?2 \n"
            + "     else upper(r.cpf) end "
            + "order by r.nome\n";
}
