package ex6;

import java.sql.Timestamp;

public class MemberVO {
    private int       id;
    private String    userid;
    private String    password;
    private String    username;
    private String    email;
    private Timestamp regDate;

    public int getId()                        { return id; }
    public void setId(int id)                 { this.id = id; }

    public String getUserid()                 { return userid; }
    public void setUserid(String userid)      { this.userid = userid; }

    public String getPassword()               { return password; }
    public void setPassword(String password)  { this.password = password; }

    public String getUsername()               { return username; }
    public void setUsername(String username)  { this.username = username; }

    public String getEmail()                  { return email; }
    public void setEmail(String email)        { this.email = email; }

    public Timestamp getRegDate()             { return regDate; }
    public void setRegDate(Timestamp regDate) { this.regDate = regDate; }
}