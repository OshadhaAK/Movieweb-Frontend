package com.movie.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class HomeController {

    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String showMovies(Model model) {

        Object movies = restTemplate.getForObject("http://localhost:8081/movies/get-all", Object.class);
        model.addAttribute("movies", movies);

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);

        return "home";

    }

    @RequestMapping(value = "movies/movie-details", method = RequestMethod.GET)
    public String movieDetail(Model model, @RequestParam("id") String id) {

        final String uri = "http://localhost:8081/movies/get/" + id;

        Object movie = restTemplate.getForObject(uri,Object.class);

        model.addAttribute("message",movie);


        return "movie-details";
    }






}
