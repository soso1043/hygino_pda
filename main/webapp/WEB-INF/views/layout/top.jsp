<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="theme-color" content="#3063A0">
    <title>MES</title>
    <link rel="apple-touch-icon" sizes="144x144" href="<c:url value='/resources/assets/apple-touch-icon.png'/>">
    <link rel="shortcut icon" href="<c:url value='/resources/assets/favicon.ico'/>">
    <link href="https://fonts.googleapis.com/css?family=Fira+Sans:400,500,600" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/open-iconic/css/open-iconic-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/fontawesome/css/all.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/theme.min.css'/>" data-skin="default">
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/theme-dark.min.css'/>" data-skin="dark">
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/custom.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/AlertifyJS/1.13.1/css/alertify.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css"/>
    <!-- Disable unused skin immediately -->
    <script>
    var skin = localStorage.getItem('skin') || 'default';
    var isCompact = JSON.parse(localStorage.getItem('hasCompactMenu'));
    var disabledSkinStylesheet = document.querySelector('link[data-skin]:not([data-skin="'+ skin +'"])');
    // Disable unused skin immediately
    disabledSkinStylesheet.setAttribute('rel', '');
    disabledSkinStylesheet.setAttribute('disabled', true);
    // add flag class to html immediately
    if (isCompact == true) document.querySelector('html').classList.add('preparing-compact-menu');
    </script>
    <!-- END THEME STYLES -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/open-iconic/css/open-iconic-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/fontawesome/css/all.min.css'/>">
    <!-- datatables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.20/af-2.3.4/b-1.6.1/cr-1.5.2/fc-3.3.0/fh-3.1.6/kt-2.5.1/r-2.2.3/rg-1.1.1/rr-1.2.6/sc-2.0.1/sp-1.0.1/sl-1.3.1/datatables.min.css"/>

    <!-- BEGIN PAGE LEVEL STYLES -->
    <style>
    .page-sidebar {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    display: flex;
    flex-direction: column;
    /*
    width: 30rem;
    max-width: 30rem;
    */
    width: 30rem;
    max-width: 22.5rem;
    background-color: #ffffff;
    border-left: 1px solid rgba(34, 34, 48, 0.1);
    box-shadow: none;
    overflow: auto;
    z-index: 1029;
    transform: translate3d(100%, 0, 0);
    transition: transform 200ms ease-in-out;
    }

    /*
    @media (min-width: 768px) {
    .has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 30rem);
    max-width: calc(100vw - 30rem);
    }
    }
    */

    /*
    @media (min-width: 1200px) {
    .has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 37.5rem);
    max-width: calc(100vw - 37.5rem);
    }
    }
    */

    @media (min-width: 576px) {
    .has-sidebar-expand-sm .app-main > .app-footer,
    .has-sidebar-expand-sm .page-inner {
    margin-right: 30rem;
    }
    .has-sidebar-expand-sm .page-sidebar {
    transform: translate3d(0, 0, 0);
    }
    .has-sidebar-open .has-sidebar-expand-sm .page-sidebar {
    position: absolute;
    top: 0;
    transform: translate3d(100%, 0, 0);
    }
    .has-sidebar-expand-sm.has-sidebar-fluid .page-inner {
    margin-right: calc(100vw - 37.5rem);
    }
    .has-sidebar-expand-sm.has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 37.5rem);
    max-width: calc(100vw - 37.5rem);
    }
    }

    @media (min-width: 768px) {
    .has-sidebar-expand-md .app-main > .app-footer,
    .has-sidebar-expand-md .page-inner {
    margin-right: 30rem;
    }
    .has-sidebar-expand-md .page-sidebar {
    transform: translate3d(0, 0, 0);
    }
    .has-sidebar-open .has-sidebar-expand-md .page-sidebar {
    position: absolute;
    top: 0;
    transform: translate3d(100%, 0, 0);
    }
    .has-sidebar-expand-md.has-sidebar-fluid .page-inner {
    margin-right: calc(100vw - 37.5rem);
    }
    .has-sidebar-expand-md.has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 37.5rem);
    max-width: calc(100vw - 37.5rem);
    }
    }

    @media (min-width: 992px) {
    .has-sidebar-expand-lg .app-main > .app-footer,
    .has-sidebar-expand-lg .page-inner {
    margin-right: 30rem;
    }
    .has-sidebar-expand-lg .page-sidebar {
    transform: translate3d(0, 0, 0);
    max-width: 30rem;
    }
    .has-sidebar-open .has-sidebar-expand-lg .page-sidebar {
    position: absolute;
    top: 0;
    transform: translate3d(100%, 0, 0);
    }
    .has-sidebar-expand-lg.has-sidebar-fluid .page-inner {
    margin-right: calc(100vw - 37.5rem);
    }
    .has-sidebar-expand-lg.has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 37.5rem);
    max-width: calc(100vw - 37.5rem);
    }
    }

    @media (min-width: 1200px) {
    .has-sidebar-expand-xl .app-main > .app-footer,
    .has-sidebar-expand-xl .page-inner {
    margin-right: 30rem;
    }
    .has-sidebar-expand-xl .page-sidebar {
    transform: translate3d(0, 0, 0);
    }
    .has-sidebar-open .has-sidebar-expand-xl .page-sidebar {
    position: absolute;
    top: 0;
    transform: translate3d(100%, 0, 0);
    }
    .has-sidebar-expand-xl.has-sidebar-fluid .page-inner {
    margin-right: calc(100vw - 37.5rem);
    }
    .has-sidebar-expand-xl.has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 37.5rem);
    max-width: calc(100vw - 37.5rem);
    }
    }

    .has-sidebar-expand .app-main > .app-footer,
    .has-sidebar-expand .page-inner {
    margin-right: 30rem;
    }
    
    </style>
    <!-- END PAGE LEVEL STYLES -->
</head>
