program significados;
uses crt;
var
entrada,salida,pregunta,pal,sin,lim,sin2,signi : string;
bus,bus_dp,h,sinp,bus_ig,i,q,q2,es,es2,k,cont,w,bus_sl : byte;
fin : byte;


procedure limpiador;
  begin
    q:=pos(pregunta,entrada);
    q:=q - 2;
    delete(entrada,1,q);
  end;

procedure busqueda;
  begin
     h:=0;
     bus:=pos(pregunta,entrada);
     {bus_dp=busqueda dos puntos}
     bus_dp:=pos(':',entrada);
    { bus_dp:=bus_dp - 1;}
     h:=bus_dp-bus;
     pal:=copy(entrada,bus,h)

  end;




procedure sinonimos;
  begin
    bus_ig:=pos('=',entrada);
    i:=bus_ig-bus_dp;

    sin:=copy(entrada,bus_dp,i);
    cont:=0;


    for k:=1 to length(sin)do
      begin
        if(sin[k]=' ') then
          cont:=cont+1;

      end;
    for k:=1 to cont+1 do
    begin
      if(k<>cont+1) then
        begin
          sin2:=copy(sin,1,pos(' ',sin));
          write('    ',k,')',sin2);
          delete(sin,1,pos(' ',sin));
        end
      else
        begin
          sin2:=sin;
          writeln('    ',i,')',sin2);
          delete(sin,1,pos(' ',sin));
        end;
    end;
  end;

procedure significado;
  begin
     w:=0;
     bus_ig:=pos('=',entrada);
     bus_ig:=bus_ig+1;


     bus_sl:=pos('/',entrada);
     w:=bus_sl-bus_ig;
     signi:=copy(entrada,bus_ig,w)
  end;



begin
repeat
  clrscr;
  entrada:='';
  salida:='';
  writeln('ingrese datos segun el siguiente ejemplo; ');
  writeln('  /Palabra1:Sinonimos=Significado/Palabra2:Sin..');
 { readln(entrada); }
  entrada:='/puerco:marrano=animal cochinito/casa:hogar vivienda lar=lugar en que se vive/' ;

  writeln('Ingrese palabra que desea buscar');
  readln(pregunta);
  limpiador;

  entrada[1]:='*';
  busqueda;
  significado;

  salida:=salida + pal;

  writeln('Palabra buscada: ',pal);
  writeln('Significado:     ',signi);
  writeln('Sinonimos: ');
  sinonimos;
  readln();

  writeln('Si desea buscar otra palabra escriba 1 sino escriba 0');
  readln(fin);




until (fin=0);


end.
