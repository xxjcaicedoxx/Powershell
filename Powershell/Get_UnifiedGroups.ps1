#In this script, we will get ALL Office365 groups in our tenant and for Each object get the Group, Member, Email Address, Recipient
$Groups = Get-UnifiedGroup -ResultSize Unlimited
$Groups | ForEach-Object {
$group = $_
Get-UnifiedGroupLinks -Identity $group.Name -LinkType Members | ForEach-Object {
      New-Object -TypeName PSObject -Property @{
       Group = $group.DisplayName
       Member = $_.Name
       EmailAddress = $_.PrimarySMTPAddress
       RecipientType= $_.RecipientType
}}} |
 
Export-CSV "c:\Mycomputer_Destination.csv" -NoTypeInformation -Encoding UTF8