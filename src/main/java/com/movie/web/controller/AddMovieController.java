package com.movie.web.controller;

import com.movie.web.domain.Actor;
import com.movie.web.domain.Movie;
import com.movie.web.ui.MovieBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@RequestMapping(value = "/movies")
@Controller
public class AddMovieController {

    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping(value = "/add-movie", method = RequestMethod.GET)
    public String addMovie(ModelMap model) {

        model.addAttribute("message", new MovieBean());

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);

        return "add-movie";

    }

    @RequestMapping(value = "/submit-movie", method = RequestMethod.POST)
    public String formMovie(@ModelAttribute("message") MovieBean movieBean, Model model) {

        final String uri = "http://localhost:8081/movies/add-movie";

        Movie obj = new Movie();
        obj.setName(movieBean.getName());
        obj.setYear(movieBean.getYear());
        obj.setGenre(movieBean.getGenre());

        List<String> actorsIdList = new ArrayList<String>();
        String[] idArray = movieBean.getActors().split(",");
        for (String id : idArray){
            actorsIdList.add(id);
        }

        obj.setActors(actorsIdList);
        obj.setDescription(movieBean.getDescription());
        obj.setLink(movieBean.getLink());


        Object addedmovie = restTemplate.postForObject( uri, obj, Object.class);

        Object movies = restTemplate.getForObject("http://localhost:8081/movies/get-all", Object.class);
        model.addAttribute("movies", movies);

        Object actors = restTemplate.getForObject("http://localhost:8081/actors/get-all", Object.class);
        model.addAttribute("actors", actors);

        model.addAttribute("message");
        return "home";
    }

}
