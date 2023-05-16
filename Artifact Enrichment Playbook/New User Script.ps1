$UserList = Import-Csv -Path 'C:\Users\nmumaw\Desktop\new_user.csv'

foreach ($User in $UserList) {

     $Attributes = @{

        Enabled = $true
        ChangePasswordAtLogon = $false
        PasswordNeverExpires = $true

        Name = "$($User.First) $($User.Last)"
        UserPrincipalName = "$($User.First)$($User.Last[0])@mumaw-lab.net"
        SamAccountName = "$($User.First)$($User.Last[0])"
		EmailAddress = "$($User.First)_$($User.Last)@company.com"

        GivenName = $User.First
        Surname = $User.Last
		DisplayName = "$($User.First) $($User.Last)"

        Company = $User.Company
        Department = $User.Department
        Title = $User.Title
		Office = "Remote"
		OfficePhone = $User.Phone

        Manager = $User.Manager
		
        AccountPassword = $User.Password | ConvertTo-SecureString -AsPlainText -Force

     }
	 
	 New-ADUser @Attributes
}
