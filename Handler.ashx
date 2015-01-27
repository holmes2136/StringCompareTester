<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using Algorithms;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        HttpRequest req = context.Request;
        HttpResponse resp = context.Response;


        string str1 = req.QueryString["str1"].ToString();
        string str2 = req.QueryString["str2"].ToString();


        float score1 = JaroWinklerDistance.GetDistance(str1, str2);
        float score2 = LevenshteinDistance.GetDistance(str1, str2);
        float score3 = new NGramDistance().GetDistance(str1, str2);
        
        context.Response.ContentType = "application/json";
        Dictionary<string, float> result = new Dictionary<string, float>();
        result.Add("jaro", score1);
        result.Add("leven", score2);
        result.Add("ngram", score3);
        
        string json = new JavaScriptSerializer().Serialize(result);        
        resp.Write(json);
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}