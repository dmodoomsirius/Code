Set objRootDSE = GetObject ("LDAP://rootDSE")
Set objContainer = GetObject ("LDAP://cn=Users, " & objRootDSE.Get("defaultNamingContext"))

'* Specifies how many users you want created. DO NOT do 1000. Microsoft does not like that many.
For i = 1 to 200
    Set objLeaf = objContainer.create("User", "cn=UserNo" & i)
    objLeaf.Put "sAMAccountName", "UserNo" & i
    objLeaf.SetInfo
Next
Wscript.echo "200 Users Created."