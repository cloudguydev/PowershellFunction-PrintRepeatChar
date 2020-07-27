<#
   .Synopsis
   A Power-shell function that counts and Prints a repeating character in a given input string character.

   .Description
    This function uses ordered hashset to store input strings and get-enumeration method to get
    count of repeating character on input string.

    .Parameter Start
      Mandatory string input parameter.

    .Parameter Value
     The function declares that the value must be a string, not digits and that the parameter is mandatory.
     It also checks to see if the value is null or empty. If the value is null or empty, the function throws and exception error,
    otherwise function call as normal.
    
    .Function written by: 
        Norbert Obiekwe
#>

 function findAndPrintFirstRepeatCharInaString {
 [CmdletBinding()]
 param(
      [Parameter(Mandatory=$true,HelpMessage="Enter charachter strings only.")]
      [ValidatePattern("[a-z]")]
      [ValidateNotNullorEmpty()]
      [String]$inPutString
      )
  
      #declare hashtable set to hold input string

         $setHashSet = [ordered]@{}

       #traverse the input characters string and count the chars,Pipe into the foreach-object
       #test for increments and add if not

       $inPutString.ToLower().ToCharArray() | foreach { 

       if($setHashSet.$PSItem) 
       
       {   
           $setHashSet.$PSItem += 1
       }
       else
       {
         $setHashSet += @{$PSItem = 1}
       }
    }
      #using the get-enumerator method to access the hashset table.
      #filtering chars occurence with the where-object, then selecting the first occurance of the char.

      $checkInputString = $setHashSet.GetEnumerator() | where Value -ne 1 | select  -First 1
     
      #checking if there is no repeating character on the input value.Printing a no-repeat char found message
  
      if ($checkinputString)
         {
          Write-Host ("Repeating character found,printing the first repeat character") 
          Write-Output ($checkInputString)
         }
      else
        {
          "No repeat character found in the input value"
        }
   }
     findAndPrintFirstRepeatCharInaString
  
