<?php
$host = "MySQLC11.webcontrolcenter.com";
$user = "drlarchitect";
$pw = "TXQ5yUpBhKGsmXap";
$db = "drlarchitectsdb2";
$query = "select Clients.Clientname, Projects.City, states.statename, Gallery.Filename from Projects join states on Projects.fkState = states.s_id join Clients on Projects.fkClients = Clients.idClients join Gallery on Gallery.fkProjects = Projects.idProjects where Projects.Active = 1 and Gallery.Active = 1 group by idProjects";
//$query = "select Filename,Active from Gallery where Active = 1 and Oversized = 1";
?>
