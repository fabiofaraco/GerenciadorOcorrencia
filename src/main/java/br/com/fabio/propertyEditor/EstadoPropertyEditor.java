package br.com.fabio.propertyEditor;

import br.com.fabio.entity.Estado;
import java.beans.PropertyEditorSupport;

public class EstadoPropertyEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        Estado estado = new Estado();
        estado.setId(Integer.parseInt(text));
        setValue(estado);
    }
}
