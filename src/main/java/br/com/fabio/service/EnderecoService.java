package br.com.fabio.service;

import br.com.fabio.entity.Cidade;
import br.com.fabio.entity.Estado;
import java.util.List;

public interface EnderecoService {

    public List<Estado> getListaEstados();

    public List<Cidade> getListaCidadesByIdEstado(int id);
}
