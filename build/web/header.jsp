<%@page contentType="text/html" pageEncoding="UTF-8"%><%@page import="java.io.*" %><!DOCTYPE html>
<!-- Template by Quackit.com -->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Migrant</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS: You can use this stylesheet to override any Bootstrap styles and/or apply your own styles -->
    <link href="css/custom.css" rel="stylesheet">
    <link href="imgs/ico.png" rel="icon" type="image/png"/>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Logo and responsive toggle -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                	<span class="glyphicon glyphicon-globe"></span> 
                	Migrant Worker
                </a>
            </div>
            <!-- Navbar links -->
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="adminlogin.jsp">Admin</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Company <span class="caret"></span></a>
                        <ul class="dropdown-menu" aria-labelledby="about-us">
                            <li><a href="dologin.jsp">Login</a></li>
                            <li><a href="doregn.jsp">Register</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Migrant <span class="caret"></span></a>
                        <ul class="dropdown-menu" aria-labelledby="about-us">
                            <li><a href="userlogin.jsp">Login</a></li>
                            <li><a href="userregn.jsp">Register</a></li>
                        </ul>
                    </li>                    
                </ul>		

            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="jumbotron feature">
        <div class="container">
        <h1><span class="glyphicon glyphicon-globe"></span> Migrant Workers</h1>
        <p>Assistance and Tracking System</p>
        <!--p><a class="btn btn-default" href="#">Engage Now</a></p-->
        </div>
    </div>

    <!-- Content -->
    <div class="container">

        <!-- Heading -->
        <div class="row">
            <div class="col-lg-12"><%@include file="db.jsp"%>