controladdin MyProgressBar
{
    Scripts = 'src/BC/script.js';
    StartupScript = 'src/BC/startup.js';
    StyleSheets = 'src/BC/style.css';
    MinimumHeight = 50;
    MaximumHeight = 50;
    HorizontalStretch = true;

    event IamReady();

    procedure setProgress(Progress:Integer)
    
}