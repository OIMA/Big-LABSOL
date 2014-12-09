<%-- 
    Document   : index
    Created on : Nov 27, 2014, 9:23:19 PM
    Author     : oima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Oscar Iván Martínez Arce">

        <title>Big-Labsol</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#" id="test">
                        <img src="http://labsol.org.mx/assets/img/labsol.png" style="height:45px; width:120px;margin-top: -12px; margin-left: 45px;" alt="Labsol" />
                    </a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>John Smith</strong>
                                        <span class="pull-right text-muted">
                                            <em>Yesterday</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>John Smith</strong>
                                        <span class="pull-right text-muted">
                                            <em>Yesterday</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <strong>John Smith</strong>
                                        <span class="pull-right text-muted">
                                            <em>Yesterday</em>
                                        </span>
                                    </div>
                                    <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>Read All Messages</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                        <!-- /.dropdown-messages -->
                    </li>
                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-tasks">
                            <li>
                                <a href="#">
                                    <div>
                                        <p>
                                            <strong>Task 1</strong>
                                            <span class="pull-right text-muted">40% Complete</span>
                                        </p>
                                        <div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                <span class="sr-only">40% Complete (success)</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <p>
                                            <strong>Task 2</strong>
                                            <span class="pull-right text-muted">20% Complete</span>
                                        </p>
                                        <div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                                <span class="sr-only">20% Complete</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <p>
                                            <strong>Task 3</strong>
                                            <span class="pull-right text-muted">60% Complete</span>
                                        </p>
                                        <div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                                <span class="sr-only">60% Complete (warning)</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <p>
                                            <strong>Task 4</strong>
                                            <span class="pull-right text-muted">80% Complete</span>
                                        </p>
                                        <div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                                <span class="sr-only">80% Complete (danger)</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>See All Tasks</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                        <!-- /.dropdown-tasks -->
                    </li>
                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-comment fa-fw"></i> New Comment
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                        <span class="pull-right text-muted small">12 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-tasks fa-fw"></i> New Task
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <div>
                                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                        <span class="pull-right text-muted small">4 minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>See All Alerts</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                        <!-- /.dropdown-alerts -->
                    </li>
                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <!--/input-group--> 
                            </li><!--Busqueda-->
                            <li>
                                <a class="text-success" href="#">
                                    <i class="fa fa-dashboard fa-fw"></i> 
                                    Monitoreo del clúster
                                    <span class="fa arrow"></span>
                                </a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a class="ambari text-success" href="#"><i class="glyphicon glyphicon-eye-open "></i> Monitoreo de recursos<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a class="ambari text-success link" href="#" url="${monitorRecursos}">Monitor de recursos</a>
                                            </li>
                                            <li>
                                                <a class="ambari text-success link" href="#" url="${cargaRecursos}">Carga de recursos</a>
                                            </li>
                                        </ul>
                                        <!-- /.nav-third-level -->
                                    </li>
                                    <li>
                                        <a class="text-success" href="#"><i class="glyphicon glyphicon-eye-open "></i> Monitoreo de servicios<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a class="ambari text-success link" href="#" url="${monitorServicios}">Monitor de servicios</a>
                                            </li>
                                            <li>
                                                <a class="ambari text-success link" href="#" url="${monitorTareas}">Monitor de tareas</a>
                                            </li>
                                            <li>
                                                <a class="ambari text-success link" href="#" url="${monitorHosts}">Monitor de hosts</a>
                                            </li>
                                        </ul>
                                        <!-- /.nav-third-level -->
                                    </li>
                                    <li>
                                        <a class="ambari text-success link" href="#" url="${administradoresCluster}">Administradores de clúster</a>
                                    </li>
                                </ul>
                            </li><!--Cluster-->
                            <li>
                                <a class="text-success" href="#"><i class="fa fa-database fa-fw"></i> Bases de datos<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a class="text-success" href="#"><i class="glyphicon glyphicon-share fa-fw"></i> Crear base de datos<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a class="hue text-success link" href="#" url="${crearTabla}">Crear tabla</a>
                                            </li>
                                            <li>
                                                <a class="hue text-success link" href="#" url="${crearBaseDatos}">Crear base de datos</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="text-success" href="#"><i class="glyphicon glyphicon-eye-open"></i> Consultar base de datos<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a class="hue text-success link" href="#" url="${crearConsulta}">Crear consulta</a>
                                            </li>
                                            <li>
                                                <a class="hue text-success link" href="#" url="${misConsultas}">Mis consultas</a>
                                            </li>
                                            <li>
                                                <a class="hue text-success link" href="#" url="${listaConsultas}">Lista de consultas</a>
                                            </li>
                                            <li>
                                                <a class="hue text-success link" href="#" url="${historialConsultas}">Historial de consultas</a>
                                            </li>
                                        </ul>
                                        <!-- /.nav-third-level -->
                                    </li>
                                    <li>
                                        <a class="hue text-success link" href="#" url="${verTablas}">Ver tablas</a>
                                    </li>
                                    <li>
                                        <a class="hue text-success link" href="#" url="${verBaseDatos}">Ver Base de datos</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li><!--Bases de datos Beeswax-->
                            <li class="">
                                <a class="text-success" href="#"><i class="fa fa-bullseye"></i> Rutinas de oozie<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a class="hue text-success link" href="#" url="${monitorRutinas}">Monitor de rutinas</a>
                                    </li>
                                    <li>
                                        <a class="text-success" href="#"><i class="glyphicon glyphicon-share fa-fw"></i> Administrador de rutinas<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a class="hue text-success link" href="#">Ver rutinas</a>
                                            </li>
                                            <li>
                                                <a class="hue text-success link" href="#">Crear rutina</a>
                                            </li>
                                            <li>
                                                <a class="hue text-success link" href="#">Importar rutina</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="text-success" href="#"><i class="glyphicon glyphicon-share fa-fw"></i> Coordinaci&oacute;n de rutinas<span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a class="hue text-success link" href="#" url="${verCoordinadores}">Ver coordinadores</a>
                                            </li>
                                            <li>
                                                <a class="hue text-success link" href="#" url="${crearCoordinadores}">Crear coordinador</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a class="hue text-success link" href="#" url="${enlazadorRutinas}">Enlazador de rutinas</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li><!--Oozie-->
                            <li class="">
                                <a class="text-success" href="#"><i class="fa fa-terminal fa-fw"></i> Shell<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a class="hue text-success link" href="#" url="${monitorTareas}">Pig</a>
                                    </li>
                                    <li>
                                        <a class="text-success " href="#" >HBase</a>
                                    </li>
                                    <li>
                                        <a class="text-success " href="#" >bash</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li><!--Shell-->

                            <li class="">
                                <a class="text-success" href="#"><i class="fa fa-archive fa-fw"></i> Administrador de archivos</a>
                            </li><!--Administrador de archivos-->
                            <li class="">
                                <a class="text-success" href="#"><i class="fa fa-spinner fa-fw"></i> Administrador de trabajos<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a class="text-success" href="#"> Monitor de trabajos</a>
                                    </li>
                                    <li>
                                        <a class="text-success " href="#" > Crear trabajos</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li><!--Administrador de trabajos-->
                            <li class="">
                                <a class="text-success" href="#"><i class="fa fa-users fa-fw"></i> Administradores<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a class="text-success" href="#">Monitoreo ambari</a>
                                    </li>
                                    <li>
                                        <a class="text-success " href="#" >Administración Hue</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li><!--Usuarios-->
                            <li class="">
                                <a class="text-success" href="#"><i class="fa fa-gears fa-fw"></i> Configuraci&oacute;n<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a class="text-success" href="#">Configuraci&oacute;n de servicios</a>
                                    </li>
                                    <li>
                                        <a class="text-success " href="#" >Configuraci&oacute;n pendiente</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li><!--Configuracion-->
                            <li class="">
                                <a class="text-success" href="#"><i class="fa fa-files-o fa-fw"></i> Logs<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a class="" href="#">Logs del servidor</a>
                                    </li>
                                    <li>
                                        <a class="text-success " href="#" >Configuraci&oacute;n pendiente</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li><!--logs-->
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="" style=" padding: 0;margin-left: -2.5%;margin-top: -43px;  height: 100%; width: 107.5%;">
                            <iframe id="iframe" src="http://www.labsol.org.mx/" scrolling="yes" frameborder="0" 
                                    style="height: 100%; width: 100%; overflow: hidden;">
                            <h1 class="">Tu navegador no soporta IFrames</h1>
                            </iframe>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/sb-admin-2.js"></script>

        <script src="js/dashboard.js"></script>
    </body>

</html>

