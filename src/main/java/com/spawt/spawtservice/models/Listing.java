/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spawt.spawtservice.models;

import javax.persistence.*;

/**
 *
 * @author johnkirksey
 */
@Entity
@Table(name="Listing")
public class Listing {
    
    public Listing()
    {
        
    }
    
    public String Street;
    public String City;
    public String State;
    public String Zip;
    public String Rooms;
    public String SquareFt;
    public String Rent;
    public int DogsOK = 0;
    public int CatsOK = 0;
    public int LargeDogsOK = 0;
    public int MediumDogsOK = 0;
    public int SmallDogsOK = 0;
    public int Insurance = 0;
    //public String[] Amenities;
    
    
    public String getStreet() {
        return Street;
    }

    public void setStreet(String Street) {
        this.Street = Street;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getState() {
        return State;
    }

    public void setState(String State) {
        this.State = State;
    }

    public String getZip() {
        return Zip;
    }

    public void setZip(String Zip) {
        this.Zip = Zip;
    }

    public String getRooms() {
        return Rooms;
    }

    public void setRooms(String Rooms) {
        this.Rooms = Rooms;
    }

    public String getSquareFt() {
        return SquareFt;
    }

    public void setSquareFt(String SquareFt) {
        this.SquareFt = SquareFt;
    }

    public String getRent() {
        return Rent;
    }

    public void setRent(String Rent) {
        this.Rent = Rent;
    }

    public int getDogsOK() {
        return DogsOK;
    }

    public void setDogsOK(int DogsOK) {
        this.DogsOK = DogsOK;
    }

    public int getCatsOK() {
        return CatsOK;
    }

    public void setCatsOK(int CatsOK) {
        this.CatsOK = CatsOK;
    }

    public int getLargeDogsOK() {
        return LargeDogsOK;
    }

    public void setLargeDogsOK(int LargeDogsOK) {
        this.LargeDogsOK = LargeDogsOK;
    }

    public int getMediumDogsOK() {
        return MediumDogsOK;
    }

    public void setMediumDogsOK(int MediumDogsOK) {
        this.MediumDogsOK = MediumDogsOK;
    }

    public int getSmallDogsOK() {
        return SmallDogsOK;
    }

    public void setSmallDogsOK(int SmallDogsOK) {
        this.SmallDogsOK = SmallDogsOK;
    }

    public int getInsurance() {
        return Insurance;
    }

    public void setInsurance(int Insurance) {
        this.Insurance = Insurance;
    }

    /*public String[] getAmenities() {
        return Amenities;
    }

    public void setAmenities(String[] Amenities) {
        this.Amenities = Amenities;
    }*/
    
    public int ListingID;
    
    @Id
    @Column(name="ListingID")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public int getListingID() {
        return ListingID;
    }

    public void setListingID(int ListingID) {
        this.ListingID = ListingID;
    }


    
    
}
