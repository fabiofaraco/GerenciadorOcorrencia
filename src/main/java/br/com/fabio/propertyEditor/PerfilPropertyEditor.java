package br.com.fabio.propertyEditor;

import br.com.fabio.entity.Perfil;
import java.beans.PropertyEditorSupport;

public class PerfilPropertyEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        Perfil perfil = new Perfil();
        perfil.setId(Long.parseLong(text));
        setValue(perfil);
    }
}
