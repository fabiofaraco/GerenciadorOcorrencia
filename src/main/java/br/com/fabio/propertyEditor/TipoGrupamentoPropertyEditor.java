package br.com.fabio.propertyEditor;

import br.com.fabio.entity.TipoGrupamento;
import java.beans.PropertyEditorSupport;

public class TipoGrupamentoPropertyEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        TipoGrupamento grupamento = new TipoGrupamento();
        grupamento.setId(Integer.parseInt(text));
        setValue(grupamento);
    }
}
