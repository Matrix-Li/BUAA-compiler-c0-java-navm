# c0语法

```
// # 单词
 
// ## 关键字
FN_KW     -> 'fn'
LET_KW    -> 'let'
CONST_KW  -> 'const'
AS_KW     -> 'as'
WHILE_KW  -> 'while'
IF_KW     -> 'if'
ELSE_KW   -> 'else'
RETURN_KW -> 'return'
BREAK_KW  -> 'break'
CONTINUE_KW -> 'continue'

// ## 字面量
digit -> [0-9]
UINT_LITERAL -> digit+
DOUBLE_LITERAL -> digit+ '.' digit+ ([eE] digit+)?

escape_sequence -> '\' [\\"'nrt]
string_regular_char -> [^"\\]
STRING_LITERAL -> '"' (string_regular_char | escape_sequence)* '"'

char_regular_char -> [^'\\]
CHAR_LITERAL -> '\'' (char_regular_char | escape_sequence) '\''

// ## 标识符
IDENT -> [_a-zA-Z] [_a-zA-Z0-9]*

// ## 符号
PLUS      -> '+'
MINUS     -> '-'
MUL       -> '*'
DIV       -> '/'
ASSIGN    -> '='
EQ        -> '=='
NEQ       -> '!='
LT        -> '<'
GT        -> '>'
LE        -> '<='
GE        -> '>='
L_PAREN   -> '('
R_PAREN   -> ')'
L_BRACE   -> '{'
R_BRACE   -> '}'
ARROW     -> '->'
COMMA     -> ','
COLON     -> ':'
SEMICOLON -> ';'

// ## 注释
COMMENT -> '//' regex(.*) '\n'

// # 表达式
expr -> 
      operator_expr
    | negate_expr
    | assign_expr
    | as_expr
    | call_expr
    | literal_expr
    | ident_expr
    | group_expr

binary_operator -> '+' | '-' | '*' | '/' | '==' | '!=' | '<' | '>' | '<=' | '>='
operator_expr -> expr binary_operator expr

negate_expr -> '-' expr

assign_expr -> l_expr '=' expr

as_expr -> expr 'as' ty

call_param_list -> expr (',' expr)*
call_expr -> IDENT '(' call_param_list? ')'

literal_expr -> UINT_LITERAL | DOUBLE_LITERAL | STRING_LITERAL | CHAR_LITERAL

ident_expr -> IDENT

group_expr -> '(' expr ')'

// ## 左值表达式
l_expr -> IDENT

// ## 类型
ty -> IDENT

// # 语句
stmt ->
      expr_stmt
    | decl_stmt
    | if_stmt
    | while_stmt
    | break_stmt
    | continue_stmt
    | return_stmt
    | block_stmt
    | empty_stmt

expr_stmt -> expr ';'

let_decl_stmt -> 'let' IDENT ':' ty ('=' expr)? ';'
const_decl_stmt -> 'const' IDENT ':' ty '=' expr ';'
decl_stmt -> let_decl_stmt | const_decl_stmt

if_stmt -> 'if' expr block_stmt ('else' 'if' expr block_stmt)* ('else' block_stmt)?

while_stmt -> 'while' expr block_stmt

break_stmt -> 'break' ';'

continue_stmt -> 'continue' ';'

return_stmt -> 'return' expr? ';'

block_stmt -> '{' stmt* '}'

empty_stmt -> ';'

// # 函数
function_param -> 'const'? IDENT ':' ty
function_param_list -> function_param (',' function_param)*
function -> 'fn' IDENT '(' function_param_list? ')' '->' ty block_stmt

// # 程序
item -> function | decl_stmt
program -> item*

```

