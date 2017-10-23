package com.polytech.web;

import com.polytech.dataAPI.HALRequest;
import com.polytech.dataAPI.HALValue;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * Created by Cyprien on 26/09/2017.
 */
@Controller
@ComponentScan(basePackages = {"com.polytech.web"})
public class HALController{

    @RequestMapping("/halArticles")
    public static String halArticles(HttpServletRequest request, Model model){
        String searchArg = request.getParameter("checkbox");
        String value = request.getParameter("value");

        String halString = "";
        if (searchArg != null)
        {
            switch (searchArg){
                case "keyword":
                    halString = "http://api.archives-ouvertes.fr/search/?q=text:" + value + "&wt=json&fl=title_s AND authFirstName_s AND authLastName_s AND labStructName_s AND authLastNameFirstName_s AND uri_s";
                    break;
                case "labo":
                    value = '"'+value+'"';
                    halString = "http://api.archives-ouvertes.fr/search/?q=text:" + value + "&wt=json&fl=title_s AND authFirstName_s AND authLastName_s AND labStructName_s AND uri_s";
                    break;
                case "coauth":
                    halString = "http://api.archives-ouvertes.fr/search/?q=text:" + value + "&wt=json&fl=title_s AND authFirstName_s AND authLastName_s AND AND authLastNameFirstName_s AND labStructName_s AND uri_s";
                    break;
            }
        }
        else
        {
            halString = "http://api.archives-ouvertes.fr/search/?q=text:" + value + "&wt=json&fl=title_s AND authFirstName_s AND authLastName_s AND labStructName_s AND uri_s";
        }
        RestTemplate restTemplateHal = new RestTemplate();
        HALRequest halRequest = restTemplateHal.getForObject(halString, HALRequest.class);
        ArrayList<HALValue> halValues = halRequest.getResponse().getDocs();


        if (searchArg != null)
        {
            switch (searchArg){
                case "keyword":
                    model.addAttribute("values", halValues);
                    return "result2";

                case "labo":
                    ArrayList<String> labMap = new ArrayList<>();
                    for (HALValue hal : halValues)
                    {
                        for (String lab : hal.getLabStructName_s())
                        {
                            if (!labMap.contains(lab) )
                            {
                                labMap.add(lab);
                            }
                        }
                    }
                    labMap.sort(String::compareTo);
                    model.addAttribute("values", labMap);
                    return "laboratories2";

                case "coauth":
                    ArrayList<String> authMap = new ArrayList<>();
                    ArrayList<String> removeMap = new ArrayList<>();
                    for (HALValue hal : halValues)
                    {
                        int index = 0;
                        for (String auth : hal.getAuthLastNameFirstName_s())
                        {
                            System.out.println(auth);
                            if (!auth.contains(value.substring(0,1).toUpperCase()+value.substring(1,value.length())) && !authMap.contains(auth)
                                    && !authMap.contains(hal.getAuthFirstName_s().get(index) + " " + hal.getAuthLastName_s().get(index))
                                        &&!authMap.contains(hal.getAuthLastName_s().get(index) + " " + hal.getAuthFirstName_s().get(index)))
                            {
                                boolean ajout = true;
                                for (String str: authMap)
                                {
                                    if (str.contains(hal.getAuthLastName_s().get(index)))
                                    {
                                        if (str.length() > hal.getAuthLastNameFirstName_s().get(index).length())
                                        {
                                            ajout = false;
                                        }
                                        else
                                        {
                                            removeMap.add(str);
                                        }
                                    }
                                }
                                if (ajout)
                                {
                                    authMap.add(auth);
                                }
                            }
                            index += 1;
                        }
                        for (String str: authMap)
                        {
                            for (String remove: removeMap)
                            {
                                if (str.equals(remove))
                                {
                                    authMap.remove(remove);
                                }
                            }
                        }
                    }
                    authMap.sort(String::compareTo);
                    model.addAttribute("values", authMap);
                    return "coauth2";
            }
        }
        model.addAttribute("values", halValues);
        return "result2";
    }

    @RequestMapping(value="/halLaboratories", method=RequestMethod.GET)
    public static String halLaboratories(HttpServletRequest request, Model model){
        String labName = request.getParameter("lab");
        labName.replaceAll("-", "\\-");
        labName = '"'+labName+'"';
        System.out.println(request.getParameter("lab"));

        String halString = "http://api.archives-ouvertes.fr/search/?q=collName_s:"+ labName +"&wt=json&fl=title_s AND authFirstName_s AND authLastName_s AND labStructName_s AND uri_s";
        System.out.println(halString);
        RestTemplate restTemplateHal = new RestTemplate();
        HALRequest halRequest = restTemplateHal.getForObject(halString, HALRequest.class);
        ArrayList<HALValue> halValues = halRequest.getResponse().getDocs();
        model.addAttribute("values", halValues);
        return "result";
    }

    @RequestMapping("/halUniversities")
    public static String halUniversities(HttpServletRequest request, Model model){
        String name = request.getParameter("name");
        return "result";
    }

    @RequestMapping("/halCoAuthors")
    public static String halCoAuthors(HttpServletRequest request, Model model){
        return "result";
    }
}
