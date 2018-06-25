import java_cup.runtime.*;

%%

%cup
%public
%class Lexer
%line
%column

%{   
    private Symbol Symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol Symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

    @Override
    public String toString(){
        return "(" + yyline + ", " + yycolumn + ")";
    }
%}


%%

leia                                { return new Symbol(Sym.LEIA, yytext()); }
mostre                              { return new Symbol(Sym.MOSTRE, yytext()); }
[\*\/\+\-]|resto|e|ou               { return new Symbol(Sym.OPERADOR, yytext()); }
se                                  { return new Symbol(Sym.SE, yytext()); }
sese                                { return new Symbol(Sym.SESE, yytext()); }
senao                               { return new Symbol(Sym.SENAO, yytext()); }
inteiro|caractere|logico|texto      { return new Symbol(Sym.TIPO, yytext()); }
verdadeiro|falso                    { return new Symbol(Sym.BOOLEANO, yytext()); }
enquanto                            { return new Symbol(Sym.ENQUANTO, yytext()); }
[a-zA-Z_][a-zA-Z0-9_]*              { return new Symbol(Sym.VAR, yytext()); }
\'[a-zA-Z0-9]\'                     { return new Symbol(Sym.CARACTERE, yytext()); }
\"[^\"]*\"                          { return new Symbol(Sym.TEXTO, yytext()); }
\#[^\#]*\#                          { return new Symbol(Sym.COMENTARIO, yytext()); }
\d+                                 { return new Symbol(Sym.NUMERO, new Integer(yytext())); }
\(                                  { return new Symbol(Sym.AP, yytext()); }
\)                                  { return new Symbol(Sym.FP, yytext()); }
\{                                  { return new Symbol(Sym.ACH, yytext()); }
\}                                  { return new Symbol(Sym.FCH, yytext()); }
\;                                  { return new Symbol(Sym.QUEBRA_LINHA, yytext()); }
\,                                  { return new Symbol(Sym.VIRGULA, yytext()); } 
[<>]=?|[!=]=                        { return new Symbol(Sym.COMPARADOR, yytext()); }
=                                   { return new Symbol(Sym.ATRIBUICAO, yytext()); }

[\t\n\r\s]+                         { /* não faz nada */ }

<<EOF>>                             { return new Symbol(Sym.EOF); }

.                                   { return new Symbol(Sym.error, yytext()); }
