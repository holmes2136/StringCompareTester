<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <label>string 1:&nbsp<input type="text" id="str1" value="" /></label><br /><br />
        <label>string 2:&nbsp<input type="text" id="str2" value="" /></label><br /><br />
        <input type="button" id="btn_Compare" value="Compare"/><br /><br />

        
        <table border="1px" id="result">
            <thead>
                <th>Algorithms</th>
                <th>Score</th>
            </thead>
            <tbody>
                <tr>
                <td>JaroWinklerDistance</td>
                <td></td>
                </tr>
                <tr><td>LevenshteinDistance</td>
                <td></td>
                </tr>
                 <tr><td>NGram</td>
                <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>

    <script type="text/javascript" src="Scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">

        $("#btn_Compare").click(function (e) {
            e.preventDefault();
            var str1 = $("#str1").val();
            var str2 = $("#str2").val();

            if (str1 != '' && str2 != '') {

                $.ajax({
                    type: "GET",
                    async: true,
                    url: "Handler.ashx",
                    data: { str1: str1, str2: str2 }
                }).done(function (resp) {
                    var $tr = $("#result").find("tbody tr");
                    var score1 = resp.jaro;
                    var score2 = resp.leven;
                    var score3 = resp.ngram;
                    $($tr[0]).find("td:eq(1)").text(score1);
                    $($tr[1]).find("td:eq(1)").text(score2);
                    $($tr[2]).find("td:eq(1)").text(score3);
                }).fail(function (xhr) {
                    console.log(xhr);
                });
            }
          

        });
    
    </script>
</body>
</html>
