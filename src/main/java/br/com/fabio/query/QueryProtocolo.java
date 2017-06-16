package br.com.fabio.query;

public class QueryProtocolo {

    public static final String FILTRAR_POR_REQUERENTE_CPF_OU_CODIGO_AUTENTICACAO
            = "select p from Protocolo p \n"
            + "where p.requerente.cpf = \n"
            + "case when ?1 = '' then p.requerente.cpf\n"
            + "     else ?1 end \n"
            + "and p.codigoAutenticacao = \n"
            + "case when ?2 = '' then p.codigoAutenticacao \n"
            + "     else ?2 end\n"
            + "order by p.requerente.nome\n";
}
