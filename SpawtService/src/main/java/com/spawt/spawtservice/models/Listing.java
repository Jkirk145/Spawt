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
    
    public String Street;

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

    public String getDogsOK() {
        return DogsOK;
    }

    public void setDogsOK(String DogsOK) {
        this.DogsOK = DogsOK;
    }

    public String getCatsOK() {
        return CatsOK;
    }

    public void setCatsOK(String CatsOK) {
        this.CatsOK = CatsOK;
    }

    public String getLargeDogsOK() {
        return LargeDogsOK;
    }

    public void setLargeDogsOK(String LargeDogsOK) {
        this.LargeDogsOK = LargeDogsOK;
    }

    public String getMediumDogsOK() {
        return MediumDogsOK;
    }

    public void setMediumDogsOK(String MediumDogsOK) {
        this.MediumDogsOK = MediumDogsOK;
    }

    public String getSmallDogsOK() {
        return SmallDogsOK;
    }

    public void setSmallDogsOK(String SmallDogsOK) {
        this.SmallDogsOK = SmallDogsOK;
    }

    public String getInsurance() {
        return Insurance;
    }

    public void setInsurance(String Insurance) {
        this.Insurance = Insurance;
    }

    public String[] getAmenities() {
        return Amenities;
    }

    public void setAmenities(String[] Amenities) {
        this.Amenities = Amenities;
    }
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
    public String City;
    public String State;
    public String Zip;
    public String Rooms;
    public String SquareFt;
    public String Rent;
    public String DogsOK;
    public String CatsOK;
    public String LargeDogsOK;
    public String MediumDogsOK;
    public String SmallDogsOK;
    public String Insurance;
    public String[] Amenities;
    
    
}
