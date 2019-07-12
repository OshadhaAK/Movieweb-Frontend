package com.movie.web.controller;

import com.movie.web.domain.Actor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

@Controller
public class AddActorController {
    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/actors/add-actor", method = RequestMethod.GET)
    public String addActor(ModelMap model) {

        model.addAttribute("message", new Actor());
        return "add-actor";

    }

    @RequestMapping(value = "/home/actor-added", method = RequestMethod.POST)
    public String formSubmit(@ModelAttribute("message") Actor actor, Model model) {

        final String uri = "http://localhost:8081/actors/add-actor";

        Actor obj = new Actor();
        obj.setName(actor.getName());
        obj.setDateofbirth(actor.getDateofbirth());
        obj.setDescription(actor.getDescription());

        Object addedactor = restTemplate.postForObject( uri, obj, Object.class);


        Object movies = restTemplate.getForObject("http://localhost:8081/movies/get-all", Object.class);
        model.addAttribute("movies", movies);

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);


        return "home";
    }
}
