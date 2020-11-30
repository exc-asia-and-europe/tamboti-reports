xquery version "3.1";

declare variable $home external;
declare variable $target external;

declare function local:set-special-permissions($path as xs:anyURI) {
    (
        sm:chown($path, "admin")
        ,
        sm:chgrp($path, "dba")
        ,
        sm:chmod($path, "rwsr-xr-x")
    )
};

(    
    (: set special permissions for xquery scripts :)
    local:set-special-permissions(xs:anyURI($target || "/reports/data-inconsistencies.xq"))
	,
    local:set-special-permissions(xs:anyURI($target || "/reports/reports.xqm"))
    ,    
    sm:chmod(xs:anyURI($target || "/modules/administration/fix-for-duplicated-aces.xq"), "rwsr-x---")    
)
