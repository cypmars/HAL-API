package com.polytech.web;

/**
 * Created by Cyprien on 27/09/2017.
 */

import com.polytech.dataAPI.HALRequest;
import com.polytech.dataAPI.HALValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


@Controller
@RequestMapping("/search")
public class SearchController extends HttpServlet{

    @RequestMapping(value="/articles", method = RequestMethod.POST)
    public static String searchArticles(Model model){
        return "search";
    }

    @RequestMapping(value="/laboratories", method = RequestMethod.POST)
    public static String searchLaboratories(Model model){
       String request = "https://api.archives-ouvertes.fr/search/?q=text:*&rows=0&wt=json&indent=true&facet=true&facet.field=collName_s";
        RestTemplate restTemplateHal = new RestTemplate();
        HALRequest halRequest = restTemplateHal.getForObject(request, HALRequest.class);
        ArrayList<String> listeLab = halRequest.getFacet_counts().getFacet_fields().getCollName_s();

        model.addAttribute("values", listeLab);
        return "laboratories";
    }

    @RequestMapping(value="/universities", method = RequestMethod.POST)
    public static String searchUniversities(Model model){
        return "search";
    }

    @RequestMapping(value="/coAuthors", method = RequestMethod.POST)
    public static String searchCoAuthors(Model model){
        return "search";
    }

}