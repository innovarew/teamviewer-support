::
:: @file teamviewer-support.bat
:: @version v1.1
:: @description
::  A handy script for remote technical support using TeamViewer
::  Usage: Download & Run to start a TeamViewer remote connection
::
:: @url https://innovarew.appspot.com/
:: @author Innovarew <innovarew.solutions (at) gmail (dot) com>
:: @copyright (C) 2018 Innovarew Solutions. All Rights Reserved.
:: @license Proprietary and confidential
::     Unauthorized copying of this file, via any medium is strictly prohibited.
:: Contact us if you are interested in using our products and services.
::
:: Changelog:
::
:: [dd/mm/yyyy]        [author]
:: [brief description]
::
:: 26/12/2018        innovarew
:: Initial version
::

@echo off

:: Prevent double-click execution
if %0 == "%~0" (
    echo [*]
    echo [*] [TeamViewer] Starting Remote Technical Support . . .
    echo [*]
    pause
)

set cwd=%~dp0
set tv_bat=%cwd%\teamviewer-support.bat
set tv_dir=%cwd%\TeamViewerPortable
set tv_file=%cwd%\TeamViewerPortable.zip
set tv_url=https://download.teamviewer.com/download/TeamViewerPortable.zip

:: Download TeamViewer
cd %cwd%
ping download.teamviewer.com -n 1
powershell -command "& { if (!(Test-Path %tv_dir%)) { Invoke-WebRequest %tv_url% -OutFile %tv_file%; Expand-Archive %tv_file% -DestinationPath %tv_dir%; } }"

:: make bat file readonly
attrib +r %tv_bat%

:: Start TeamViewer
%tv_dir%\TeamViewer.exe

