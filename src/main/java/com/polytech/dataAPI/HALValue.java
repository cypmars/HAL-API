package com.polytech.dataAPI;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.ArrayList;

/**
 * Created by Cyprien on 26/09/2017.
 */

@JsonIgnoreProperties(ignoreUnknown = true)
public class HALValue {
    private ArrayList<String> abstract_s;
    private ArrayList<String> authFirstName_s;
    private ArrayList<String> authLastName_s;
    private ArrayList<String> authLastNameFirstName_s;
    private ArrayList<String> title_s;
    private ArrayList<String> labStructName_s;
    private String uri_s;

    public ArrayList<String> getAuthLastNameFirstName_s() {
        return authLastNameFirstName_s;
    }

    public void setAuthLastNameFirstName_s(ArrayList<String> authLastNameFirstName_s) {
        this.authLastNameFirstName_s = authLastNameFirstName_s;
    }

    public ArrayList<String> getAbstract_s() {
        return abstract_s;
    }

    public void setAbstract_s(ArrayList<String> abstract_s) {
        this.abstract_s = abstract_s;
    }

    public ArrayList<String> getAuthFirstName_s() {
        return authFirstName_s;
    }

    public void setAuthFirstName_s(ArrayList<String> authFirstName_s) {
        this.authFirstName_s = authFirstName_s;
    }

    public ArrayList<String> getAuthLastName_s() {
        return authLastName_s;
    }

    public void setAuthLastName_s(ArrayList<String> authLastName_s) {
        this.authLastName_s = authLastName_s;
    }

    public ArrayList<String> getTitle_s() {
        return title_s;
    }

    public void setTitle_s(ArrayList<String> title_s) {
        this.title_s = title_s;
    }

    public ArrayList<String> getLabStructName_s() {
        return labStructName_s;
    }

    public void setLabStructName_s(ArrayList<String> labStructName_s) {
        this.labStructName_s = labStructName_s;
    }

    public String getUri_s() {
        return uri_s;
    }

    public void setUri_s(String uri_s) {
        this.uri_s = uri_s;
    }

    @Override
    public String toString() {
        return "HALValue{" +
                "abstract_s=" + abstract_s +
                ", authFirstName_s=" + authFirstName_s +
                ", authLastName_s=" + authLastName_s +
                ", authFullName_s=" + authLastNameFirstName_s +
                ", title_s=" + title_s +
                ", labStructName_s=" + labStructName_s +
                ", uri_s='" + uri_s + '\'' +
                '}';
    }
}