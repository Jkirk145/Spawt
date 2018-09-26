package com.spawt.spawtservice.models;
 
import java.io.Serializable;
import javax.persistence.*;

 
@Entity
@Table(name="Picture")
public class Picture implements Serializable {
    
    public Picture(){
     
    }
    private int ListingId;
    private String imageLink;
    private String tag;
    
    @Column(name= "ListingID")
    public int getListingId(){
        return ListingId;
    }
    
    public void setListingId(int listing){
        this.ListingId = listing;
    }
    
    @Column(name="PictureLink")
    public String getImageLink(){
        return imageLink;
    }
    
    public void setImageLink(String image){
        this.imageLink = image;
    }
    
    @Column(name="Tag")
    public String getTag(){
        return tag;
    }
    
    public void setTag(String tag){
        this.tag = tag;
    }
    
    private int PictureID;
    
    @Id
    @Column(name="PictureID")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public int getPictureID() {
        return PictureID;
    }
    
    public void setPictureID(int PictureID) {
        this.PictureID = PictureID;
    }
     
}

