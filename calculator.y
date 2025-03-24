/* Elif Yildiz */
%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void yyerror(const char *s);
int yylex();
%}

%union {
    double fval;
}

%token <fval> NUMBER
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN
%left PLUS MINUS
%left TIMES DIVIDE
%right UMINUS 

%type <fval> expr

%%

input:
    | input expr '\n' { printf("= %lf\n", $2); }
    | '\n'
    ;

expr:
      expr PLUS expr   { $$ = $1 + $3; }
    | expr MINUS expr  { $$ = $1 - $3; }
    | expr TIMES expr  { $$ = $1 * $3; }
    | expr DIVIDE expr  {
        if ($3 == 0) {
            yyerror("Error: Division by zero!");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
    }
    | MINUS expr %prec UMINUS { $$ = -$2; } // Unary minus tanımı
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    printf("Elf's Simple Calculator (Type an expression and press enter)\n");
    return yyparse();
}

