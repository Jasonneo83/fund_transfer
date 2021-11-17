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

        var hash1 = GenerateHash(date1, salt);
        var hash2 = GenerateHash(date2, salt);

        ErrorLog(sign + " vs " + hash1);
        ErrorLog(sign + " vs " + hash2);

        context.Response.ContentType = "text/plain";
        if (sign == hash1 || sign == hash2)
        {
          context.Response.Write("true");
        }
        else {
          context.Response.Write("false");
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
