<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
	
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Bootswatch: Minty</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="/resources/docs/4/minty/bootstrap.css" media="screen">
    <link rel="stylesheet" href="/resources/docs/_assets/css/custom.min.css">
    <script>

     var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-23019901-1']);
      _gaq.push(['_setDomainName', "bootswatch.com"]);
        _gaq.push(['_setAllowLinker', true]);
      _gaq.push(['_trackPageview']);

     (function() {
       var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
       ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
     })();

    </script>
  </head>
  <body>
    <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
      <div class="container">
        <a href="/resources/docs/" class="navbar-brand">Bootswatch</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="themes">Themes <span class="caret"></span></a>
              <div class="dropdown-menu" aria-labelledby="themes">
                <a class="dropdown-item" href="/resources/docs/default/">Default</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/resources/docs/cerulean/">Cerulean</a>
                <a class="dropdown-item" href="/resources/docs/cosmo/">Cosmo</a>
                <a class="dropdown-item" href="/resources/docs/cyborg/">Cyborg</a>
                <a class="dropdown-item" href="/resources/docs/darkly/">Darkly</a>
                <a class="dropdown-item" href="/resources/docs/flatly/">Flatly</a>
                <a class="dropdown-item" href="/resources/docs/journal/">Journal</a>
                <a class="dropdown-item" href="/resources/docs/litera/">Litera</a>
                <a class="dropdown-item" href="/resources/docs/lumen/">Lumen</a>
                <a class="dropdown-item" href="/resources/docs/lux/">Lux</a>
                <a class="dropdown-item" href="/resources/docs/materia/">Materia</a>
                <a class="dropdown-item" href="/resources/docs/minty/">Minty</a>
                <a class="dropdown-item" href="/resources/docs/pulse/">Pulse</a>
                <a class="dropdown-item" href="/resources/docs/sandstone/">Sandstone</a>
                <a class="dropdown-item" href="/resources/docs/simplex/">Simplex</a>
                <a class="dropdown-item" href="/resources/docs/sketchy/">Sketchy</a>
                <a class="dropdown-item" href="/resources/docs/slate/">Slate</a>
                <a class="dropdown-item" href="/resources/docs/solar/">Solar</a>
                <a class="dropdown-item" href="/resources/docs/spacelab/">Spacelab</a>
                <a class="dropdown-item" href="/resources/docs/superhero/">Superhero</a>
                <a class="dropdown-item" href="/resources/docs/united/">United</a>
                <a class="dropdown-item" href="/resources/docs/yeti/">Yeti</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/resources/docs/help/">Help</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="https://blog.bootswatch.com">Blog</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="download">Minty <span class="caret"></span></a>
              <div class="dropdown-menu" aria-labelledby="download">
                <a class="dropdown-item" target="_blank" href="https://jsfiddle.net/bootswatch/3bojykn2/">Open in JSFiddle</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/resources/docs/4/minty/bootstrap.min.css" download>bootstrap.min.css</a>
                <a class="dropdown-item" href="/resources/docs/4/minty/bootstrap.css" download>bootstrap.css</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="/resources/docs/4/minty/_variables.scss" download>_variables.scss</a>
                <a class="dropdown-item" href="/resources/docs/4/minty/_bootswatch.scss" download>_bootswatch.scss</a>
              </div>
            </li>
          </ul>

          <ul class="nav navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="https://wrapbootstrap.com/?ref=bsw" target="_blank">WrapBootstrap</a>
            </li>
          </ul>

        </div>
      </div>
    </div>


    <div class="container">
      
        <!-- jquery download -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
