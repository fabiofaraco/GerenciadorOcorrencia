package br.com.fabio.entity;

public class Menu {
    private String liId;
    private String aId;
    private String descricao;
    private String icone;
    private boolean selected;
    
    public Menu(String liId, String aId, String descricao, String icone) {
        this.liId = liId;
        this.aId = aId;
        this.descricao = descricao;
        this.icone = icone;
        this.selected = false;
    }
    
    public Menu(String liId, String aId, String descricao, String icone,
            boolean selected) {
        this.liId = liId;
        this.aId = aId;
        this.descricao = descricao;
        this.icone = icone;
        this.selected = selected; 
    }
    
    /**
     * @return the liId
     */
    public String getLiId() {
        return liId;
    }

    /**
     * @param liId the liId to set
     */
    public void setLiId(String liId) {
        this.liId = liId;
    }

    /**
     * @return the aId
     */
    public String getaId() {
        return aId;
    }

    /**
     * @param aId the aId to set
     */
    public void setaId(String aId) {
        this.aId = aId;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    
    /**
     * @return the icone
     */
    public String getIcone() {
        return icone;
    }

    /**
     * @param icone the icone to set
     */
    public void setIcone(String icone) {
        this.icone = icone;
    }
    
    /**
     * @return the selected
     */
    public boolean isSelected() {
        return selected;
    }

    /**
     * @param selected the selected to set
     */
    public void setSelected(boolean selected) {
        this.selected = selected;
    }
}
