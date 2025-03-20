data coordenadas;
    input latitude longitude local $;
    datalines;
    -23.5505 -46.6333 "São Paulo"
    -22.9068 -43.1729 "Rio de Janeiro"
    -15.7942 -47.8822 "Brasília"
    ;
run;

proc sgmap plotdata=coordenadas;
    openstreetmap;
    scatter x=longitude y=latitude / markerattrs=(symbol=circlefilled color=red size=12);
    text x=longitude y=latitude text=local / position=right;
run;