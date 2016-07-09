package com.samridhdhi;

/**
 * Created by randhirsingh on 09/07/16.
 */
public class Student {
    public  int id;
    public String  name, father, mother, dob, additional, gender;

    public Student(int id, String name, String gender,String dob, String father, String mother, String additional ) {
        this.id = id;
        this.name = name;
        this.father = father;
        this.mother = mother;
        this.dob = dob;
        this.additional = additional;
        this.gender = gender;
    }
}
