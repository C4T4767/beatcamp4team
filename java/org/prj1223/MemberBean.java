package org.prj1223;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberBean {
    private String id;
    private String pwd;
    private String name;
    private char gender;
    private String email;
    private String birth;
    private String zipcode;
    private String address;
    private String[] hobby;
    private String job;
}
