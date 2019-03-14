$var = Get-ChildItem C:\
foreach($element in $var)
{
    if ($element.mode -match "d")
    {
        $element.FullName.Substring($element.FullName.LastIndexOf('\')+1)
    }
}