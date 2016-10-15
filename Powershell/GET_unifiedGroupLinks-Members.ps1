#In this script, we will do the same as with our Get-UnifiedGroup script, but here we are looking for the members of the group.
$Groups = Get-UnifiedGroup -ResultSize Unlimited
 $Groups | ForEach-Object {
 $group = $_
 Get-UnifiedGroupLinks -Identity $group.Name -LinkType Members | ForEach-Object {
       New-Object -TypeName PSObject -Property @{
        Group = $group.DisplayName
        Member = $_.Name
        EmailAddress = $_.PrimarySMTPAddress
        RecipientType= $_.RecipientType
 }}} |Export-Csv "C:\Scripts\Output.csv" -notypeinformation