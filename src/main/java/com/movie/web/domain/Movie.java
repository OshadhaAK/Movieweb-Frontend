package com.movie.web.domain;

import java.util.ArrayList;
import java.util.List;

public class Movie {

    public String name;
    public int year;
    public String genre;
    public List<String> actorIds;
    public String description;
    public String link;


    public Movie() {
    }

    public Movie(String name, int year, String genre, List<String> actorIds, String description, String link) {
        this.name = name;
        this.year = year;
        this.genre = genre;
        this.actorIds = actorIds;
        this.description = description;
        this.link = link;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public List<String> getActors() {
        return actorIds;
    }

    public void setActors(List<String> actors) {
        this.actorIds = actors;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
