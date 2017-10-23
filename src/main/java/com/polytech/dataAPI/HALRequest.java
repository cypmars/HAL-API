package com.polytech.dataAPI;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.ArrayList;

/**
 * Created by Cyprien on 26/09/2017.
 */
public class HALRequest {

    private Response response ;
    private FacetCounts facet_counts;

    public Response getResponse() {
        return response;
    }
    public void setResponse(Response response) {
        this.response = response;
    }

    public FacetCounts getFacet_counts() {
        return facet_counts;
    }

    public void setFacet_counts(FacetCounts facet_counts) {
        this.facet_counts = facet_counts;
    }

    @Override
    public String toString() {
        return "HALRequest{" +
                "response=" + response +
                ", facet_counts=" + facet_counts +
                '}';
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public class Response{
        private int numFound;
        private int start;
        private ArrayList<HALValue> docs;

        public int getNumFound() {
            return numFound;
        }

        public void setNumFound(int numFound) {
            this.numFound = numFound;
        }

        public int getStart() {
            return start;
        }

        public void setStart(int start) {
            this.start = start;
        }

        public ArrayList<HALValue> getDocs() {
            return docs;
        }

        public void setDocs(ArrayList<HALValue> docs) {
            this.docs = docs;
        }

        @Override
        public String toString() {
            return "Response{" +
                    "numFound=" + numFound +
                    ", start=" + start +
                    ", docs=" + docs +
                    '}';
        }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public class FacetCounts{
        private FacetFields facet_fields;

        public FacetFields getFacet_fields() {
            return facet_fields;
        }

        public void setFacet_fields(FacetFields facet_fields) {
            this.facet_fields = facet_fields;
        }

        @Override
        public String toString() {
            return "FacetCounts{" +
                    "facet_fields=" + facet_fields +
                    '}';
        }

        @JsonIgnoreProperties(ignoreUnknown = true)
        public class FacetFields{
            private ArrayList<String> collName_s;

            public ArrayList<String> getCollName_s() {
                return collName_s;
            }

            public void setCollName_s(ArrayList<String> collName_s) {
                this.collName_s = collName_s;
            }

            @Override
            public String toString() {
                return "FacetFields{" +
                        "collName_s=" + collName_s +
                        '}';
            }
        }
    }
}

