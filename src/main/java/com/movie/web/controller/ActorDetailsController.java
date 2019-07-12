package com.movie.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class ActorDetailsController {

    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/delete-actor", method = RequestMethod.GET)
    public String deleteActor(Model model, @RequestParam("id") String id) {

        final String uri = "http://localhost:8081/actors/delete/" + id;
        restTemplate.delete(uri);

        Object movies = restTemplate.getForObject("http://localhost:8081/movies/get-all", Object.class);
        model.addAttribute("movies", movies);

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);

        return "home";
    }
}
