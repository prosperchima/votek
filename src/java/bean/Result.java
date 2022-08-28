package bean;

import java.io.Serializable;

/**
 *
 * @author USER
 */
public class Result implements Serializable {
    private String president;
    private String secretary;
    private String governor;

    public Result(String president, String secretary, String governor) {
        this.president = president;
        this.secretary = secretary;
        this.governor = governor;
    }

    public String getPresident() {
        return president;
    }

    public String getSecretary() {
        return secretary;
    }

    public String getGovernor() {
        return governor;
    }

    public void setPresident(String president) {
        this.president = president;
    }

    public void setSecretary(String secretary) {
        this.secretary = secretary;
    }

    public void setGovernor(String governor) {
        this.governor = governor;
    }
    
    
}
