package br.com.fabio.propertyEditor;

import br.com.fabio.entity.Cidade;
import java.beans.PropertyEditorSupport;

public class CidadePropertyEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        Cidade cidade = new Cidade();
        cidade.setId(Integer.parseInt(text));
        setValue(cidade);
    }
}
