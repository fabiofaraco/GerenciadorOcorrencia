package br.com.fabio.propertyEditor;

import br.com.fabio.entity.NaturezaEvento;
import java.beans.PropertyEditorSupport;

public class NaturezaEventoPropertyEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        NaturezaEvento naturezaEvento = new NaturezaEvento();
        naturezaEvento.setId(Integer.parseInt(text));
        setValue(naturezaEvento);
    }
}
