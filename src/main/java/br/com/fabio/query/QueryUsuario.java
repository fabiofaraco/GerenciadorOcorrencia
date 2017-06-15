package br.com.fabio.query;

public class QueryUsuario {

    public static final String BUSCAR_USUARIO_CPF
            = "select u from Usuario u \n"
            + "where u.cpf = ?1 and u.id <> ?2";

    public static final String FILTRAR_POR_NOME_OU_CPF
            = "select u from Usuario u \n"
            + "where upper(u.nome) like \n"
            + "case when ?1 <> '' then concat('%', upper(?1), '%') \n"
            + "     else concat('%', upper(u.nome), '%') end \n"
            + "and upper(u.cpf) = \n"
            + "case when ?2 <> '' then ?2 \n"
            + "     else upper(u.cpf) end "
            + "order by u.nome\n";
}
