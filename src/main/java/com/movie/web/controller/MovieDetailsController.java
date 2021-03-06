package com.movie.web.controller;

import com.movie.web.domain.Actor;
import com.movie.web.domain.Movie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
public class MovieDetailsController {

    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/movies/delete-movie", method = RequestMethod.GET)
    public String deleteMovie(Model model, @RequestParam("id") String id) {

        final String uri = "http://localhost:8081/movies/delete/" + id;
        restTemplate.delete(uri);

        Object movies = restTemplate.getForObject("http://localhost:8081/movies/get-all", Object.class);
        model.addAttribute("movies", movies);

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);

        return "home";
    }

    @RequestMapping(value = "/movies/update-movie", method = RequestMethod.GET)
    public String updateMovie(Model model, @RequestParam("id") String id) {

        final String uri = "http://localhost:8081/movies/get/" + id;

        Object movie = restTemplate.getForObject(uri,Object.class);

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);


        model.addAttribute("movie",movie);

        model.addAttribute("message", new Movie());

        return "update-movie";
    }
    @RequestMapping(value = "/movies/update", method = RequestMethod.POST)
    public String update(@ModelAttribute("message") Movie movie, Model model, @RequestParam("id") String id) {

        model.addAttribute("movie",movie);
        model.addAttribute("message", new Movie());
        final String uri = "http://localhost:8081/movies/modify/" + id;

        Movie obj = new Movie();
        obj.setName(movie.getName());
        obj.setYear(movie.getYear());
        obj.setGenre(movie.getGenre());
        obj.setActors(movie.getActors());
        obj.setDescription(movie.getDescription());
        obj.setLink(movie.getLink());
        restTemplate.put(uri,obj);

        Object movies = restTemplate.getForObject("http://localhost:8081/movies/get-all", Object.class);
        model.addAttribute("movies", movies);

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);



        return "home";
    }

}
