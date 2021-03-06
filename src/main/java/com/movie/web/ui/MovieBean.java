package com.movie.web.ui;

import java.util.ArrayList;

public class MovieBean {

    public String name;
    public int year;
    public String genre;
    public String actors;
    public String description;
    public String link;


    public MovieBean() {
    }

    public MovieBean(String name, int year, String genre, String actors, String description, String link) {
        this.name = name;
        this.year = year;
        this.genre = genre;
        this.actors = actors;
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

    public String getActors() {
        return actors;
    }

    public void setActors(String actors) {
        this.actors = actors;
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
