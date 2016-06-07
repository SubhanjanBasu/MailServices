using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;

public partial class SIGNUP1 : System.Web.UI.Page
{
    dbConnection cn = new dbConnection();
    dbConnection cn1 = new dbConnection();
    SqlDataReader dr;
    string email,username,pass,fullname;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_OnClick(object sender, EventArgs e)
    {
        if (TextBox1.Text.ToString() == "" || TextBox2.Text.ToString() == "" || TextBox3.Text.ToString() == "" || TextBox4.Text.ToString() == "" || TextBox5.Text.ToString() == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('FILL UP ALL THE FIELDS');</script>");
        }
        else
        {
            //Table Name SIGNUP

            cn.sqlQuery("SELECT * FROM SIGNUP");
            dr = cn.getdata;

            while (dr.Read())
            {
                if ((dr.GetValue(2).ToString() == TextBox1.Text) || (dr.GetValue(4).ToString() == Email.Text))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('USERNAME or Email ALREADY EXISTS');</script>");
                    TextBox3.Text = "";
                    Email.Text = "";
                }

            }
           
                cn.closeDataReader();
                cn.closeCommand();
                cn.closeConnection();

                if (Page.IsValid)
                {
                    try
                    {
                        string random = genCode();
                        email = Email.Text.ToString();
                        fullname = TextBox1.Text.ToString();
                        username = TextBox3.Text.ToString();
                        pass = TextBox5.Text.ToString();
                        cn.insupdel("INSERT INTO SIGNUP VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + Email.Text + "','" + random + "')");
                        cn.closeDataReader();
                        cn.closeConnection();
                        cn.closeCommand();
                        sendMsg(email, fullname, username, pass, random);
                        Session["newEmail"] = username;
                        Response.Redirect("Activation.aspx");
                        
                    }
                    catch (Exception msg1)
                    {
                        Response.Write(msg1);
                    }



                }
            }
                
            
            cn.closeDataReader();
            cn.closeCommand();
            cn.closeConnection();


            
        
    }

    //Generate Random Number
    public String genCode()
    {
        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        var stringChars = new char[8];
        var random = new Random();

        for (int i = 0; i < stringChars.Length; i++)
        {
            stringChars[i] = chars[random.Next(chars.Length)];
        }

        var finalString = new String(stringChars);
        return finalString;
    }
    
    
    //Send Mail
    public static void sendMsg(string email,string fullname,string username,string pass,string random)
    {

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("project2016budgetizer@gmail.com", "budgetizer2016");
        smtp.EnableSsl = true;

        MailMessage msg = new MailMessage();
        msg.Subject = "Hello "+fullname;
        msg.Body = "Hello "+fullname+"Thanks for Registering in Budgetize...Your Account Details are given below:";
        msg.Body += "<tr>";
        msg.Body += "<td>User Name :" + username + "</td>";
        msg.Body += "</tr>";
        msg.Body += "<tr>";
        msg.Body +="<td>Password :" + pass + "</td>";
        msg.Body += "</tr>";
        msg.Body += "<tr>";
        msg.Body += "<td>Activation Number :" + random + "</td>";
        msg.Body += "</tr>";

        msg.Body += "<tr>";
        msg.Body += "<td>Thanking</td><td>Team Budgetize</td>";
        msg.Body += "</tr>";

        string toAddress = email; // Add Recepient address
        msg.To.Add(toAddress);

        string fromAddress = "\"Budgetize \" <project2016budgetizer@gmail.com>";
        msg.From = new MailAddress(fromAddress);
        msg.IsBodyHtml = true;

        try
        {
            smtp.Send(msg);

        }
        catch
        {
            throw;
        }
    }
}
