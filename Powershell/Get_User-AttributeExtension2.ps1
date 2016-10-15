#Author: Juan Caicedo
#This script will get content from a pre-prepared CSV file and loop through the users provided and provide information on a specific attribute.
#In this case extensionAttribute2.  We use a CSV file here instead of targeting an OU for a user base.

#Get the content from a CSV
Get-Content "c:\scripts\Fix_Student_License_Attribute.csv" | ForEach-Object{ #For every object in the csv file
#Get a user Filter Nothing and provide all properties.  Proceed to select Name and Extension attribute2.  Finally export to a CSV without Type information.    
Get-ADUser -filter * -properties *| Select-Object Name, extensionAttribute2| Export-Csv C:\Scripts\test.csv -NoTypeInformation
}