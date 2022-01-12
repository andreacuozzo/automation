#region Syspass

Function Get-SyspassClientSearch
   
  {

  [CmdletBinding()]
    Param(

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $client,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $auth_token,

        [string] $syspass_url,
        [string] $invoke_timeout

        )

    $Body = @{"jsonrpc"="2.0";"id"="181";"params"=@{"authToken"= $auth_token}}
    $Body.method = 'client/search'
    $Body.params.text = $client
 
    $result = Invoke-RestMethod -ContentType "application/json" -Method 'Post' -Uri $syspass_url  -Body ($body|ConvertTo-Json) -TimeoutSec $invoke_timeout

    return $result

   }

Function Get-SyspassCategorySearch
   
  {

  [CmdletBinding()]
    Param(

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $category,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $auth_token,

        [string] $syspass_url,
        [string] $invoke_timeout

        )

    $Body = @{"jsonrpc"="2.0";"id"="181";"params"=@{"authToken"= $auth_token}}
    $Body.method = 'category/search'
    $Body.params.text = $category
 
    $result = Invoke-RestMethod -ContentType "application/json" -Method 'Post' -Uri $syspass_url  -Body ($body|ConvertTo-Json) -TimeoutSec $invoke_timeout

    return $result

   }

Function Get-SyspassTagSearch
   
  {

  [CmdletBinding()]
    Param(

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $auth_token,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $syspass_url,

        [string] $Tag,
        [string] $invoke_timeout

        )

    $Body = @{"jsonrpc"="2.0";"id"="181";"params"=@{"authToken"= $auth_token}}
    $Body.method = "tag/search"
    $Body.params.text = $tag
	
    $result = Invoke-RestMethod -ContentType "application/json" -Method 'Post' -Uri $syspass_url  -Body ($body|ConvertTo-Json) -TimeoutSec $invoke_timeout

    return $result

    }

Function Get-SyspassAccountSearch

    {

    [CmdletBinding()]
    Param(

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $auth_token,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $syspass_url,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $account,

        [int] $categoryId = $null,
        [int] $clientId = $null,
        [string[]] $tagsid = $null,
        [string] $invoke_timeout
        )

    $Body = @{"jsonrpc"="2.0";"id"="181";"params"=@{"authToken"= $auth_token}}
    $Body.method = 'account/search'
    $Body.params.text = $account

    if ($categoryID) { $Body.params.categoryId = $categoryId }
    if ($clientId)   { $Body.params.clientId   = $clientId }
    if ($tagsid)     { $Body.params.tagsId     = $tagsid }

    $result = Invoke-RestMethod -ContentType "application/json" -Method 'Post' -Uri $syspass_url  -Body ($body|ConvertTo-Json) -TimeoutSec $invoke_timeout

    return $result

}

Function Get-SyspassAccountViewPass

    {
    [CmdletBinding()]
    Param(

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $auth_token,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $tokenPass,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $userID,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $syspass_url,

        [int] $detail = 0,
        [string] $invoke_timeout
        )

    $Body = @{"jsonrpc"="2.0";"id"="181";"params"=@{"authToken"= $auth_token}}
    $Body.method = 'account/viewPass'
    $Body.params.tokenPass = $tokenPass
    $Body.params.id = $userId 

    if ($details) { $Body.params.details = $details }

    $result = Invoke-RestMethod -ContentType "application/json" -Method 'Post' -Uri $syspass_url  -Body ($body|ConvertTo-Json) -TimeoutSec $invoke_timeout

    return $result

}

Function New-SyspassAccountCreate

    {
    [CmdletBinding()]
    Param(

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $auth_token,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $tokenPass,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $name,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [int] $categoryId,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [int] $clientID,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $pass,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $syspass_url,

        [string[]] $tagsid = $null,

        [string] $login,

        [string] $invoke_timeout
        )

    $Body = @{"jsonrpc"="2.0";"id"="181";"params"=@{"authToken"= $auth_token}}
    $Body.method = 'account/create'
    $Body.params.tokenPass = $tokenPass
    $Body.params.name = $name
    $Body.params.categoryId = $categoryId
    $Body.params.clientId = $clientId
    $Body.params.pass = $pass
    $Body.params.login = $login

    if ($tagsid)     { $Body.params.tagsId     = $tagsid }

    $result = Invoke-RestMethod -ContentType "application/json" -Method 'Post' -Uri $syspass_url  -Body ($body|ConvertTo-Json) -TimeoutSec $invoke_timeout

    return $result

}
Function Get-UserPassword
    {
    [CmdletBinding()]
    Param(

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $auth_token,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $tokenPass,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $account,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string] $syspass_url,

        [string] $client,

        [string] $category,

        [string] $tag,

        [string] $invoke_timeout

        )
    #---------------------
    # CLIENT SEARCH
    #---------------------
    if ($client)
        {
        $client_result = Get-SyspassClientSearch -auth_token $auth_token -client $client -syspass_url $syspass_url -invoke_timeout $invoke_timeout

        $clientId = $client_result.result.result.id
        }

    #---------------------
    # CATEGORY SEARCH
    #---------------------
    if ($category)
        {
        $category_result = Get-SyspassCategorySearch -auth_token $auth_token -category $category -syspass_url $syspass_url -invoke_timeout $invoke_timeout

        $categoryId = $category_result.result.result.id
        }

    #---------------------
    # TAG SEARCH
    #---------------------
    if ($tag)
        {
        $tag_result = Get-SyspassTagSearch -auth_token $auth_token -Tag $tag -syspass_url $syspass_url -invoke_timeout $invoke_timeout

        $tagId = $tag_result.result.result.id
        }

    #---------------------
    # ACCOUNT SEARCH
    #---------------------
    $account_result = Get-SyspassAccountSearch -auth_token $auth_token -account $account -syspass_url $syspass_url -tagsid $tagId -invoke_timeout $invoke_timeout

    $userId  = $account_result.result.result.id

    $login   = $account_result.result.result.login

    #---------------------
    # PASSWORD VIEW
    #---------------------
    $password_result = Get-SyspassAccountViewPass -auth_token $auth_token -tokenPass $tokenPass -userID $userID -syspass_url $syspass_url -invoke_timeout $invoke_timeout

    $password = $password_result.result.result.password

    return $login,$password

    }

#endregion