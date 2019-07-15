package com.movie.web.controller;

import com.movie.web.domain.Actor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class ActorDetailsController {

    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/actors/delete-actor", method = RequestMethod.GET)
    public String deleteActor(Model model, @RequestParam("id") String id) {

        final String uri = "http://localhost:8081/actors/delete/" + id;
        restTemplate.delete(uri);

        Object movies = restTemplate.getForObject("http://localhost:8081/movies/get-all", Object.class);
        model.addAttribute("movies", movies);

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);

        return "home";
    }

    @RequestMapping(value = "/actors/update-actor", method = RequestMethod.GET)
    public String updateActor(Model model, @RequestParam("id") String id) {

        final String uri = "http://localhost:8081/actors/get/" + id;

        Object actor = restTemplate.getForObject(uri,Object.class);

        model.addAttribute("actor",actor);

        model.addAttribute("message", new Actor());

        return "update-actor";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@ModelAttribute("message") Actor actor,Model model, @RequestParam("id") String id) {

        model.addAttribute("actor",actor);
        model.addAttribute("message", new Actor());
        final String uri = "http://localhost:8081/actors/modify/" + id;

        Actor obj = new Actor();
        obj.setName(actor.getName());
        obj.setDateofbirth(actor.getDateofbirth());
        obj.setDescription(actor.getDescription());
        obj.setLink(actor.getLink());

        restTemplate.put(uri,obj);

        Object movies = restTemplate.getForObject("http://localhost:8081/movies/get-all", Object.class);
        model.addAttribute("movies", movies);

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);



        return "home";
    }

}
