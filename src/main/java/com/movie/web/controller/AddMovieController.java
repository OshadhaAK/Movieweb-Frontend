package com.movie.web.controller;

import com.movie.web.domain.Actor;
import com.movie.web.domain.Movie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

@Controller
public class AddMovieController {

    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/movies/add-movie", method = RequestMethod.GET)
    public String addMovie(ModelMap model) {

        model.addAttribute("message", new Movie());

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);

        return "add-movie";

    }

    @RequestMapping(value = "/home/movie-added", method = RequestMethod.POST)
    public String formMovie(@ModelAttribute("message") Movie movie, Model model) {

        final String uri = "http://localhost:8081/movies/add-movie";

        Movie obj = new Movie();
        obj.setName(movie.getName());
        obj.setYear(movie.getYear());
        obj.setGenre(movie.getGenre());
        obj.setActors(movie.getActors());
        obj.setDescription(movie.getDescription());
        obj.setLink(movie.getLink());


        Object addedmovie = restTemplate.postForObject( uri, obj, Object.class);

/*
        Object movies = restTemplate.getForObject("http://localhost:8081/movies/get-all", Object.class);
        model.addAttribute("movies", movies);

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);*/

        model.addAttribute("message");
        return "home";
    }
}
