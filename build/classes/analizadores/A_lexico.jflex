package analizadores;
import java_cup.runtime.*;
import java.io.*;
%%

%{ 
    public static String errors="";
    public static String inicio="";
    public static String segundo="";
    public static String ends="";
%}
%public 
%class Analizador_Lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

L=[a-zA-Z]
D=[0-9]+
GB=[_]
id={GB}({L}|{D})*{GB}
digito = ("(-"{D}+")")|{D}+|{D}+("."{D}+|"")
cadena = ([\"][^\n\"]*[\"])
caracter = ([\'][^\n\']*[\'])
comentario = ("//"[^"\n"]+)
comentarioMulti = [\/]\*[^*]*\*+([^/*][^*]*\*+)[\/]
interrogacion_I = [\¿]
interrogacion_D = [\?]
%%

<YYINITIAL> "inicio" {
                    return new Symbol(Simbolos.prInicio, yycolumn, yyline, yytext());
                    }
        

<YYINITIAL>"fin"   {
                    String inicio =" <!DOCTYPE html><html lang=\"en\"><head><meta charset=\"UTF-8\"><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><link rel=\"stylesheet\" href=\"main4.css\" type=\"text/css\" /<title>Reporte HTML</title></head><body><ul><li class=\"Titulo\">Julio Estuardo Solorzano Sosa</a></li><li class=\"subtitulo\">Proyecto 1 OLC1</li></ul><div>";
                    String segundo= "<table align=\"center\"><tr><td class=\"precio\"  colspan=\"3\">Errores Lexicos</td></tr><tr><td>Lexema</td><td>Linea</td><td>Columna</td></tr>";
                    String ends = "</table><table class=\"precio\" align=\"center\"></div></body></html>";
                    try{
                        PrintWriter writer = new PrintWriter("ReporteLexico.html");
                        writer.println(inicio);
                        writer.println(segundo);
                        writer.println(errors);
                        writer.println(ends);
                        writer.println("");
                        writer.close();
                    }catch (Exception e) {
                       System.out.println("Error");
                    }
                    return new Symbol(Simbolos.prFin, yycolumn, yyline, yytext());
                    }

<YYINITIAL>{id}     {
                    return new Symbol(Simbolos.id, yycolumn, yyline, yytext()); 
                    }
<YYINITIAL>{comentario} {
                    return new Symbol(Simbolos.comenta, yycolumn, yyline, yytext()); 
                    }
<YYINITIAL>{comentarioMulti} {
                    return new Symbol(Simbolos.comentarioMulti, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"ingresar"     {
                    return new Symbol(Simbolos.prIngresar, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"como"   {
                    return new Symbol(Simbolos.prcomo, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"numero"     {
                    return new Symbol(Simbolos.prnumero, yycolumn, yyline, yytext()); 
                    }
<YYINITIAL>"con_valor"     {
                    return new Symbol(Simbolos.prConValor, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"cadena" {
                    return new Symbol(Simbolos.prCadena, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"boolean" {
                    return new Symbol(Simbolos.prBoolean, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"caracter" {
                    return new Symbol(Simbolos.prCaracter, yycolumn, yyline, yytext()); 
                    }


<YYINITIAL>{digito}   {
                    return new Symbol(Simbolos.digito, yycolumn, yyline, yytext()); 
                    }
<YYINITIAL>{cadena} {
                    return new Symbol(Simbolos.cadena, yycolumn, yyline, yytext()); 
                    }
<YYINITIAL>"Verdadero" {
                    return new Symbol(Simbolos.BoleanVerdadero, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"Falso"  {
                    return new Symbol(Simbolos.BoleanFalso, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>{caracter}  {
                    return new Symbol(Simbolos.caracter, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"->"  {
                    return new Symbol(Simbolos.simAsignacion, yycolumn, yyline, yytext()); 
                    }
<YYINITIAL>";"  {
                    return new Symbol(Simbolos.puntoYComa, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>","  {
                    return new Symbol(Simbolos.coma, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>{
    "-"         {  return new Symbol(Simbolos.trest, yycolumn, yyline, yytext());   }
    "+"         {  return new Symbol(Simbolos.tsum, yycolumn, yyline, yytext());     }
    "/"         {  return new Symbol(Simbolos.tdiv, yycolumn, yyline, yytext());    }
    "*"         {  return new Symbol(Simbolos.tmul, yycolumn, yyline, yytext());     }
    "potencia"  {  return new Symbol(Simbolos.tpot, yycolumn, yyline, yytext());     }
    "mod"       {  return new Symbol(Simbolos.tmod, yycolumn, yyline, yytext());     }
    "("         {  return new Symbol(Simbolos.pare1, yycolumn, yyline, yytext());   }
    ")"         {  return new Symbol(Simbolos.pare2, yycolumn, yyline, yytext());   }
    "["         {  return new Symbol(Simbolos.cor1, yycolumn, yyline, yytext());     }
    "]"         {  return new Symbol(Simbolos.cor2, yycolumn, yyline, yytext());     }   
}

<YYINITIAL>"mayor"  {  
                    return new Symbol(Simbolos.tmayor, yycolumn, yyline, yytext());   
                    }

<YYINITIAL>"menor"  {  
                    return new Symbol(Simbolos.tmenor, yycolumn, yyline, yytext());   
                    }

<YYINITIAL>"mayor_o_igual"  {  
                    return new Symbol(Simbolos.tmayorigual, yycolumn, yyline, yytext());   
                    }

<YYINITIAL>"menor_o_igual"  {  
                    return new Symbol(Simbolos.tmenorigual, yycolumn, yyline, yytext());   
                    }

<YYINITIAL>"es_igual"  {  
                    return new Symbol(Simbolos.tigual, yycolumn, yyline, yytext());   
                    }

<YYINITIAL>"es_diferente"  {  
                    return new Symbol(Simbolos.tdiferente, yycolumn, yyline, yytext());   
                    }


<YYINITIAL>"imprimir"  {
                    return new Symbol(Simbolos.primprimir, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"imprimir_nl" {
                    return new Symbol(Simbolos.primprimirln, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"or" {
                    return new Symbol(Simbolos.pror, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"and" {
                    return new Symbol(Simbolos.prand, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"not" {
                    return new Symbol(Simbolos.prnot, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"mientras" {
                    return new Symbol(Simbolos.prmientras, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"hacer" {
                    return new Symbol(Simbolos.prhacer, yycolumn, yyline, yytext()); 
                    }


<YYINITIAL>"fin_mientras" {
                    return new Symbol(Simbolos.prfinmientras, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"si" {
                    return new Symbol(Simbolos.prsi, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"entonces" {
                    return new Symbol(Simbolos.prentonces, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"fin_si" {
                    return new Symbol(Simbolos.prfinsi, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"o_si" {
                    return new Symbol(Simbolos.prosi, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"de_lo_contrario" {
                    return new Symbol(Simbolos.prdelocontrario, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"segun" {
                    return new Symbol(Simbolos.prsegun, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>{interrogacion_I} {
                    return new Symbol(Simbolos.prinzq, yycolumn, yyline, yytext()); 
                    }
<YYINITIAL>{interrogacion_D} {
                    return new Symbol(Simbolos.prinder, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"fin_segun" {
                    return new Symbol(Simbolos.prfinsegun, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"para" {
                    return new Symbol(Simbolos.prpara, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"hasta" {
                    return new Symbol(Simbolos.prhasta, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"fin_para" {
                    return new Symbol(Simbolos.prfinpara, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"con" {
                    return new Symbol(Simbolos.prcon, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"incremental" {
                    return new Symbol(Simbolos.princremental, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"repetir" {
                    return new Symbol(Simbolos.prrepetir, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"hasta_que" {
                    return new Symbol(Simbolos.prhastaque, yycolumn, yyline, yytext()); 
                    }


<YYINITIAL>"retornar" {
                    return new Symbol(Simbolos.prretornar, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"metodo" {
                    return new Symbol(Simbolos.prmetodo, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"fin_metodo" {
                    return new Symbol(Simbolos.prfinmetodo, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"funcion" {
                    return new Symbol(Simbolos.prfuncion, yycolumn, yyline, yytext()); 
                    }


<YYINITIAL>"fin_funcion" {
                    return new Symbol(Simbolos.prfinfuncion, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"con_parametros" {
                    return new Symbol(Simbolos.prconparametros, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>"ejecutar" {
                    return new Symbol(Simbolos.prejecutar, yycolumn, yyline, yytext()); 
                    }

[ \t\r\n\f]         {  /*este es un comentario en java, omitirlos*/ }

.                   {
                    errors+="<tr><td>"+yytext()+"</td><td>"+(yyline+1)+"</td><td>"+(yycolumn+1)+"</td></tr>";
                    System.out.println("Error Lexico: "+yytext()+ " Linea: "+(yyline+1)+" Columna: "+(yycolumn+1));
                    }