@echo off
REM Create Perl Directory 
REM copy ActivePerl from Downloads directory into perl directory

Set DirBase="C:\Users\Mike\Desktop\"


mkdir %DirBase%\Perl
copy  %DirBase%\ActivePerl.msi %DirBase%\Perl\ActivePerl.msi