package com.movie.web.domain;

public class Actor {

    public String name;
    public String dateofbirth;
    public String description;
    public String link;

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Actor() {
    }

    public Actor(String name, String dateofbirth, String description) {
        this.name = name;
        this.dateofbirth = dateofbirth;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateofbirth() {
        return dateofbirth;
    }

    public void setDateofbirth(String dateofbirth) {
        this.dateofbirth = dateofbirth;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
