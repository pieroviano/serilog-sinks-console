mklink /j Packages ..\WhenTheVersion\Packages
del ..\WhenTheVersion\Packages\Net4x.Serilog.Sinks.Console.*
rmdir /s /q %userprofile%\.nuget\Packages\Net4x.Serilog.Sinks.Console
del "src\Serilog.Sinks.Console\bin\%Configuration%\Net4x.Serilog.Sinks.Console.*"
MSBuild.exe serilog-sinks-console.sln -t:clean
MSBuild.exe serilog-sinks-console.sln -t:restore -p:RestorePackagesConfig=true
MSBuild.exe serilog-sinks-console.sln -m /property:Configuration=%Configuration% 
git add -A
git commit -a --allow-empty-message -m ''
git push
