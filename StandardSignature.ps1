$strName = $env:username

$strFilter = "(&(objectCategory=User)(samAccountName=$strName))"

$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.Filter = $strFilter
$objPath = $objSearcher.FindOne()
$objUser = $objPath.GetDirectoryEntry()

$strName = $objUser.FullName
$strTitle = $objUser.Title
$strCompany = $objUser.Company
$strCred = $objUser.info
$strStreet = $objUser.StreetAddress
$strPhone = $objUser.telephoneNumber
$strCity = $objUser.l
$strPostCode = $objUser.PostalCode
$strCountry = $objUser.co
$strEmail = $objUser.mail

$UserDataPath = 'C:\Temp' #$Env:appdata
$FolderLocation = $UserDataPath # + 'C:\Temp\'
#mkdir $FolderLocation -force

$stream = [System.IO.StreamWriter] "$FolderLocation\\$strName.html"
$stream.WriteLine("<HTML><HEAD><TITLE>Signature</TITLE>")
$stream.WriteLine("<!DOCTYPE HTML PUBLIC`"-//W3C//DTD HTML 4.0 Transitional//EN`">")
$stream.WriteLine("<METAhttp-equiv=Content-Type content=`"text/html; charset=UTF8`">")
$stream.WriteLine("<BODY>")
$stream.WriteLine("<B><SPAN style=`"FONT-SIZE: 10pt; COLOR: gray; font-weight: normal; font-family: Arial`" > С уважением </B><BR>")
$stream.WriteLine("<SPAN style=`"FONT-SIZE: 11pt; COLOR: gray; font-family: Arial`">   <BR>")
$stream.WriteLine("<B><SPAN style=`"FONT-SIZE: 10pt; COLOR: gray; font-weight: 600; font-family: Arial`" >" + $strName + "</B><BR>")
$stream.WriteLine("<SPAN style=`"FONT-SIZE: 9pt; COLOR: gray; font-family: Arial`">"+ $strTitle[0] + "<BR>")
$stream.WriteLine("<SPAN style=`"FONT-SIZE: 7pt; COLOR: gray; font-family: Arial`">" + $strCountry[0] + "<BR>" + $strPostCode + " " + $strCity[0] + "<BR>" + $strStreet[0] + "</SPAN><BR><BR>")
$stream.WriteLine("<B><img src=`"C:\Temp\logo.png`"  width=`"110`" height=`"110`"><BR>")
$stream.WriteLine("<SPAN style=`"FONT-SIZE: 11pt; COLOR: gray; font-family: Arial`">   <BR>")
$stream.WriteLine("<SPAN style=`"FONT-SIZE: 7pt; COLOR: gray; font-family: Arial`"> АО `"НПФ `"БУДУЩЕЕ`"<BR>")
$stream.WriteLine("<SPAN style=`"FONT-SIZE: `7pt; COLOR: gray; font-family: Arial`"> Phone: +7 (495) 980-6530 (# " + $strPhone + " ), <a href=`"mailto:"+ $strEmail +"`">ELityushkin@futurenpf.ru</a> <br>"+ " ")
$stream.WriteLine("<B><SPAN style=`"FONT-SIZE: 7pt; COLOR: gray; font-family: Arial`" > 127051, г. Москва, Цветной бульвар, д. 2, БЦ «Легенда Цветного», вход D </B><BR>")
$stream.WriteLine("<B><a href=`"http://futurenpf.ru`">НПФБУДУЩЕЕ.РФ</a></p></B><BR>")
$stream.WriteLine("")
$stream.WriteLine("")
$stream.close()
