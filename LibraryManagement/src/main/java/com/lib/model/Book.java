package com.lib.model;

public class Book {

    private int id;
    private String title;
    private int quanity;
    private int availableQuantity;
    private String images_url;

    //default constructor
    public Book() {
    }

    // constructor
    public Book(int id, String title, int quanity, int availableQuantity, String images_url) {
        this.id = id;
        this.title = title;
        this.quanity = quanity;
        this.availableQuantity = availableQuantity;
        this.images_url = images_url;
    }

    /*
    getter 
    setter
     */
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getQuanity() {
        return quanity;
    }

    public void setQuanity(int quanity) {
        this.quanity = quanity;
    }

    public int getAvailableQuantity() {
        return availableQuantity;
    }

    public void setAvailableQuantity(int availableQuantity) {
        this.availableQuantity = availableQuantity;
    }

    public String getImages_url() {
        return images_url;
    }

    public void setImages_url(String images_url) {
        this.images_url = images_url;
    }

}
