<cfapplication name="drl" clientmanagement="yes" sessionmanagement="yes" setclientcookies="yes" setdomaincookies="yes">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">

<html xmlns="http://www.w3.org/1999/xhtml">

<!--- Set Datasource --->
	<cfset dsn = "drl_mysql5">

<!--- JQUERY --->
	<!--- i believe this version of jquery is required for the slideshow to work properly. check this at a later date --->
<script type="text/javascript" src="galleriffic-2.0/js/jquery-1.3.2.js"></script>


<!--- Link to default body font from Google --->
	<link href='http://fonts.googleapis.com/css?family=PT+Sans:regular,italic,bold&subset=latin' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Cantarell:700' rel='stylesheet' type='text/css'>

	<link href='http://fonts.googleapis.com/css?family=Cantarell:400,700' rel='stylesheet' type='text/css'>

	<link href="styles/navbar.css" rel="stylesheet" type="text/css" />

<!--- Galleriffic --->
    <link href="styles/galleriffic_old.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jquery.galleriffic.js"></script>


<!--- jScrollPane --->
	<!-- styles needed by jScrollPane -->
	<link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="all" />
	
	<!-- the mousewheel plugin - optional to provide mousewheel support -->
	<script type="text/javascript" src="scripts/jquery.mousewheel.js"></script>
	
	<!-- the jScrollPane script -->
	<script type="text/javascript" src="scripts/jquery.jscrollpane.min.js"></script>

<!--- the accordion menu --->
	<!---<script type="text/javascript" src="../scripts/accordion.js"></script>--->
    <link href="styles/accordion.css" rel="stylesheet" type="text/css" />
    

<!--- Image rollover for On The Boards --->
<!--- Courtesy of http://cssglobe.com/post/1695/easiest-tooltip-and-image-preview-using-jquery --->
	<script type="text/javascript" src="scripts/image_rollover.js"></script>


<!--- QueryToArray function --->
<!--- Courtesy of: Ben Nadel --->
<!--- (http://www.bennadel.com/blog/124-Ask-Ben-Converting-a-Query-to-an-Array.htm) --->
<cffunction name="QueryToArray" access="public" returntype="array" output="false"
hint="This turns a query into an array of structures.">

<!--- Define arguments. --->
<cfargument name="Data" type="query" required="yes" />

<cfscript>

// Define the local scope.
var LOCAL = StructNew();

// Get the column names as an array.
LOCAL.Columns = ListToArray( ARGUMENTS.Data.ColumnList );

// Create an array that will hold the query equivalent.
LOCAL.QueryArray = ArrayNew( 1 );

// Loop over the query.
for (LOCAL.RowIndex = 1 ; LOCAL.RowIndex LTE ARGUMENTS.Data.RecordCount ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){

// Create a row structure.
LOCAL.Row = StructNew();

// Loop over the columns in this row.
for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE ArrayLen( LOCAL.Columns ) ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){

// Get a reference to the query column.
LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];

// Store the query cell value into the struct by key.
LOCAL.Row[ LOCAL.ColumnName ] = ARGUMENTS.Data[ LOCAL.ColumnName ][ LOCAL.RowIndex ];

}

// Add the structure to the query array.
ArrayAppend( LOCAL.QueryArray, LOCAL.Row );

}

// Return the array equivalent.
return( LOCAL.QueryArray );

</cfscript>
</cffunction>
<title>DRL Associates, Inc. | Architects</title>
 