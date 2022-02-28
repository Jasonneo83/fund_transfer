<%@ WebHandler Language="C#" Class="GenericHandler1" %>

using System;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.IO;

public class GenericHandler1 : IHttpHandler
{

  string salt = "jstarmdbo123$";

  public void ProcessRequest(HttpContext context)
  {
    try
    {
      var sign = context.Request["signin"];

      if (!String.IsNullOrEmpty(sign))
      {

        var date1 = DateTime.Now.ToString("yyyyMMddHHmm");
        var date2 = DateTime.Now.AddMinutes(-1).ToString("yyyyMMddHHmm");
        var date3 = DateTime.Now.AddMinutes(-2).ToString("yyyyMMddHHmm");
        var date4 = DateTime.Now.AddMinutes(-3).ToString("yyyyMMddHHmm");
        var date5 = DateTime.Now.AddMinutes(-4).ToString("yyyyMMddHHmm");
        var date6 = DateTime.Now.AddMinutes(-5).ToString("yyyyMMddHHmm");
        var date7 = DateTime.Now.AddMinutes(-6).ToString("yyyyMMddHHmm");
        var date8 = DateTime.Now.AddMinutes(-7).ToString("yyyyMMddHHmm");
        var date9 = DateTime.Now.AddMinutes(-8).ToString("yyyyMMddHHmm");
        var date10 = DateTime.Now.AddMinutes(-9).ToString("yyyyMMddHHmm");
        var date11 = DateTime.Now.AddMinutes(-10).ToString("yyyyMMddHHmm");
        var date12 = DateTime.Now.AddMinutes(-11).ToString("yyyyMMddHHmm");
        var date13 = DateTime.Now.AddMinutes(-12).ToString("yyyyMMddHHmm");
        var date14 = DateTime.Now.AddMinutes(-13).ToString("yyyyMMddHHmm");
        var date15 = DateTime.Now.AddMinutes(-14).ToString("yyyyMMddHHmm");
        var date16 = DateTime.Now.AddMinutes(-15).ToString("yyyyMMddHHmm");

        var hash1 = GenerateHash(date1, salt);
        var hash2 = GenerateHash(date2, salt);
        var hash3 = GenerateHash(date3, salt);
        var hash4 = GenerateHash(date4, salt);
        var hash5 = GenerateHash(date5, salt);
        var hash6 = GenerateHash(date6, salt);
        var hash7 = GenerateHash(date7, salt);
        var hash8 = GenerateHash(date8, salt);
        var hash9 = GenerateHash(date9, salt);
        var hash10 = GenerateHash(date10, salt);
        var hash11 = GenerateHash(date11, salt);
        var hash12 = GenerateHash(date12, salt);
        var hash13 = GenerateHash(date13, salt);
        var hash14 = GenerateHash(date14, salt);
        var hash15 = GenerateHash(date15, salt);
        var hash16 = GenerateHash(date16, salt);

        //ErrorLog(sign + " vs " + hash1);
        //ErrorLog(sign + " vs " + hash2);

        context.Response.ContentType = "text/plain";
        if (sign == hash1 || sign == hash2 || sign == hash3 || sign == hash4 || sign == hash5 || sign == hash6 || sign == hash7 || sign == hash8 || sign == hash9 || sign == hash10 || sign == hash11 || sign == hash12 || sign == hash13 || sign == hash14 || sign == hash15 || sign == hash16)
        {
          context.Response.Write("true");
        }
        else {
		      context.Response.StatusCode = 403;
        }
      }

    }
    catch (Exception exp)
    {
      ErrorLog("ProcessRequest: " + exp.Message);
    }

  }

  public bool IsReusable
  {
    get
    {
      return false;
    }
  }

  private static string GenerateHash(string value, string salt)
  {
    var hmacSHA1 = new HMACSHA1(Encoding.ASCII.GetBytes(salt));
    var data = hmacSHA1.ComputeHash(Encoding.ASCII.GetBytes(value));
    return Convert.ToBase64String(data);
  }

  public static void ErrorLog(string sMessage)
  {
    string logDirectory = AppDomain.CurrentDomain.BaseDirectory + "api/log/";

    if (!Directory.Exists(logDirectory))
      Directory.CreateDirectory(logDirectory);

    string sFilePath = logDirectory + DateTime.Now.ToString("yyyyMMdd") + ".log";

    using (StreamWriter objSw = new StreamWriter(sFilePath, true))
    {
      objSw.WriteLine(DateTime.Now.ToString() + " " + sMessage);
    }

  }

}
